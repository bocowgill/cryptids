#!/usr/bin/env python3
"""Bounded, remote-only exact whole-body binary bisimulation pilot.

This finite certificate is experimental evidence, not a Lean certificate or a
new accepted chess machine. Every allocated state and both rows are included.
"""

import os

if os.environ.get("CHESS_REMOTE") != "1" or os.environ.get("GITHUB_ACTIONS") != "true":
    raise SystemExit("Remote-only pilot: require CHESS_REMOTE=1 and GITHUB_ACTIONS=true")

import argparse
from array import array
from collections import Counter, deque
import hashlib
import json
from pathlib import Path
import resource
import signal
import sys
import tempfile
import time


ROOT = Path(__file__).resolve().parents[2]
DEFAULT_INPUT = ROOT / "docs/chess/campaign-2026-10-22/round-01/evidence/final/unpacked/body-rows.jsonl"
DEFAULT_OUTPUT = ROOT / ".lake/chess-body-20261022"
SOURCE_SHA256 = "d2afbf1c0abe1afb0008029680c5bc52b41f2dc21718a88d16b7aecd06becb0a"
BODY_STATES = 573802
MAIN_STATES = 533341
RETURN_STATES = 40461
SOURCE_OFFSET = 1837941
EXPERIMENTAL_PREFIX = 424374
ACCEPTED_TOTAL = 2411743
EXPERIMENTAL_TOTAL = 998176
ARTIFACTS = ("class-map.u32le", "representatives.u32le", "class-sizes.u32le", "quotient-rows.jsonl")


def require(condition, message):
    if not condition:
        raise AssertionError(message)


def write_json(path, value):
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    temporary.replace(path)


def file_info(path):
    digest = hashlib.sha256()
    size = 0
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b""):
            digest.update(chunk)
            size += len(chunk)
    return {"sha256": digest.hexdigest(), "bytes": size}


class BudgetExceeded(RuntimeError):
    pass


class Budget:
    """One wall-clock/address-space budget, including fixtures and certificate IO."""

    def __init__(self, output, seconds, memory_gib):
        self.output = output
        self.start = time.monotonic()
        self.seconds = seconds
        self.phase = "starting"
        self.last_checkpoint = 0.0
        self.progress = {}
        self.summary = {
            "status": "running", "classification": "FINITE_EXPERIMENTAL_PILOT",
            "new_accepted_machine": False, "lean_certificate": False,
            "limits": {"wall_seconds": seconds, "address_space_bytes": memory_gib * (1 << 30),
                       "cleanup_reserve_seconds": 3},
            "run_id": os.environ.get("GITHUB_RUN_ID"),
            "commit": os.environ.get("GITHUB_SHA"),
            "pilot_source": file_info(Path(__file__)),
            "source": {"sha256": SOURCE_SHA256, "states": BODY_STATES,
                       "rows": 2 * BODY_STATES, "offset": SOURCE_OFFSET},
        }
        resource.setrlimit(resource.RLIMIT_AS, (memory_gib * (1 << 30), memory_gib * (1 << 30)))
        self.emergency_reserve = bytearray(4 << 20)
        signal.signal(signal.SIGALRM, self.expired)
        signal.setitimer(signal.ITIMER_REAL, max(0.1, seconds - 3))

    def expired(self, _signum, _frame):
        # Keep the final failure summary bounded even if a cleanup operation stalls.
        signal.signal(signal.SIGALRM, lambda *_: os._exit(124))
        signal.setitimer(signal.ITIMER_REAL, 3)
        raise BudgetExceeded("global wall budget reached (three seconds reserved for diagnostics)")

    def checkpoint(self, phase=None, force=False, **progress):
        if phase is not None and phase != self.phase:
            self.phase = phase
            self.progress = {}
            force = True
        self.progress.update(progress)
        elapsed = time.monotonic() - self.start
        if force or elapsed - self.last_checkpoint >= 15:
            self.summary.update({"phase": self.phase, "progress": self.progress,
                                 "elapsed_seconds": elapsed,
                                 "peak_rss_kib": resource.getrusage(resource.RUSAGE_SELF).ru_maxrss})
            write_json(self.output / "pilot-summary.json", self.summary)
            self.last_checkpoint = elapsed
            print(json.dumps({"phase": self.phase, "elapsed_seconds": round(elapsed, 3),
                              **self.progress}), flush=True)


