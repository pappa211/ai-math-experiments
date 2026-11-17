> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Strict H-D: a survivor packing of size k-1 is also impossible

Frozen ordinary extension, 2026-11-16. This is a source_audit reconstruction of a further consequence of the elementary Wang exchange, with exact endpoint geometry retained. It is not an unrestricted H-D proof or a novelty claim.

Assume

    nu(G)=k>=2, tau(G)=2k-1,
    tau(G-E(T))=2k-2 for EVERY actual triangle T.             (H)

For any minimum cover C, color C red and the other edges blue. Every actual triangle has exactly one red edge. Fix ANY maximum packing P and let B(P) be its blue edges. The companion ordinary note hd_wang_full_survivor_exclusion_v1.md proves that the survivor packing number cannot be k. Here we prove it cannot be k-1 either. Therefore

    nu(G-B(P)) <= k-2.                                      (2)

The original residual packing equality is still unused. No two-edge blocker is asserted.

## 1. Book structure and the singleton

Suppose Q is a survivor packing of size k-1. Every Q-triangle uses a distinct red edge of P, so pairing corresponding P and Q pages gives k-1 two-page books and one singleton P-triangle T0. Their supports are pairwise edge-disjoint, and every one-page-per-book selection together with T0 is a maximum k-packing.

Write T0=abx, with red c0=ab and blue e=ax, f=bx. Let R be the k used red edges and U=C minus R, of size k-1. Call a paired book good when its opposite edge belongs to U.

The ordinary residual-cover hypothesis implies that EVERY d in U has a triangle surviving E(T0). Otherwise C minus {c0,d} would cover G-E(T0), contradicting its cover number 2k-2. Such a triangle avoids e,f and all red spines R, since its unique red edge is d. The elementary book-cover fact from the companion note therefore makes d the opposite edge of a paired book. There are k-1 paired books and k-1 unused red edges, so every paired book is good, and its opposite-edge map is a bijection onto U.

More precisely, any triangle with red d that avoids e,f is an opposite page of the unique paired book whose opposite edge is d. Thus if that book has pages uvz and uvy, its red spine c=uv and red opposite d=zy, the complete d-page family avoiding e,f consists exactly of uzy and vzy. These pages exist by actual K4 closure; their blue edges belong to the book support and therefore avoid e,f.

## 2. Every opposite edge needs a page meeting singleton blue

Fix one paired book, with red opposite edges c=uv and d=zy. If d had no further page meeting e or f, its entire actual page family would be uzy and vzy. Deleting the displayed spine page uvz would remove c and destroy both d-pages through uz and vz. Then C minus {c,d} would cover that residual at cost 2k-3, contradicting (H).

Consequently d has a page meeting e or f. This fact forces the endpoints of c to lie entirely outside V(T0), as the next exact geometric observation shows.

## 3. Endpoint observation

The book supplies a literal K4 on u,v,z,y, with opposite red edges uv and zy and four blue cross edges. Its five-edge book support avoids all edges of T0. The red edge d=zy cannot be an edge of T0: the only red edge there is c0 in R. A triangle containing d and either singleton blue edge e or f can exist only if d has an endpoint t in V(T0). It has exactly one such endpoint, since otherwise it would itself be an edge of T0.

Neither endpoint of c is t, because c and d are opposite K4 edges. Suppose an endpoint s of c were another vertex of T0. The K4 requires st to be a blue edge in the paired book support. But st is an edge of T0. If st=c0, its color is wrong; if st=e or f, disjointness of book supports is violated. Both alternatives are impossible. Hence

    V(c) intersect V(T0) is empty.                         (3)

In particular NO triangle on c can contain e or f, because c has two endpoints outside V(T0), while e and f each have both endpoints inside V(T0).

## 4. Every third spine page would have to meet singleton blue

Suppose the spine c has a third actual page T, different from the two displayed pages. In every one-page-per-book maximum selection, the unchosen page of this book survives deletion of the chosen blue edges. Since its opposite d is unused red, Wang's elementary exchange says it is the sole survivor on c. Thus T meets a chosen blue edge for EVERY independent selection.

T meets neither blue edge of either displayed page of its own book. If T avoids e,f, and every other paired book has some page whose blue edges avoid T, select those pages independently. This contradicts the preceding conclusion. Therefore a third page avoiding e,f must meet both pages of another paired book in blue edges. Actual two-page geometry makes it an opposite page of that book; its unique red edge c would be that book's opposite edge. This is impossible because every paired book is good and has its opposite in U, whereas c belongs to R.

It follows that every third page on c must meet e or f. Equation (3) makes that impossible. Hence c has exactly its two displayed pages globally.

Now delete the actual opposite page uzy. It removes d and destroys both c-pages through uz and uy. Again C minus {c,d} covers the residual at cost 2k-3, contradicting (H). This excludes a (k-1)-survivor packing and proves (2), using the companion exclusion of k.

## Dependency and scope boundary

The proof reconstructs the elementary exchange/book geometry of Sichen Wang, arXiv:2609.13831v1, Section 2, Lemmas 2.1-2.2, directly for the ENTIRE actual one-red triangle family. The exact primary HTML was inspected at https://arxiv.org/html/2609.13831v1 . No published global bound or formalization is used.

All arbitrary outside pages are accounted for: opposite pages not in the paired K4 must meet singleton blue, while any third spine page must do the same. Their incompatible actual endpoint locations drive the contradiction. No abstract colored-graph completion, census, numerical optimization, universal page-completion assumption, or classification of the remaining survivor regime <=k-2 is invoked.
