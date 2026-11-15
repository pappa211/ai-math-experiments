# Fresh independent audit: Delta–Y closed-boundary gate

**Verdict: ACCEPT as an ordinary proof of an auxiliary gate counterexample.** I found no mathematical gap in the frozen statement. The note proves that the stated closed-boundary T-join availability gate fails for every maximum packing of K5, and that connected bouquets force an unbounded number of original boundary vertices at the Tuza-sized cover budget. It does not refute Tuza or the odd-triangle-cover gate.

The input was `notes/packing_new_delta_y_gate.md`, SHA256 `ac32c0f5d76207fb644b5f82bf34b1d1e99ecef2015ace820eb548fd07b0c8a8`. An exact snapshot is retained at `review/delta_y_fresh_inputs/packing_new_delta_y_gate.md`. I reconstructed the proof before building my checker. I did not read or import the producer checker, producer literal evidence, favorable review, or research log for this audit. The only mathematical input was the frozen note and my own reconstruction. Requested model controls were Astra / Ultra; the actual serving identity and applied reasoning control are not independently exposed to this reviewer. This is AI ordinary-proof review, not human or Lean verification.

The mission clock remains start 2026-11-15T01:53:58Z, research cutoff 09:23:58Z, hard deadline 09:53:58Z. This audit was completed locally on Darwin before the research cutoff, without remote computation, publication, new environment changes, or a Lean run.

## Exact operation and cycle correspondence

For an edge-disjoint triangle packing, each packed edge belongs to exactly one packed triangle. Thus assigning it to the opposite spoke is a well-defined bijection from original edges to transformed edges. Maximality, and hence maximum status, guarantees that the retained old-edge graph N has no triangle. A transformed triangle with one centre would need a retained edge between two vertices of that same packed triangle, which is impossible. No two centres are adjacent. Connectivity is preserved by replacing each removed old edge by the two-spoke path through its centre.

A nonpacked original triangle cannot contain two edges of the same packed triangle: those edges determine all three vertices, making the triangles equal. It therefore visits distinct centres when its packed edges are replaced. Its three old vertices and those distinct new centres form a simple cycle. XOR with each complete star changes the opposite spoke into the required pair of on-cycle spokes. The cycle has ordinary length 3+r and weighted length 3, where r is the number of packed edges.

Conversely, between consecutive old vertices on a simple transformed cycle there is either one retained edge of weight 1 or one two-spoke path of total weight 1. Therefore a cycle of weighted length 3 has exactly three distinct old vertices. Compression gives their actual triangle in G. The compressed triangle cannot itself be a packed member, since then its three replacement paths would repeat that member's unique centre. A cycle with r=0 cannot occur because N is triangle-free. This proves the bijection, including the six-cycle case; it is not merely a correspondence in one direction.

The cover constraint uses an N edge on the lifted cycle or an opposite spoke off it. An on-cycle spoke corresponds to a different original edge and does not cover the triangle being encoded. Packed members require at least one spoke at their centre. These two classes account for every actual original triangle. My checker tested this equivalence for every transformed edge subset for every K5 maximum packing and separately tested six-cycle correspondence in a full K7 Steiner packing.

## Exhaustive K5 argument

K5 has packing number 2: three triangles would leave one edge, contrary to even degree at every vertex of both K5 and an edge-disjoint triangle union. Any pair of edge-disjoint triangles in K5 shares exactly one vertex, so all 15 maximum packings are automorphic.

For the representative pair (vab,vcd), let p,q,r,s indicate retained edges ac,ad,bc,bd. Evenness at old vertices a,b,c,d forces c_vb=p+q, c_va=r+s, c_vd=p+r, c_vc=q+s. Evenness at v forces c_ab=c_cd. Oddness at either centre then forces their common value to be 1+p+q+r+s. Conversely these equations satisfy every required parity. Thus the four bits parametrize exactly all 16 T-joins.

The inverse-cover states have size distribution five of size 6 and two of size 8. None of sizes 2,3,5 covers. The empty-retained-edge state maps to {ab,cd}; the singleton representative misses abd and bcd; the triple representative misses vbd. The displayed six-edge cover on {a,b,c,d} attains the lower bound. Consequently the constrained optimum is exactly 6 for every maximum packing, whereas 2 nu=4. The obstruction survives arbitrary moves that remain in the prescribed parity class.

K5 also satisfies the separately stated criticality and resilience assumptions. Three cover edges can meet at most nine of its ten triangles, and a 2+3 cut complement gives a cover of size 4. Each edge can be placed inside a part of such a partition, so it belongs to some minimum cover. The general inequality tau(G)<=tau(G-e)+1 then yields exact criticality. The explicit two-packing after each of the adjacent and disjoint two-edge deletion types is valid. Extending a deletion set handles sizes zero and one. The same cut complement is odd on each triangle, so pi=tau=4. None of these facts upgrades this auxiliary counterexample into a parity-gate counterexample.

## Bouquets: the shared vertex does not remove the obstruction

In a bouquet of m K5 blocks meeting only at w, no triangle crosses blocks and the edge sets of the blocks are disjoint. Hence maximum packings contain two members per block and all triangle-cover costs add. This proves nu=2m and tau=pi=4m. Criticality and two-edge resilience also pass blockwise, including deletion sets spread across two blocks.

