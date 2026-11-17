> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: connected defect-two single-edge predecessors

Verdict: PASS, PROVED_ORDINARY at the unchanged fixed-G/minimum-Q scope. No finite replay or Lean verification was needed.

Reviewed source: notes/single_deletion_connected_defect_two_v1.md, SHA-256 d1323c858e1c1651f0242ff1335f6011089772a4410b491885cf11413ac5d38e.

## Multiple-component neutral insertion

For every new page on the missing edge uv, a footprint spread across components or using background contains at most one forbidden edge per old component. Each named C12 and tight K4/K5 component has a maximum packing avoiding any single edge, so such a page would append over the sum of old maxima. Packing-neutral insertion therefore puts both spokes in the same component. That component cannot be a literal old clique, because it would already contain uv.

For a named component C, a larger packing in C+uv would append to all other old-component maxima; hence its insertion must also be packing-neutral. The previously accepted exact named insertion response then forces C=K5-e, with missing pair uv. This is a use of the exact frozen C12 property, not a classification of arbitrary defect-one graphs.

All new triangles are internal to completed K5 pieces. Triangle connectivity forces every old component to be touched, so no tight component survives. Distinct touched K5-e components share u,v and cannot share a third vertex x, since both would contain the old supported edge ux. Their private triples are mutually disjoint. Background outside these completed pieces lies in neither an old nor a new triangle and is excluded by triangle-supportedness. This proves the full literal reconstruction and freshness.

The optional formula for r completed pieces is also correct: packing equals 2r because each K5 admits a two-packing avoiding the common edge, and restriction bounds every packing by two per piece. A cover including the common edge uses three further edges per piece, giving 3r+1. Restricting an arbitrary cover to the r cliques gives the lower bound 3r+1 if the common edge is used, and 4r otherwise. Thus tau=3r+1 for r>=1. For exactly two pieces this is the frozen double-K5 model; for one it is K5.

## Application and remaining scope

Eligibility gives tau(Q-e)=2k-2; two-edge resilience gives packing k and single-edge resilience of Q-e. Proper CS and additivity leave one defect-two active component or two defect-one active components, with any additional tight components. In the second case, each active support is smaller, connected, resilient and defect one inside the same fixed G, so explicit minimum-Q naming applies to both. The neutral insertion theorem gives double K5, contradicting Q outside C12. It does not name the remaining defect-two component.

Every additional tight component has complete outside-triangle boundary at most one, because restoration is a single missing edge and its entire ordinary page family has at most one footprint edge per old clique. The accepted paid boundary exclusion removes these pieces. The alternative connectivity/packing argument in the source is also sound: a page cannot use two spokes in a tight old clique, so any page touching it would append over resilient component maxima and violate neutrality; an untouched tight component would remain disconnected from the new triangle family.

No surviving edge becomes background: for f different from e, at most one triangle contains both edges. Since every Q edge has at least two actual triangles, an f-triangle survives deletion of e. Thus Q-e itself has exactly one nonempty shared-edge-connected triangle support, is triangle-supported, single-edge resilient, and has defect two. Isolated vertices, if retained by an edge-deletion convention, have no role in the claimed support connectivity.

For every restored page uvx, a maximum K=Q-uv packing avoiding ux,vx would append that page and exceed nu(Q). Therefore the pair is a blocker. Its deletion loses exactly one packing unit: at least one by the append argument, and at most one because either first deletion is packing-neutral and deleting the second loses at most one. The final defect-two value after deleting the pair correctly remains CONDITIONAL on the pending every-triangle-minimum-cover theorem; it is not a defect-one residual and cannot be named by the old blocker-pair step.

The proof order is noncircular. It uses accepted core constraints and named single-edge insertion only, not the pending triangle-restoration reconstruction or a classification of defect-two supports. No paid reduction for all these predecessor interfaces, universal availability, unrestricted CS/Tuza, or new C12 model is asserted.

Frozen UTC: 2026-11-16T22:30:24.987951+00:00
