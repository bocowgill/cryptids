#!/usr/bin/env python3
"""Check sealed saved remote evidence; never execute a compiler, model, or fixture.

All arithmetic and machine coverage assertions below inspect saved remote receipts.
The complete prefix and body streams are hashed as bytes, never parsed, traversed as rows, or
recounted. Portable: copy this review folder and use --root REPO --evidence PACKET.
The seal and exact whole-claim/source binding are mandatory in every mode.
"""
import argparse
import hashlib
import json
import math
from pathlib import Path, PurePosixPath
import re
import shutil
import stat
import subprocess
import sys
import tempfile
import zipfile

HERE = Path(__file__).resolve().parent
SCHEMA = "chess-field-reverse-review-v1"
REPO = "bocowgill/cryptids"
BRANCH = "codex/chess-openevolve-pilot"
WORKFLOW = ".github/workflows/chess_field_reverse.yml"
META = ("run-api.json", "jobs-api.json", "artifact-api.json", "retention.json", "archive-entries.json")
PHASES = ("machine", "contracts", "native", "fixtures", "regressions", "counts", "full")
SOURCES = {
    WORKFLOW, "lakefile.chess-field-reverse.toml", "docs/chess/field-reverse/baseline-pins.json",
    "Cryptids/Chess/Optimisation/FieldReverse.lean", "Cryptids/Semantics/ChessFieldReverse.lean",
    "scripts/chess_field_reverse/Audit.lean", "scripts/chess_field_reverse/Export.lean",
    "scripts/chess_field_reverse/fixtures.py", "scripts/chess_field_reverse/verify.py",
}
CLAIM = {
    "formal_machine": "ConjectureMachines.Machines.chess_field_reverse",
    "formal_theorem": "ConjectureMachines.Semantics.ChessFieldReverse.halts_iff_not_draw",
    "statement": "Halts chess_field_reverse iff NOT (Chess.WhiteCanAvoidLoss AND Chess.BlackCanAvoidLoss)",
    "equivalent_machine": "Chess.Optimisation.FieldPacked.machine",
    "blank_tape": True, "symbols": 2, "states": 2904623, "previous_states": 4742562,
    "saved_states": 1837939, "actual_graph_nodes": 106668, "graph_padding_nodes": 0,
    "post_states": 533341, "body_states": 1066682, "initializer_states": 1837941,
    "input_bits": 1837940, "source_cells": 141380, "source_labels": 4042,
    "all_actual_source_nodes_preserved": True, "all_controls_and_input_paid": True,
    "full_chess_machine_constructed": True, "unconditional_chess_equivalence": True,
    "frozen_body_and_input_unchanged": True, "body_entry_relative_tape": "Tape.mk₁ FieldPacked.bits.toList",
    "physical_head_at_body_entry": -1837939, "physical_frame_min": -1837940,
    "physical_frame_max": 1, "absolute_head_restored": False,
}
FALSE_CONTRACTS = {
    "BadCount": "example : generated.states = 4742562 := by rw [generated_states]; decide +kernel",
    "Unpaid": "example : generated.states = body.states := by rw [generated_states, body_states]; decide +kernel",
    "BadInitializer": "example : actions.size = 3675880 := by rw [prefix_states]; decide +kernel",
    "MissingTurn": "example : actions.size = bits.size := by rw [prefix_states, bits_size]; decide +kernel",
    "BadBody": "example : body.states = 533341 := by rw [body_states]; decide +kernel",
    "BadSaving": "example : FieldPacked.generated.states - generated.states = 1837940 := by rw [FieldPacked.generated_states, generated_states]; decide +kernel",
}
ALLOCATION = {
    "source_labels": 4042, "slots_per_label": "actual syntax row size", "meaningful_nodes": 106668,
    "padding_nodes": 0, "all_graph_nodes": 106668, "stores_per_node": 5,
    "live_node_store_controls": 533340, "shared_halt_controls": 1, "post_controls": 533341,
    "binary_main_controls": 533341, "binary_bounce_controls": 533341, "body_controls": 1066682,
    "initializer_write_controls": 1837940, "initializer_reverse_write_controls": 1837940,
    "initializer_final_right_controls": 1, "initializer_restore_controls": 0,
    "initializer_controls": 1837941, "total_controls": 2904623,
}
MUTATIONS = ["dispatch", "store", "frame", "initializer", "initializer_physical_head",
    "undercount", "packed_offset", "body_write", "body_bounce", "body_missing_halt",
    "body_order", "body_truncation", "prefix_write", "prefix_direction", "prefix_final_turn", "prefix_truncation"]
EDGES = [("empty", ""), ("singleton_zero", "0"), ("singleton_one", "1"),
    ("leading_zero", "011"), ("trailing_zero", "110"), ("mixed", "010110")]
CONTROLS = ("source", "entry", "claim", "receipt", "missing-phase", "seal")
CONTROL_ERRORS = {
    "source": "phase source binding changed: machine", "entry": "archive inventory digest changed",
    "claim": "whole construction claim changed", "receipt": "command argv/exit/token changed",
    "missing-phase": "seven phase inventory changed", "seal": "seal file mismatch: check_saved_evidence.py",
}
SEALED_FILES = {"check_saved_evidence.py", "construction-binding.json", "review.json", "review.md", "receipt.json"}


