# Frozen Track B addendum 2: tight matching-deletion separates link components

Joint coordinator/scout structural deduction, 4 November2026. Exact AC is unchanged. This is an unbounded graph-specific transfer statement, with its hypotheses stated independently of any actual Tuza violation. No new Lean or independent-final verification claim.

## Exact lemma

Let H,X,L,G satisfy the original AC hypotheses. Let M be ANY matching of L such that J=H-M is tight: tau(J)=2nu(J). Then the full triangle families of H and G split into edge-disjoint groups indexed by the connected components of L, together with K4 groups disjoint from X. For each link component L_i on X_i, there is an explicit edge-subgraph H_i of H with H_i[X_i]=L_i and inherited rainbow triangle edge-colouring. Adding one apex adjacent exactly to X_i gives G_i. If AC holds for every pair (H_i,X_i), it holds for (H,X).

The deletion is of matching EDGES. No claim is made that arbitrary H separates this way, or that vertex-sharing alone is enough to split triangle optima.

## Full proof and state completeness

By the already declared Aharoni/HNS graphical equality consequence, J's actual triangles are exactly the faces of edge-disjoint K4 blocks. Since H[X] is induced triangle-free, a block contains at most two X vertices; if it contains two, they are adjacent in L and therefore lie in the same connected component of L. Assign a block meeting X to this unique component, and assign each block disjoint from X to a separate background group.

Every H triangle absent from J contains an M edge. It contains EXACTLY one L edge, namely that M edge: two L edges would put all three vertices in X and make an L triangle. Thus such a page has two X vertices in one link component and a third vertex outside X. Assign it to that component. Its two non-M edges each join that component's X set to a vertex outside X.

Groups have disjoint edge supports, for the following exhaustive reasons:
- J blocks have disjoint edges by equality extraction.
- A page assigned to component i can share a J-block edge only with a block containing one of its X vertices, so that block is also assigned to i.
- Two pages assigned to different components cannot share an edge: every page edge meets X, and the X endpoints of the two groups belong to disjoint components.
- Background blocks have no X vertices, so they share no page edge.
- Every L edge belongs only to its own component, and an L edge in a J block assigns that block to the same component.

Define H_i to contain the edges of all blocks and pages assigned to i and ALL edges of L_i. Its vertex set consists of their endpoints together with X_i. It is an actual edge-subgraph of H; hence no new triangles are created. Every H_i triangle is an H triangle, and the preceding complete classification shows it belongs to i. Conversely every assigned triangle has all its edges in H_i. Also H_i[X_i]=L_i, since all L_i edges are included and no other H edges between X_i vertices exist. Restricting H's edge colouring verifies eligibility. Isolated link vertices and their assigned blocks are allowed; their apex contributes no triangles.

All H triangles are now partitioned into these edge-disjoint groups and the background K4s. Triangle-free H edges not in L are irrelevant to minimum triangle covers and packings and may be discarded. Any minimum triangle cover can be assumed to omit such edges, since including one would be redundant. It follows that

    nu(H)=sum_i nu(H_i)+k_0,
    tau(H)=sum_i tau(H_i)+2k_0,

where k_0 counts background blocks. For G, the only additional triangles are apex pages on L edges. Pages from different L components use distinct z-spokes, and each is assigned to its edge's component. The same full edge-disjoint partition therefore gives

    nu(G)=sum_i nu(G_i)+k_0.

These equalities permit graph vertices, including the one global apex z, to be shared between groups. Only edge supports matter. If minimum H_i covers C_i witness AC, their union with an opposite pair per background K4 is a minimum H cover C. The residual link is the disjoint union of L_i-C_i, so its ordinary vertex-cover number is the sum of their vertex-cover numbers. Therefore

    |C|+vc(L-C)
      = sum_i (|C_i|+vc(L_i-C_i))+2k_0
      <= 2sum_i nu(G_i)+2k_0 = 2nu(G).

This proves the asserted transfer. The construction explicitly retains all boundary states needed for scalar cover and packing addition; it does not discard crossing triangles, since the classification covers every old triangle and every apex triangle. QED.

## Corollaries and exact relevance

1. **Small link components.** AC holds under the lemma's tight-J hypothesis whenever each connected component of L has matching number at most3. For any eligible component instance, its budget b_i is at least m_i by the necessary matching bound. If b_i=m_i, use AC-saturation. If b_i>m_i, the elementary bounds vc<=1 for m=1, vc<=3 for m=2, and vc<=4 for m=3 give vc(L_i)<=b_i. The empty case is immediate. This is not a finite table: the matching bounds hold at arbitrary graph order.

2. **Two-C5 targeted shape.** In particular, when L is the disjoint union of two C5s and J=H-M is tight, AC holds. This explains why trying to force a failure merely by coupling the two cycles through arbitrary outside vertices cannot succeed under tight matching deletion: the actual triangle edge supports necessarily separate.

3. **Minimal-critical subcase.** If G were a genuine edge-minimal Tuza counterexample, its nonempty triangle support would have a single shared-edge component by the known criticality package. Under the tight-J hypothesis, two distinct edge-containing components of L would already yield two nonempty edge-disjoint triangle groups in G, with no shared-edge path between them. Therefore that restricted critical subcase forces L to have at most one edge-containing component and admits no background K4 group. This is a necessary structural implication within the stated apex class, not a proof that every hypothetical minimal counterexample belongs to the class.

4. **What remains.** The lemma reduces a tight-J instance to its connected link components; it does not prove AC for a connected component of arbitrarily large matching number. In the first frontier m=b-1, a packing-edge-stable slack-one J is still outside this lemma. There is no automatic iterative global decomposition of an arbitrary G.

Evidence category: PROVED_USING_PUBLISHED_INPUT, with the edge-support separation and transfer elementary once equality blocks are supplied. Historical originality UNESTABLISHED. Independent_final_verification: NOT_RUN.
