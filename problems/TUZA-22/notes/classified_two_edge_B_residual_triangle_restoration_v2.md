> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Strict triangle restoration from every resilient two-edge-B residual

Frozen corrected ordinary proof candidate v2, 2026-11-16. The v1 wording called the supported overlap the entire old edge intersection, overlooking possible triangle-free old background spokes; this v2 explicitly restricts the footprint to triangle support and always avoids every attachment edge. The prior draft remains preserved. This uses the exact newly classified near-tight representation; it does not assert that every near-tight graph admits that representation.

## Theorem

Let J have ONE nonempty shared-edge-connected actual triangle component, tau(J)=2nu(J)-1, and nu(J-e)=nu(J) for every edge e. Suppose deleting at most two edges from J yields B. If T is a triangle all three of whose edges are absent from J, then

    tau(J+E(T)) <= 2nu(J+E(T))-1.

Arbitrary triangle-free background and all actual new pages are included.

Put p=nu(J), G=J+E(T). The restored triangle appends, so nu(G)>=p+1, while tau(G)<=2p+2. The only possible obstruction to strictness is

    nu(G)=p+1, tau(G)=2p+2.                            (*)

The ordinary two-edge-B classification gives exactly three cases: K5-e; two K4s sharing an edge; or a root K4 with one K5 attachment or with two adjacent-edge K4/K5 attachments. We exclude(*) in each case.

## 1. The new family is exactly K5-e

Let N consist of T and ALL pages on its three restored bases. In each case there is an old collection of edge-disjoint literal clique supports with total packing p-1: for a root K4 with attachments, take all attached old blocks and omit the root; for old K5-e take either of its K4 subgraphs; for double K4 take either petal.

If the page base-apex incidence graph had a matching of size three, the corresponding three pages would be edge-disjoint. The three independent T terminals meet each old clique in at most one vertex, and each terminal occurs in only two of the selected bases. Hence the WHOLE footprint of those pages in any chosen old clique is a star of at most two edges. Maximum old clique packings avoid them simultaneously. Appending the three pages gives (p-1)+3=p+2 triangles, contrary to(*).

The accepted ordinary page-incidence classification therefore gives a cover of N of size at most two, unless N is exactly the seven-triangle K5-e family on T and two full apices u,v. A two-edge cover with a minimum J cover would give2p+1, contrary to(*). Thus the K5-e new family is forced.

Every old spoke of N belongs to a three-edge N cover: for a terminal x, use xu,xv and the T base opposite x. Consequently, if a spoke lies in SOME minimum J cover, overlapping that cover with the indicated N cover gives2p+1, again a contradiction. Under(*) every N spoke supported in J must therefore be ineligible for every minimum J cover.

## 2. The root-K4 classes with a K5 or two attachments

Let C be the root K4 and let the attached old blocks have total packing m, so p=m+1 and tau(J)=2m+1.

If there are two attachments, their root edges are adjacent, say ab and ac. EVERY edge of either attached old block belongs to some minimum J cover. To include an arbitrary edge f of the block on ab, choose a minimum cover of that block containing f; choose the other block's minimum cover containing ac; and use the root opposite pair {ac,bd}. The union has size2m+2-1=2m+1 and contains f. Interchange the attachments for the other block. This argument does not require f and its own attachment edge to occur in the same old minimum cover.

If there is one attachment and it is K5, EVERY edge f of that K5 is also eligible: any two prescribed K5 edges occur in a minimum four-edge cover. For incident prescribed edges choose their triangle plus the complementary pair; for disjoint ones choose one as the pair and a triangle on the remaining three vertices. Thus choose an old minimum cover containing f and the attachment edge e, and the root opposite-pair cover through e. Their union has size4+2-1=5=2p-1 and contains f.

Section1 now shows that N has NO old spoke in any attached block. The TRIANGLE-SUPPORTED footprint E(N) intersect E_triangle(J) is therefore confined to the root C. Old background spokes may also lie in J, but no J triangle packing uses them. Since T is independent in J, C contains at most one T terminal, so this whole intersection is a star of at most two old spokes in C. Restored bases are absent from J and cause no exception.