class Rejected(Exception):
    pass


def need(condition, message):
    if not condition:
        raise Rejected(message)


def digest(value):
    return hashlib.sha256(value).hexdigest()


def file_sha(path):
    hasher = hashlib.sha256()
    with Path(path).open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            hasher.update(block)
    return hasher.hexdigest()


def unique(pairs):
    result = {}
    for name, value in pairs:
        need(name not in result, "duplicate JSON key: " + name)
        result[name] = value
    return result


def parse(value):
    return json.loads(value, object_pairs_hook=unique,
                      parse_constant=lambda v: (_ for _ in ()).throw(Rejected("nonfinite JSON: " + v)))


def read(path):
    return parse(Path(path).read_bytes())


def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":"), allow_nan=False)


def same(first, second):
    # JSON equality in Python otherwise equates true with 1.
    return canonical(first) == canonical(second)


def relative(name):
    need(isinstance(name, str), "non-string relative path")
    path = PurePosixPath(name)
    need(bool(name) and not path.is_absolute() and "." not in path.parts and
         ".." not in path.parts and "\\" not in name and ":" not in name and
         path.as_posix() == name, "unsafe relative path: " + name)
    return name


def regular(path):
    path = Path(path)
    need(not path.is_symlink() and path.is_file(), "missing/symlink file: " + str(path))
    return path


def zip_inventory(path, text=False):
    """Hash ZIP members, validating each saved CRC and rejecting ambiguous paths."""
    inventory, contents, seen = {}, {}, set()
    with zipfile.ZipFile(regular(path)) as archive:
        for member in archive.infolist():
            name = relative(member.filename[:-1] if member.is_dir() else member.filename)
            need(name not in seen, "duplicate ZIP path: " + name)
            seen.add(name)
            need(not stat.S_ISLNK(member.external_attr >> 16) and not member.flag_bits & 1,
                 "symlink/encrypted ZIP member: " + name)
            if member.is_dir():
                continue
            h, length, blocks = hashlib.sha256(), 0, []
            with archive.open(member) as stream:
                for block in iter(lambda: stream.read(1024 * 1024), b""):
                    h.update(block)
                    length += len(block)
                    if text and name not in {"body-rows.jsonl", "prefix-rows.bin"}:
                        blocks.append(block)
            need(length == member.file_size, "ZIP member size mismatch: " + name)
            inventory[name] = {"bytes": length, "sha256": h.hexdigest(), "crc32": member.CRC,
                               "compressed_bytes": member.compress_size, "compression": member.compress_type}
            if blocks:
                contents[name] = b"".join(blocks)
    return inventory, contents


def load_packet(folder):
    folder = Path(folder)
    need(folder.is_dir() and not folder.is_symlink(), "missing/symlink evidence folder")
    need({p.name for p in folder.iterdir()} == set(META) | {"artifact.zip", "logs.zip", "unpacked"},
         "evidence packet top-level inventory changed")
    raw = {name: regular(folder / name).read_bytes() for name in META}
    inventory, payload = zip_inventory(folder / "artifact.zip", text=True)
    log_inventory, logs = zip_inventory(folder / "logs.zip", text=True)
    unpacked = folder / "unpacked"
    need(unpacked.is_dir() and not unpacked.is_symlink(), "missing/symlink unpacked folder")
    actual = {}
    for path in unpacked.rglob("*"):
        need(not path.is_symlink(), "unpacked symlink: " + str(path))
        if path.is_file():
            name = relative(path.relative_to(unpacked).as_posix())
            actual[name] = {"bytes": path.stat().st_size, "sha256": file_sha(path)}
    return {"folder": folder, "raw": raw, "meta": {k: parse(v) for k, v in raw.items()},
            "inventory": inventory, "unpacked_inventory": actual, "payload": payload,
            "logs_inventory": log_inventory,
            "logs_text": "\n".join(v.decode("utf-8", errors="replace") for v in logs.values()),
            "artifact_sha256": file_sha(folder / "artifact.zip"),
            "artifact_bytes": (folder / "artifact.zip").stat().st_size,
            "logs_sha256": file_sha(folder / "logs.zip"),
            "logs_bytes": (folder / "logs.zip").stat().st_size}


def packet_binding(packet):
    run = packet["meta"]["run-api.json"]
    artifact = packet["meta"]["artifact-api.json"]["artifacts"][0]
    jobs = packet["meta"]["jobs-api.json"]["jobs"]
    return {"metadata_sha256": {name: digest(packet["raw"][name]) for name in META},
            "run_id": run["id"], "commit": run["head_sha"], "conclusion": run["conclusion"],
            "job_id": jobs[0]["id"], "artifact_id": artifact["id"], "artifact_name": artifact["name"],
            "artifact_sha256": packet["artifact_sha256"], "artifact_bytes": packet["artifact_bytes"],
            "logs_sha256": packet["logs_sha256"], "logs_bytes": packet["logs_bytes"],
            "archive_inventory": packet["inventory"], "logs_inventory": packet["logs_inventory"]}


