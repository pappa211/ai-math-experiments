> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent resilient outside-component exclusion and all-defect composition

Status: ACCEPTED ORDINARY at the supplied codegree-two outside-packing interface. The conclusion is componentwise and imposes no bound on total defect. No numerical or Lean verification.

A resilient W component has no critical W edge, so its complete Q boundary is contained in xy. Empty boundary contradicts Q triangle connectivity because uvx lies outside it. Thus xy is an actual supported edge of C and both uxy,vxy are outside pages. Delete only C-private edges, retaining xy and all vertices and other edges. Every outside-C triangle survives in R, and no C triangle survives there. A maximum C packing avoids xy, proving exact nu(Q)=nu(C)+nu(R); the reverse inequality partitions every actual Q packing by its triangle family.

The two-edge-resilience transfer is valid and explicit. The same upper partition bound after deleting xy and any additional R edge forces R-xy to retain nu(R) after every single deletion. No arbitrary residual is silently assumed resilient. The cover identity after deleting xy also holds exactly: the two triangle families then have disjoint edge sets, despite possible shared vertices.

Defect-zero C is a tight clique with the paid one-edge boundary. Defect at least two is excluded by combining a C cover with a proper-CS R cover and using the exact packing sum. A surviving resilient defect-one C is legitimately smaller, connected through triangles, and inside fixed G, so only here is minimum-Q C12 naming applied.

If xy is eligible in C, saturation of Q and exact cover additivity make R-xy tight B. Restoring xy creates the actual pages uxy,vxy while preserving packing, impossible because a single page appends over full B packings avoiding its one footprint per clique. If xy is ineligible, R-xy is resilient defect one. Its active component is legitimately named; the previously accepted arbitrary-background neutral-insertion lemma forces K5-e completed by xy, with every new page confined to that completion.

The removal of other B components is justified by full triangle connectivity. They are unchanged on restoring xy, do not meet the completed K5 in an edge, and cannot connect to C through a private C edge since the complete C boundary was only xy. A shared vertex does not supply such an edge connection. Thus R's entire triangle support is exactly the completed K5.

The endpoint-degree conclusion is not a freshness assumption. Every supported Q edge outside E(C) lies in a triangle not wholly in C; that triangle uses no deleted private C edge and survives in R. All edges at u,v are outside C and remain supported. Their actual uxy,vxy pages place both vertices in R's K5 support, and there can be no additional incident background edge because every such Q edge was just shown supported in R. Therefore both full Q degrees are exactly four, contradicting the independently established degree-four exclusion.

Every resilient W component is excluded. Combined with the separately accepted fragile defect-one exclusion and proper CS, every nonempty W component is fragile and has defect at least two. Hence total defect exactly two gives one fragile support component. A W-background edge other than xy would acquire an endpoint page in Q and be critical, impossible for a triangle-free edge. A W vertex outside all supports has at most one W neighbor and the two endpoint neighbors, violating the degree premise. Thus all support vertices lie in the remaining components, with xy the sole possible retained background edge. None of these conclusions names a higher-defect component or supplies the outside-packing interface globally.

Bound source: `notes/matching26_outside_resilient_component_exclusion_v1.md` SHA-256 `1a91149793bcf54406e0218727b747e173ea9209d6116883c8a5e220a830f1da`.
