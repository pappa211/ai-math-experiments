> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# H-D: exact book-defect count after deleting a singleton

Frozen ordinary count, 2026-11-16. Source_audit. This sharpens the remaining book-state obligation without asserting that it is solved.

Assume nu(G)=k>=2, tau(G)=2k-1, and tau(G-E(T))=2k-2 for every actual triangle T. Fix any minimum exact-one cover C, any maximum packing P, and any survivor packing Q in G-B(P). Let q=|Q| and s=k-q>=1. Pair the corresponding red-spine pages and leave the s unpaired P-triangles as singletons. Let R be the k used red edges, W the 2s singleton blue edges, and O the set of DISTINCT unused-red opposite edges of paired books. Put g=|O|.

The elementary actual book-cover lemma gives a cover

    D=R union W union O,   |D|=k+2s+g.

Indeed a triangle avoiding R and W is an opposite page of a paired book; its unique red edge is its unused opposite in O. For any singleton T0, exactly its three edges occur in D, so D minus E(T0) covers G-E(T0). The residual cover requirement yields

    k+2s+g-3 >= 2k-2,
    g >= k-2s+1 = q-s+1,
    q-g <= s-1.                                          (1)

This uses only actual covers. It is not an estimate of an optimizer or a presumed minmax identity.

## One singleton

For s=1, (1) forces g=q. All paired books are good and their unused opposite edges distinct. This gives a shorter count proof of the book-bijection step in hd_wang_one_missing_survivor_exclusion_v1.md; that note still supplies the indispensable endpoint contradiction and the unconditional q<=k-2 conclusion.

## Two singletons: at most one explicit defect

For s=2, (1) gives q-g<=1. If g=q, every paired book is good with distinct opposites. The already frozen distinct-good-book residual reduction, plus one-triangle restoration of the residual after deleting one singleton, excludes this case under original H-D.

Otherwise g=q-1, and exactly one of the following occurs:

1. Exactly one paired book is bad (its opposite is missing or is a used red edge); every other book is good and their unused opposites are distinct.
2. Every paired book is good; exactly one unused opposite edge belongs to two books, and all other opposite edges occur once.

These alternatives follow from the identity q-g=(number of bad books)+(number of repetitions beyond the first within good-book opposite classes). No other defect pattern has count one.

Let T0,T1 be the two singletons and H=G-E(T0)-E(T1). In the defect-one alternatives, D minus E(T0) minus E(T1) has q+g=2q-1 edges and covers H. Conversely restoring T1 gives

    tau(H)>=tau(G-E(T0))-3=2q-1.

The q paired P-pages survive in H, and any H-packing appends both singleton triangles in G, so nu(H)=q. Therefore

    nu(H)=q, tau(H)=2q-1.                                (2)

The displayed H-cover consists of the q paired red spines and the q-1 distinct unused red opposites. It is a minimum exact-one cover inherited from C. Moreover H has a full q-survivor packing, namely the paired Q-pages.

Equation (2) is a near-tight residual, not a classified one. It is not justified to apply the full-survivor exclusion to H, because the universal residual-cover-drop hypothesis for H has NOT been established.

In the repeated-opposite alternative, all books are good. The all-choice exchange excludes every third spine page after the two singleton triangles are deleted; the book-cover geometry classifies all opposite pages. Thus H consists of literal K4 components and precisely one component made from two literal K4s sharing their common opposite edge, with every actual crossing triangle accounted for. This is a concrete defect-one component, not B. In the one-bad-book alternative, extra pages on that bad spine remain possible; no book-only or bounded-core classification is claimed.

## Remaining bridge

To exclude q=k-2 globally one must still handle these exact one-bad-book or one-repeated-opposite residual states with their two restored singleton triangles and the ORIGINAL H-D packing/cover equalities. The earlier ordinary one-classified-residual theorem cannot simply be applied to their defect-one residual. This note removes all larger book-defect patterns at s=2, but does not supply the remaining restoration or blocker.

Elementary source mechanism: Wang, arXiv:2609.13831v1, Section2 Lemma2.2, independently reconstructed in hd_wang_full_survivor_exclusion_v1.md. No general bound from that paper, finite computation, or formalization is a premise.
