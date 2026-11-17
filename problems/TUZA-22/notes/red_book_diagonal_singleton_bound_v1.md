> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Every regular K4 needs two distinct singleton terminals

Frozen ordinary strengthening,2026-11-16. Source_audit. This improves the parameterized book count without assuming the absence of a blocker or using original H-D residual packing equality.

Assume

    nu(G)=k>=2, tau(G)=2k-1,
    tau(G-E(T))=2k-2 for EVERY actual triangle T.            (H)

Fix ANY minimum C and ANY maximum packing P. Each actual triangle has exactly one C-edge by the elementary cover-drop argument. Let Q be ANY packing of size q surviving deletion of P's blue edges, and let s=k-q>=1. Keep the auxiliary red-book graph, regular slots, g distinct unused opposite edges and d=q-g from red_book_tree_rerooting_v1.md. Let H0 be G with ALL s singleton triangles deleted; W is just their 2s blue edges.

Then

    #regular slots <=9 binom(s,2),
    q <=9 binom(s,2)+2(s-1),
    k <=9 binom(s,2)+3s-2.                              (1)

These are all-size necessary bounds for the supplied packing configuration. No survivor lower bound or universal blocker conclusion is inferred.

## 1. Each regular red diagonal needs a third global page

A regular slot is one isolated auxiliary edge and gives a literal K4 with opposite red diagonals c=uv and d=xy. Rerooting proves that its complete H0 page family on c is precisely uvx,uvy, and its complete H0 page family on d is precisely uxy,vxy. This remains true even if an uncontrolled-spine page attaches along a BLUE K4 edge.

Suppose c had no third page in the ENTIRE G. Delete the actual opposite page T=uxy. It removes red d and destroys both global c-pages through ux and uy. Hence C minus {c,d} covers G-E(T) at size2k-3, contradicting (H). Thus c has a third page in G. The identical argument applies to d.

Every third c-page was absent in H0. Since its unique red edge is c, it cannot contain a singleton red edge. It therefore contains an edge of W. An actual triangle containing c and such a singleton blue edge forces one endpoint of c to be a vertex of that singleton triangle. The same holds for d.

Consequently the two vertex-disjoint red diagonals provide TWO DISTINCT K4 vertices belonging to singleton triangles. They cannot both belong to the same singleton triangle: the K4 support survives in H0 and contains their connecting edge, whereas all edges of that singleton triangle were deleted. This is a literal edge contradiction, not a vertex-disjointness assumption on the singleton packing.

## 2. Inject into pairs of singleton terminals

Distinct regular K4 supports are edge-disjoint. Therefore no unordered pair of actual vertices can occur in two regular K4s. Choose for each regular K4 a pair supplied by Section1, and choose two distinct singleton indices containing its two vertices. For any pair of singleton triangles there are at most3*3=9 such vertex pairs. Even if different singleton triangles share vertices, this only overcounts the available pairs and does not weaken the upper bound.

Thus #regular slots<=9 binom(s,2). The already proved component count gives #exceptional slots<=2d, while the singleton residual-cover count gives d<=s-1. Adding yields (1).

## Scope and relation to the earlier blocker kernel

The earlier family decomposition and star-boundary blocker theorem remain valid. This diagonal argument is stronger for counting regular slots: it needs only SINGLETON vertices, not endpoints of uncontrolled red bases, and it does not assume blockerlessness. It uses just a fixed minimum exact-one C and the universal residual COVER equality. It does not use other minimum covers or nu(G-E(T))=k-1.

At s=1, (1) forces k<=1 and therefore excludes that state under k>=2, agreeing with the earlier direct one-singleton proof. The separately proved two-singleton restoration argument still supplies the stronger exclusion of s=2 under full original H-D. For unbounded s, (1) permits unbounded k; it gives a necessary growth condition on the number of unmatched singleton triangles, not an unrestricted contradiction.

No finite certificate, census, external general bound, GE, Kotzig or formalization is a premise. The all-size lower-survivor/compatible-cover-selection bridge remains unresolved.
