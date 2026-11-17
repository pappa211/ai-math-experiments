> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Tuza from any triangle cover with tree and triangle components

Status: ORDINARY_PROOF_CANDIDATE v2, frozen for fresh review. Challenger construction with the stronger local-cost normalization independently reconstructed by source_audit, 2026-11-16 UTC. This proves the inequality only. Version2 removes the minimum-cover hypothesis and proves hereditary closure of the resulting existence class; it does not classify equality or assert universal cover-shape availability. Version1 remains valid at its narrower scope.

## Theorem

Suppose a finite simple graph G has an actual triangle-edge cover C, not necessarily minimum, such that every nonempty connected component of the selected-edge graph C is either a tree or a literal triangle. For each component let tau_i be the minimum number of actual graph edges covering its assigned triangle family. Then

    tau(G) <= sum_i tau_i <= 2nu(G).

There is no bound on the sizes or number of tree components, on the numbers of either triangle type, or on outside vertices and reciprocal interactions. Every actual graph triangle is included.

## 1. Local supplied packings

Write C_i for the cover components and A_i for their mutually disjoint vertex sets. Each actual triangle is assigned to the unique component containing its C-edges: two selected edges of one triangle have a common endpoint, so they cannot belong to distinct components.

For a tree component, apply the forest anchored-cover theorem to its internal graph, obtaining an internal packing I_i and cover D_i with C_i intersect E(I_i) contained in D_i and |D_i|<=2|I_i|. Let q_i be the packing number of outside pages on C_i bases outside D_i. The forest external-family minmax supplies a cover of those pages of size q_i. Together with D_i it covers the assigned family, so

    tau_i <= |D_i|+q_i <= 2|I_i|+q_i.

Those q_i pages are edge-disjoint from I_i because every selected base used by I_i belongs to D_i and their other edges are external. Thus they give an assigned-family packing P_i of weight at least tau_i. Here internal means all three vertices are in A_i; an external member has one C_i base and its third vertex outside A_i. No minimum-cover optimality was used in this argument.

For a triangle component T, its assigned family consists of T and all pages on its three bases, so its cover number tau_i is at most3. If tau_i<=2, select the internal triangle T as P_i. Its weight2 pays tau_i, and it creates no cross-family conflict. Call these the low-cost triangle cores. If tau_i=3, each of the three bases has a private page: if one lacked such a page, the other two bases would cover the whole family. Only these cost-three cores require the following classification.

For a cost-three triangle core, the elementary classification in matching_and_triangle_cover_tuza_v1.md gives the following exhaustive alternatives. Either the private family has a three-packing, and we choose three pages; or its maximum packing size is2 and it consists exactly of pages through two full apices x,y, with each of x,y adjacent to all three core vertices and no other private pages. Choose a two-packing using both apices in this second case. Call these q3 and q2 triangle cores respectively.

For clarity, the classification uses only the following ordinary argument. A pairwise edge-intersecting triangle family is a book or contained in K4 and has a two-cover, so a family of cover number3 has two private disjoint pages. For its three nonempty apex sets, no three distinct representatives means either two sets have singleton union (giving a two-cover) or total union has size at most2. An apex on two bases is full. The only remaining possibility is exactly two full apices on all three bases.

Let t2 be the number of q2 cores, and let I,E be the total counts of supplied internal and external members over all cores. Tree weights pay tau_i; low-cost triangle weights pay tau_i; every q3 core contributes weight3; every q2 core contributes weight2 rather than its family cost3. Thus, writing c_total=sum_i tau_i,

    2I+E >= c_total-t2.                                  (1)

The union of minimum covers of the assigned families covers every actual G-triangle, so tau(G)<=c_total. This is an upper bound and does not require those family covers to be mutually edge-disjoint.

## 2. Complete cross-conflict geometry

An internal member of one assigned family cannot share an edge with a member of another family: its edges have both endpoints in its own A_i, while another family's triangle has at most one vertex there.

Two external members assigned to distinct components i,j can share an edge only when their apices lie reciprocally in A_j,A_i. Their common edge then joins those two core vertex sets. A given external member has at most two conflicts, one per spoke, because the supplied packing in each other family is internally edge-disjoint. Moreover every nonisolated connected component of the external cross-conflict graph X involves one fixed unordered pair of cover components, with bipartition by those two families. Hence X is a disjoint union of paths and even cycles, together with isolated vertices. These are actual edge conflicts, not merely potential targets.

