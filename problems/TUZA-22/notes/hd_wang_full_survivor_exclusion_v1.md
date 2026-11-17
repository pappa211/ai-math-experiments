> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Strict H-D: a full blue-deletion survivor packing is impossible

Frozen ordinary lemma, 2026-11-16. Source_audit reconstruction, prompted by the coordinator's primary-source inspection of Wang's exchange. No unrestricted H-D conclusion or novelty claim is made.

## Exact scope

Let G be a finite simple graph with

    nu(G)=k>=2, tau(G)=2k-1,
    tau(G-E(T))=2k-2 for EVERY actual triangle T.             (H)

Fix ANY minimum ordinary triangle-edge cover C. Every actual triangle meets C exactly once: C minus its intersection with T covers G-E(T), so |C intersect E(T)|<=1, while the cover property supplies the reverse inequality. Call C red and all other edges blue.

For ANY maximum triangle packing P, let B(P) be its 2k blue edges. Then

    nu(G-B(P)) <= k-1.                                      (1)

In particular this necessary condition holds in the strict original H-D branch. The hypothesis nu(G-E(T))=k-1 is not used in this lemma. Nothing here proves a one-/two-edge blocker, bounds the survivor number further, or says that a partial page selection can be completed arbitrarily.

## Elementary source mechanism, reconstructed

Primary source: Sichen Wang, *A Bound Below 2.8 for Tuza's Conjecture*, arXiv:2609.13831v1, 12 September 2026, Section 2, Lemmas 2.1 and 2.2:
https://arxiv.org/html/2609.13831v1

The exact HTML statements and proofs were inspected. We use only their elementary exchange/book geometry, reconstructed below; the paper's general bound and its reported Lean formalization are not imported or independently certified here.

Write R for the k red edges used by P. Any triangle surviving B(P) has its red edge in R: otherwise it is disjoint from P and augments it.

First exchange. Suppose uvx is packed, uvy survives its packing's blue deletion, uv is red, and xy is an unused red edge. Then uvy is the ONLY surviving page on uv. Indeed a further survivor uvz, with z distinct from x,y, would allow replacement of uvx by uxy and uvz. Both are actual one-red triangles. Their blue edges outside uvx avoid the packed blue edges, their red edges are respectively unused xy and uv, and they are edge-disjoint. This augments the packing.

Second elementary fact. Suppose k two-page books have pairwise edge-disjoint supports, and each one-page-per-book choice is a maximum packing. Any actual triangle avoiding all book spines must meet both pages of some book; otherwise independently choose a disjoint page in each book and append the triangle. For a book {uvx,uvy}, a triangle avoiding uv and meeting both pages must be uxy or vxy: its two intersecting page edges must be ux,uy or vx,vy. It therefore uses the book's opposite edge xy.

## Full survivor packing produces almost entirely opposite-edge books

Suppose contrary to (1) that Q is a k-packing surviving B(P). Its red edges are k distinct members of R, hence exactly R. Pair the P and Q pages on each red edge. These are k two-page books with pairwise edge-disjoint supports: P and Q are individually packings; their blue edge sets are disjoint; and different pairs have different red edges. Every one-page-per-book choice is a packing of size k and hence maximum. Its red set remains R under all choices.

Put U=C minus R, so |U|=k-1. Every d in U belongs to some actual triangle, since a minimum cover has no dispensable edge. Such a triangle has exactly one red edge d, and therefore avoids every spine in R. The second elementary fact makes d the opposite edge of some book.

Call a book good if its opposite edge exists and belongs to U. Each book has only one possible opposite edge. Since every member of U is the opposite edge of a good book, at least k-1 of the k books are good. There are exactly two cases.

## Case 1: all k books are good

We claim each book spine has exactly its two displayed pages in the ENTIRE actual triangle family.

Fix a book i with spine ci=uv, pages uvx,uvy, and unused red opposite d=xy. Suppose T=uvz is a third actual page, z distinct from x,y. For every independent one-page-per-book maximum selection, the unchosen page of book i survives deletion of all chosen blue edges, because book supports are disjoint. Apply the first exchange with the chosen and unchosen pages and opposite edge d. It says that the unchosen page is the sole survivor on ci. Consequently T meets a chosen blue edge for EVERY such independent choice.

T uses neither blue edge of either page of book i. If every other book had a page whose blue edges avoid T, choosing those pages independently would contradict the preceding conclusion. Hence some other book j has BOTH pages meeting T in blue edges. The same two-page geometry makes T an opposite-edge page of book j. Its only red edge is ci, so the opposite edge of book j is ci in R. This contradicts that j is good. The claim follows.

Now choose any good book i, with notation uvx,uvy and opposite d=xy. The actual opposite page T=uxy exists. Deleting E(T) removes d and destroys BOTH global pages on ci=uv, through ux and uy. Thus C minus {ci,d} covers G-E(T), with size 2k-3. This contradicts (H).

## Case 2: exactly k-1 books are good

The map from good books to their unused red opposite edges is now a surjection between two sets of size k-1, hence a bijection. Choose a good book with pages uvx,uvy and opposite d=xy. EVERY actual triangle with red edge d avoids R, so the second elementary fact identifies it as an opposite page of a book whose opposite edge is d. Bijection leaves only the chosen book. Therefore the complete actual page family on d consists exactly of uxy and vxy.

Take T=uvx. Deleting its edges removes ci=uv and destroys both global pages on d, through ux and vx. Again C minus {ci,d} is a cover of G-E(T) of size 2k-3, contradicting (H).

Both cases are impossible, proving (1).

## Verification boundary

This is a symbolic proof about all actual triangles and arbitrary attachments. It uses no census, numerical optimization, published asymptotic bound, abstract colored-graph realization claim, or stronger private-family conjecture. Only the finite-simple-graph geometry and the stated minimum-cover/residual-cover hypotheses are used. In particular, the blue-deletion survivor family is allowed arbitrary size below k; the case k-1 remains a separate unresolved interface.