def validate_packet(packet, bound, official=False):
    meta = packet["meta"]
    need(set(bound["metadata_sha256"]) == set(META), "incomplete official metadata binding")
    for name in META:
        need(digest(packet["raw"][name]) == bound["metadata_sha256"][name], "metadata hash changed: " + name)
    run, jobs, listing, retained = (meta[n] for n in META[:4])
    need(listing["total_count"] == len(listing["artifacts"]) == 1, "artifact inventory changed")
    artifact = listing["artifacts"][0]
    need(run["id"] == bound["run_id"] == retained["run_id"] == artifact["workflow_run"]["id"],
         "official run identity changed")
    need(run["head_sha"] == bound["commit"] == retained["commit"] == artifact["workflow_run"]["head_sha"],
         "official computation commit changed")
    need(run["repository"]["full_name"] == REPO and run["head_branch"] == BRANCH and
         run["path"] == WORKFLOW and run["name"] == "Reverse initializer chess compiler" and
         run["status"] == "completed" and run["conclusion"] == retained["conclusion"] == bound["conclusion"],
         "official repository/branch/workflow/disposition changed")
    run_url = f"https://github.com/{REPO}/actions/runs/{run['id']}"
    api_url = f"https://api.github.com/repos/{REPO}/actions/runs/{run['id']}"
    need(run["html_url"] == run_url and run["url"] == api_url, "run URLs changed")
    artifact_url = f"https://api.github.com/repos/{REPO}/actions/artifacts/{artifact['id']}"
    need(artifact["id"] == bound["artifact_id"] and artifact["url"] == artifact_url and
         artifact["archive_download_url"] == artifact_url + "/zip" and
         artifact["name"] == bound["artifact_name"] and artifact["expired"] is False and
         artifact["workflow_run"]["head_branch"] == BRANCH, "artifact identity/URLs changed")
    need(artifact["digest"] == "sha256:" + packet["artifact_sha256"] and
         packet["artifact_sha256"] == bound["artifact_sha256"] == retained["artifact_sha256"] and
         packet["artifact_bytes"] == bound["artifact_bytes"] == artifact["size_in_bytes"],
         "artifact digest/size changed")
    need(packet["logs_sha256"] == retained["logs_sha256"] == bound["logs_sha256"] and
         packet["logs_bytes"] == bound["logs_bytes"], "logs digest/size changed")
    need(jobs["total_count"] == len(jobs["jobs"]) == 1, "job inventory changed")
    job = jobs["jobs"][0]
    need(job["id"] == bound["job_id"] and job["run_id"] == run["id"] and
         job["head_sha"] == run["head_sha"] and job["head_branch"] == BRANCH and
         job["name"] == "verify" and job["status"] == "completed" and
         job["conclusion"] == bound["conclusion"], "job identity/disposition changed")
    need(job["url"] == f"https://api.github.com/repos/{REPO}/actions/jobs/{job['id']}" and
         job["html_url"] == run_url + f"/job/{job['id']}", "job URLs changed")
    need(same(packet["inventory"], bound["archive_inventory"]) and
         same(packet["logs_inventory"], bound["logs_inventory"]), "ZIP CRC/member inventory changed")
    entries = {name: {k: value[k] for k in ("bytes", "sha256")} for name, value in packet["inventory"].items()}
    need(same(meta["archive-entries.json"], entries), "archive inventory digest changed")
    need(same(entries, packet["unpacked_inventory"]) and retained["entries"] == len(entries),
         "exact unpacked byte binding changed")
    if official:
        need(bound["conclusion"] == "success" and run["event"] == "workflow_dispatch" and
             artifact["name"] == "chess-field-reverse-full-" + run["head_sha"], "full official run not successful")
        for name in ("Fresh evidence", "Fetch pinned Mathlib cache", "Remote compiler verification"):
            selected = [s for s in job["steps"] if s["name"] == name]
            need(len(selected) == 1 and selected[0]["status"] == "completed" and
                 selected[0]["conclusion"] == "success", "required workflow step failed: " + name)
    return run


def source_manifest(root):
    actual = {p.relative_to(root).as_posix() for p in (root / "scripts/chess_field_reverse").rglob("*")
              if p.is_file() and p.suffix in (".lean", ".py")}
    need(actual == {name for name in SOURCES if name.startswith("scripts/chess_field_reverse/")},
         "computation source inventory changed")
    need(not (root / "Cryptids/Machines/ChessFieldReverse.lean").exists(), "unreviewed machine module appeared")
    return {name: file_sha(regular(root / relative(name))) for name in sorted(SOURCES)}


def source_closure(root, source, pins):
    """Source-file fidelity only, not a Lean parser or independent kernel check."""
    bound, pending, seen = set(source) | set(pins), [n for n in source if n.endswith(".lean")], set()
    while pending:
        name = pending.pop()
        if name in seen:
            continue
        seen.add(name)
        for line in (root / name).read_text().splitlines():
            found = re.fullmatch(r"\s*(?:public\s+)?(?:meta\s+)?import\s+([^\n]+)", line.split("--", 1)[0])
            if not found:
                continue
            for module in found[1].split():
                if module.split(".", 1)[0] in {"Cryptids", "Challenge", "BusyBeaver", "BusyBeaverChallenge"}:
                    target = module.replace(".", "/") + ".lean"
                    need(target in bound and (root / target).is_file(), "unbound repository import: " + module)
                    pending.append(target)
    return {name: source.get(name, pins.get(name)) for name in sorted(seen)}


