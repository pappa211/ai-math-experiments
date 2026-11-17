> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# H-D: distinct good books leave an exact classified residual

Frozen ordinary conditional reduction, 2026-11-16. Source_audit. This identifies an explicit remaining book-state obstruction; it does not assert that the supplied book configuration is always available.

Let G have a minimum triangle-edge cover C meeting EVERY actual triangle exactly once. Color C red and all other edges blue. Let P be a maximum packing of size k, and let Q be a packing of size q in G-B(P), where B(P) denotes the blue edges used by P. Pair each Q-page with its P-page on the same red spine, leaving s=k-q singleton P-triangles T1,...,Ts. The resulting book supports are pairwise edge-disjoint, and every one-page-per-book selection with all singletons is a maximum packing. Let R be the used red set, U=C minus R, and W the 2s singleton blue edges.

Assume EVERY paired book has an opposite edge in U, and these q opposite edges are pairwise DISTINCT. These are actual hypotheses, not consequences of maximality when s>=2.

Then deleting all singleton triangles leaves exactly q literal K4 actual triangle components, plus triangle-free background:

    B(G - union_i E(Ti)) holds,
    nu(G - union_i E(Ti))=q.                             (1)

## Proof with all actual triangles accounted for

Each paired book together with its unused red opposite edge is a literal K4. Their full six-edge supports are pairwise disjoint: the five-edge book supports already are, the added red opposites are unused by all books and singletons, and they are distinct. Deleting the singleton triangles therefore preserves every one of these K4s intact.

Any actual triangle surviving the singleton deletion has a unique red edge. There are four possible locations for that edge.

- A singleton spine is impossible because it was deleted.
- An unused red edge that is not one of the q opposite edges is impossible. A surviving page on it avoids all spines and W. By the elementary book-cover geometry, it would have to be an opposite page of some paired book.
- If the red edge is a displayed opposite d, the same book-cover geometry and distinctness force the triangle to be one of the two opposite pages of its unique book.
- If the red edge is a paired spine c, a surviving triangle other than its two displayed pages is impossible. For every independent page choice, the unchosen page on c survives blue deletion, and the unused opposite permits Wang's two-for-one exchange. Hence any third c-page must meet some chosen blue edge for EVERY choice. Since it avoids W, some other paired book must have both pages meeting it in blue edges. The elementary endpoint geometry makes it an opposite page of that book, whose opposite would then be c in R, contradicting that every book's opposite belongs to U.

Thus every surviving actual triangle belongs to one of the q displayed K4s. There are no crossing triangles combining their supports, even when blocks share vertices or are joined by triangle-free edges. This proves (1).

The elementary exchange and book geometry are the independently reconstructed Lemmas 2.1-2.2 of Wang, arXiv:2609.13831v1, https://arxiv.org/html/2609.13831v1 . The precise reconstructions are also recorded in hd_wang_full_survivor_exclusion_v1.md. No global theorem from that paper is used.

## Consequence for strict original H-D when s<=3

Now additionally assume the original H-D premises, k>=2, and tau(G)=2k-1. Such a supplied configuration with 1<=s<=3 is impossible.

Indeed fix one singleton T1. Starting from the B residual in (1), G-E(T1) is obtained by restoring s-1<=2 edge-disjoint missing triangles. The accepted ordinary one-/two-triangle restoration theorems give combined CS for this graph, including all newly created crossing pages. Original H-D gives its exact parameters nu=k-1 and tau=2k-2, so equality forces B(G-E(T1)). The accepted ordinary one-classified-residual H-D theorem then classifies G as k actual K4 components, contradicting tau(G)=2k-1.

When s=0 the all-paired configuration is separately excluded by hd_wang_full_survivor_exclusion_v1.md. For s=1, the sharper direct endpoint proof in hd_wang_one_missing_survivor_exclusion_v1.md does not need the residual packing hypotheses or restoration inputs.

## Exact remaining bridge

This reduction does NOT remove bad paired books (missing opposite edge or opposite belonging to R), does NOT identify repeated unused opposite edges as distinct, and does NOT bound the number of singleton triangles. These are real remaining alternatives. In particular, the unconditional survivor bound q<=k-2 does not by itself supply the distinct-good-book condition. No arbitrary partial-packing extension, abstract colored realization, or unrestricted H-D classification is inferred.
