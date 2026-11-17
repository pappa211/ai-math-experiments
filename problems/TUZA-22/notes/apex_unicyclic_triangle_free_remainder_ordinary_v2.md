> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Triangle-free unicyclic remainders: ordinary proof without GE

Frozen ordinary proof candidate v2, 2026-11-16. This is a new shorter proof using simultaneous residual covers. The previously accepted `apex_unicyclic_triangle_free_remainder_exclusion_v1.md` remains preserved with its DECLARED_GE dependency and is an independent proof at its exact scope; that dependency is not silently erased from v1.

## Theorem

A minimum combined-CS failure G, globally or within an edge-subgraph-hereditary class, has no closed link component L at h and vertex w such that F=L-w is connected, triangle-free and unicyclic.

## Nonperfect remainder

Suppose F has no perfect matching. The ordinary exposable-leaf lemma proved in `apex_unicyclic_wke_v1.md` gives a maximum matching M exposing an original F leaf z, unless F is a bare odd cycle. In the leaf case minimum degree two of L forces wz. In the odd-cycle case choose any neighbor z of w and a maximum cycle matching exposing z.

Let r=nu_match(F). Because F contains a cycle of length at least four, r>=2. The matching

    P=M union {wz}

has size r+1>=3. The ordinary pseudoforest matching-complement cover lemma supplies a cover Q0 of F-M with |Q0|<=r. Then Q=Q0 union {w} covers L-P and satisfies |Q|<=|P|.

The near-bipartite simultaneous-cover theorem `near_bipartite_wke_cover_collapse_v1.md` now contradicts this WKE tuple of size at least three. It covers every matching deficiency at once, including deficiency one. No prescribed-edge leaf-selection fact or GE structure is needed.

## Perfect noncycle remainder

Suppose F has a perfect matching M of size r and is not a cycle. Since F is connected unicyclic, it has 2r edges, and F-M has r edges. Some F vertex has degree at least three, leaving two adjacent edges in F-M. A cover of F-M can cover that pair by one common endpoint and all other edges individually, using at most r-1 vertices.

Thus P=M and Q={w} union cover(F-M) form a WKE tuple with |P|=r, and P leaves w unmatched. The graph F contains a cycle of length at least four, so r>=2. The stronger unmatched-apex clause of the simultaneous-cover theorem gives the contradiction directly.

## Perfect cycle remainder and the small boundary

The remaining F is an even cycle. The accepted full apex-cycle exclusion `apex_cycle_link_exclusion_full_v2.md` applies at every length and every apex-neighbor set. Its new parity proof and exact historical W5 local input are ordinary, with no finite census or Kotzig theorem. For cycles of length at least six, its explicit two-P3 WKE tuple already has size at least three and the simultaneous-cover theorem would suffice; C4 is the genuine small case handled by the recorded local five-vertex arguments.

This exhausts all connected triangle-free unicyclic remainders and proves the theorem.

## Dependency and remaining-scope audit

The short proof uses only:

- `near_bipartite_wke_cover_collapse_v1.md`, SHA aec8d88dba77cc18895810e77ad27a626722ac68d381073709959ea851043fb3;
- the ORDINARY matching-complement cover and exposed-original-leaf lemmas inside `apex_unicyclic_wke_v1.md`, SHA d0fb7564463def15f0f77f9713aabfcfcb0437764cf1b9e19bf2dc8f848d968e; its older Kotzig-dependent corollary is not used;
- `apex_cycle_link_exclusion_full_v2.md`, SHA 558a0d1f99c1672328aee8c1dd7a38d2c3dc9677233e561f0c90521a428815b7, with its explicitly audited pinned TUZA-15 §5.3 five-wheel input;
- authenticated class-local M0/codegree and literal clique covers/avoidance.

There is no Gallai-Edmonds, Kotzig, new finite certificate, or all-size Lean input in this v2 argument. The longer GE proof and its component-selection mechanism remain separately accepted; its source authentication and exact labels remain preserved.

The broader apex-unicyclic problem now has only nonperfect F whose unique cycle is an actual triangle. The accepted full perfect-unicyclic theorem handles the perfect triangular-cycle case. No global one-cycle-cover availability or unrestricted Tuza conclusion is asserted.
