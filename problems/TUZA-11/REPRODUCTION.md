# TUZA-11 public reproduction

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
