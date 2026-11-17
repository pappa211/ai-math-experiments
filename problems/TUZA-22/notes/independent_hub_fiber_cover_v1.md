> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent hubs: a fiber replacement pays for essential bases

Status: ORDINARY_PROOF_CANDIDATE, frozen for fresh review. This is a scoped matching-to-cover mechanism motivated by targeted reading of Haxell–Kohayakawa. It is not an unrestricted proof or a claim of historical novelty.

## Primary source and exact imported motivation

P.E. Haxell and Y. Kohayakawa, *Packing and Covering Triangles in Tripartite Graphs*, Graphs and Combinatorics14(1998),1–10. The [author's publication index](https://users.ime.usp.br/~cris/gcomb/tem-fapesp/publications.html) links the [original compressed TeX](https://users.ime.usp.br/~yoshi/pronex/publications/MS/Journals/J5/paper.tex.gz). Exact files and HTTP provenance are retained in literature/haxell_kohayakawa_1998/receipt.json. Compressed SHA256 f95c21d11948be2a7aa8550ef6ad8f9f2fac365eb2daed64da1136244095891b; decompressed SHA256 39e5e0b78e873abe92bd550153ea323c004705f6d03f2458cc09539ff771ebd9. The source was decompressed only; no macros executed or publication package rebuilt.

The inspected source's Lemma1 either augments a packing while preserving its two nonbase edge colors or covers by twice its size, using bipartite hub matchings. Lemma2 either augments while losing at most one edge of each other color or gives cover size2|P| minus the number of essential base-color edges. Its proof propagates essentiality through alternating paths. The full strict-factor theorem remains tripartite and is not imported here. The two-color retention feature matters for the paper's iteration and is not asserted by the new argument below.

## New exact interface

Let G be a finite simple graph and S an INDEPENDENT vertex set meeting every actual triangle. Every triangle consequently has exactly one vertex in S, its hub. Let P be a maximum edge-disjoint triangle packing, with |P|=k. Let B be the k edges of P opposite their hubs; call them bases.

For s∈S, let P_s be the triangles of P with hub s, and M_s their bases. Since P is edge-disjoint, M_s is a matching on V(G) minus S. Define

    K_s = G[N_G(s)] minus B.

Only edges are deleted in this definition. As S is independent, all neighbors of s are outside S. The graph K_s consists exactly of the bases of hub-s triangles avoiding B.

A base e∈M_s is essential for P if there is an actual triangle W_e with

    E(W_e) intersect E(P) = {e}.

Let e_s count these essential bases at s. Then the following ordinary inequality holds WITHOUT a bipartiteness assumption:

    nu_matching(K_s) + e_s <= |M_s|.                          (1)

If, in addition, each K_s has equal vertex-cover and matching numbers, then

    tau(G) <= 2nu(G) − sum_(s∈S) e_s.                        (2)

In particular (2) holds whenever every induced link G[N(s)], s∈S, is bipartite. Therefore graphs with an independent triangle vertex transversal whose links are bipartite satisfy Tuza. A positive number of essential bases in the displayed maximum packing forces strictness.

## 1. Simultaneous essential-base witnesses

For each essential e∈M_s choose one witness triangle W_e. Its hub lies in S and is different from s: the hub-s triangle on e is the original member of P_s and shares all three of its edges with P, so it cannot witness essentiality.

The witnesses W_e for a FIXED s are mutually edge-disjoint. Their bases e form the matching M_s, so their outside-S endpoints are all distinct. Two witness spokes could coincide only if they had the same S hub and the same outside-S endpoint, which cannot occur. A base cannot equal a spoke, because the former has no endpoint in S and the latter exactly one. Their bases themselves are distinct.

Take any matching Z in K_s and its |Z| hub-s triangles. Those triangles are edge-disjoint from every W_e. Their bases avoid B and hence avoid the witness bases e. Their spokes have hub s, whereas each witness hub is another vertex of S. A spoke cannot equal a base, again by S incidence. This accounts for every possible shared edge.

## 2. Whole-fiber replacement

Remove P_s from P. The retained packing P minus P_s is edge-disjoint from every W_e by the essentiality definition: its only original intersection e was in the removed fiber. It is also edge-disjoint from the hub-s triangles on Z. Such a new base is not in B, and such a new spoke has hub s; no retained triangle has hub s and no triangle can have two S vertices.

Consequently

    (P minus P_s) union {W_e : e essential in M_s}
                      union {sxy : xy∈Z}

is a literal actual packing of size k−|M_s|+e_s+|Z|. Maximum optimality of P proves (1), taking Z maximum. This argument replaces all affected pages simultaneously; it never assumes independently chosen witnesses from arbitrary different fibers are compatible.

## 3. Cover construction

Choose a minimum vertex cover Q_s of K_s for every s. Then

    B union {sx : s∈S, x∈Q_s}

covers all actual triangles. A triangle whose base belongs to B is covered there. Any other triangle has a unique hub s and its base is an edge of K_s, so a selected spoke covers it.

Different hub-spoke sets have distinct edges because S is independent; all spokes are distinct from B. If each K_s has vertex-cover/matching equality, the cover size is

    k + sum_s |Q_s|
      = k + sum_s nu_matching(K_s)
      <= k + sum_s (|M_s|−e_s)
      = 2k−sum_s e_s.

This proves (2).

For completeness, the needed equality is elementary when K_s is bipartite. Fix a maximum matching M with bipartition X,Y. Let R be the vertices reached from unmatched X vertices by alternating paths beginning outside M. There is no reached unmatched Y vertex, or the matching augments. The set (X minus R) union (Y intersect R) is a vertex cover, since a nonmatching edge from a reached X vertex leads to a reached Y vertex. Every M edge contributes exactly one vertex to this cover and unmatched vertices contribute none, so its size is |M|. The reverse inequality follows because any cover meets every matching edge.

## 4. Scope beyond the primary theorem

The local proof does not require a single global bipartition of G−S. Its only structural requirements are unique independent hubs and vertex-cover/matching equality for the residual hub links. Thus the stated sufficient class is broader in its formulation than globally tripartite graphs. No claim that this formulation is historically new has been checked.

The mechanism fails to be an unrestricted proof at precise points. An arbitrary graph need not have an independent set meeting all triangles. Even with such a set, residual links need not have vertex-cover/matching equality. If hubs are allowed to be adjacent, associated witness pages can share hub edges and the whole-fiber compatibility argument no longer follows. If K_s is nonbipartite, a minimum vertex cover may exceed the matching bound in (1).

The retained Clebsch-cone and odd-wheel controls do not satisfy the local bipartite-link hypothesis at their unique universal hub. The method therefore does not revive the refuted private-only bound. Nor does it select private pages of a minimum EDGE cover; essentiality here is relative to the complete edge set of a maximum TRIANGLE PACKING.

A prospective component application must first supply independent hubs meeting every actual triangle and verify each residual link, or replace that interface with another genuinely compatible construction. The named global availability gap remains open.
