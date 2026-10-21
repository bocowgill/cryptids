# Independent return-capsule review replay

This is an advisory model review. The reviewer runs only saved-metadata, archive,
and source-hash checks locally; all Lean, native, transition replay, fixture, and
count execution belongs to the retained official remote workflow.

After `seal.json`, `construction-binding.json`, and `receipt.json` are present:

```sh
python3 check_saved_evidence.py --root /absolute/path/to/cryptids
```

For a copied evidence directory, also pass
`--evidence /absolute/path/to/current`. Keep the review files together; the seal
hashes their exact contents. The checker uses only the Python standard library,
never launches a command, and never parses or executes the machine's rows.

The six deliberate rejection controls are `source`, `entry`, `claim`, `receipt`,
`missing-phase`, and `seal`:

```sh
python3 check_saved_evidence.py --root /absolute/path/to/cryptids --negative-control source
```

A control must exit 1 with its specific rejection reason. Normal replay must exit
0 and reproduce `receipt.json`. `R1.md` preserves the original critique;
`R1-repair.md` records its resolution; `R2.md` gives the final scope and evidence.
