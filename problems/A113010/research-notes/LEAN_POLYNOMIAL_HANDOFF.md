> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Sparse polynomial support and root multiplicity — Session 01

Final wrapper verification completed 2026-10-27 10:48 UTC.
Owned source: `proof/A113010/PolynomialSupport.lean`. Other proof files unchanged.

## Attribution and scope

This is an independent Lean formalization of a known lemma, not a new
mathematical discovery. Sandro Mattarei, *Root multiplicities and number of
nonzero coefficients of a polynomial*, arXiv:math/0512239v2 (2006),
https://arxiv.org/pdf/math/0512239, explicitly identifies the characteristic-zero
support/multiplicity bound as already known. The module documentation records
this attribution.

This is supporting polynomial mathematics. No theorem connecting it to decimal
carry behavior or establishing either frozen A113010 target is claimed.

## Fully checked public results

For any characteristic-zero field K:

```lean
OeisA113010.rootMultiplicity_lt_support_card
  {p : K[X]} (hp : p ≠ 0) {α : K} (hα : α ≠ 0) :
  p.rootMultiplicity α < p.support.card
```

This includes non-roots, whose multiplicity is zero. Both the polynomial and
the evaluation point must be nonzero.

```lean
OeisA113010.support_card_power_of_nonzero_root
  {p : K[X]} (hp : p ≠ 0) {α : K} (hα : α ≠ 0)
  (hroot : p.IsRoot α) (s : ℕ) :
  s + 1 ≤ (p ^ s).support.card
```

For any algebraically closed field K (characteristic zero is not needed here):

```lean
OeisA113010.exists_nonzero_root_of_two_le_support_card
  [IsAlgClosed K] {p : K[X]} (hcard : 2 ≤ p.support.card) :
  ∃ α : K, α ≠ 0 ∧ p.IsRoot α
```

For any algebraically closed characteristic-zero field K:

```lean
OeisA113010.support_card_power_of_two_le_support_card
  [IsAlgClosed K] {p : K[X]} (hcard : 2 ≤ p.support.card) (s : ℕ) :
  s + 1 ≤ (p ^ s).support.card
```

The last theorem proves the genuinely nonmonomial power-support statement;
the support-cardinality hypothesis already excludes zero. Both power theorems
hold for every natural s, including zero. They specialize directly to the
complex numbers. Generic transport from an arbitrary characteristic-zero
field into its algebraic closure is not implemented or needed by this scope.

## Proof structure

No existing Mathlib sparse-support multiplicity theorem was found in the pinned
library. Strong induction on natural degree proves the bound:

- If the point is not a root, nonempty support gives the result.
- If the constant coefficient vanishes, division by X preserves support size
  and multiplicity at a nonzero point, while decreasing the degree.
- Otherwise differentiation removes exactly one support entry and decreases
  root multiplicity by one. Characteristic zero ensures the derivative
  coefficients do not vanish unexpectedly.

The explicit-root power corollary uses divisibility by `(X - C α)^s`.
For the nonmonomial wrapper, degree induction strips factors of X until the
constant coefficient is nonzero; algebraic closedness then gives a nonzero root.
Private helpers establish the support-cardinality identities for divX and the
derivative. No new axioms or computation oracles are introduced.

## Verification and resource coordination

- `scripts/lean.sh --wfail build A113010.PolynomialSupport`: PASS.
- `scripts/lean.sh env leanchecker -v A113010.PolynomialSupport`: PASS, exit 0.
- All four public theorem axiom audits report exactly
  `[propext, Classical.choice, Quot.sound]`.
- No sorry, custom axiom, native_decide, dependency changes, frozen edits, or
  fresh full-Mathlib replay.
- No outstanding goals in the source or active owned subprocesses.

The core was verified at 10:34 UTC. The wrapper was drafted while builds were
held for the principal's GMP scan, and final verification ran after explicit
release of the serial Lean slot. That slot is now released to the principal.
