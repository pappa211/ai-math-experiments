# Vertex identification with integral-defect transfer

Initial specification, before testing. This is a different operation from the earlier restricted twin compression: arbitrary pairs of vertices may be identified, loops discarded, and parallel edges simplified. Every triangle of the quotient must be reconstructed, including new triangles.

Put d(G)=tau(G)-2nu(G). Let B be the already elementary class in which every nonempty shared-edge triangle component has literal support K3, K4, or K5, with arbitrary triangle-free background. Such graphs have d(G)<=0 by independent block covers.

Candidate VI: every finite simple G outside B has distinct vertices x,y whose simple quotient G/(x=y) satisfies d(G/(x=y))>=d(G). If true, induction on the vertex count proves unrestricted Tuza: repeatedly identify an available pair until B is reached, and the defect never decreases. No individual packing or covering transfer is assumed; the complete integral defect is the required transferred quantity.

The first decisive point is this availability inequality. An exact graph outside B for which EVERY quotient has smaller defect refutes VI, even if that graph itself satisfies Tuza. The weaker assertion restricted to hypothetical positive-defect graphs would not be refuted by such a control and would remain an unproved global claim.

Planned initial test: use the existing exact full-triangle solver on the 1253 NetworkX atlas graphs, discarding B, inspect every unordered vertex pair, and stop at the first certified obstruction. Retain literal graph, full triangles, all quotient edges and both exact parameters. No graph-order expansion is authorized by finite survival alone. Independently verify a found witness with direct cover/packing enumeration or certificates before claiming refutation.

## First failure and substantive repair specification

The initial run stopped at atlas187 after67 eligible graphs (0.039 seconds): the cone over C5 has defect−1 and every one of its15 pair identifications has defect−2. Independent ordinary/certificate verification is assigned to the criticality track. The evidence is `evidence/identification_gate.json`. This attacks the exact availability claim, not Tuza; the wheel itself satisfies the inequality.

The wheel has a maximum packing whose triangles share its hub. The new common-vertex PK theorem therefore supplies an independently proved terminal family that was not used in the first VI claim. The next and only repair tested here is VI-star: enlarge B to include graphs admitting a common-vertex maximum packing, and ask the same nondecreasing-defect identification outside that union. The induction implication remains exact because the new terminals satisfy Tuza. Test the same initial atlas domain once, retaining all eligible literal graphs and quotient parameter rows; do not increase graph order after finite survival. No availability theorem for positive-defect graphs is being assumed.
