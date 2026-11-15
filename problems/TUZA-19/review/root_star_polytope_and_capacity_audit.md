# Root reconstruction: bounded-star polytopes and refined cluster capacities

Status: ordinary independent mathematical reconstruction by root on15 November2026. Producer files were read after the proofs were frozen. This is not a blind fresh context, a Lean proof, or an independent rerun of the producer checkers.

## Bounded-star packing-polytope obstruction

Input: notes/fresh_global_star_polytope_obstruction.md.

PASS at its exact scope. The doubling construction partitions the new complete graph's edges by midpoint matchings and uses every old-new edge exactly once, retaining precisely the original C4 leave. Even degree parity excludes a one-edge leave, so the claimed packing optimum is exact. Relabeling that leave covers every two-edge deletion orbit. Mantel's elementary degree proof supplies the minimum covers, and a balanced partition may put any specified triangle in one side.

For the local marginal step, the set B outside the four leave vertices has every incident edge covered. The lower bound on packed triples wholly in B is positive at n=11 and increases thereafter. For an s-subset of B, the expected number of contained packed triples is at most C(s,3)/(n-6), so the strict inequality guarantees a zero-triple subset; a second subset contains at least one. Their mixture has the required expected internal count and preserves saturation of every edge incident with S. Symmetrization gives a common probability p_i for each triangle type. The internal count fixes p_3; the internal-edge and crossing-edge equations successively fix p_2 and p_1. The s=1,2 treatments avoid nonexistent types. All probabilities are in [0,1], and n-s-1 is positive.

Singleton-star constraints imply all edge capacities, yielding the exact relaxation optimum m/3. The integral value (m-4)/3 differs by4/3. In the amplified graph, every actual triangle is copy-local and copied edge sets are disjoint. Independent block distributions give the required local convex combination for any global S, even if a shared vertex meets many blocks. TF and two-edge resilience pass blockwise. Thus the gap4b/3 can exceed C times the total vertex count.

Scope: this intersection of projected exact polytopes requires agreement of first marginals only. No common joint distribution or overlap-moment consistency is imposed. The result does not establish a lower bound for a named hierarchy with additional constraints, a triangle-cover inequality, or a Tuza violation. Global leave/component inequalities can detect these particular controls. No originality claim is approved.

## Partition-refined capacity obstruction

Input: notes/h_o2_cluster_capacity_screen.md.

PASS at its exact scope. In F join triangle-free R, the listed four triangle types are exhaustive. After fixing the actual boundary packing Q, every remaining internal triangle uses two previously unused spokes in precisely one apex/cluster cell. This gives the displayed score upper bound without assuming compatible rim matchings exist.

For a packing after an even number of spoke deletions in each cell, its Q is still an admissible original boundary state and avoids all deleted spokes. Hence subtracting2t spokes lowers that cell's floor capacity by exactly t. Maximizing over original Q gives the uniform deletion inequality. In particular attainment of this upper bound excludes two-edge resilience whenever some cluster has two vertices.

The comparison with the coarse bound is sound: each two-apex triangle contributes one boundary spoke at each of its two apices, and each inter-cluster one-apex triangle contributes two. Summing floors can only be smaller than the floor of the sum. No attained-capacity assumption is hidden in the upper bound; it is used only to deduce the blocker. The lemma is restricted to triangle-free rims and does not apply directly to the K5-incidence rims.

No further verification jobs were launched for this reconstruction.

Input SHA256 notes/fresh_global_star_polytope_obstruction.md: 40896772e0eba03072bdab40c9e8ba95b708c0c6cd17f1dc1c17970f0ec7886e

Input SHA256 notes/h_o2_cluster_capacity_screen.md: d96c16a2a3154364d8e3042a13a0b11f1a37f1e27034d74919c4822784faf266
