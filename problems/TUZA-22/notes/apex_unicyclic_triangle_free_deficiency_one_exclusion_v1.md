> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Triangle-free unicyclic remainder of deficiency one is excluded

Frozen ordinary proof candidate, 2026-11-16. "Triangle-free" here applies to F=L-w, not necessarily to L. The apex may create arbitrary triangles on F edges.

## Statement

In a minimum combined-CS failure G, globally or within an edge-subgraph-hereditary class, there is no closed link component L at h with F=L-w connected, triangle-free and unicyclic, and

    |V(F)|-2nu_match(F)=1.

The already accepted full apex-cycle theorem handles the case that F is a bare odd cycle. Assume F has at least one attached tree.

## Balanced tuple and one exceptional unsupported edge

Put r=nu_match(F), so |V(F)|=|E(F)|=2r+1. The ordinary exposable-leaf lemma in `apex_unicyclic_wke_v1.md` gives a maximum F matching M exposing an ORIGINAL leaf z. Write e0=az for its unique F edge. The link minimum degree forces wz to be present.

Set P=M union {wz}, of size s=r+1, and R=F-M, which has r+1 edges. The elementary maximum-matching-complement lemma gives a cover of R of size at most r. With w added it covers L-P, giving a WKE tuple. If tau_vertex(R)<=r-1 this tuple is strict, already impossible. Thus

    tau_vertex(R)=r=|E(R)|-1.

Balanced deletion of all h-spokes and P gives B(K) and nu(K)=nu(G)-s.

EVERY R edge e other than e0 is triangle-supported in K. Codegree provides a page other than its hub triangle. Its third vertex cannot lie in F, since F is triangle-free. If it is w, neither page spoke is the deleted wz, because e is not incident with the original leaf z; thus both survive. If the third vertex is outside L, all page spokes survive because P has both endpoints in L. A vertex in another h-link component cannot be adjacent to an endpoint of e. These cases exhaust all possible second pages.

The exclusion of e0 is essential: its only second page could be waz, which is destroyed when wz is deleted. No support claim is made for that edge.

## Cover-critical edges are forbidden except possibly e0

If e!=e0 and tau_vertex(R-e)<=r-1, choose a minimum K cover D containing the supported edge e. Then

    D union P union {hw} union {hx:x in a cover of R-e}

covers all G triangles. The P bases cover all their lost pages, hw covers every other hub triangle with rim incident with w, and the smaller R-e cover handles all remaining rims except e, already in D. The cardinality is at most

    2nu(K)+(r+1)+1+(r-1)=2nu(G)-1,

contradiction.

Therefore every vertex-cover-critical edge of R, if any, must be the single edge e0.

## One-unit cover saving leaves no case

The elementary classification already used in the perfect-remainder note says that a graph R with m edges and tau_vertex(R)=m-1 consists of one P3, P4 or K3 component together with isolated-edge components and isolates. It follows by ruling out degree at least three (which saves two), then computing cover numbers of paths and cycles. The K3 case is impossible because R is a subgraph of triangle-free F.

If the nontrivial component is P4, each of its two end edges is cover-critical. At least one differs from e0, contradiction. Every isolated-edge component is also cover-critical, so there can be at most one such component, and it would have to be e0.

The sole remaining shape is P3 plus at most one isolated edge. Since R has r+1 edges, this gives r<=2. A connected triangle-free unicyclic noncycle F has at least five vertices, so r=2 and |V(F)|=5. Its unique cycle must be C4 (the bare C5 case was already separated), and its fifth vertex is a single attached leaf z.

A maximum matching exposing that leaf is a perfect matching of the C4. In the complement R, the leaf edge e0 meets the one complementary cycle edge at its attachment vertex, forming the P3. The other complementary cycle edge is an isolated edge distinct from e0. It is supported and cover-critical, the final contradiction.

This proves the theorem.

## Exact remaining scope

Together with full perfect-unicyclic exclusion, an actual triangle-free unicyclic remainder in the remaining apex-unicyclic problem must have matching deficiency at least two. This does not yet classify such remainders or prove the required combined critical-edge/rim/external alternative. The disproved isolated critical-edge selection lemmas remain disproved even in families with larger deficiency.

All arguments are ordinary, with no finite enumeration and no Kotzig theorem. Dependencies are authenticated minimum-CS/codegree/clique cover facts; the ordinary exposable-leaf and matching-complement cover lemmas; the accepted full apex-cycle exclusion; and the elementary one-unit-saving component classification.