def command_specs(binding):
    remote, py = binding["remote_root"], binding["python_executable"]
    build = ["lake", "--wfail", "-f", "lakefile.chess-field-reverse.toml", "build"]
    audit = ["prlimit", "--as=17179869184", "--", "lake", "env", remote + "/.lake/build/bin/chess_field_reverse_audit"]
    contracts = [(audit, 0, "Chess FieldReverse foundation audit passed", 600)]
    for flag, token in (("--negative-control", "Forbidden axiom: sorryAx"),
                        ("--negative-control-open", "The open chess conjecture is a dependency"),
                        ("--negative-control-generator", "Proof generator is a mathematical dependency:")):
        contracts.append((audit + [flag], 1, token, 600))
    for name in FALSE_CONTRACTS:
        contracts.append((["lake", "env", "lean", "-M6144", "-DwarningAsError=true", remote + "/.lake/chess-field-reverse/" + name + ".lean"],
                          1, "is false", 300))
    native = [(build + ["chess_field_reverse_export"], 0, "Build completed successfully", 1800),
              (["prlimit", "--stack=67108864", "--", "lake", "env", remote + "/.lake/build/bin/chess_field_reverse_export",
                remote + "/.lake/chess-field-reverse/machine-export.json"], 0, "Reverse native export passed", 900)]
    fixtures = [([py, "scripts/chess_field_reverse/fixtures.py"], 0, "Reverse independent fixtures passed", 900)]
    regressions = [(build + ["Cryptids.Chess.Fixtures", "Cryptids.Chess.Evaluation", "Cryptids.Semantics.ChessFieldPacked",
                            "Cryptids.Compilation.FieldBranch.Certificate"], 0, "Build completed successfully", 1200)]
    for name, token, args in (("scripts/RunChessM2.lean", "Rule fixtures passed:", ["--rules"]),
                               ("scripts/RunChessM3.lean", "Chess M3 fixtures passed:", []),
                               ("scripts/RunChessM4.lean", "Chess M4 fixtures passed:", []),
                               ("scripts/RunChessM5.lean", "16 assertions", []),
                               ("scripts/chess_m6/SharedFixtures.lean", "Shared fixtures passed:", []),
                               ("scripts/chess_m7/Fixtures.lean", "M7 quotient fixtures passed", []),
                               ("scripts/chess_openevolve/Fixtures.lean", "Terminal binary fixtures passed", [])):
        mode = [] if name == "scripts/chess_m6/SharedFixtures.lean" else ["--run"]
        regressions.append((["lake", "env", "lean", "-M6144", "-DwarningAsError=true"] + mode + [name] + args,
                            0, token, 600))
    specs = {"machine": [(build + ["Cryptids.Semantics.ChessFieldReverse"], 0, "Build completed successfully", 1800)],
             "contracts": contracts, "native": native, "fixtures": fixtures,
             "regressions": contracts + native + fixtures + regressions, "counts": [],
             "full": [(build + ["Cryptids.Semantics.ChessFieldReverse", "chess_field_reverse_audit", "chess_field_reverse_export"],
                       0, "Build completed successfully", 1800),
                      ([py, "scripts/chess_field_reverse/verify.py", "--target", "machine"], 0, "Reverse field machine passed", 1800),
                      ([py, "scripts/chess_field_reverse/verify.py", "--regressions"], 0, "Reverse field regressions passed", 1800),
                      ([py, "scripts/chess_field_reverse/verify.py", "--counts"], 0, "Reverse full chess reduction passed", 120)]}
    return specs


def check_command(actual, spec, binding):
    argv, exit_code, token, timeout = spec
    need(same(actual["argv"], argv) and type(actual["exit"]) is int and actual["exit"] == exit_code and
         token in actual["output"], "command argv/exit/token changed: " + token)
    need(actual["cwd"] == binding["remote_root"] and actual["shell"] is False and actual["timed_out"] is False and
         actual["timeout_seconds"] == timeout, "command cwd/shell/timeout changed")
    elapsed = actual["elapsed_seconds"]
    need(type(elapsed) in (int, float) and math.isfinite(elapsed) and 0 <= elapsed <= timeout + 15 and
         digest(actual["output"].encode()) == actual["output_sha256"], "command output hash/elapsed changed")
    need(type(actual["cumulative_children_peak_rss_kib"]) is int and actual["cumulative_children_peak_rss_kib"] > 0,
         "command memory receipt missing")


def fields(actual, expected, context):
    for name, value in expected.items():
        need(name in actual and same(actual[name], value), context + ': ' + name)


