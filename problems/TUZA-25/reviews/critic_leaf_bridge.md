> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent critic: named reconstruction, confinement, and remaining matching interface

**PASS for diamond confinement, the two named-core exclusions, and the conditional critical-triangle exclusion using the verified finite interface.** No universal classification is implied. A wording overstatement about supported edges was corrected during review: connected triangle support does not remove arbitrary background edges.

Reviewed corrected files: `notes/mixed_conditional_leaf_bridge.md`, SHA-256 `9286ec3c6ac4d1429ee7f4b9891b3eb2705df97f01d88b8fba05f30539a1471c`, and `notes/mixed_critical_edge_corollaries.md`, SHA-256 `f48e5988c992acd532299d7d2f80af438ff8a3c7271ea81dae101ffb735c4829`. The independent finite check is documented in `critic_edge_exchange.md` and its script/receipt.

## Why background adds no insertion cases

Suppose J=R+e and every actual J triangle has a K4 completion. Every new e-page belongs to a K4 containing e. Removing e leaves a diamond whose five edges are all triangular in R. Thus all four vertices of that completion, both endpoints of e, and both old spokes of the new page lie in R's actual triangle support. This applies separately to every new page.

Consequently no background-only vertex or nontriangular old edge participates in a new page. Old triangles already lie in the support, and the only added edge is e, so the actual triangle family of J is exactly the triangle family of R_support+e. Packing and cover optima, and the criticality of every triangular edge, agree under this normalization. Background edges themselves are not packing-critical. This proves the required extension from the finite support domain to arbitrary retained background under the explicit K4-completion hypothesis; enumeration alone would not justify it.

## Two named cores

If R has W5 support, it has no old K4. Every J-K4 must contain e and, by confinement, use only wheel vertices. The missing edge must therefore be a rim diagonal. Its endpoints have exactly two common supported neighbors: the hub and the intermediate rim vertex. The insertion creates exactly one K4, containing two old wheel triangles. The other three old wheel triangles remain without a K4 completion, contradiction. Extra background cannot create additional K4s or pages because their surviving diamonds would introduce supported edges outside the wheel.

If R has K5-e support, criticality guarantees a new page. Its completing diamond puts the new edge's endpoints among the five support vertices. Only the missing K5 pair is available, so the insertion creates K5 support. Confinement excludes outside pages. Thus J has defect zero, contradicting its assumed defect two. Neither argument assumes background is absent.

## Critical-triangle finite interface

The independently regenerated twelve-model universe has 210 missing-edge presentations. The complete finite predicate rules out a wholly critical triangle whenever the inserted graph is K4-completed and defect two. Exactly four presentations qualify, all isomorphic, and each has only its inserted edge critical.

Now let J satisfy the critical-edge theorem's explicit hypotheses, have connected triangle support, and contain a wholly critical triangle A. For each edge e of A, the theorem gives a defect-one, one-edge-resilient R_e with connected nonempty triangle support. It does not eliminate any background edges. If even one support R_e belongs to the twelve named models, confinement maps J to the verified finite insertion interface. Its critical triangle contradicts the finite predicate. Hence every R_e support is outside that named class.

This implication is sound. It becomes an exclusion of a configuration in a separately minimized nonnamed state only after that separate minimization is explicitly introduced and all of its membership conditions are verified. Proper-subgraph CS by itself supplies no named classification at defect one. Likewise no membership in the broader frozen F follows from this finite predicate.

## Opposite-pair deletion and its boundary

The original zero-gain note was also checked. Its cover argument is valid: a minimum predecessor cover cannot contain an entire separator triangle, since the one-spoke extension would then save a cover edge. A triangle-free cover of a literal K4 is an opposite pair, a four-vertex path, or a four-cycle, and each contains a perfect matching. Choosing that matching from the minimum cover gives exact cover loss two.

The first draft obtained exact packing loss two using an every-triangle-extension premise. A subsequently verified simpler argument removes that premise: for each opposite pair ab,cd, the new triangles xab,xcd are edge-disjoint and append to a predecessor packing avoiding that pair. Zero packing gain alone forces loss at least two, while deleting two edges gives the reverse inequality. The complete resilience argument is reviewed separately in `critic_matching_deletion.md`.

This matching branch reaches one smaller resilient defect-one component plus possibly several tight B components. It does not automatically yield a connected full residual or a one-edge insertion interface. The two restored edges can interact with those components and with retained background. The 210 single-edge named-model check therefore cannot be reused as though it had already solved this matching reconstruction problem.

No every-triangle-extension property, actual tight missing-triangle parent, three-connectivity, or family membership is silently transferred to the smaller state. The reconstruction of the predecessor and original leaf graph from the active component, tight components, two restored edges, and all background remains an explicit open obligation.

No mathematical discrepancy remains after the support wording correction. This is ordinary in-session independent reconstruction combined with a complete finite interface check; it is not a proof of unrestricted Tuza/CS or universal configuration availability.
