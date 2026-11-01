> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# Exact restoration identities and non-circularity audit

Status: PROVED_ORDINARY. No new Lean verification or priority claim.

Let H be a finite simple graph, let u≠v be nonadjacent, let W=N_H(u)∩N_H(v) be nonempty, and put F_w={uw,vw}. Let G=H+uv. Define τ_hit(H;W) as the least size of an actual H-edge triangle cover meeting every F_w. This minimum exists, since E(H) is such a cover. All families below contain all graph triangles.

Then

```
ν(G)=max(ν(H), 1+max_{w∈W} ν(H−F_w)),
τ(G)=min(τ(H)+1, τ_hit(H;W)).
```

For packing, every triangle newly present in G is uvw for exactly one w∈W. A packing uses at most one of them because they share uv. If it uses uvw, all other triangles lie in H−F_w, and conversely every packing there can be appended to uvw. If it uses none it is an H-packing. This proves both inequalities and attainment.

For covering, a G-cover containing uv restricts, after removing uv, to an H-cover and therefore has size≥τ(H)+1; that bound is attained by adding uv to a minimum H-cover. A G-cover omitting uv is precisely an H-cover meeting every F_w. Taking the better case proves the formula. No triangle outside the displayed vertices is discarded.

## Why a plausible full compatibility target can be circular

Assume ν(H)=k, τ(H)=2k. Then the following are equivalent:

1. Every F_w blocks all maximum H-packings, and no minimum H-cover meets every F_w.
2. The restored graph has ν(G)=k and τ(G)=2k+1.

Blockade is equivalent to ν(H−F_w)≤k−1; exact loss-one is not needed. The formulas prove the equivalence immediately. Such a conjunction already certifies a Tuza counterexample. Adding exact wedge losses makes the hypotheses stronger, not positively testable on an ordinary Tuza-satisfying restored graph.

For |W|=2 this is an equivalence ONLY for the restricted two-page restoration class. Excluding it would rule out codegree-two edges in minimal counterexamples, not all counterexamples without a further theorem ensuring one exists. The analogous universal assertion for arbitrary nonempty W, combined with A1 for an edge-minimal counterexample, is equivalent in strength to general Tuza. The old diamond-padding obstruction is an additional, different warning about universal tight-wedge avoidance.

## A meaningful test class must drop part of the conjunction

The seven-vertex graph in [COUNTEREXAMPLES_AND_TESTS.md](COUNTEREXAMPLES_AND_TESTS.md) satisfies exact loss-one/two-cover-drop for both pairs and cover-choice incompatibility, but τ(H)=5<2ν(H)=8. It cannot supply a Tuza counterexample and does not pretend to.

The eight-vertex graph has two blocking pairs and all four cross choices avoidable, but neither full pair fits into a minimum cover. It refutes a packing-only exchange shortcut.

The unconditional cover-switch theorem gives a genuine local sufficient condition for mixed feasibility: it examines how two actual covers differ outside the four spokes. No assumption equivalent to a counterexample is needed. Turning its contrapositive into a global contradiction still requires a new bound on those exterior differences or their neutral-edge structure. Such a bound has NOT been derived from A1.
