> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Refuted forced-spine interface: a six-wheel core

This is a small refutation of a proposed sufficient cover interface, not a CS or Tuza counterexample.

Let the rim cycle be1-2-5-6-4-3-1 and add hub0. The actual graph has12 edges. Take the maximum packing P={012,034,056}. Deleting any two packing triangles leaves only the third triangle, so it is a book whose spine can be chosen as its rim edge. Choose spines12,34,56.

A cover containing these three spines still has to meet triangles013,025,046. These three triangles are edge-disjoint and contain none of the selected spines. Thus at least three additional edges are needed, for total6; selecting their three rim edges attains6. This refutes the sufficient claim that every such core/spine choice has a cover<=5 containing all three spines.

Ordinary tau=nu=3: the three displayed P triangles prove both parameters at least3, and spokes01,04,05 cover every triangle. The six spokes at0 give packing upper bound3. Thus this core is far from tight and is not an equality-classification exception.

The fixed-spine requirement discards the useful alternating rim matching {13,25,46}. Adding even one new outside page12x would allow that matching's three hub triangles plus12x, a packing of4. Hence a possible repair must consider exchanges or outside-page forcing, not insist on all chosen spines.

A newly authored0.14-second exact screen examined the three nontrivial intersection types of three edge-disjoint packing triangles, with all triangle-free backgrounds on their core vertices and every allowable spine choice. It found251 failing labeled core/spine choices (240 common-hub,11 three-intersection), with no isomorphism-class assertion. The receipt is evidence/three_packing_spine_core.json and the independent identity is scripts/three_packing_spine_core.py. It is not Claude's checker replay, a CS census, or an all-size proof. No larger follow-up census was performed; the explicit six-wheel already decisively refutes the proposed interface.
