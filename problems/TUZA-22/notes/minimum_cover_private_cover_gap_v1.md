> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# An ordinary minimum cover need not be minimum for its private family

Status: ordinary counterexample with a bounded discovery receipt and a direct proof. This refutes the proposed equivalence of ordinary and private-family minimum covers even when the ordinary minimum cover has a bipartite complement. It does not refute a private-packing bound or Tuza.

## The nine-vertex witness

Let A={0,1,2,3,4} have exactly the edges

    C={01,02,04,12,13}.

Add independent vertices5,6,7,8 with respective neighborhoods

    N(5)={0,1,3}, N(6)={1,2,3},
    N(7)={0,1,4}, N(8)={0,2,4}.

There are no other edges. The graph has9 vertices,17 edges and exactly9 actual triangles. One is the internal triangle012. The other eight, all private to C, are

    028,048,047,017,015,135,136,126.

Their incidence has a particularly simple exact representation. Arrange the graph edges

    02 -- 08 -- 04 -- 07 -- 01 -- 15 -- 13 -- 16 -- 12

as a nine-vertex path. Each consecutive pair belongs to one of the eight listed private triangles, whose third graph edge occurs in no other triangle of that private family. These third edges are respectively28,48,47,17,05,35,36,26. Thus each private triangle contains the two consecutive path-node edges and one unique extra edge.

The four even-position path nodes

    D={08,07,15,16}

cover the private family. The four private triangles028,047,015,136 are pairwise edge-disjoint, so the private packing and covering numbers are both4.

Moreover D is the UNIQUE private cover of size4. To see this, a cover containing a unique extra edge can replace it by either of that triangle's two path nodes without increasing size. The resulting selected path nodes cover all edges of P9. Its only vertex cover of size4 is its even-position set: the complementary independent5-set must occupy positions1,3,5,7,9, since five nonconsecutive positions in a nine-position path force all gaps and both endpoints. Choosing the odd-position endpoint when replacing any unique extra edge would contradict that uniqueness. Therefore no unique extra edge can occur in a minimum private cover, and the only such cover is D.

The cover D misses012. Hence no four-edge cover meets all actual triangles. The five edges C do meet every triangle, proving

    tau(G)=5=|C|,     tau(private family)=4.

Deleting C leaves a bipartite graph with parts A and {5,6,7,8}. Thus C is an ordinary minimum cover with bipartite complement, yet is not minimum for its private family. The maximum full packing number is4: a packing omitting012 is a private packing of size at most4, while one containing012 can use only the two noncentral bases04,13 and therefore has size at most3. The witness is strict for Tuza and satisfies the private half-size bound comfortably.

## An unbounded version of the same mechanism

Take a triangle abc, p>=1 private leaves adjacent only to a in the core, and q>=1 private leaves adjacent only to b in the core. Let m=p+q+3 be the number of core edges, and order them as

    ac, all a-leaf edges, ab, all b-leaf edges, bc.

For each consecutive pair add one independent apex adjacent to their three endpoints. Consecutive pairs span exactly a two-edge path in the core: p,q>=1 prevent a pair of triangle edges from occurring consecutively. Thus each added apex has exactly two private triangles. There are no other mixed triangles or triangles with two apices, and the core has only abc.

The same incidence representation is P_(2m-1), alternating m core edges and m-1 shared spokes. Every private triangle also has a distinct unique third edge. The unique private minimum cover is the m-1 even-position shared spokes, by the same path argument. It misses abc, while the m core edges cover the full graph. Therefore for every m>=5 obtainable with p,q>=1,

    |V(G)|=2m-1, |E(G)|=4m-3,
    number of actual triangles=2m-1,
    tau(G)=m, tau(private family)=nu(private family)=nu(G)=m-1.

The private matching lower bound follows by taking alternating edges of the path incidence, giving m-1 actual edge-disjoint triangles. A full packing containing abc can use only m-3 remaining core bases and has size at most m-2. The triangle support is connected through the displayed path. These are actual graphs of unbounded order, not abstract hypergraphs.

## Discovery and independent certification boundary

The approved bounded discriminator stopped at its first witness, rather than completing or expanding its search domain. `scripts/private_vs_full_cover_discriminator.cpp` compared the exact global cover formula and the private-family formula on small core/apex-multiset inputs. `scripts/private_vs_full_cover_discriminator.py` independently rebuilt all literal graph edges and triangles of the found witness and replayed all32 core-edge subsets, including all28 triangle-free subsets. It confirmed ordinary optimum5 and private optimum4 and verified the displayed private cover and missed internal triangle.

Source C++ SHA-256: `830c0dac3d47fc844ffd8d7726ba03c0a7ac71370252471ebf84ba5343e511e0`. Literal data and replay output: `evidence/private_vs_full_cover_discriminator.json`. Process receipt: `operations/private_vs_full_cover_discriminator.json`; wall1.063s including compilation, sampled peak130.219MiB,60s/2200MiB caps, exit0, no timeout. The discovery inspected nine core representatives and58328 apex-multiset states before stopping. Those are run diagnostics, not an all-graph classification. The ordinary proof above makes the counterexample independent of trusting those finite diagnostics.

## Exact implication for the active program

The triangle-free restriction in the global ordinary-cover identity cannot be dropped, even under full ordinary minimum-cover optimality and bipartite complement. A private-family cover may genuinely be smaller by leaving an internal triangle uncovered. This eliminates the proposed identification of the two cover optima as a route to a packing theorem. It leaves the desired private-packing inequalities, the scoped positive results, D-some-choice and unrestricted Tuza unchanged.
