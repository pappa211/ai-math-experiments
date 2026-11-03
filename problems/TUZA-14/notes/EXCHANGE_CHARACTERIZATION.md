# Exact blue-replacement characterization and the missing packing step

Author: coordinator. Literal statement was sent to the independent structural critic before the directed exact tests. Status: **PROVED_ORDINARY**, independently reviewed in `STRUCTURAL_AUDIT.md` section 7. This is an exact optimal-cover parametrization, not S or E and not a historical novelty claim.

Let G be a finite simple graph and C any actual edge cover of ALL its actual triangles. Initially C need not be globally minimum. Put B=E(G) minus C. For S subset C, call S admissible if it contains no complete actual all-red triangle.

Define F(S) subset B as the union of the unique blue edges of all T2 triangles whose two red edges lie in S. Define an ordinary auxiliary graph H_S with vertex set B minus F(S). Its edges are the two-blue pairs of T1 triangles whose red edge belongs to S and whose blue edges both avoid F(S). These auxiliary vertices are actual GRAPH EDGES, not vertices of G. Duplicate constraints may be suppressed.

## X1. Exact replacement cost

If S is inadmissible, no D subset B makes (C minus S) union D a triangle cover. If S is admissible, the exact minimum cost of such a D is

    beta(S) = |F(S)| + vc(H_S),

where vc denotes ordinary vertex-cover cardinality.

Proof. The only triangles no longer hit by C minus S have their entire red set in S. A T3 among them has no blue edge and makes replacement impossible. A T2 among them forces its unique blue edge, giving exactly F(S). Each affected T1 is already hit if one blue edge lies in F(S); otherwise its two blue edges are exactly one edge of H_S. Therefore D works if and only if F(S) subset D and D minus F(S) is a vertex cover of H_S. The two sets are disjoint, giving the formula. Empty sets and isolated auxiliary vertices are allowed. QED.

## X2. Global optimality and every equal-cardinality exchange

C is globally minimum if and only if beta(S)>=|S| for every admissible S subset C.

Proof. Every replacement gives a cover of size |C|-|S|+|D|. Conversely, for any alternative cover C', take S=C minus C' and D=C' minus C. Then D subset B and C'=(C minus S) union D. X1 applies and no smaller alternative is omitted. QED.

If C is globally minimum, ALL other global minimum covers are exactly

    C' = (C minus S) union F(S) union Z,

where S is admissible, beta(S)=|S|, and Z is a minimum ordinary vertex cover of H_S. For each C', S is uniquely determined. The empty S recovers C itself. If a blue replacement costs less than |S| then C was never globally minimum; inclusion-minimality cannot substitute for this condition.

## X3. What this does not prove

The ordinary inequality vc(H_S)<=2 nu(H_S) yields only

    |S| <= |F(S)| + 2 nu(H_S)

for admissible S of an optimal C. It is not a triangle-packing certificate. Two disjoint auxiliary edges can carry the SAME red label, and different forced singleton-blue constraints can share red edges. A single red triangle also makes S inadmissible regardless of the rest of the graph. Thus neither an ordinary matching nor its endpoints account for all red and blue capacities of a triangle packing.

The first unproved step in the proposed universal mechanism is a theorem converting these simultaneous replacement inequalities AND actual triangle closure into an eligible packing of size ceil(|C|/2), or into an equal-cost exchange increasing the best attainable k. No such conversion is proved here. Merely renaming this step would restate S/E.

A useful local fact is that the private pairs carrying a fixed red label are disjoint auxiliary edges: distinct actual triangles containing the same red edge share no other edge. This is why an ordinary matching can use one color many times, not a reason that colors can be forgotten.

## Directed exact check

`checks/exchange_characterization.py` imports the authenticated TUZA-13 bit-mask full-graph checker READ ONLY and separately implements ordinary vertex-cover recursion. On eight literal designated pairs it exhaustively checks all 3,308 red subsets, constructs every equal-cost replacement, and compares the reconstructed set with the full exact minimum-cover set. All 246 global optimum covers across the eight graphs are recovered exactly. It also tests the private-blue-conflict geometry and the unique-witness packing lemma on those designated covers.

The inputs are the three normalized sharp near misses, the Clebsch cone, K7, the eight-vertex restoration example, K4, and a central red triangle with two private pages on every edge. Full literals, actual triangles, covers, subset constraints and outcomes are in `evidence/exchange_characterization.json`. Runtime about 0.11 seconds, no timeout. This is **FINITE_CHECKED** support for the implementation and examples, not the proof of X1/X2 and not evidence of universal S/E beyond those inputs.
