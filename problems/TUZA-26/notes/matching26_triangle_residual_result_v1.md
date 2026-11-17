> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Triangle-residual named-support interface: complete cover certificates

Frozen 2026-11-16T22:27:20.368162+00:00. **Candidate complete exclusion, pending independently authored domain/certificate replay and ordinary-proof review.** No general optimizer or graph census was used.

## Exact conclusion and assumptions

At the explicitly minimized unknown Q inside fixed G, assume the accepted saturation, no-blocker, three-connectivity and minimum-degree-four properties. Let T be an actual triangle such that R=Q-E(T) is resilient and defect one. The ordinary domain proof removes all old tight pieces using their complete at-most-two-adjacent-edge boundary, names the remaining active C12 support by fixed-G minimum-Q choice, and excludes zero or one triangle terminal inside C. The two remaining finite families are complete by that proof.

Every candidate in those families is excluded by a necessary structural certificate or by an explicit cover/packing pair proving defect at least two. Thus, once independently checked, Q has NO resilient defect-one triangle residual. The separate theorem making a defect-one triangle residual resilient is not assumed proved by this artifact. The existence/selection of such a residual and the defect-two frontier remain distinct OPEN obligations.

## Frozen domain and computation

notes/matching26_triangle_residual_domain_v1.md and scripts/matching26_triangle_domain.py were frozen before the certificate scan. The complete literal domain comprises160 internal independent-triple insertions and6512 one-outside-vertex presentations. The1192 earlier number counts all tested triples, not the160 independent ones.

Necessary certificate filters reject3267 cases by minimum degree,2558 by an unsupported edge,72 by an inactive ordinary base certifying a two-edge packing blocker, and645 by a vertex separator. Exactly130 cases remain:36 internal and94 one-outside. The old residual triangle family is reconstructed and verified to equal C for every generated presentation. Full domain rows are in evidence/matching26_triangle_domain.json.

The certificate method constructs feasible old minimum C covers from the literal clique pieces, adds one restored T edge, and directly checks every actual Q triangle. For every successful row, it also records the old C packing plus T, which is an actual edge-disjoint packing of size L=r+1. Every recorded cover has size U=2r, so

    tau(Q)<=U<=2L-2<=2nu(Q)-2.

This is enough to exclude defect one without proving that any recorded cover or packing is optimal. The literal-cover pool is only a witness generator; its completeness is not a premise because every retained graph received a separately checkable actual cover.

A representative benchmark used one case from each of the seven(model,mode) types and found covers for all seven in0.044 seconds. The unchanged full certificate script then covered ALL130 retained rows in 0.058211415976984426 seconds. There are zero unresolved rows, timeouts or candidate survivors. No packing/cover optimizer was imported, and no new dependency was installed. The local process has exited.

The successful cover pools contained1,4,26,96,1488 and16 old covers for double-K4, root-K4/K5, star45, star55, star555 and double-K5 respectively. These pool sizes are implementation details only; the graph-level cover witnesses determine acceptance.

## Independent verification requested

A fresh checker must independently regenerate both finite families from the exact frozen C12, verify every structural rejection certificate, confirm that the130 cover rows match the structural survivors bijectively, rebuild every actual triangle, and check every cover and packing inequality. It need not trust the cover-pool construction or solve an optimization problem. It must separately review the all-size confinement and exactly-one-inside-terminal argument, including their explicit use of no blockers and triangle connectivity.

The all-inside case also appears to admit a short direct cover/augmentation proof from the literal clique pieces. That possible simplification is not needed for this frozen complete certificate package and is not being used to bypass independent verification.

## Frozen files and hashes

- notes/matching26_triangle_residual_domain_v1.md: `612cdb1dd9083dce9dd5bd80e298633af296b67bcc28c5f064a1a3e52ec8fdd1`.
- scripts/matching26_triangle_domain.py: `9f88130685e850b01f27986264e85634f56d0cfa4db180003b4fdc5e45178f6c`.
- evidence/matching26_triangle_domain.json: `17c552385b8d60cf830693daa0a2f9bb3bf9010447e2d1d6f72dc64404a75240`.
- scripts/matching26_triangle_cover_certificates.py: `a3bca7d3b24ef132db2f76d0fdee160d62a49865cf73fa3c3cba8cf9f9f5ea1e`.
- evidence/matching26_triangle_cover_certificates.json: `82913ed5901491ba72c4b5e8ba099a48ccc740bf65c7cf821e21cf31c01574ec`.
- evidence/matching26_triangle_benchmark.json: `bf6367c9822292b69f7d983d81476085e76914c354d94322569a2b350dfb24fb`.

## Route and scope

The route is: supplied resilient defect-one triangle residual -> smaller active named C12 plus tight pieces (proper CS and separate minimum-Q) -> no tight pieces (accepted complete small-boundary reduction) -> complete finite interface (new ordinary geometry) -> defect at least two or a forbidden structural state (these explicit finite certificates). Each implication stays in the actual fixed-G universe until the complete named interface is identified; arbitrary background and crossing triangles have been retained.

This materially excludes the resilient defect-one residual branch in a no-blocker minimum Q. It does not classify arbitrary defect-one graphs, furnish a triangle residual of defect one, establish the separate resilience lemma, or solve unrestricted Tuza. It is a complete targeted interface, not evidence inferred from an unrelated census with no survivors.
