# The common-vertex terminal repair also fails

Status: complete ordinary control, independently checked by literal full-triangle enumeration. This closes the stated repaired universal identification mechanism; it is not a Tuza counterexample.

## Exact repaired claim

Let B be the class with only literal K3/K4/K5 nonempty triangle components, and let S be the class admitting a maximum triangle packing whose members have a common vertex. Both classes satisfy Tuza, the latter by `criticality_star_pk_theorem.md`. The substantive repair of VI proposed in `criticality_identification_wheel.md` was:

    For every finite simple G outside B union S, some distinct x,y satisfy
    d(G/(x=y)) >= d(G), where d=tau-2nu.

Identification discards loops, simplifies parallel edges, and counts every actual quotient triangle. The square of a seven-cycle disproves this repaired claim.

## Literal graph and exclusion from both terminal classes

Use vertices 0,...,6 and join pairs at cyclic distance one or two modulo seven. Its fourteen edges are

    01,02,05,06,12,13,16,23,24,34,35,45,46,56.

The actual triangles are exactly the seven consecutive triples T_i={i,i+1,i+2}, with indices modulo seven. For example the link of vertex0 is the path2-1-6-5; its three edges yield exactly012,016,056, and cyclic symmetry gives the complete list.

Two distinct triangles share an edge exactly when their indices are consecutive modulo seven. Thus the triangle edge-conflict graph is a seven-cycle, and nu=3. Explicitly012,234,456 are an edge-disjoint three-packing; no independent set of a seven-cycle has four vertices. Each graph edge belongs to at most two triangles, so any triangle cover has size at least four. The four edges01,23,45,06 cover every T_i, proving tau=4. Consequently d=-2 and ordinary Tuza holds.

The seven triangles form one shared-edge component on all seven vertices, whose support is not K3, K4, or K5. Therefore this graph is outside B.

Every vertex lies in exactly three triangles, and these three have edge-conflict graph a path of length two. They admit a two-packing but no three-packing. Thus the largest packing with ANY specified common vertex has size exactly two, whereas nu=3. The graph is outside S as well. This verifies the repaired claim's entire antecedent, not merely the old terminal exclusion.

## All twenty-one quotient defects drop

Cyclic rotations and reflection give exactly three pair orbits, according to cyclic distance1,2,3; each orbit has seven pairs. For representatives identify0 with b, where b=1,2,3, retaining label0 for the merged vertex and deleting label b. The following are complete actual triangle lists, obtained directly from the simple quotient edges:

- b=1: 023,035,056,234,345,456.
- b=2: 013,016,034,035,045,046,056,345,456.
- b=3: 012,016,024,045,046,056,456.

These lists include newly formed triangles. They can be verified by applying the specified identification to the displayed fourteen original edges and testing each triple of the six remaining vertices.

Each representative has the following explicit three-packing and three-cover:

| Identified pair | Three edge-disjoint triangles | Three-edge triangle cover |
| --- | --- | --- |
| 0,1 | 023; 056; 345 | 03; 34; 56 |
| 0,2 | 013; 046; 345 | 03; 06; 45 |
| 0,3 | 016; 024; 456 | 01; 04; 56 |

Inspection of the complete triangle lists verifies every cover; inspection of the three triangle-edge sets verifies every packing. Therefore tau=nu=3 in all three representatives, and by symmetry in every quotient. Hence for ALL distinct x,y,

    d(G/(x=y))=3-2*3=-3 < -2=d(G).

This is an ordinary finite proof that VI remains false after adding the entire newly proved common-vertex maximum-packing terminal class. It does not depend on the atlas index at which the coordinator discovered the graph.

## Evidence, scope, and stopping rule

`checks/criticality_identification_star_repair.py` constructs only this fixed C7-square graph and its twenty-one quotients. It uses the separate standard-library literal optimizer in `criticality_identification_wheel.py`, independently of the coordinator's atlas solver. Every actual triangle is reconstructed; every triangle subset is checked for packing; cover subsets are inspected in increasing cardinality. The script additionally checks the largest star packing separately at all seven vertices. Complete input and quotient graphs, all triangles, optimum witnesses, and dependency hashes are saved in `evidence/criticality_identification_star_repair.json`.

The first wheel control and this C7-square control refute the initial availability proposal and its one substantive, theorem-supported repair. No further terminal enlargement by selected exceptions is proposed. The weaker availability assertion restricted to hypothetical positive-defect graphs is not refuted by these negative-defect controls; it remains an unproved global claim and supplies no completed reduction.