class Table:
    def __init__(self, states):
        self.states = states
        self.labels = [bytearray(states), bytearray(states)]
        self.dest = [array("i", [-1]) * states, array("i", [-1]) * states]


def load_source(path, states, offset, expected_sha256, budget):
    """Builder-side decoder. Certificate verification below parses independently."""
    table = Table(states)
    digest = hashlib.sha256()
    missing = []
    rows = 0
    for index, raw in enumerate(path.open("rb")):
        require(index < 2 * states and raw.endswith(b"\n"), "source row count/newline")
        digest.update(raw)
        record = json.loads(raw)
        q, symbol = divmod(index, 2)
        require(type(record) is list and len(record) == 3, "source record shape")
        require(type(record[0]) is int and record[0] == offset + q and
                type(record[1]) is int and record[1] == symbol, "source exact row order")
        row = record[2]
        if row is None:
            missing.append([q, symbol])
        else:
            require(type(row) is list and len(row) == 3 and all(type(x) is int for x in row),
                    "source transition shape")
            write, direction, destination = row
            require(write in (0, 1) and direction in (-1, 1) and
                    offset <= destination < offset + states, "source transition domain")
            table.labels[symbol][q] = 1 + 2 * write + (direction == 1)
            table.dest[symbol][q] = destination - offset
        rows += 1
        if index % 16384 == 0:
            budget.checkpoint(rows_loaded=rows)
    require(rows == 2 * states, "source truncated")
    require(digest.hexdigest() == expected_sha256, "source SHA256 pin mismatch")
    return table, missing


