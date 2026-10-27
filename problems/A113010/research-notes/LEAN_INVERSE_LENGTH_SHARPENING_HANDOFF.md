> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Inverse-length sharpening handoff

Completed 2026-10-27 before 14:23 UTC; serial heavy slot released to root. Owned source: proof/A113010/InverseLengthSharpening.lean. Existing verified sources, frozen sources, ResearchAudit, and scripts were unchanged.

The successor power bound requires only s ≤ x for positive x: (x+1)^s < 3*x^s. It uses pinned Mathlib inequalities (1+1/x)^x ≤ exp 1 and exp 1 < 3, exponent monotonicity, and exact transport to natural numbers. Two successor steps give factor 9, enough for the next decimal threshold. The resulting inverse-length exclusion and pair-containment lemmas require s ≤ k instead of 2*s ≤ k.

These are intermediate results; no new fixed point or all-size classification is asserted. The optional global wrapper for s≥10 was deliberately omitted to preserve the deadline. No unfinished goal remains in this module.

## Exact public statements

All names are in namespace OeisA113010. digitCount is the frozen decimal digit-count definition.

```lean
theorem succ_pow_lt_three_mul_pow {x s : ℕ} (hx : 0 < x) (hs : s ≤ x) :
    (x + 1) ^ s < 3 * x ^ s

theorem power_exclusion_step_of_exponent_le_base {k s : ℕ} (hk : 0 < k)
    (hs : s ≤ k) (hp : k ^ s < 10 ^ (k - 1)) : (k + 1) ^ s < 10 ^ k

theorem power_exclusion_above_of_exponent_le_base {K s : ℕ} (hK : 0 < K)
    (hs : s ≤ K) (hp : K ^ s < 10 ^ (K - 1)) {h : ℕ} (hh : K ≤ h) :
    h ^ s < 10 ^ (h - 1)

theorem power_below_digit_lower_of_gap_two_of_exponent_le_base {k s h : ℕ}
    (hk : 0 < k) (hs : s ≤ k) (hc : digitCount (k ^ s) = k) (hh : k + 2 ≤ h) :
    h ^ s < 10 ^ (h - 1)

theorem not_length_compatible_of_gap_two_of_exponent_le_base {k s h : ℕ}
    (hk : 0 < k) (hs : s ≤ k) (hc : digitCount (k ^ s) = k) (hh : k + 2 ≤ h) :
    digitCount (h ^ s) ≠ h

theorem length_compatible_eq_or_succ_of_exponent_le_base {k s h : ℕ}
    (hk : 0 < k) (hs : s ≤ k) (hc : digitCount (k ^ s) = k)
    (hkh : k ≤ h) (hh : digitCount (h ^ s) = h) : h = k ∨ h = k + 1
```


## Verification

- Warning-free build: scripts/lean.sh --wfail build A113010.InverseLengthSharpening, exit 0. Final successful invocation: 29.93 seconds elapsed; maximum RSS 2,183,316 KiB (about 2.08 GiB).
- The six public #print axioms commands remain in source. Every result is exactly [propext, Classical.choice, Quot.sound].
- Independent module-only replay: scripts/lean.sh env leanchecker -v A113010.InverseLengthSharpening, exit 0; 19.48 seconds elapsed; maximum RSS 2,043,496 KiB (about 1.95 GiB). No --fresh.
- Measured commands used explicit timeouts and ran serially with the exclusive heavy slot. An initial compile exposed a redundant ring tactic after field_simp had solved the goal; removing it produced the final verified source.
- No sorry, native_decide, custom axioms, dependency changes, or unfinished proof goals. No numerical search launched.
- Root owns module-inventory and consolidated-verifier integration. This handoff reports local build/audits/replay, not any later integrated run.
