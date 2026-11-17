> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Localization to the high-triangle-codegree four-core

Frozen ordinary assembly candidate, 2026-11-16. Fresh review requested. The local branch exclusion is proved within any edge-subgraph-hereditary CS class. No historical-priority claim is made; this is a specific core localization of the accepted TUZA-22 restrictions.

For a finite simple graph G define J(G) on V(G) by retaining exactly the actual graph edges that belong to at least THREE actual G triangles. Let K(G) be the vertex set of the graph-theoretic four-core of J(G), obtained by repeatedly deleting vertices of degree at most three. This is a high-triangle-codegree core, not a triangle component or an ordinary graph block.

## 1. The core is full in every minimum CS failure

Let G be a minimum CS failure globally or within an edge-subgraph-hereditary class, with isolates discarded. For an actual edge vu, its triangle codegree equals the degree of u in the induced link G[N(v)]. Thus the branch vertices (link degree at least three) in each closed link component are exactly the neighbors u such that vu belongs to J(G).

The accepted notes/three_branch_cs_link_exclusion_v1.md says each nonempty closed link component has at least four branch vertices. Every v has a nonempty link by the authenticated triangle-support/codegree conclusions. Therefore every v has at least four incident J(G)-edges:

    delta(J(G)) >= 4, and K(G)=V(G).

This does not assert that J(G) is a triangle cover. It is a necessary structural property of a minimum failure.

## 2. First hereditary consequence

All graphs G for which J(G) is three-degenerate satisfy CS. Indeed this class is edge-subgraph hereditary: deleting graph edges cannot increase any remaining edge's actual triangle codegree, so J(H) is an edge-subgraph of J(G) for H subset G; three-degeneracy is inherited by subgraphs. A minimum CS failure in the class would have minimum J-degree at least four, contradicting three-degeneracy.

Within this class the equality components are only literal K4. A literal K5 subgraph would give a K5 subgraph of J(G), impossible in a three-degenerate graph. Conversely literal K4 triangle components give equality by actual triangle-component additivity. Triangle-free background and vertex sharing remain permitted.

Equivalently, the sufficient condition is K(G) empty. It is not asserted that every graph has empty high-codegree core.

## 3. Localization of any hereditary proved CS class

Let A be any edge-subgraph-hereditary graph class for which combined CS is established. Define the larger class

    L_A = {G : the induced graph G[K(G)] belongs to A}.

Then every G in L_A satisfies CS.

To verify hereditary closure, let H be an edge-subgraph of G. Since J(H) is a subgraph of J(G), its four-core vertex set is contained in K(G). One way to see this is that the subgraph J(H)[K(H)] has minimum degree at least four and is contained in J(G); none of its vertices can be removed during degree-at-most-three peeling in J(G). Thus K(H) subset K(G), and H[K(H)] is an edge-subgraph of G[K(G)]. Heredity of A puts H in L_A.

Now choose a minimum CS failure in L_A. Section1 gives K(G)=V(G), so G[K(G)]=G. Its assumed membership in A supplies CS, contradiction.

Examples of admissible base classes include graphs admitting a forest triangle-edge cover, graphs with triangle packing number at most four, and graphs admitting an edge-three-coloring making every actual triangle rainbow. Each is edge-subgraph hereditary, and each has a proved CS theorem in this workspace at its explicitly recorded dependency scope. The localization inherits the selected base theorem's external inputs; it does not strengthen their verification labels. In particular the rainbow case retains the declared Aharoni/Haxell–Narins–Szabo inputs, while the forest case retains only the authenticated local historical lemmas and the new ordinary link proofs.

## Scope and remaining unrestricted obligation

The proof permits arbitrary low-J-degree attachments around the induced four-core, even when ordinary graph degrees are large. It gives a precise reduced object for further research. An arbitrary four-core may still lie outside every established base class; no all-size availability theorem or unrestricted solution follows.

Dependencies: notes/three_branch_cs_link_exclusion_v1.md (fresh review/challenger_three_branch_cs_review.md), its ordinary link-deletion/parallel-thread predecessors and authenticated class-local M0/codegree/robustness. There is no finite enumeration premise in the new localization argument.
