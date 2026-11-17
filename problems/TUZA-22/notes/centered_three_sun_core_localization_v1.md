> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Localization to the centered three-sun kernel

Frozen ordinary assembly candidate, 2026-11-16. Fresh independent review requested. Depends on the exact local argument in `claw_free_triangle_intersection_cs_v1.md` and the reviewed class-local link-deletion theorem. No historical-priority or unrestricted-kernel availability claim.

## Local necessary condition in every minimum CS failure

A centered three-sun consists of six distinct graph vertices a,b,c,x,y,z and the nine edges of the four actual triangles abc,abx,acy,bcz. Further edges are allowed: this is a subgraph condition, not an induced-subgraph condition in the original graph. Its central triangle is abc. The three page triangles are pairwise edge-disjoint and intersect abc on its three different edges.

Equivalently the vertex abc is the center of an induced claw in the actual triangle-intersection graph X(G). Conversely three independent triangle neighbors of abc must meet its three distinct edges and must have three distinct outside apices, giving exactly this configuration.

Claim: in a global or hereditary-class minimum CS failure G, each vertex a belongs to the central triangle of some centered three-sun. In fact every nonempty component of G[N(a)] contains the other two central vertices of such a triangle.

Proof: suppose one nonempty closed link component L0 at a has no central-claw triangle abc with b,c in L0. Run the local steps of the claw-free proof inside L0. If any triangle abc there has two high-codegree edges, three-list Hall and actual closure give K5-e on a,b,c,x,y. The vertices b,c,x,y all lie in L0. Every test excluding an external page on this support can use a claw center containing a and the other two vertices in L0: use abc for a page on any core edge, abx/aby/acx/acy for pages on spokes, and axy if the missing edge is completed. Hence the K5-e/K5 is an isolated triangle component, which proper-subgraph CS and additivity exclude in a smallest failure.

There is therefore at most one high edge in any triangle abc from L0. As in the frozen claw-free proof, each branch vertex b of L0 has its neighbors paired into triangles b-c-x whose other two vertices have degree exactly two in the full link. This makes its component a friendship graph. If no branch exists, L0 is a cycle, since M0 gives link minimum degree two. Deleting the friendship center, or any cycle vertex, leaves a tree component of the link. This contradicts the class-local link-deletion theorem. All possible claw centers invoked stay inside the assumed component, proving the strengthened claim.

## Monotone operator and iteration

For arbitrary G, let Z(G) be the vertices lying on the central triangle of at least one actual centered three-sun. Define F(G)=G[Z(G)], with the induced graph taken in G. Repeatedly apply F until the vertex set stops decreasing; denote the final induced graph by S(G).

This is a deterministic finite kernel. No choices are made, and each nontrivial step deletes at least one vertex. The empty graph is allowed. If H is any graph subgraph of G, then every centered three-sun of H survives as the same noninduced subgraph in G. Consequently Z(H) is contained in Z(G) and F(H) is a graph subgraph of F(G). Induction gives the same inclusion at every iteration, and hence S(H) is a graph subgraph of S(G). Vertex names may be retained to make these inclusions literal.

Every minimum CS failure G is a fixed point of F, by the local claim, so S(G)=G. This is a necessary condition, not a proof that no fixed point exists. Complete K6 is an immediate nonempty fixed point.

## Localization of any hereditary CS base

Let A be any edge-subgraph-hereditary class for which CS has been established, including its explicitly recorded dependencies. Then every G with S(G) in A satisfies CS.

Indeed this condition is hereditary by the monotonicity just proved. A smallest failure in that class would satisfy S(G)=G, placing G itself in A, contradiction. In particular an empty centered-three-sun kernel is a sufficient condition for CS. K5 already has Z(K5) empty because the configuration requires six distinct vertices; this contrasts with its full high-codegree four-core, while making no general inclusion claim between kernels.

The centered-three-sun iteration may also be alternated with the accepted high-codegree four-core induced restriction. Both are subgraph-monotone operators and both fix every minimum CS failure. Their alternating fixed graph therefore supports the same hereditary-base argument. No bound on the surviving order, packing number, density or cycle structure follows without another theorem.

The equality conclusion throughout is the full B classification, with literal K4/K5 triangle components and arbitrary triangle-free background. The proof is an induction-class localization, not a claim that deleting a single arbitrary vertex preserves either numerical optimum.
