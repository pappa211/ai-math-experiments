# Audited local-stability corollary to the order-three repair

The frozen proof notes/root_cksu_order3_repair.md has been freshly accepted in review/cksu_order3_repair_fresh_audit.md. Its hypothesis can be weakened without changing any charging rule.

Let P be a triangle packing such that there do not exist R contained in P, |R|<=2, and |R|+1 pairwise edge-disjoint actual triangles avoiding every edge of P minus R. This includes the empty R case. Then the repaired assignment has total mass at most2|P| and covers every actual triangle.

Indeed the only optimality uses in the proof are: no0-for1 gives attachment to the packing; no1-for2 gives private types0,1,3 and the unique type3 tip; no2-for3 gives the complete doubly attached classifications. Each displayed new triangle is private or doubly attached to the stated owners, so it avoids all other packing members. The charging and coverage arguments use no additional maximality.

Starting from any packing, repeatedly find one of these augmentations. Cardinality increases each time and is bounded by|E|/3. Enumerating at most two old and at most three new triangles is polynomial; no complexity improvement is claimed. The terminal packing and repaired third-integral cover therefore provide the same constructive known factor-two fractional certificate. This is neither an integral rounding theorem nor a validation of CKSU Section4. No Lean verification or historical originality is asserted.

Producer checks: evidence/cksu_order3_repair/producer_check.json records486 maximum packings in209 atlas graphs through six vertices and616 singleton processing orders, plus one specified seven-vertex interface. The independent audit separately checked559 packing instances and55,101 singleton orders, including genuine credit overlaps. Their finite domains support, but do not replace, the ordinary all-size proof.

A fixed ordinary control shows that the weakened premise genuinely allows nonmaximum packings. Take the cone over the eight-vertex path0-1-2-3-4-5-6-7, with apex a, and choose P={a12,a34,a56}. Cone packings correspond to path matchings. Its only two unmatched rim vertices are0,7, whose unique augmenting path has seven edges and replaces three matching edges by four. Thus no augmentation removing at most two members exists, while nu(G)=4>|P|=3. The repaired third-integral scheme still costs at most6=2|P|. This control does not require a graph census or a maximum-packing oracle.
