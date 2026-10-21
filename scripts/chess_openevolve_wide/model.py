"""Unconstrained remote CPU generation; no finite response trie or policy enumeration."""
import json
import os
import time
from pathlib import Path
ROOT = Path(__file__).resolve().parents[2]
PIN = json.loads((ROOT / "docs/chess/openevolve-wide/model-pin.json").read_text())
MODEL, REVISION = PIN["model"], PIN["revision"]
WORK = ROOT / ".lake/chess-openevolve-wide/search"


class CpuModel:
    def __init__(self, config):
        self.model = MODEL
        self.last_usage = None
        self.tokenizer = self.network = None

    async def generate(self, prompt, **kwargs):
        return await self.generate_with_context("", [{"role": "user", "content": prompt}])

    async def generate_with_context(self, system_message, messages, **kwargs):
        assert os.environ.get("CHESS_REMOTE") == "1", "Inference is remote-only"
        import torch
        from transformers import AutoModelForCausalLM, AutoTokenizer
        begin = time.monotonic()
        WORK.mkdir(parents=True, exist_ok=True)
        path = WORK / "model.jsonl"
        previous = [json.loads(line) for line in path.read_text().splitlines()] if path.exists() else []
        if len(previous) >= 24:
            raise RuntimeError("24-request model budget exhausted")
        if self.network is None:
            torch.set_num_threads(2)
            self.tokenizer = AutoTokenizer.from_pretrained(MODEL, revision=REVISION, trust_remote_code=False)
            self.network = AutoModelForCausalLM.from_pretrained(MODEL, revision=REVISION,
                trust_remote_code=False, torch_dtype=torch.float32, use_safetensors=True)
            self.network.eval()
        context = [{"role": "system", "content": system_message}] + messages
        rendered = self.tokenizer.apply_chat_template(context, tokenize=False, add_generation_prompt=True)
        inputs = self.tokenizer(rendered, return_tensors="pt")
        original_width = inputs.input_ids.shape[1]
        if original_width > 4096:
            # Preserve the task definition plus the most recent code/feedback suffix.
            for key, value in inputs.items():
                inputs[key] = torch.cat([value[:, :1024], value[:, -3072:]], dim=1)
        width = inputs.input_ids.shape[1]
        torch.manual_seed(21901 + len(previous))
        with torch.inference_mode():
            output = self.network.generate(**inputs, max_new_tokens=256, do_sample=True,
                temperature=0.7 + 0.1 * (len(previous) % 3), top_p=0.95,
                pad_token_id=self.tokenizer.eos_token_id)
        response = self.tokenizer.decode(output[0, width:], skip_special_tokens=True)
        self.last_usage = dict(prompt_tokens=width, completion_tokens=output.shape[1]-width,
                               total_tokens=output.shape[1])
        record = dict(model=MODEL, revision=REVISION, system=system_message, messages=messages,
            rendered_prompt=rendered, original_prompt_tokens=original_width,
            prompt_truncated=original_width > 4096, response=response, usage=self.last_usage,
            input_token_ids=inputs.input_ids[0].tolist(), output_token_ids=output[0, width:].tolist(),
            seconds=time.monotonic()-begin, pid=os.getpid(), remote=True,
            constrained_response_set=False, supplied_optimization_hint=False)
        with path.open("a") as stream:
            stream.write(json.dumps(record) + "\n")
        return response
