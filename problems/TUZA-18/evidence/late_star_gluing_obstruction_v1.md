# Canonical star centres and arbitrary minimum-cover gluing both fail

Status: ordinary counterexample with an independent literal checker. It refutes two auxiliary selection assertions, not existential star gluing, PK, or Tuza. The input was discovered among previously saved literal type1 controls; this track did not generate a new graph-order census.

## Literal graph, prescribed maximum packing, private states

Use vertices {0,1,2,3,4,5,7} and all edges of K7 except {05,57,13,24}. Thus the17 graph edges are

  01,02,03,04,07,12,14,15,17,23,25,27,34,35,37,45,47.

Prescribe P=(T1,T2,T3,T4)=(237,012,147,345). These four triangles are edge-disjoint. Vertices0,1,2,3,4,7 have odd degree and vertex5 has even degree. Five packed triangles would use15 of the17 edges and leave just two edges. The edge union of triangles has even degree everywhere, so those two remaining edges would have exactly six odd-degree vertices, impossible. Hence nu(G)=4 and P is maximum.

The full actual triangle list is

  012,014,017,023,027,034,037,047,
  125,127,145,147,235,237,345,347.

Relative to B=E(P), all four packed members are type1. Their unique private bases, in packing order, are

  R=(37,12,47,34),

with private witnesses037,125,047,034 respectively. All other actual nonpacked triangles meet B at least twice. There are no private K4 completions, so A(P)=B. The canonical centres opposite the private bases are(2,0,1,5), all distinct.

## Exact residual cover structure

Every B-contained cover must contain the four bases R. The remaining support edges are

  U={01,02,14,17,23,27,35,45}.

After selecting R the only uncovered constraints are the six pairs of U edges

  {01,14}, {01,17}, {14,45},
  {02,23}, {02,27}, {23,35}.

They arise from the actual triangles014,017,145,023,027,235. Their pair graph is the disjoint union of paths

  17--01--14--45,     27--02--23--35.

Each path has minimum vertex-cover size2, so the exact B-constrained cover optimum is4+2+2=8. Each path has exactly three minimum vertex covers, giving exactly nine B-contained8-covers.

Canonical singleton groups would allow one U edge per packed triangle. But T2's two U edges are01 and02. If01 is not selected, both14 and17 must be selected, exceeding T3's quota. If02 is not selected, both23 and27 must be selected, exceeding T1's quota. Selecting both01 and02 exceeds T2's quota. Therefore no canonical-centre compatible cover exists.

## A minimum cover that admits NO star grouping

Take

  C_bad=R union {01,02,14,23}.

Its selected-edge counts on(T1,T2,T3,T4) are(2,3,2,1). The only triangle with more than two selected edges is T2=012; the only triangle with fewer than two is T4=345. They are vertex-disjoint. In any partition into common-vertex groups, the group containing T2 has no light triangle to pay its extra edge, so that group exceeds its2-per-member budget. Thus even an exact minimum B-cover need not admit any compatible star partition.

This addresses an existential partition but a FIXED arbitrary minimum cover. It does not refute existence of another minimum cover together with a suitable partition.

## The same witness has compatible existential choices

Take

  C_good=R union {02,14,17,23}.

Its counts are(2,2,3,1). Group T3=147 and T4=345 at centre4; leave T1 and T2 singleton groups, with centres2 and0. The selected costs are2,2,4 for group sizes1,1,2. The union is an actual8-edge B-contained cover. Its restrictions cover every triangle of the local edge-deletion graphs, since all edges outside the group's support have been removed there.

Therefore this witness satisfies the full existential-centre gluing claim. It demonstrates that both the centre assignment and the cover state must be chosen together; optimizing one while freezing the other can fail.

## Exact matching reformulation of support-cover gluing

For any packing P and any B-contained triangle cover C, every T in P has one, two or three selected edges. Call these members light, balanced and heavy, respectively. There exists a partition of P into common-vertex groups, each spending at most two selected edges per member, if and only if the bipartite graph joining heavy to light packed triangles that share a graph vertex has a matching saturating all heavy triangles.

Necessity: within any one group, the budget says the number of heavy members is at most the number of light members. Pair each heavy member with a different light member of that group; the paired triangles share its centre. These pairings form the required matching.

Sufficiency: assign each matched heavy/light pair their shared vertex as centre, assign remaining members arbitrary centres, and merge groups with equal centres. Each pair has total selected cost4; unmatched light/balanced members cost at most2. Hence every resulting group meets its budget. This proves the equivalence without any maximum-packing assumption.

Thus for the pure type1 case, the unresolved global gluing assertion is precisely existence of a support cover whose heavy-to-light intersection graph satisfies Hall's condition. Every canonical centre can fail, and some minimum covers can fail Hall, as the literal graph shows. The existence of a suitable cover satisfying Hall is an additional structural obligation, not supplied by the local star theorem or by finite survival.

## Finite discriminator scope

The first canonical failure appeared at existing source row214, the17th complete eligible type1 control. An exact existential-centre test on the same frozen source then examined all36,218 previously complete controls, with576 canonical failures and no existential-centre failure (4.72seconds). The one UNKNOWN source input was not promoted to eligible or silently counted as passing. The source contained393,643 total literal attempts, most of which did not meet the original hypotheses. These numbers support no universal conclusion.

Evidence: checks/late_star_gluing.py, checks/late_star_global_gluing.py, evidence/late_star_gluing.json, evidence/late_star_global_gluing.json. The separate literal checker checks the displayed graph and all cover states without importing the discovery scripts or its source corpus.
