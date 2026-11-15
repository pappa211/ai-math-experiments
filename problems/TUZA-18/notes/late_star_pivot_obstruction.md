# Global Hall deficiency has arbitrarily long minimum-cover plateaus

Status: ordinary proof with an independent literal two-block checker. This REFUTES PIV1 and every fixed-radius strict-descent version of the global Hall-deficiency potential. It does not refute existential star gluing, a componentwise potential, PK, or Tuza. The blocks remain separate shared-edge triangle components, a material scope limit.

## One block and its two ports

Use the seven-vertex graph and prescribed four-packing from late_star_gluing_obstruction.md:

  G0=K_{0,1,2,3,4,5,7} minus {05,57,13,24},
  P0=(237,012,147,345),
  R={37,12,47,34},
  C0=R union {01,02,14,23}.

Every packed member is type1; nu(G0)=4; the exact B0-contained cover minimum is8. All nine minimum support covers were independently certified. C0 has selected counts(2,3,2,1), so its heavy triangle is H=012 and its light triangle is L=345. They are disjoint, giving Hall deficiency1.

The two ports are vertex0, which belongs only to H among P0, and vertex5, which belongs only to L. The other two packed triangles237 and147 avoid both ports.

Exactly four equal-cost one-edge support pivots leave C0 a cover:

  remove01/add17; remove02/add27;
  remove23/add35; remove14/add45.

The first two move the heavy member from H to one of237,147, keeping L fixed. The last two move the light member from L to one of237,147, keeping H fixed. Each resulting local cover has Hall deficiency0. No other one-edge pivot is possible, as follows directly from the two disjoint P4 residual constraint graphs; no optimum oracle is needed.

## Chain construction and preservation of the exact hypotheses

For N>=2 take disjoint copies G_i of G0, and identify vertex0 of copy i with vertex5 of copy i+1 for each i<N. Make no further identifications or add any other edge. The two ports of an interior copy remain distinct. The result has6N+1 vertices,17N edges and16N actual triangles.

Every actual triangle lies wholly in one copy. Indeed each identification is a one-vertex clique sum: a triangle meeting both sides away from their shared vertex would need a nonexistent cross edge. Applying this along the chain proves the assertion. Different copies share no graph edge. Consequently triangle packing and covering parameters are additive over the copies. In particular the union P of the original P_i is a maximum packing of size4N. The old private witnesses remain private, all members remain type1, and there are still no private K4 completions. Original permitted edges are exactly B=E(P).

Since a B-contained cover restricts to a B_i-contained cover in every block, its minimum size is8N. Every such minimum restricts to one of the nine minimum covers in each copy. No edge selected from another copy can repair an uncovered local triangle.

Take C to be the union of C0 in every copy. It is a minimum B-contained cover. Its heavy/light bipartite graph consists exactly of the N-1 edges

  H_i -- L_(i+1),  i=1,...,N-1.

The endpoints of those edges are all distinct. Thus h(C)=N, matching(C)=N-1, and delta(C)=1.

## Why every block must change before deficiency can decrease

For any minimum B-contained cover C', each copy has four packed members and eight selected edges, so its local numbers of heavy and light triangles are equal. Adjacent copies have only one common graph vertex; that vertex belongs to exactly one prescribed packed triangle on either side. Therefore across each cut between a prefix of the chain and its suffix, the heavy/light bipartite graph has AT MOST ONE possible edge.

If C' has delta(C')=0, all heavy members can be matched. Total heavy and light counts are equal, so this matching covers all light members too. Each prefix separately has equal heavy and light counts. Hence the number of matching edges leaving that prefix from a heavy vertex must equal the number entering its light vertices. The cut has at most one possible edge, so neither direction can occur. Thus no edge of a perfect heavy/light matching crosses any chain cut. Each block must admit its own perfect heavy/light matching.

The original local cover C0 has no such matching. Therefore every one of the N blocks must change before global deficiency can become0. A change in any block exchanges at least one selected edge for one omitted edge because its cover size remains8. Consequently every compatible minimum C' satisfies

  |C symmetric_difference C'| >= 2N.

Since delta(C)=1 and deficiencies are nonnegative integers, any strict improvement must reach0. Thus for every fixed pivot radius r, choose N>r: no minimum cover at symmetric-difference distance at most2r from C strictly lowers delta. In particular N=2 refutes PIV1.

The bound is attained. In every block perform remove01/add17. Each resulting local heavy147 matches its local light345 at vertex4, so their union has deficiency0 and differs from C by exactly2N edges. This supplies an explicit successful nonlocal repair, not a failure of existential gluing.

## What this failure does and does not show

The literal local star theorem remains valid. The endpoint argument giving the star-quota/Hall equivalence remains valid. A support cover compatible with a star partition exists in every constructed graph, and the displayed simultaneous N-block repair finds one.

The failure is the chosen GLOBAL potential: one identification can match a bad heavy triangle to a neighboring bad light triangle, hiding all but one unit of the separate component defects. A potential that sums Hall deficiencies over the actual shared-edge triangle components starts at N here and decreases after each local pivot. Thus this construction does not refute componentwise PIV1 or a genuinely nonlocal exchange theorem.

A tentative attempt to connect these triangle components by adding a new cross triangle is not silently valid. At the join0_i=5_(i+1), such a triangle can use an omitted/selected spoke from the two port packed triangles. Their original private base pages avoid the join and lie in opposite copies; they are disjoint from each other and from the new cross triangle. Those three triangles replace the two port packed triangles, so the prescribed P ceases to be maximum. A stronger connected obstruction would need to block this concrete augmentation. No such construction or theorem is claimed here.

## Evidence and provenance

checks/late_star_pivot_chain_verify.py independently reconstructs N=2, all32 actual triangles, the original eight-packing, all81 minimum support covers from a separate local enumeration, the Hall-deficient start, every one-edge pivot, and the explicit two-pivot repair. Packing upper bounds use the proved actual-triangle decomposition and the elementary local parity certificate. Evidence is evidence/late_star_pivot_chain_verified.json.

The original direct one-pivot discriminator happened to pass all36,218 saved eligible controls (each had only3-5 packed members), recorded in evidence/late_star_pivot.json. The symbolic two-block construction has eight packed members; its purpose is to attack the mechanism, not extend a numerical bound. Finite survival did not imply the claim. No external theorem or Lean result enters this obstruction.
