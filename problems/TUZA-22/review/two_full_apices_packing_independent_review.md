> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: two full apices per vertex-disjoint triangle

Decision: ACCEPT, ordinary scoped theorem. This review independently reconstructs the actual-edge conflict geometry and constraint solution. It does not assume that the required apices are available in an arbitrary minimum-cover problem.

Frozen source: notes/challenger_two_full_apices_packing_v1.md
SHA256: 3397edc4af7950b3eaa3257066ad6f7574da4e7e1829af9a3265f8ab87f8b1ee

For each triangle core, a page is specified by the vertex excluded from its base edge. Two distinct apices and distinct exclusions give two edge-disjoint local pages. Across cores, a common edge is possible only when each apex belongs to the other's core, and then the common edge is the pair of apices. The disjunction of reciprocal exclusions is necessary and sufficient to avoid it. This also rules out a hidden third-core or shared-external-apex conflict.

There are exactly two slots per core. Consequently a core has at most two mutual neighbors; if it sends two slots to one neighbor, it has no other mutual neighbor. A mutual pair with multiplicities2,2 forms an isolated component, and the displayed crossed labeling satisfies all four constraints with distinct local exclusions.

For a pair with multiplicities2,1, the two-slot endpoint is a leaf. If its opposite slot excludes neither available apex label, both leaf slots must exclude the same vertex, impossible. If it excludes either available label, only the other leaf slot is forced, and the first slot has two remaining labels. Thus eliminating the leaf imposes exactly a two-element list on the opposite slot, with no further condition.

The remaining1,1 graph has maximum degree2. Consistent path and cycle orientations give at most one forced slot label per core. All other constraints at that core are two-element lists from removed leaves, and there are only two total slots. One prescribed label and one size-two list are compatible. Two size-two lists in a three-element set have an SDR. One or zero constrained slots also extend. A forced slot cannot be the same slot as one restricted by a removed leaf, because they refer to different mutual neighbors. Restoring leaves therefore completes every constraint.

This proves2t actual edge-disjoint private pages relative to the union C0 of the core edges. Privacy relative to an additional larger cover is correctly excluded. When C0 is a minimum ordinary triangle cover, tau=3t and nu>=2t, hence strict Tuza for t>0. The case t=0 is vacuous. No cardinality or triangle-accounting exception was found, and no finite search is needed.
