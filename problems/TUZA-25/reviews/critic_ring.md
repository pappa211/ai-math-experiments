> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent critic: frozen four-K5 ring

**Verdict: PASS, with one resolved certificate-format omission.** This is an in-session independent AI reconstruction and exact finite check, supplemented by ordinary arguments. It is not Lean verification, external peer review, or a separately commissioned final audit. No mathematical disagreement remains on the frozen ring claim.

I read `notes/ring_frozen.md` and `evidence/ring_certificate.json`, then wrote `scripts/critic_ring_check.py` from the graph definition. I did not read, import, or execute the discovery checker. The verifier uses only the Python standard library, set operations, exhaustive tiny local checks, witness checking, and independent F2 elimination. It ran locally on Darwin with the pinned existing Python 3.12.12 and no optimizer, installation, or remote computation. `evidence/critic_ring_check.json` records source hashes, execution details and all results. Requested Astra/Ultra configuration is not an independently exposed serving attestation.

## Reconstruction and bounds

Let P_i={2i,2i+1}, x_i=8+i, and Q_i=P_i union P_(i+1) union {x_i}, with indices modulo four. Generate edges as the union of all ten edges of each Q_i. The checker directly generates this union and tests every 3-subset of the twelve vertices for all three edges. It obtains 36 distinct edges and exactly 40 actual triangles. Every triangle has exactly one Q_i owner, ten per clique. Thus there are no omitted crossing triangles. All edges are triangular; the 40 triangles form one component under shared-edge adjacency.

Each local K5 packs at most two triangles. An ordinary reason is that three edge-disjoint triangles would use nine of its ten edges; their union has even degree at every vertex, whereas K5 with one edge removed has degree three at the two endpoints of that missing edge. Unique triangle ownership therefore gives nu <= 8 for the entire graph and for all its edge-deleted subgraphs. The checker independently enumerates local triangle families and confirms maximum two.

All **667** deletion sets are covered exactly once: 1 empty, 36 single-edge, and 630 two-edge sets. For each supplied witness, the checker verifies eight distinct actual triangles, pairwise edge disjointness, and avoidance of every deleted edge. It rejects duplicates, extra cases, and omissions. Consequently nu(G-S)=8 for every |S|<=2, without relying on solver status or an optimality flag. The checker additionally confirms that each K5 has a two-triangle packing avoiding any at-most-two of its own edges, but does not substitute that local fact for global compatibility.

Every cover restricted to any Q_i has at least four edges: K5 has ten triangles and each edge meets only three, so three edges cannot cover it. Summing over Q_i counts every nonshared edge once and the four pair edges twice. Hence 16 <= |C|+4, so tau >= 12. All four pair edges together with both edges x_i-P_i for each i form a 12-edge cover. Therefore **tau=12**. Alternately color the pair groups and color x_i like P_i; the monochromatic edges are precisely this cover. Independent enumeration of all 2^11 vertex bipartitions up to complementation also gives minimum cut-cover size 12.

## Cohomology

The checker constructs the actual vertex-to-edge and edge-to-triangle coboundary matrices. Set-based Gaussian elimination over F2 gives rank(delta0)=11 and rank(delta1)=24; it checks delta1 delta0=0. Thus

    dim H^1 = 36 - 11 - 24 = 1.

There is also a rank-free proof of nonzero cohomology. Select the six Q_0 edges from P_0 to P_1 union {x_0}. Within Q_0 this is a cut, hence meets every local triangle evenly; no selected edge belongs to another clique. It is therefore a cocycle on every actual graph triangle. The graph cycle 0-2-4-6-0 meets it in exactly the edge 0-2. Every global cut meets every cycle evenly, so this cocycle is not a coboundary. The checker verifies the cycle and the odd pairing, and separately verifies that adjoining the cocycle to the delta0 image increases its rank.

## Resolved discrepancy

The initial certificate gave `cut_partition_bits=102` without its convention. Reading bit v as the color of vertex v produces the wrong edge set. Independently reconstructing the intended convention resolves the mismatch: vertex 0 is fixed to color 0, and bit v-1 gives the color of vertex v for 1<=v<=11. With that convention the listed minimum cut cover matches exactly and has twelve edges. The coordinator was notified immediately and documented the convention. This is a schema omission, not a failed graph claim.

## Exact scope and controls

The example refutes the broad implication that two-edge packing resilience, connected nonempty triangle support, and all edges triangular force H^1(F2)=0. It does **not** refute unrestricted Tuza, universal CS, the narrower minimum-CS residual application, defect-one rigidity, the scoped cut-cover inequality, or a graph census only through ten vertices.

Indeed 12 < 2*8=16. The graph is not defect-one (that would require tau=15). Its connected triangle support is neither literal K4 nor literal K5; it is non-B and strictly below equality, consistent with CS. Its minimum triangle cover, odd cover, and cut cover all have cardinality 12: the constructed cut cover is odd and every odd cover is a cover. Thus nontrivial cohomology separates the *families* of odd and cut covers while this example does not separate their minimum sizes.

A requested additional scope control was reconstructed independently in the same checker: K4 has four actual triangles, nu=1 and tau=2, every edge triangular, connected shared-edge triangle support, and nu remains 1 for all seven at-most-one-edge deletion sets. Hence a literal statement that K5 is the sole tight one-edge-resilient graph "through ten vertices" is false if order four is included. A source census restricted to orders five through ten is not contradicted by this K4 control. The complete census has not been reproduced by this review.

## Reproduce

From the TUZA-25 workspace:

    source PRIVATE_PATH_REMOVED
    python scripts/critic_ring_check.py

The output is `evidence/critic_ring_check.json`. The checker is lightweight, has no solver/timeouts, and hashes the exact frozen inputs it checked. If those input bytes change, rerun to bind the review receipt to the new certificate. No claim of exhaustive graph enumeration or smallest possible counterexample order is made.
