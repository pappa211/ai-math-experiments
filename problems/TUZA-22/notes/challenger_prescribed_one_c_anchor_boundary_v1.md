> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A prescribed one-cover-edge triangle need not extend to an anchored packing

Status: REFUTED_AUXILIARY_STATEMENT with an ordinary literal certificate, frozen for fresh review. Challenger, 2026-11-16 UTC. This does not refute the accepted existential forest-anchor theorem.

## Refuted quantifier

The following strengthening is false:

    For every graph H with forest triangle cover C and every actual triangle T
    having exactly one C-edge, there is a packing I containing T and a cover D
    with C intersect E(I) contained in D and |D|<=2|I|.

Neither maximum packing cardinality nor minimum C was assumed in this proposed strengthening. The failed triangle in the witness below is not contained in a maximum packing. A version that adds maximum-packing eligibility is not tested by this witness.

## Five-vertex ordinary witness

Take vertices0,1,2,3,4 and edges

    C={01,12,23,34},
    E(H) minus C={02,03,04}.

Thus C is a spanning path and covers all triangles. The complete actual triangle list is

    012, 023, 034.

There are no others: vertices1 and4 have only their two displayed triangle neighbors, and among2,3,4 the only rim edges are23,34.

Prescribe T=023, whose only C-edge is23. It shares02 with012 and03 with034. Hence the ONLY packing containing T is I={T}. Any anchored cover D for this I must contain23. The other two triangles012 and034 are edge-disjoint and neither contains23. They require two further distinct covering edges. Therefore the minimum anchored cost is3, witnessed by {23,02,03}, while2|I|=2. This proves the failure without a solver premise.

The ordinary parameters are tau(H)=nu(H)=2: triangles012 and034 form a two-packing, and {02,03} is a two-cover. Thus this is not a Tuza or CS counterexample.

The accepted existential anchor is visibly intact: choose I={034} and D={34,02}. The selected C-edge34 is included and the two-edge cover meets all three triangles. Also, forcing the BASE23 into D without forcing T into I is a different quantifier and succeeds: take I={012,034} and D=C. Then |D|=4=2|I| and every C-edge used by I, as well as the prescribed base23, belongs to D.

The displayed C has size4 while tau(H)=2 and is not asserted minimum. Any use under a minimum-cover normalization would need an additional construction or theorem.

## Admission and finite receipt

Reasons to test: the new one-C prescribed choice could have supplied stronger packing flexibility for the remaining K5-boundary equality interface; the existing K4/path control rejects prescribed two-C choices but accepts its one-C choices. Risks: the prescribed quantifier is strictly stronger than the accepted existential anchor, and a pointed leaf WKE construction is not itself an exhaustive anchor search.

The parent authorized one new <=10-second discriminator on the SAME three six-vertex trees and chord masks as the earlier1761-valid-graph corpus, with no expansion and stopping at the first failure. The script challenger_tree_anchor_prescribed_one_probe.py stopped after8 valid graphs and7 prescribed requests including controls. The literal first witness is the five-vertex graph above plus a triangle-free leaf5 and selected edge45; removing that irrelevant leaf gives the ordinary certificate here. All compatible packings were enumerated and their exact minimum residual cover costs retained. There was no UNKNOWN.

Evidence: evidence/challenger_tree_anchor_prescribed_one_probe.json. External monitor: operations/challenger_tree_anchor_prescribed_one_probe.json. Monitored elapsed0.1217689514 seconds, peak sampled process-tree RSS4.25MiB, ceiling2200MiB, return code0, owned process finished. The incomplete domain is intentional because the first failure ended this statement; no larger passing census is claimed or proposed.

## Remaining role

The false prescribed-triangle bridge is retired. The ordinary existential forest-anchor theorem, weighted TREE theorem, and mixed-cover inequality remain accepted. Forcing a selected BASE into the cover, and forcing a page already eligible for an optimal weighted packing, are distinct questions; neither is settled by this witness.
