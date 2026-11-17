> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Forcing an arbitrary selected base into an anchor cover also fails

Status: REFUTED_AUXILIARY_STATEMENT, ordinary literal certificate. Independently reconstructed by coordinator and challenger, 2026-11-16 UTC. No computation was required.

Let H=K4 on vertices1,2,3,4 and let the selected spanning-tree cover be C={12,23,34}. Prescribe the triangle-supported selected edge e=23. The proposed strengthening asks for a packing I and cover D satisfying C intersect E(I) subset D, e in D, and |D|<=2|I|.

Every nonempty packing in K4 has size1. Every cover of size at most2 has exactly two opposite edges. The only such cover containing23 is D={23,14}. However every K4 triangle contains at least one of the selected edges12 or34: triangles123,124 contain12, and134,234 contain34. Neither edge belongs to D. Thus no one-triangle packing is anchored by D. The empty packing cannot have a nonempty D under the size bound. This refutes the prescribed-base strengthening.

The accepted existential forest anchor remains valid: choose triangle124 and cover {12,34}. The selected tree C is not minimum, since tau(K4)=2. This witness therefore does not refute a stronger premise involving global minimum-cover optimality or the local-cost preservation forced by mixed-cover equality.

The earlier five-vertex fan refutes a different prescribed-triangle quantifier. Its prescribed base can be forced successfully, whereas the present K4 proves that arbitrary base forcing nevertheless fails in general. Neither broad quantifier will be pursued by a larger passing census.