def validate_phases(packet, binding, source, pins, negative):
    data = packet['payload']
    phases = {phase: parse(data[phase + '.json']) for phase in PHASES}
    commands = {name: parse(value) for name, value in data.items()
                if name.startswith('commands/') and name.endswith('.json')}
    expected_files = {p + '.json' for p in PHASES} | set(commands) | {n + '.lean' for n in FALSE_CONTRACTS} | {
        'machine-export.json', 'body-rows.jsonl', 'prefix-rows.bin', 'fixtures-detail.json'}
    need(set(packet['inventory']) == expected_files, 'complete artifact file inventory changed')
    if negative == 'source':
        phases['machine']['source_sha256']['Cryptids/Chess/Optimisation/FieldReverse.lean'] = '0' * 64
    elif negative == 'missing-phase':
        phases.pop('machine')
    elif negative == 'receipt':
        phases['machine']['checks'][0]['exit'] = 97
    need(set(phases) == set(PHASES), 'seven phase inventory changed')
    specs, all_checks = command_specs(binding), []
    for name in PHASES:
        phase = phases[name]
        fields(phase, {'status': 'passed', 'phase': name}, 'phase not passed')
        need(same(phase['source_sha256'], source), 'phase source binding changed: ' + name)
        need(same(phase['frozen_source_sha256'], pins), 'phase frozen binding changed: ' + name)
        need(phase['commit'] == binding['official']['commit'] and
             phase['run_id'] == str(binding['official']['run_id']), 'phase official identity changed: ' + name)
        need(len(phase['checks']) == len(specs[name]), 'phase command inventory changed: ' + name)
        for check, spec in zip(phase['checks'], specs[name]):
            check_command(check, spec, binding)
        all_checks += phase['checks']
    observed = {canonical(c) for c in all_checks}
    recorded = [canonical(c) for c in commands.values()]
    need(len(recorded) == len(set(recorded)) == binding['unique_command_receipts'] and
         set(recorded) == observed, 'standalone/phase receipts differ')
    need(len(all_checks) == binding['phase_receipt_entries'], 'phase receipt entry count changed')
    need(same({name: {'argv': c['argv'], 'exit': c['exit'], 'timed_out': c['timed_out'],
                     'timeout_seconds': c['timeout_seconds'], 'output_sha256': c['output_sha256']}
               for name, c in commands.items()}, binding['command_bindings']), 'exact command binding changed')
    for name, statement in FALSE_CONTRACTS.items():
        expected = ('import Cryptids.Semantics.ChessFieldReverse\n'
                    'open Chess.Optimisation Chess.Optimisation.FieldReverse ConjectureMachines.Compilation\n'
                    + statement + '\n')
        need(data[name + '.lean'].decode() == expected, 'false kernel contract source changed: ' + name)
    unrelated = ('Unknown constant', 'Unknown identifier', 'unknown identifier', 'unknown namespace',
                 'unknown module', 'object file', 'file not found', 'failed to synthesize',
                 'deep recursion', 'maximum recursion', 'timeout')
    for check in phases['contracts']['checks'][4:]:
        output = check['output']
        need('Tactic `decide` proved that the proposition' in output and 'is false' in output and
             not any(token in output for token in unrelated), 'kernel control failed for an unrelated reason')
    audit = phases['contracts']['checks'][0]['output']
    need(audit == binding['audit_output'] and 'Audited ' in audit and ' FieldReverse foundation roots and ' in audit and
         'Permitted axioms: #[propext, Classical.choice, Quot.sound]' in audit and
         'Meta certificate generator roots outside safe roots: 0' in audit and
         'Compiler artifacts outside safe roots:' in audit, 'safe proof closure audit changed')
    detail, payload = parse(data['fixtures-detail.json']), parse(data['machine-export.json'])
    need(same(detail, phases['fixtures']['detail']) and same(detail, phases['counts']['detail']) and
         same(detail, binding['fixture_detail']), 'fixture/count receipt changed')
    fields(detail, {'states': 2904623, 'previous_states': 4742562, 'saved_states': 1837939,
                   'body_states': 1066682, 'initializer_states': 1837941, 'labels_covered': 4042,
                   'cases': 202100, 'stores_per_label': 5, 'markers_per_store': 2, 'active_field_values': 5,
                   'native_samples_checked': 80866, 'unique_native_sample_pairs': 80854,
                   'complete_prefix_rows_verified': True, 'complete_prefix_rows_checked': 3675882,
                   'complete_body_rows_verified': True, 'complete_body_rows_checked': 2133364,
                   'complete_full_rows_verified': True, 'complete_full_rows_checked': 5809246,
                   'initializer_verified': True, 'initializer_edges_verified': True,
                   'shared_halt_probes_verified': True, 'universal_proof': False, 'status': 'passed',
                   'machine_json_filename': 'machine-export.json', 'machine_export_filename': 'machine-export.json'},
           'saved remote fixture scope changed')
    need(same(detail['cases_per_label'], [50] * 4042), 'all 4042*5*2*5 cases not certified')
    need(same(detail['counts'], ALLOCATION), 'complete allocation/all-controls receipt changed')
    fields(payload, {'schema': 'chess-field-reverse-v1'}, 'native payload schema changed')
    need(same(payload['metadata'], binding['native_metadata']) and
         same(payload['body_rows'], binding['native_body_coverage']) and
         same(payload['prefix_rows'], binding['native_prefix_coverage']), 'native payload metadata changed')
    need('checks' not in payload and 'metadata' not in phases['machine'] and
         packet['inventory']['machine-export.json']['sha256'] != packet['inventory']['machine.json']['sha256'],
         'native payload and machine phase receipt conflated')
    fields(payload['metadata'], {'labels': 4042, 'stores': 5, 'cell_bits': 13, 'graph_nodes': 106668,
           'post_states': 533341, 'body_states': 1066682, 'generated_states': 2904623,
           'machine_states': 2904623, 'row_machine_states': 2904623, 'actions_count': 1837941,
           'bits_count': 1837940, 'source_cells_count': 141380, 'initial_raw': 1,
           'initial_encoded': 0, 'halt_encoded': 1, 'body_entry': 1837941}, 'native full construction changed')
    fields(payload['prefix_rows'], {'filename': 'prefix-rows.bin',
           'format': 'binary:<BBI(write:u8,direction:u8,next:u32le)', 'record_bytes': 6,
           'direction_left': 0, 'direction_right': 1, 'target_bound_exclusive': 4294967296,
           'first_state': 0, 'state_limit': 1837941, 'states': 1837941, 'rows': 3675882,
           'missing_rows': 0, 'bits_per_state': 2, 'bytes': 22055292,
           'order': 'state-major,bit-0-before-1', 'native_machine_rowMachine_equal': True}, 'native prefix coverage changed')
    fields(payload['body_rows'], {'filename': 'body-rows.jsonl',
           'format': 'jsonl:[absolute_state,bit,null-or-[write,direction,absolute_next]]',
           'first_state': 1837941, 'state_limit': 2904623, 'states': 1066682, 'rows': 2133364,
           'missing_rows': 2, 'bits_per_state': 2, 'order': 'state-major,bit-0-before-1',
           'native_machine_rowMachine_equal': True}, 'native body coverage changed')
    fields(detail['prefix_rows'], {'filename': 'prefix-rows.bin',
           'format': 'binary:<BBI(write:u8,direction:u8,next:u32le)', 'record_bytes': 6,
           'target_bound_exclusive': 4294967296, 'first_state': 0, 'state_limit': 1837941,
           'states_checked': 1837941, 'rows_checked': 3675882, 'bits_per_state': 2,
           'order': 'state-major,bit-0-before-1', 'missing_rows': 0,
           'all_actual_prefix_states_and_bits_checked': True, 'native_machine_rowMachine_equal': True,
           'independent_python_recipe_equal': True, 'retained_artifact': True}, 'independent prefix receipt changed')
    fields(detail['body_rows'], {'filename': 'body-rows.jsonl', 'first_state': 1837941,
           'state_limit': 2904623, 'states_checked': 1066682, 'rows_checked': 2133364, 'bits_per_state': 2,
           'order': 'state-major,bit-0-before-1', 'missing_rows': [[1837942, 0, None], [1837942, 1, None]],
           'all_actual_body_states_and_bits_checked': True, 'native_machine_rowMachine_equal': True,
           'independent_python_recipe_equal': True, 'retained_artifact': True}, 'independent body receipt changed')
    for stem, filename in (('prefix', 'prefix-rows.bin'), ('body', 'body-rows.jsonl')):
        entry, coverage = packet['inventory'][filename], detail[stem + '_rows']
        need(entry['sha256'] == coverage['sha256'] == phases['fixtures'][stem + '_rows_sha256'] ==
             phases['counts'][stem + '_rows_sha256'] == binding[stem + '_rows_sha256'] and
             entry['bytes'] == coverage['bytes'] == binding[stem + '_rows_bytes'], 'raw stream digest/bytes changed: ' + stem)
    fields(detail['initializer'], {'steps': 1837941, 'body_entry': 1837941, 'head': -1837939,
           'physical_head': -1837939, 'normalized_head': 0, 'frame_min': -1837940, 'frame_max': 1,
           'bits': 1837940, 'source_cells': 141380, 'left_blank': 0, 'right_blank': 0,
           'native_machine_and_rowMachine_replayed': True, 'independent_all_steps_replayed': True},
           'full actual initializer receipt changed')
    fields(payload['initializer'], {'steps': 1837941, 'state': 1837941, 'head': -1837939,
           'normalized_head': 0, 'frame_min': -1837940, 'frame_max': 1, 'left_blank': 0, 'right_blank': 0,
           'native_machine_and_rowMachine_replayed': True}, 'native initializer physical frame changed')
    need(payload['initializer']['tape'] == payload['bits'] and
         digest(payload['bits'].encode('ascii')) == detail['initializer']['bits_sha256'] ==
         detail['initializer']['normalized_tape_sha256'] and
         digest(payload['source_cells'].encode('ascii')) == detail['initializer']['source_cells_sha256'],
         'exact normalized input/source-cell digest changed')
    need(len(payload['initializer_edges']) == len(detail['initializer_edges']) == len(EDGES), 'generic edge inventory changed')
    for native, remote, (name, bits) in zip(payload['initializer_edges'], detail['initializer_edges'], EDGES):
        fields(native, {'name': name, 'bits': bits, 'machine_states': len(bits) + 2,
                        'generic_schedule_actual_machine': True}, 'native generic initializer edge changed')
        fields(native['initializer'], {'steps': len(bits) + 1, 'state': len(bits) + 1,
               'head': 1 - len(bits), 'normalized_head': 0, 'tape': bits,
               'left_blank': 0, 'right_blank': 0, 'frame_min': -len(bits), 'frame_max': 1,
               'native_machine_and_rowMachine_replayed': True}, 'native generic edge final tape changed')
        fields(remote, {'name': name, 'bits': bits, 'steps': len(bits) + 1, 'physical_head': 1 - len(bits),
               'normalized_tape': bits, 'actual_generic_machine': True, 'independent_replay': True},
               'independent generic edge receipt changed')
    expected_halt = [
        {'state': 1837942, 'bit': 0, 'actual': None, 'rowMachine': None, 'independent_recipe': None},
        {'state': 1837942, 'bit': 1, 'actual': None, 'rowMachine': None, 'independent_recipe': None},
        {'state': 2371283, 'bit': 0, 'actual': [0, -1, 1837942], 'rowMachine': [0, -1, 1837942], 'independent_recipe': [0, -1, 1837942]},
        {'state': 2371283, 'bit': 1, 'actual': [1, -1, 1837942], 'rowMachine': [1, -1, 1837942], 'independent_recipe': [1, -1, 1837942]},
    ]
    need(same(detail['shared_halt_probes'], expected_halt), 'shared halt main/bounce both-bit receipt changed')
    controls = detail['mutation_controls']
    need([c['name'] for c in controls] == MUTATIONS and
         all(c['passed'] is True and c['rejected'] is True and bool(c['reason']) for c in controls),
         'sixteen exact native corruption controls missing')
    for control in controls[:7]:
        need(control['original_full_artifacts_positive'] is True and
             control['rejection_stage'] == control['validation_stages_attempted'][-1], 'corruption rejection stage changed')
    need(same(controls, binding['mutation_controls']), 'exact corruption dispositions changed')
    exported = packet['inventory']['machine-export.json']
    need(exported['sha256'] == detail['machine_json_sha256'] == detail['machine_export_sha256'] ==
         phases['fixtures']['export_sha256'] == phases['counts']['export_sha256'] == binding['machine_json_sha256'] and
         exported['bytes'] == detail['machine_json_bytes'] == detail['machine_export_bytes'], 'native payload digest changed')
    for token in ('Complete reverse initializer chess compiler passed', 'Reverse field machine passed',
                  'Reverse field regressions passed', 'Reverse native export passed', 'Reverse independent fixtures passed',
                  'Reverse full chess reduction passed', 'Chess FieldReverse foundation audit passed'):
        need(token in packet['logs_text'], 'workflow evidence token missing: ' + token)
    return {'phases': list(PHASES), 'unique_command_receipts': len(commands),
            'phase_receipt_entries': len(all_checks), 'artifact_entries': len(packet['inventory']),
            'saved_source_cases': detail['cases'], 'saved_prefix_rows': detail['complete_prefix_rows_checked'],
            'saved_body_rows': detail['complete_body_rows_checked'], 'saved_full_rows': detail['complete_full_rows_checked'],
            'prefix_rows_sha256': binding['prefix_rows_sha256'], 'prefix_rows_bytes': binding['prefix_rows_bytes'],
            'body_rows_sha256': binding['body_rows_sha256'], 'body_rows_bytes': binding['body_rows_bytes'],
            'machine_json_sha256': exported['sha256']}


