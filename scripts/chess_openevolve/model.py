"""Remote CPU model adapter: finite-grammar decoding, never replayed proposals."""
import itertools
import json
import os
import time
from pathlib import Path

MODEL = "Qwen/Qwen2.5-Coder-0.5B-Instruct"
REVISION = "ea3f2471cf1b1f0db85067f1ef93848e38e88c25"
WORK = Path(".lake/chess-openevolve/search")


class CpuModel:
    def __init__(self, config):
        self.model = MODEL
        self.last_usage = None
        self.tokenizer = self.network = None

    async def generate(self, prompt, **kwargs):
        return await self.generate_with_context("", [{"role": "user", "content": prompt}])

    async def generate_with_context(self, system_message, messages, **kwargs):
        if os.environ.get("CHESS_REMOTE") != "1":
            raise RuntimeError("Model inference is remote-only")
        import torch
        from transformers import AutoModelForCausalLM, AutoTokenizer

        WORK.mkdir(parents=True, exist_ok=True)
        begin = time.monotonic()
        log = WORK / "model.jsonl"
        previous = [json.loads(line) for line in log.read_text().splitlines()] if log.exists() else []
        if len(previous) >= 5:
            raise RuntimeError("Five-proposal model budget exhausted")
        # Seed was already evaluated. Exclude previously proposed policies; record this
        # supplied finite grammar explicitly rather than calling it autonomous invention.
        excluded = {"POLICY = (0, 0)\n"} | {p["response"] for p in previous}
        choices = [f"POLICY = ({a}, {b})\n" for a, b in itertools.product(range(3), range(2))
                   if f"POLICY = ({a}, {b})\n" not in excluded]
        if self.network is None:
            torch.set_num_threads(2)
            self.tokenizer = AutoTokenizer.from_pretrained(MODEL, revision=REVISION,
                                                           trust_remote_code=False)
            self.network = AutoModelForCausalLM.from_pretrained(
                MODEL, revision=REVISION, trust_remote_code=False, torch_dtype=torch.float32)
            self.network.eval()
        context = [{"role": "system", "content": system_message}] + messages
        prompt = self.tokenizer.apply_chat_template(context, tokenize=False, add_generation_prompt=True)
        inputs = self.tokenizer(prompt, return_tensors="pt", truncation=True, max_length=3072)
        width = inputs.input_ids.shape[1]
        trie = [self.tokenizer.encode(c, add_special_tokens=False) + [self.tokenizer.eos_token_id]
                for c in choices]

        def allowed(batch, ids):
            prefix = ids.tolist()[width:]
            return sorted({c[len(prefix)] for c in trie
                           if c[:len(prefix)] == prefix and len(c) > len(prefix)})

        torch.manual_seed(1729 + len(previous))
        with torch.inference_mode():
            generated = self.network.generate(
                **inputs, max_new_tokens=32, do_sample=True, temperature=0.8,
                prefix_allowed_tokens_fn=allowed, pad_token_id=self.tokenizer.eos_token_id)
        response = self.tokenizer.decode(generated[0, width:], skip_special_tokens=True)
        if response not in choices:
            raise RuntimeError("Constrained model output escaped the supplied grammar")
        self.last_usage = {"prompt_tokens": width, "completion_tokens": generated.shape[1] - width,
                           "total_tokens": generated.shape[1]}
        record = {"model": MODEL, "revision": REVISION, "system": system_message,
                  "messages": messages, "rendered_prompt": prompt, "choices": choices,
                  "excluded": sorted(excluded), "response": response,
                  "input_token_ids": inputs.input_ids[0].tolist(),
                  "output_token_ids": generated[0, width:].tolist(),
                  "usage": self.last_usage, "seconds": time.monotonic() - begin,
                  "pid": os.getpid(), "remote": True}
        with log.open("a") as handle:
            handle.write(json.dumps(record) + "\n")
        return response