On the q2 cores alone define a separate simple graph J: join i,j if one of the two full apices of i lies in A_j and one of the two full apices of j lies in A_i. This is a POTENTIAL mutual-target graph, regardless of the currently chosen page endpoints. Every neighbor consumes one of the two full-apex slots, so J has maximum degree2. Thus its components are paths, cycles, or isolates.

## 3. Closed odd cycles of q2 cores

Let W be an odd-cycle component of J. Every core in W has two distinct neighbors in W, consuming both its full-apex slots. Thus BOTH its apices lie in cores of W. No page chosen at such a core can conflict with a triangle assigned to a core outside W: a cross-conflict would need its own apex outside W, which is impossible. This closure holds under resampling its page endpoints.

Apply the independently proved two-full-apices compatibility lemma to the cores of W. It supplies two mutually compatible private pages per core using those same full apices. The resulting2|W| triangles are disjoint from all supplied choices outside W by the preceding complete conflict geometry. If h is the total number of cores in all these odd-cycle components, remove them from the remaining selection problem and reserve their2h pages.

Their total family-cover cost is3h. This already yields a strict surplus h/2 over half that cost. On the remaining q2 cores, J is bipartite. The local weighted bound (1) still holds after removing the reserved cores, with the remaining values of I,E,t2 and family-cover cost c=c_total-3h:

    2I+E >= c-t2.                                        (2)

## 4. Coherent fair orientations

Give each connected component of the remaining bipartite J an independent fair binary choice between its two bipartition signs. Write u_i in {0,1} for the resulting sign at q2 core i; adjacent q2 cores have opposite signs, and each individual sign is1 with probability one half. Isolated J vertices also receive a fair sign.

Orient each connected component of the actual external-conflict graph X by selecting one of its two bipartition classes, as follows.

- If it involves a q2 core i, select its i-side exactly when u_i=1. If the other side is also a q2 core j, this is consistent: their actual conflict implies the potential edge ij in J, so u_j=1-u_i.
- If it has no q2 core, choose either class fairly.
- An isolated external page is treated as the two classes consisting of that page and the empty class. Use its q2 sign if applicable, and otherwise a fair choice.

Each external page is therefore selected with marginal probability one half. Independence between different X components is unnecessary. Most importantly, the TWO supplied pages at every q2 core i are both retained when u_i=1 and both omitted when u_i=0, even if they lie in different X components or are isolated.

Keep all I internal supplied members. Whenever u_i=0, append the internal triangle of q2 core i. It is disjoint from all other families by Section2, and neither of its own supplied pages was retained. Different appended core triangles are vertex-disjoint. The result is therefore an actual triangle packing for EVERY outcome of the fair choices.

Its expected size is

    I + E/2 + t2/2 >= c/2,                               (3)

by (2). Some outcome has at least this expectation. Adding the2h reserved pages gives

    nu(G) >= c/2+2h = c_total/2+h/2 >= c_total/2.

Since tau(G)<=c_total, this proves the theorem. QED.

If h>0 the displayed bound is strict. No full equality classification for h=0 is asserted. The probabilistic language is just averaging over finitely many binary orientations; it does not introduce an algorithmic sampling or a probability-of-correctness claim.

## 5. Scope and dependencies

This is an all-size ordinary proof using:

- challenger_forest_anchored_cover_v1.md and its accepted independent review, for the internal anchor theorem, used above directly without minimum-cover optimality;
- challenger_forest_external_minmax_v1.md, already included in that weighted corollary;
- the ordinary two-apex classification from matching_and_triangle_cover_tuza_v1.md;
- challenger_two_full_apices_packing_v1.md, for the closed odd-cycle components;
- the actual cross-conflict geometry also recorded in weighted_component_internal_strictness_v2.md, reconstructed above.

No CS minimality, codegree assumption, finite census, solver result, or external matching theorem is used. No minimum-cover hypothesis remains. The class of graphs admitting ANY cover of this shape is hereditary under graph-edge deletion: restrict the selected cover to surviving edges; each tree component splits into trees, and a partly deleted triangle becomes a path, edge, or isolated vertices. The restricted set still covers every surviving triangle. Vertex deletion follows as a special case. This heredity does not assert that the graph has a MINIMUM cover of the same shape.

We do not claim that an arbitrary graph admits such a cover. A tight graph with this cover shape is not yet classified by this theorem; existing equality results in narrower subclasses remain separate. The stronger sum-of-local-cover-costs bound is deliberate and is justified by the explicit compatibility construction, not by additivity of ordinary tau.