def check_seal(negative=None):
    seal = read(regular(HERE / 'seal.json'))
    fields(seal, {'schema': SCHEMA, 'status': 'passed', 'review_kind': 'independent-model-advisory',
                 'formal_verification_by_reviewer': False, 'human_approval': False, 'local_heavy_computation': False,
                 'review_gates': {'R1': 'passed', 'R2': 'passed'}}, 'seal authority/scope/status changed')
    need(set(seal['review_files_sha256']) == SEALED_FILES, 'sealed file inventory changed')
    if negative == 'seal':
        seal['review_files_sha256']['check_saved_evidence.py'] = '0' * 64
    for name, expected in seal['review_files_sha256'].items():
        need(file_sha(regular(HERE / relative(name))) == expected, 'seal file mismatch: ' + name)
    return seal


def validate(root, evidence, negative=None):
    seal = check_seal(negative)
    binding, report = read(HERE / 'construction-binding.json'), read(HERE / 'review.json')
    if negative == 'claim':
        binding['claim']['states'] -= 1
    need(binding['schema'] == SCHEMA and same(binding['claim'], CLAIM), 'whole construction claim changed')
    fields(report, {'schema': SCHEMA, 'status': 'passed', 'verdict': 'correct', 'review_kind': 'independent-model-advisory',
                   'formal_verification_by_reviewer': False, 'human_approval': False, 'local_heavy_computation': False,
                   'review_gates': {'R1': 'passed', 'R2': 'passed'}, 'claim': CLAIM}, 'advisory claim/authority/status changed')
    for field, expected in (('run_id', binding['official']['run_id']), ('computation_commit', binding['official']['commit'])):
        need(report[field] == seal[field] == expected, 'sealed computation identity changed')
    source = source_manifest(root)
    need(same(source, binding['source_sha256']) and same(source, report['source_sha256']), 'current computation source binding changed')
    pins = read(regular(root / 'docs/chess/field-reverse/baseline-pins.json'))
    need(len(pins) == 2550 and same(pins, binding['frozen_source_sha256']), '2550 frozen pin inventory changed')
    for name, expected in pins.items():
        need(file_sha(regular(root / relative(name))) == expected, 'frozen prior source changed: ' + name)
    closure = source_closure(root, source, pins)
    need(same(closure, binding['repository_import_closure']), 'repository import closure changed')
    packet = load_packet(evidence)
    run = validate_packet(packet, binding['official'], official=True)
    if negative == 'entry':
        name = sorted(packet['meta']['archive-entries.json'])[0]
        packet['meta']['archive-entries.json'][name]['sha256'] = '0' * 64
        entries = {n: {k: v[k] for k in ('bytes', 'sha256')} for n, v in packet['inventory'].items()}
        need(same(packet['meta']['archive-entries.json'], entries), 'archive inventory digest changed')
    history = root / 'docs/chess/field-reverse/evidence/history'
    need(history.is_dir() and {p.name for p in history.iterdir()} == set(binding['development_runs']), 'development history inventory changed')
    need(set(binding['development_runs']) == set(binding['development_command_receipts']) ==
         set(binding['development_dispositions']), 'development disposition inventory changed')
    for name, bound in binding['development_runs'].items():
        old = load_packet(history / relative(name))
        validate_packet(old, bound)
        commands = {n: parse(v) for n, v in old['payload'].items() if n.startswith('commands/') and n.endswith('.json')}
        need(same(commands, binding['development_command_receipts'][name]), 'development command receipts changed: ' + name)
        for command in commands.values():
            need(digest(command['output'].encode()) == command['output_sha256'] and command['shell'] is False and
                 command['timed_out'] is False, 'development receipt corrupt: ' + name)
        need(binding['development_dispositions'][name]['conclusion'] == bound['conclusion'] and
             bool(binding['development_dispositions'][name]['reason']), 'development disposition changed: ' + name)
    summary = validate_phases(packet, binding, source, pins, negative)
    receipt = {'schema': SCHEMA, 'status': 'passed', 'review_kind': 'independent-model-advisory', 'claim': CLAIM,
               'run_id': run['id'], 'computation_commit': run['head_sha'], 'source_sha256': source,
               'artifact_sha256': packet['artifact_sha256'], 'logs_sha256': packet['logs_sha256'],
               'development_runs_checked': len(binding['development_runs']), 'frozen_files_checked': len(pins),
               'repository_import_files_checked': len(closure), 'formal_verification_by_reviewer': False,
               'human_approval': False, 'local_heavy_computation': False, **summary}
    need(not negative, 'negative control was accepted')
    need(same(receipt, read(HERE / 'receipt.json')), 'deterministic metadata receipt changed')
    return receipt


