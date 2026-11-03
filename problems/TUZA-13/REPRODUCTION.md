# TUZA-13 public reproduction

From the repository root, with Python 3.10 or newer and assertions enabled:

```sh
python3 tools/check_tuza_11_15.py --output ../tuza-11-15-replay
```

The output path must be new and outside the checkout. All standard checks use
only the Python standard library and run serially on copies of public inputs.
The suite records per-command results in `REPRODUCTION.json`, with raw local
outputs under `public-copy/` and `logs/`. Those generated outputs may describe
the user's local environment; they are not automatically published.

The [top-level guide](../../REPRODUCTION.md#tuza-1115-ordinary-proofs-and-exact-finite-checks)
explains fresh versus historical evidence. Full ordinary arguments are linked
from [README.md](README.md); finite tests do not replace them.

## Historical literal corpus

The mathematical JSONL ledgers (some gzip-compressed) retain the exact tested
inputs, cover witnesses and unfinished statuses; `SEARCH_COVERAGE.json`
provides the ranges and literal timeout inputs. They are historical results,
not fresh solver runs. The default suite only repeats small controls and a
nearest/cover-drop witness. Adaptive timed searches may produce a different
attempted prefix; they do not redefine the retained completed domain.

The optional ratio recount performs no optimization:

```sh
python3 problems/TUZA-14B/generators/ratio_audit.py --source problems/TUZA-13 --out ../tuza-ratio-recount
```

The new output path must not exist. This reads the shipped mathematical
corpus and checks arithmetic, identities, overlap and UNKNOWN accounting.
It does not rerun millions of cover optimizations or certify new optima.
Discovery generators under `checks/` write named data files; run them only in
a further scratch copy. The rooted auxiliary diagnostic alone uses NetworkX;
standard reproduction and the ratio recount are standard-library-only.
