> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Tuza for any triangle cover of total cycle rank at most two

Frozen 2026-11-16. Status: **PROOF_USING_FINITE_CERTIFICATES**, inherited only through the accepted one-cycle-cover CS theorem. There is no new computational premise. This theorem proves the inequality, not equality classification for the rank-two class.

## Statement and exact class

Let G be a finite simple graph admitting a triangle edge cover C whose selected graph has total cycle rank at most two. Then

    tau(G) <= 2nu(G).

The cover need not be minimum. Its selected graph may be disconnected, and the two cycles may occur in one component. The total cycle rank is |E(C)|−|V(C)|+components(C), with isolated vertices contributing zero. This is a hereditary graph class: restricting the selected cover to an edge-deleted subgraph remains a triangle cover and cannot increase total cycle rank.

Equivalently, this is the class of graphs obtained by adding at most one edge to a graph admitting a cover of total cycle rank at most one. In one direction delete a selected edge on a cycle. Conversely add the new edge to the previous cover; it covers every newly created triangle and raises cycle rank by at most one.

## Proof

If C has rank at most one, use the accepted combined one-cycle-cover CS theorem. Otherwise choose any selected edge e lying on a cycle and set H=G−e. Then C−{e} covers H and has total cycle rank one. Hence H satisfies combined CS.

If tau(H)<2nu(H), integrality gives

    tau(G) <= tau(H)+1 <= 2nu(H) <= 2nu(G).

If tau(H)=2nu(H), the accepted equality theorem gives B(H). If insertion of e creates no triangle, the triangle family is unchanged, so B(G) and equality follow. If it creates a triangle abx with new edge e=ab, its two old spokes ax,bx cannot both belong to the same literal K4/K5 old triangle component: that clique would already contain ab. Choose maximum packings in every old component avoiding whichever single spoke belongs to it. Old background spokes are automatically avoided. Appending abx yields nu(G)>=nu(H)+1, while tau(G)<=2nu(H)+1, proving strict inequality. This exhausts the cases.

## Exact remaining equality branch

Suppose G in this class satisfies tau(G)=2nu(G) but not B(G), and write k=nu(G). For EVERY selected cycle edge e whose deletion lowers the cover rank to at most one, the proof forces

    nu(G−e)=k,       tau(G−e)=2k−1.

Thus every such deletion is a packing-preserving defect-one residual, and reinsertion raises the minimum cover by one. The proof does not classify these near-tight residuals and does not establish rank-two CS.

There is also a modest additional necessary property for a proper-subgraph-minimal CS failure in this class: EVERY VERTEX must be incident with the selected cover C. If a vertex v had no selected incident edge, its entire induced link would be a subgraph of C, because every triangle through v must be covered on its rim edge. The minimum-CS codegree condition makes every link component have minimum degree at least two. A connected such component of cycle rank at most two has at most two vertices of degree at least three, since sum(deg−2)=2(rank−1)<=2. The accepted ordinary at-most-three-branch link exclusion rules out that component. Hence selected degree zero is impossible. This does not exclude selected leaves or prove equality classification.

## Dependencies and boundary

- `notes/challenger_one_cycle_cover_cs_v1.md`, SHA256 `e8412e3e36014cfa1067c3d98ae3b51640051d9bdb600b26f019b171a2e86418`; fresh review `review/one_cycle_cover_cs_independent_assembly_review.md`, SHA256 `2c39311fafa5a60bbc4d9c179dc55d3e9d16a52f97c99da484a9cf663774eab4`. Its exact2018 P6,2422 isolate and8220 final finite interfaces remain explicit premises.
- The single-edge insertion argument is reconstructed above and uses only literal K4/K5 packing avoidance.
- Only for the final minimum-CS necessary property: the accepted class-local minimum-CS codegree framework and ordinary `notes/three_branch_cs_link_exclusion_v1.md`, SHA256 `dd530b892b10279fda98b195522f1027376deadfbce7a769ae2aec28d62bafa4`.

No cover-availability result for arbitrary graphs, unrestricted Tuza/CS conclusion, or original H-D proof follows from this class theorem.