def discover_root():
    for parent in HERE.parents:
        if (parent / 'lean-toolchain').is_file() and (parent / 'Cryptids').is_dir():
            return parent
    raise Rejected('copied review folder requires --root REPO')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', type=Path)
    parser.add_argument('--evidence', type=Path)
    parser.add_argument('--negative', '--negative-control', dest='negative', choices=CONTROLS)
    parser.add_argument('--self-test', action='store_true')
    args = parser.parse_args()
    need(not (args.self_test and args.negative), 'self-test and individual negative modes are exclusive')
    root = (args.root or discover_root()).resolve()
    evidence = (args.evidence or root / 'docs/chess/field-reverse/evidence/current').resolve()
    receipt = validate(root, evidence, args.negative)
    if args.self_test:
        for name in CONTROLS:
            try:
                validate(root, evidence, name)
            except Rejected as error:
                need(CONTROL_ERRORS[name] in str(error), 'control rejected for wrong reason: ' + name + ': ' + str(error))
            else:
                raise Rejected('evidence corruption escaped: ' + name)
        with tempfile.TemporaryDirectory(prefix='chess-reverse-portability-') as temporary:
            target = Path(temporary) / 'review'
            shutil.copytree(HERE, target)
            result = subprocess.run([sys.executable, str(target / 'check_saved_evidence.py'), '--root', str(root),
                                     '--evidence', str(evidence)], stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                                    text=True, timeout=180, check=False)
            need(result.returncode == 0 and 'Reverse sealed evidence review passed' in result.stdout,
                 'copied-directory metadata portability failed: ' + result.stdout[-2000:])
        print('Reverse sealed evidence controls passed')
    else:
        print(json.dumps(receipt, sort_keys=True, indent=2))
        print('Reverse sealed evidence review passed')


if __name__ == '__main__':
    try:
        main()
    except (Rejected, KeyError, TypeError, ValueError, OSError, zipfile.BadZipFile, subprocess.SubprocessError) as error:
        print('Reverse sealed evidence rejected: ' + str(error))
        sys.exit(1)