There is a maximum J packing avoiding ANY such root star: choose the root triangle opposite its center (or any root triangle if the star is empty), and in EVERY attached old block choose a maximum packing avoiding its single attachment edge, whether or not the chosen root triangle uses it. These packings are edge-disjoint and have size m+1=p. They avoid the ENTIRE triangle-supported N footprint in J. They automatically avoid every old background spoke because such an edge lies in no J triangle.

The new K5-e family has a two-packing. Append it to this J packing to obtain p+2 triangles, contradiction. This handles every two-attachment combination K4/K4, K4/K5 and K5/K5, as well as the one-K5 attachment, at arbitrary background scope.

## 3. One K4 attachment

This is exactly two K4s sharing an edge. The independently reconstructed ordinary theorem `two_edge_glued_k4_triangle_restoration_v1.md` proves strict restoration with arbitrary old B components and background, hence applies here. Its whole-apex classification and four-edge/prescribed-spoke cover argument are genuine ordinary premises, not a small-packing finite theorem.

## 4. The old K5-e case

Here p=2. Within the five-vertex old triangle support, write the unique nonedge as rs and its common triangle as xyz. The graph has independence number two, and a maximum two-packing avoids any one prescribed old edge (the two edge orbits have the usual direct witnesses).

The full new apices u,v cannot be adjacent in J. If uv were an old edge, the three actual old triangles uv t_i would put all three independent T terminals in the same old component, which has independence number two. Thus uv is absent. At least one T terminal lies outside the old five-vertex support.

If at most one full apex lies in the old support, choose a new page on a base containing an outside old-support terminal and using that apex, if present. It has at most one old support edge. Choose a page on a different base using the other apex; it has no old support edge. The pages are edge-disjoint, and an old two-packing avoids their whole at-most-one-edge footprint. This gives four triangles, contradicting(*) with nu(G)=3. If neither apex is old, the footprint is empty.

If both full apices lie in the old support, their nonadjacency forces {u,v}={r,s}. The only common old neighbors are x,y,z, a clique, so at most one independent T terminal lies in the old support. With none, the disjoint-support four-packing applies. With one, say x, the whole TRIANGLE-SUPPORTED N footprint in J is {xr,xs}; other old N spokes, if present, are background and require no old-triangle coverage. The old three-edge cover {xr,xs,yz} and the new three-edge cover consisting of xr,xs plus the opposite T base have union of size four. They cover all actual G triangles, contradicting tau(G)=6 in(*).

All classified cases exclude(*), proving strict restoration.

## Minimum-CS consequence and its precise limit

For a minimum CS failure G and any actual triangle T, the accepted restoration/peeling results give J=G-E(T) with ONE shared-edge triangle component, deficit one and single-edge packing resilience. Therefore J cannot have a B residual after deletion of any two further edges. Equivalently,

    B(G-E(T)-F) is impossible for every |F|<=2 disjoint from E(T).

This does not prove two-edge packing resilience of J. If deleting two edges drops its packing from p to p-1, the tight residual alternative is now excluded, but a deficit-one residual with tau=2p-3 remains possible. No availability of the two-edge-B representation is claimed.

## Frozen dependencies

- `resilient_defect_one_two_edge_B_classification_v2.md`, SHA95cc1d7859c32dc275e7766bfd139336a501b90513c16edac60b9e4615b53124; the ONE SHARED-EDGE COMPONENT hypothesis is essential.
- `two_edge_glued_k4_triangle_restoration_v1.md`, SHA20324b2731aa35b53f95699be4f62eb77da49ca8c32afca4d0662d9f436f7fd4.
- The ordinary page-incidence classification in `two_triangle_restoration_v1.md`.
- Elementary clique avoidance and minimum covers, and the accepted minimum-CS residual identities only for the final consequence.

No finite enumeration, GE, Kotzig, or bounded-outside-attachment premise is used.
