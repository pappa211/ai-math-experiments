> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Deficiency one does not support the two prescribed leaf choices

Ordinary literal boundary, source_audit, 2026-11-16. This supplements the precise d>=2 scope of `unicyclic_exposable_leaf_matching_v1.md`; it does not change that frozen source.

Take the five-cycle 0,1,2,3,4,0 and add the pendant path 0-x-y. This connected unicyclic graph F has seven vertices, matching number three, deficiency one, and exactly one original leaf y. The matching {xy,12,34} proves the matching lower bound; floor(7/2)=3 proves the upper bound.

Fact A fails at deficiency one even though F is not a bare odd cycle: xy is allowed, but every matching retaining xy necessarily covers the only original leaf y. No maximum matching retaining that edge can expose an original leaf.

Fact B also fails at deficiency one: deleting edge 0x leaves C5 disjoint from K2 on{x,y}, so the matching number remains three. Every maximum residual matching must use xy, because C5 alone has matching number two. Thus it cannot expose the only original leaf y, which lies outside the deleted edge's endpoints {0,x}.

This is a direct seven-vertex proof with no census, solver, or external theorem. Excluding only bare odd cycles would not permit lowering the d>=2 threshold in either prescribed-edge statement. A separate deficiency-one argument remains necessary in any unicyclic link application.