def hopcroft(table, budget):
    """Observation-initialized Hopcroft refinement; never prune unreachable states.

    A block's ID always stays with its larger child. Each new smaller child is
    queued for both symbols, and existing queued old IDs still name the larger
    child. This is the usual worklist replacement rule without duplicate IDs.
    Collect all predecessors before splitting, since a splitter can split itself.
    """
    n = table.states
    by_observation = {}
    blocks = []
    owner = array("I", [0]) * n
    for q in range(n):
        observation = 5 * table.labels[0][q] + table.labels[1][q]
        if observation not in by_observation:
            by_observation[observation] = len(blocks)
            blocks.append(set())
        block = by_observation[observation]
        blocks[block].add(q)
        owner[q] = block
    initial = len(blocks)
    heads = [array("i", [-1]) * n, array("i", [-1]) * n]
    links = [array("i", [-1]) * n, array("i", [-1]) * n]
    for symbol in (0, 1):
        for q, target in enumerate(table.dest[symbol]):
            if target != -1:
                links[symbol][q] = heads[symbol][target]
                heads[symbol][target] = q
    pending = deque((block, symbol) for block in range(initial) for symbol in (0, 1))
    popped = 0
    edges = 0
    max_pending = len(pending)
    while pending:
        splitter, symbol = pending.popleft()
        affected = {}
        for target in blocks[splitter]:
            q = heads[symbol][target]
            while q != -1:
                affected.setdefault(owner[q], []).append(q)
                edges += 1
                q = links[symbol][q]
        for block, hits in affected.items():
            old = blocks[block]
            if len(hits) == len(old):
                continue
            hit_set = set(hits)
            moved = hit_set if len(hits) <= len(old) // 2 else old.difference(hit_set)
            require(moved and len(moved) <= len(old) // 2, "invalid smaller-half split")
            old.difference_update(moved)
            new = len(blocks)
            blocks.append(moved)
            for q in moved:
                owner[q] = new
            pending.append((new, 0))
            pending.append((new, 1))
        popped += 1
        max_pending = max(max_pending, len(pending))
        if popped % 256 == 0:
            budget.checkpoint(partition_classes=len(blocks), pending_splitters=len(pending),
                              popped_splitters=popped, predecessor_visits=edges,
                              partition_stability_checked=False)
    # Canonical class order is increasing least member; the class of old 0 is 0.
    ordering = sorted((min(members), block) for block, members in enumerate(blocks))
    representatives = array("I", (q for q, _ in ordering))
    sizes = array("I", (len(blocks[block]) for _, block in ordering))
    mapping = array("I", [0]) * n
    for new, (_, old) in enumerate(ordering):
        for q in blocks[old]:
            mapping[q] = new
    require(mapping[0] == 0, "entry not canonical zero")
    return mapping, representatives, sizes, {
        "algorithm": "output-labelled Hopcroft, retained larger IDs, queued smaller children",
        "initial_observation_classes": initial, "splits": len(blocks) - initial,
        "popped_splitters": popped, "predecessor_visits": edges,
        "maximum_pending_splitters": max_pending, "worklist_exhausted": True,
        "maximality_basis": "observation initialization and bisimulation-respecting refinement; small naive oracle",
        "independent_large_certificate_proves": "exact all-row quotient, not independent minimality",
    }


def write_words(path, words):
    data = array("I", words)
    require(data.itemsize == 4, "u32 array platform")
    if sys.byteorder != "little":
        data.byteswap()
    with path.open("wb") as stream:
        data.tofile(stream)


def read_words(path, expected_count):
    require(path.stat().st_size == 4 * expected_count, (path.name, "exact binary census"))
    data = array("I")
    with path.open("rb") as stream:
        data.fromfile(stream, expected_count)
        require(stream.read(1) == b"", "binary trailing data")
    require(data.itemsize == 4, "u32 array platform")
    if sys.byteorder != "little":
        data.byteswap()
    return data


def export_certificate(folder, table, mapping, representatives, sizes, source_sha, offset):
    folder.mkdir(parents=True, exist_ok=True)
    write_words(folder / ARTIFACTS[0], mapping)
    write_words(folder / ARTIFACTS[1], representatives)
    write_words(folder / ARTIFACTS[2], sizes)
    with (folder / ARTIFACTS[3]).open("w", encoding="utf-8") as stream:
        for new, old in enumerate(representatives):
            for symbol in (0, 1):
                label = table.labels[symbol][old]
                row = None if label == 0 else [(label - 1) // 2, 1 if label % 2 == 0 else -1,
                                              mapping[table.dest[symbol][old]]]
                stream.write(json.dumps([new, symbol, row], separators=(",", ":")) + "\n")
    manifest = {
        "format_version": 1, "classification": "FINITE_EXPERIMENTAL_PILOT",
        "source_sha256": source_sha, "source_states": table.states, "source_offset": offset,
        "source_rows": 2 * table.states, "quotient_states": len(representatives),
        "quotient_rows": 2 * len(representatives), "entry_class": 0,
        "canonical_order": "classes ordered by least original standalone body index",
        "binary_format": "headerless unsigned 32-bit little-endian; one word per source state or class",
        "row_format": "jsonl:[standalone_class,bit,null-or-[write,direction,standalone_class]]",
        "artifacts": {name: file_info(folder / name) for name in ARTIFACTS},
    }
    write_json(folder / "certificate-manifest.json", manifest)
    return manifest


def verify_certificate(source, source_states, offset, source_sha, folder, budget):
    """Independent serialized-certificate checker; no splitter/builder-table access.

    Reparse every quotient row and every original row. For each old q and bit b,
    check Q(map(q),b) == map_target(Old(q,b)), with None preserved in both
    directions. Also establish a total surjection, canonical representatives,
    exact per-class census, entry identity, destination bounds, and all hashes.
    """
    manifest = json.loads((folder / "certificate-manifest.json").read_text(encoding="utf-8"))
    k = manifest["quotient_states"]
    require(type(k) is int and 1 <= k <= source_states, "quotient count domain")
    require(manifest["format_version"] == 1 and manifest["source_states"] == source_states and
            manifest["source_rows"] == 2 * source_states and manifest["source_offset"] == offset and
            manifest["source_sha256"] == source_sha and manifest["quotient_rows"] == 2 * k and
            manifest["entry_class"] == 0, "manifest source/count/entry mismatch")
    for name in ARTIFACTS:
        require(file_info(folder / name) == manifest["artifacts"][name], (name, "artifact hash/size"))
    mapping = read_words(folder / ARTIFACTS[0], source_states)
    representatives = read_words(folder / ARTIFACTS[1], k)
    declared_sizes = read_words(folder / ARTIFACTS[2], k)
    require(mapping[0] == 0 and representatives[0] == 0, "entry class identity")
    counts = array("I", [0]) * k
    minima = array("I", [source_states]) * k
    for q, c in enumerate(mapping):
        require(c < k, (q, "map destination out of bounds"))
        counts[c] += 1
        if q < minima[c]:
            minima[c] = q
    require(all(counts), "class map not surjective")
    require(counts == declared_sizes, "class census differs")
    require(minima == representatives, "representatives are not canonical least members")
    require(all(representatives[i - 1] < representatives[i] for i in range(1, k)),
            "classes not in canonical order")
    quotient = []
    with (folder / ARTIFACTS[3]).open("rb") as stream:
        for index, raw in enumerate(stream):
            require(index < 2 * k and raw.endswith(b"\n"), "quotient row count/newline")
            record = json.loads(raw)
            require(type(record) is list and len(record) == 3 and
                    type(record[0]) is int and record[0] == index // 2 and
                    type(record[1]) is int and record[1] == index % 2, "quotient row order/shape")
            row = record[2]
            if row is not None:
                require(type(row) is list and len(row) == 3 and all(type(x) is int for x in row) and
                        row[0] in (0, 1) and row[1] in (-1, 1) and 0 <= row[2] < k,
                        "quotient transition domain")
            quotient.append(row)
    require(len(quotient) == 2 * k, "quotient row truncation")
    digest = hashlib.sha256()
    rows = 0
    missing_rows = 0
    with source.open("rb") as stream:
        for index, raw in enumerate(stream):
            require(index < 2 * source_states and raw.endswith(b"\n"), "source census/newline")
            digest.update(raw)
            record = json.loads(raw)
            require(type(record) is list and len(record) == 3 and
                    type(record[0]) is int and record[0] == offset + index // 2 and
                    type(record[1]) is int and record[1] == index % 2, "source order/shape")
            old_row = record[2]
            actual = quotient[2 * mapping[index // 2] + index % 2]
            if old_row is None:
                require(actual is None, (index, "source halt not reflected"))
                missing_rows += 1
            else:
                require(type(old_row) is list and len(old_row) == 3 and
                        all(type(x) is int for x in old_row) and old_row[0] in (0, 1) and
                        old_row[1] in (-1, 1) and offset <= old_row[2] < offset + source_states,
                        (index, "source transition domain"))
                expected = [old_row[0], old_row[1], mapping[old_row[2] - offset]]
                require(actual == expected, (index, "universal mapped-row equality", actual, expected))
            rows += 1
            if index % 16384 == 0:
                budget.checkpoint(certificate_rows_checked=rows, certificate_total_rows=2 * source_states)
    require(rows == 2 * source_states, "source row truncation")
    require(digest.hexdigest() == source_sha, "certificate source hash pin")
    return {"status": "passed", "source_states_checked": source_states,
            "source_rows_checked": rows, "quotient_states_checked": k,
            "quotient_rows_checked": len(quotient), "source_missing_rows_checked": missing_rows,
            "total_surjection": True, "canonical_least_representatives": True,
            "exact_class_sizes": True, "entry_class_zero": True,
            "all_allocated_states_included": True, "every_old_row_commutes": True,
            "halting_write_and_direction_reflected": True}


def naive_reference(rows):
    """Deliberately independent synchronous signature refinement for small literals."""
    colors = [0] * len(rows)
    while True:
        signatures = [tuple(None if r is None else (r[0], r[1], colors[r[2]]) for r in pair)
                      for pair in rows]
        catalog = {}
        new = []
        for signature in signatures:
            if signature not in catalog:
                catalog[signature] = len(catalog)
            new.append(catalog[signature])
        if new == colors:
            return new
        colors = new


GOLDENS = [
    ("cycle_self_loop_and_unreachable_halt", [
        [[0, 1, 1], [1, -1, 1]], [[0, 1, 0], [1, -1, 0]],
        [[0, 1, 2], [1, -1, 2]], [None, None]], [0, 0, 0, 1]),
    ("delayed_distinction_and_equivalent_suffix", [
        [[0, 1, 1], [1, 1, 1]], [[0, 1, 2], [1, 1, 2]],
        [[0, 1, 3], [1, 1, 3]], [None, None],
        [[0, 1, 5], [1, 1, 5]], [[0, 1, 5], [1, 1, 5]],
        [[0, 1, 3], [1, 1, 3]]], [0, 1, 2, 3, 4, 4, 2]),
    ("both_symbols_write_direction_and_partial_halt", [
        [[0, 1, 0], [1, 1, 0]], [[1, 1, 1], [1, 1, 1]],
        [[0, 1, 2], [1, -1, 2]], [None, None],
        [[0, 1, 4], [1, 1, 4]], [[0, 1, 5], None],
        [None, [1, 1, 6]]], [0, 1, 2, 3, 0, 4, 5]),
]


def run_goldens(output, budget):
    reports = []
    for name, rows, literal_map in GOLDENS:
        folder = output / "goldens" / name
        folder.mkdir(parents=True, exist_ok=True)
        source = folder / "source-rows.jsonl"
        source.write_text("".join(json.dumps([q, b, row], separators=(",", ":")) + "\n"
                                  for q, pair in enumerate(rows) for b, row in enumerate(pair)),
                          encoding="utf-8")
        digest = file_info(source)["sha256"]
        table, _ = load_source(source, len(rows), 0, digest, budget)
        mapping, representatives, sizes, stats = hopcroft(table, budget)
        require(list(mapping) == literal_map, (name, "literal golden map", list(mapping)))
        require(list(mapping) == naive_reference(rows), (name, "independent naive reference"))
        export_certificate(folder, table, mapping, representatives, sizes, digest, 0)
        checked = verify_certificate(source, len(rows), 0, digest, folder, budget)
        report = {"name": name, "literal_map": literal_map, "certificate": checked, "refinement": stats}
        if name == "delayed_distinction_and_equivalent_suffix":
            # A wrong partition with valid entry, canonical order, surjection and
            # class census. Only the universal mapped-row check can reject it.
            with tempfile.TemporaryDirectory(prefix="overmerged-", dir=output) as temporary:
                bad_folder = Path(temporary)
                export_certificate(bad_folder, table, [0, 0, 1, 2, 3, 3, 1],
                                   [0, 2, 3, 4], [2, 2, 1, 2], digest, 0)
                try:
                    verify_certificate(source, len(rows), 0, digest, bad_folder, budget)
                except AssertionError as error:
                    require("universal mapped-row equality" in str(error),
                            (name, "overmerge failed before the intended semantic check", str(error)))
                    report["well_formed_overmerged_partition"] = {"status": "rejected", "reason": str(error)}
                else:
                    raise AssertionError("well-formed overmerged golden partition accepted")
        reports.append(report)
    return reports


def hostile_controls(source, source_states, offset, source_sha, certificate_folder, budget):
    """Run only AFTER a positive certificate check; refresh hashes after mutations.

    Thus rejection must come from semantic/census obligations, not merely a stale
    digest. Every hostile variant uses the same complete certificate checker.
    """
    original = json.loads((certificate_folder / "certificate-manifest.json").read_text())
    k = original["quotient_states"]
    require(k >= 2, "negative-control fixture needs distinct quotient states")
    cases = ("corrupt_map", "corrupt_write", "corrupt_direction", "corrupt_destination", "corrupt_halt",
             "undercount", "truncated_quotient", "truncated_map", "truncated_source",
             "noncanonical_representative", "wrong_class_size", "source_order")
    results = []
    for case in cases:
        with tempfile.TemporaryDirectory(prefix="hostile-", dir=budget.output) as temporary:
            folder = Path(temporary)
            manifest = json.loads(json.dumps(original))
            for name in ARTIFACTS:
                os.link(certificate_folder / name, folder / name)
            changed = None
            test_source = source
            if case in ("corrupt_map", "truncated_map", "noncanonical_representative", "wrong_class_size"):
                changed = {"corrupt_map": ARTIFACTS[0], "truncated_map": ARTIFACTS[0],
                           "noncanonical_representative": ARTIFACTS[1], "wrong_class_size": ARTIFACTS[2]}[case]
                count = source_states if changed == ARTIFACTS[0] else k
                words = read_words(folder / changed, count)
                if case == "truncated_map":
                    words.pop()
                elif case == "corrupt_map":
                    words[0] = 1
                elif case == "noncanonical_representative":
                    words[0] = 1
                else:
                    words[0] += 1
                (folder / changed).unlink()
                write_words(folder / changed, words)
            elif case in ("corrupt_write", "corrupt_direction", "corrupt_destination", "corrupt_halt", "truncated_quotient"):
                changed = ARTIFACTS[3]
                records = [json.loads(line) for line in (folder / changed).read_text().splitlines()]
                if case == "truncated_quotient":
                    records.pop()
                else:
                    candidates = [r for r in records if (r[2] is None) == (case == "corrupt_halt")]
                    require(candidates, (case, "missing positive mutation target"))
                    row = candidates[0]
                    if case == "corrupt_halt":
                        row[2] = [0, 1, 0]
                    elif case == "corrupt_write":
                        row[2][0] ^= 1
                    elif case == "corrupt_direction":
                        row[2][1] *= -1
                    else:
                        row[2][2] = (row[2][2] + 1) % k
                (folder / changed).unlink()
                with (folder / changed).open("w", encoding="utf-8") as stream:
                    for record in records:
                        stream.write(json.dumps(record, separators=(",", ":")) + "\n")
            elif case == "undercount":
                manifest["quotient_states"] -= 1
                manifest["quotient_rows"] -= 2
            else:
                test_source = folder / "hostile-source.jsonl"
                with source.open("rb") as stream:
                    first = stream.readline()
                if case == "source_order":
                    record = json.loads(first)
                    record[1] = 1
                    first = (json.dumps(record) + "\n").encode()
                test_source.write_bytes(first)
            if changed:
                manifest["artifacts"][changed] = file_info(folder / changed)
            write_json(folder / "certificate-manifest.json", manifest)
            try:
                verify_certificate(test_source, source_states, offset, source_sha, folder, budget)
            except AssertionError as error:
                results.append({"name": case, "status": "rejected", "reason": str(error),
                                "mutated_artifact_hash_refreshed": changed is not None})
            else:
                raise AssertionError((case, "hostile certificate accepted"))
        budget.checkpoint(hostile_controls_rejected=len(results), hostile_controls_total=len(cases))
    return results


def family_breakdown(mapping, representatives, sizes):
    """Only source-index facts: do not infer unverified syntax categories."""
    k = len(representatives)
    main_counts = array("I", [0]) * k
    return_counts = array("I", [0]) * k
    for q, c in enumerate(mapping):
        (main_counts if q < MAIN_STATES else return_counts)[c] += 1
    family = Counter("mixed" if main_counts[c] and return_counts[c] else
                     "main_only" if main_counts[c] else "return_only" for c in range(k))
    # Source convention: encoded main indices 0 and 1 swap raw live-entry and halt.
    # The main input loader separately requires the pinned halt at standalone 1.
    store_groups = Counter()
    for node in range((MAIN_STATES - 1) // 5):
        members = []
        for store in range(5):
            raw = 1 + 5 * node + store
            members.append(mapping[0 if raw == 1 else raw])
        store_groups[len(set(members))] += 1
    main_touched = sum(bool(x) for x in main_counts)
    return_touched = sum(bool(x) for x in return_counts)
    main_collapse = MAIN_STATES - main_touched
    return_collapse = RETURN_STATES - return_touched
    cross_family = family["mixed"]
    store_only_saving = sum((5 - distinct) * nodes for distinct, nodes in store_groups.items())
    total_saving = BODY_STATES - k
    require(main_collapse + return_collapse + cross_family == total_saving, "family savings partition")
    require(store_only_saving <= main_collapse, "within-node saving exceeds all main sharing")
    return {
        "source_main_states": MAIN_STATES, "source_return_states": RETURN_STATES,
        "class_membership_counts": dict(family), "classes_touched_by_main": main_touched,
        "classes_touched_by_return": return_touched,
        "additive_saving_breakdown": {"within_main": main_collapse,
                                      "within_return": return_collapse,
                                      "additional_main_return_merges": cross_family},
        "within_node_five_store_distinct_class_histogram": dict(sorted(store_groups.items())),
        "same_node_store_only_saving": store_only_saving,
        "remaining_main_saving_across_nodes": main_collapse - store_only_saving,
        "class_size_histogram": dict(sorted(Counter(sizes).items())),
        "largest_classes": [{"class": c, "representative": representatives[c], "size": sizes[c],
                             "main_members": main_counts[c], "return_members": return_counts[c]}
                            for c in sorted(range(k), key=lambda c: (-sizes[c], c))[:32]],
        "interpretation_limit": "cross-node sharing can include repeated suffixes; syntax cause is not established",
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, default=DEFAULT_INPUT)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--seconds", type=int, default=600)
    parser.add_argument("--memory-gib", type=int, default=6)
    args = parser.parse_args()
    require(5 <= args.seconds <= 600 and 1 <= args.memory_gib <= 6, "budget outside pilot bounds")
    require(sys.platform == "linux", "resource accounting requires Linux GitHub Actions")
    require(ACCEPTED_TOTAL == SOURCE_OFFSET + BODY_STATES and
            EXPERIMENTAL_TOTAL == EXPERIMENTAL_PREFIX + BODY_STATES and
            MAIN_STATES + RETURN_STATES == BODY_STATES, "baseline accounting mismatch")
    args.output.mkdir(parents=True, exist_ok=True)
    budget = Budget(args.output, args.seconds, args.memory_gib)
    try:
        budget.checkpoint("literal_goldens", force=True)
        goldens = run_goldens(args.output, budget)
        budget.summary["goldens"] = goldens
        budget.checkpoint("load_pinned_complete_source", force=True)
        table, missing = load_source(args.input, BODY_STATES, SOURCE_OFFSET, SOURCE_SHA256, budget)
        require(missing == [[1, 0], [1, 1]], "pinned body's exact halt census")
        budget.summary["source"]["missing_standalone_rows"] = missing
        budget.checkpoint("bounded_partition", force=True)
        mapping, representatives, sizes, stats = hopcroft(table, budget)
        budget.summary["refinement"] = stats
        budget.checkpoint("export_complete_certificate", force=True,
                          candidate_classes=len(representatives), partition_stability_checked=False)
        manifest = export_certificate(args.output, table, mapping, representatives, sizes,
                                      SOURCE_SHA256, SOURCE_OFFSET)
        budget.summary["certificate_manifest"] = manifest
        del table
        budget.checkpoint("independent_every_old_row_check", force=True)
        checked = verify_certificate(args.input, BODY_STATES, SOURCE_OFFSET, SOURCE_SHA256,
                                     args.output, budget)
        budget.summary["certificate_check"] = checked
        budget.checkpoint("hostile_controls_after_positive", force=True)
        negatives = hostile_controls(args.input, BODY_STATES, SOURCE_OFFSET, SOURCE_SHA256,
                                     args.output, budget)
        budget.summary["hostile_controls"] = negatives
        budget.checkpoint("whole_machine_accounting_and_source_families", force=True)
        breakdown = family_breakdown(mapping, representatives, sizes)
        write_json(args.output / "source-family-breakdown.json", breakdown)
        k = len(representatives)
        certificate_bytes = sum(item["bytes"] for item in manifest["artifacts"].values())
        budget.summary.update({
            "status": "passed", "quotient_body_states": k, "body_saving": BODY_STATES - k,
            "accounting": {"accepted_best_unchanged": ACCEPTED_TOTAL,
                           "accepted_writer_states": SOURCE_OFFSET,
                           "prospective_full_total_with_accepted_writer": SOURCE_OFFSET + k,
                           "additional_saving_against_accepted": ACCEPTED_TOTAL - SOURCE_OFFSET - k,
                           "experimental_round02_prefix_states": EXPERIMENTAL_PREFIX,
                           "experimental_round02_total_before_body_quotient": EXPERIMENTAL_TOTAL,
                           "prospective_full_total_with_experimental_prefix": EXPERIMENTAL_PREFIX + k,
                           "additional_saving_against_experimental_round02": EXPERIMENTAL_TOTAL - EXPERIMENTAL_PREFIX - k,
                           "all_states_counted_no_reachability_pruning": True},
            "source_family_breakdown": breakdown, "certificate_artifact_bytes": certificate_bytes,
            "certificate_binary_map_bytes": manifest["artifacts"][ARTIFACTS[0]]["bytes"],
            "proof_effort": {
                "finite_checker_obligations": "all source rows, quotient rows, total surjection, canonical representatives, exact census",
                "row_equalities_for_direct_formal_certificate": 2 * BODY_STATES,
                "map_entries_for_direct_formal_certificate": BODY_STATES,
                "structural_compression_recommended": True,
                "next_proof_work": "generic exact-row quotient simulation plus actual-table/map identity; seek a structural compiler map before a million-row Lean certificate",
                "unproved_here": "Lean refinement, full linked machine acceptance, independent large minimality certificate",
            },
        })
        budget.checkpoint("complete", force=True, partition_stability_checked=True,
                          certificate_rows_checked=2 * BODY_STATES, hostile_controls_rejected=len(negatives))
        signal.setitimer(signal.ITIMER_REAL, 0)
        print("Whole-body exact quotient pilot passed", flush=True)
        return 0
    except Exception as error:
        budget.emergency_reserve = None
        budget.summary["status"] = "incomplete" if isinstance(error, (BudgetExceeded, MemoryError)) else "failed"
        budget.summary["obstruction"] = {"type": type(error).__name__, "message": str(error),
                                         "phase": budget.phase,
                                         "partial_partition_is_valid_quotient": False,
                                         "partial_artifacts_are_not_accepted_evidence": True}
        budget.checkpoint(force=True)
        signal.setitimer(signal.ITIMER_REAL, 0)
        print("Whole-body exact quotient pilot did not pass: " + repr(error), file=sys.stderr, flush=True)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
