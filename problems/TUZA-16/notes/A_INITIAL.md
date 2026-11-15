# Route A independent initial note

Frozen 2026-11-03 before reading any other scout arguments. The only coordinator input seen is that the common test battery exists.

## Precise leading candidate A4: minimum deletion to four vertex colors, with optimal certified residual payment

First discard graph edges belonging to no actual triangle (this changes neither optimum). Given the resulting graph G, choose a vertex partition into at most four classes maximizing the number of crossing edges; let F be exactly the monochromatic edges and H=G-F. Break ties in any specified deterministic vertex order; the proposed universal assertion allows the most favorable maximum-cut tie. Color the four parts by F_2^2 and every H-edge by the nonzero difference of its endpoint colors. This is an explicit triangle-3-coloring certificate; deleting edges creates no triangles.

A4 asserts that some maximum four-cut has an actual packing P of G and an actual cover C_H of all H-triangles such that |F|+|C_H| <= 2|P|. The cover lift is exactly F union C_H; every destroyed triangle contains an F-edge, including all crossing triangles. P may be globally repacked, and need not preserve any prescribed residual maximum packing. The residual slack certificate, if used, is an actual pair (P_H,C_H) with s=2|P_H|-|C_H|; a packing increment is valid only when its reconstruction is proved compatible.

The shortest hypothetical proof of unrestricted Tuza is: strip triangle-free edges, choose the four-cut and the A4 certificates, and use F union C_H as a cover. The four-cut always exists; H is a published triangle-3-colorable Tuza class, but this alone does NOT prove A4. This is a single nonlocal operation, so no termination issue remains.

The first unproved assertion is exactly that the lifted cover can always be paid on at least one maximum four-cut. Aharoni only guarantees some C_H with |C_H| <= 2 nu(H); it supplies no repair budget. A4 is a particular algorithmic repair restriction, not the known unrestricted F-existence equivalence. Its being stronger than Tuza leaves it susceptible to counterexamples among ordinary Tuza graphs.

## Strongest expected obstruction and cheap attack

The leading attack is a cone over a large independent-twin blow-up of a triangle-free graph of chromatic number at least five. Every graph edge remains in an actual triangle. Every triangle uses the cone apex, so every packing is at most half the rim order, whereas a maximum four-cut might leave quadratically many rim defects. This can defeat payment even with arbitrary global repacking and the best residual cover. A symbolic construction using a fixed triangle-free five-chromatic base would reject A4 on an unbounded family without any exact packing solver. The key fact to prove is the four-cut defect scaling under independent-twin blow-up.

Controls: empty/triangle/books/K4/K5 must obey literal definitions. Dense clique controls do not decide the hub attack. The 27-vertex VB cone is relevant as a warning about vertex budgets, although the new assertion uses total certificates and is not VB. The abstract Fano plane is outside the graphic domain; any positive proof must use actual triangle geometry.

## What would constitute progress

A positive result would need an actual unbounded compatibility/payment lemma and a reason that these prescribed cuts always admit its certificates. Passing small examples is insufficient. A rigorous negative result would isolate an unbounded obstruction to this specific nonlocal color-repair operation, including global repacking and arbitrary certified residual savings. If the expected cone obstruction succeeds, replace the mechanism only after recording the exact failure, considering a hub-aware repair with genuine boundary states rather than relaxing to the already-equivalent unrestricted F-existence condition.

## Prior-art separation

I inspected the pinned TUZA-01 triangle-deletion theorem and TUZA-02 essential-edge restoration hypotheses. The old one-triangle theorem assumes H=G-E(T) triangle-3-colorable; equality uses HNS and actual K4 triangle components, and choices of residual packing matter. The old two-triangle essential-edge theorem additionally assumes tau(H)=2nu(H)-1 and an edge whose deletion lowers nu(H). No such essential-edge, equality, or block hypothesis is assumed in A4. A4 is not claimed new in the literature; no originality claim has been established.