A possible loophole was that w could have odd degree in two different restrictions and cancel globally. This does not occur for the closed-boundary T-joins in question: in each block all private old vertices are even and its two centres are odd. Handshaking within that block forces w even there as well. Each restriction is therefore exactly one of the local K5 T-joins already classified. Every inverse cover has size at least 6 per block, and the local attaining solutions combine. The constrained optimum is 6m for every maximum packing, even when the common vertex of a packed pair is private rather than w.

For the enlarged-boundary claim, let C be odd on each packed triangle. At an old vertex u, the transformed spoke indicator from a packed member equals 1 plus the sum of the two incident original indicators. Summing over members gives deg_H(phi(C))(u)=deg_G(C)(u)+d_P(u) modulo 2. This proves the stated identity for arbitrary edge-disjoint P and C satisfying that local oddness hypothesis.

At budget at most 4m, every local restriction is a minimum four-cover. Its six-edge triangle-free complement is K2,3: maximum degree cannot be 4, degree at most 2 cannot support six edges, and a vertex of degree 3 has three independent neighbors; the sixth edge forces the remaining vertex to join all three. This also proves that every such cover is odd on every triangle, so the identity applies without an extra hidden assumption.

For a local packed pair with common vertex v, d_P(v)=2 and all other local incidences are 1. If v lies in the size-three cover part, the other two vertices of that part are exactly the old boundary. If it lies in the size-two part, the boundary is v and the three vertices in the other part. Thus every block has at least one private boundary vertex. Globally at least m old vertices are odd; their total number is even because the 2m new centres are odd. This gives 2 ceil(m/2). Choosing private v_i,u_i and cover part {v_i,w,u_i} attains it: the local boundary is {w,u_i}, so the global boundary has size m+(m mod 2).

The precise optimum here is over maximum P and covers of size at most 2 nu together. It is not asserted to hold as an attained optimum for every fixed P. The lower bound applies to every such P and cover, which is enough to refute a fixed bound on additional original terminals. The all-m conclusion is the ordinary argument above; bounded computations only diagnose its local ingredients.

## Additional scope and objections tested

The K4 star and four-cycle do violate matroid augmentation for triangle-free edge sets, and a ground-set bijection preserves that violation. This excludes the stated same-ground-set identification. It does not exclude auxiliary-gadget matroid encodings.

The decisive objections tested were repeated centres under compression, overlooked on-cycle versus off-cycle spokes, nonrepresentative maximum packings, parity cancellation at the bouquet articulation, and confusing an optimized boundary statement with a statement for every fixed packing. Each is resolved by an explicit argument above. No mathematical repair to the frozen note was needed.

The doubling implication for the proposed gate is also correct: identifying one vertex of two copies of a connected graph creates no crossing triangle; nu and tau double, while connectedness and even packing number hold. Componentwise treatment then gives the unrestricted claim if the gate had been true.

## Independent literal validation and provenance

`review/delta_y_fresh_checker.py` is a standard-library-only reconstruction, with no producer imports. The retained run used the existing pinned local environment and Python 3.12.12 on Darwin. It passed:

- all 15 K5 maximum packings, with 16 T-join states each;
- all 15,360 K5 transformed-edge subsets for the exact inverse-cover criterion;
- independent simple-cycle enumeration for each K5 transform;
- all 150 K5 maximum-packing/minimum-cover pairs and their degree boundaries;
- all 28 nonpacked triangles and weighted six-cycles of a full K7 Steiner packing;
- a two-state boundary product calculation for m=1 through 8, plus literal bouquets m=3 and 4;
- the K4 triangle-free-set augmentation obstruction.

One operational correction is recorded: the first execution mistyped the path to the environment script, so that run used ambient local Python. I immediately reran with the correct script under `set -e`; the pinned run passed and regenerated the retained evidence. No mathematical output depends on the failed environment-source attempt.

SHA256 records:

| Artifact | SHA256 |
|---|---|
| Frozen note and input snapshot | `ac32c0f5d76207fb644b5f82bf34b1d1e99ecef2015ace820eb548fd07b0c8a8` |
| `review/delta_y_fresh_checker.py` | `89e3d250c50393526e93974689ed361b84b4a70dc44a1898fa58787501403e91` |
| `evidence/delta_y_fresh/results.json` | `27b78ff477d441d3895836607f18efcf17f16bb210a8497eecc6dd2b97d40097` |
| `evidence/delta_y_fresh/K5_states_and_cycles.json` | `ac4568c520b858cb3a81ac973d8977bca2857c87cfd3092696ae4ecc6cb7b4bd` |
| `evidence/delta_y_fresh/boundary_and_bouquets.json` | `59a288f94a7e7c432009af17ab1bae20df1d229a35793e49c1d1ea1f68b8a1b1` |
| `evidence/delta_y_fresh/K7_six_cycles.json` | `fb51205bde6010c644a300484d6cba256d4f476a2634750f38adc71899328388` |

This audit establishes the ordinary finite-graph proof and the stated independent bounded checks. It does not establish external novelty, formal verification, an unrestricted Tuza result, or an alternative global transfer theorem.
