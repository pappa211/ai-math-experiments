# Actual publication reproduction evidence

**PASS.** Fresh project rebuild finished 2026-10-30T21:20:57.971780+00:00; full fresh-object replay finished 2026-10-30T21:30:37.107427+00:00.

- [Summary](PUBLICATION_VERIFICATION.json), [complete build evidence](build/verification.json), [complete replay evidence](replay/verification.json).
- [Exact main theorem types and axioms](MAIN_THEOREM_TYPES.log), [all 618 declaration axiom closures](build/declaration-axioms.json), and the complete type/axiom audit logs in `build/`.
- Every one of the 280 compiler commands and 280 exact-module replay commands has its output log in the corresponding directory. All successful command exit statuses, source/module coverage and source/object hashes are preserved.
- [Pinned bootstrap verification](bootstrap-verification.json) exercises the separately verified compiled-package reuse route and confirms pins/configuration remain unchanged. No cold network/cache acquisition is claimed.
- [Public-only finite input resolution](finite-input-resolution.json) records zero nonpublic file opens; the [three regenerated checker reports](../../checks/) identify their finite scope.

These logs/reports are **public derivatives** of actual execution evidence. Operational paths are replaced by descriptive placeholders. Original-evidence SHA-256 fields identify original private reports, not these changed derivatives. The replay report's active prior-build hash is regenerated to authenticate the included public build report; its original prior-build identity is separately labeled. Mathematical source/object hashes, theorem names, command exit statuses and coverage are unchanged. The public file manifests authenticate derivative bytes.

All 280 mathematical modules retain their frozen bytes and rebuild into new project objects. All 618 public theorem types/transitive axioms are printed; the main theorem and frozen target have only `Classical.choice`, `Quot.sound`, `propext`. Compiled dependencies at all nine exact manifest pins are reused. Standard-kernel replay checks all 280 fresh local modules using the unchanged upstream replay routine and the documented IO adapter; it is neither a cold Mathlib rebuild nor an independent kernel implementation. Historical diagnostic failures are discussed in [failed approaches](../../FAILED_APPROACHES.md); no pilot is substituted for these successful stages.
