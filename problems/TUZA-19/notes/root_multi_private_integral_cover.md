# An integral cover bound from multi-page private bases

Status: ordinary all-size proof; independent reviewer has reconstructed the endpoint argument and is writing a frozen audit. No Lean, novelty or unrestricted Tuza claim. This is a new exact packing-parameter reduction rather than a proof that the required parameter is globally available.

Let P be any maximum edge-disjoint triangle packing, n=|P|. A private page for p in P is an actual triangle other than p meeting E(P) in exactly one edge of p. The private bases of p are its edges supporting such pages. A type1 owner has exactly one private base. Call it multi-page if that base supports at least two distinct private pages. Let m be the number of these owners.

Use the corrected type[1,1] doubly-attached classification in notes/root_cksu_order3_repair.md (independently accepted in review/cksu_order3_repair_fresh_audit.md). Its exceptional K5 pairs are disjoint pairs of owners vab,vcd whose private bases are ab,cd and whose private tip sets are exactly {c,d},{a,b}. Every pair is multi-page. Let p be the number of these pairs (the symbol p in formulas counts pairs, not a particular owner).

## The integral bound and its global role

There is an explicit cover C contained in E(P) with

    |C| = 3n - 2m + 2p.

Consequently m-p >= n/2 suffices for Tuza. In the special case where every owner is multi-page type1, the bound is n+2p <=2n. If none of these owners is in an exceptional pair, the private bases themselves cover every triangle and tau=nu.

No availability theorem for m-p >= n/2 is asserted. It fails even on the existing32-vertex concentration control: each all-type1 concentration-maximizing packing has n=15, m=12, p=6; the three core owners are singleton-page. This bound gives33, while the actual cover optimum is29. A Steiner triangle decomposition of K7 also has m=0. Thus this parameter alone cannot replace the missing global mechanism.

## Key lemma: a base-free triply attached triangle needs a non-multi owner

Suppose T has three edges in E(P), belongs to three different owners, and contains none of their private bases. If all three owners are type1, at least one has at most one private page.

Assume otherwise. Label T=012 and its owners 01a,12b,20c. Their six vertices 0,1,2,a,b,c are distinct: an owner tip in T would equal T and overlap the other owners; equal tips between two owners would give a shared packed edge at the common T-vertex.

The bases are respectively one of {0a,1a}, {1b,2b}, {2c,0c}. A private tip for any chosen base must either be outside these six vertices or be the unique allowed old tip in the following table:

| Owner/base | Only permitted old private tip |
|---|---|
| 01a / 0a | b |
| 01a / 1a | c |
| 12b / 1b | c |
| 12b / 2b | a |
| 20c / 2c | a |
| 20c / 0c | b |

To verify the table, neither endpoint of a base can be a tip, the third vertex of its own owner gives the owner rather than a private page, and each other forbidden old vertex would give a second edge of E(P). For example base0a excludes1,2,c because 01,02,0c are packed edges; only b remains.

There are eight base choices. Under the symmetries of T, two are directed-cycle choices, represented by 0a,1b,2c, and the other six are represented by 0a,1b,0c. This can also be checked directly from the eight binary choices.

For bases0a,1b,2c, every pair of bases is disjoint. Two pages on disjoint bases can share a new edge only if their tips lie reciprocally on the other bases. The allowed old tips b,c,a make every such reciprocal combination impossible. A shared fresh tip creates no shared edge because the bases are disjoint. Thus any three chosen private pages are pairwise edge-disjoint.

For bases0a,1b,0c, call the owners P,Q,R in that order. A P-page and Q-page never share an edge. A P-page and R-page share an edge precisely when their private tips coincide (their bases share0). A Q-page and R-page can share an edge only when their tips are c and b, respectively, sharing bc. Choose a Q-page whose tip is not c, possible because it has at least two distinct tips. Choose P- and R-pages with different tips, again possible because each has at least two tips. The three chosen pages are pairwise edge-disjoint.

All chosen private pages avoid the edges of T: their only packed edge is their private base, which is not in T. They also avoid every other owner in P. Replace the three owners by these three pages and T, increasing the packing by one. This contradicts maximal cardinality and proves the lemma. Only exclusion of this4-for3 augmentation is used here.

## Construction and complete cover verification

For each owner not counted by m, put all three of its packed edges in C. For every multi-page owner put its private base in C. For each exceptional K5 pair, choose either one of its owners and add its two spokes to C. Since packed supports are edge-disjoint and exceptional owner pairs are disjoint, the size is exactly3(n-m)+m+2p.

Every actual triangle meets E(P), since P is maximal. Packed triangles meet C by construction. A triangle using a packed edge from a non-multi owner is covered. Otherwise all its packed edges belong to multi-page owners.

If it has one packed edge, it is a private page and that edge is its selected base. If it has two packed edges, the corrected type[1,1] classification says either it contains a private base or its two owners are an exceptional K5 pair: the other alternatives require a singleton page owner and are excluded. In the exceptional case the triangle's two packed spokes meet the two selected spokes of the chosen owner, so it is covered. Equivalently the two bases plus both spokes of one owner cover the entire K5.

If it has three packed edges, then it is either a packed member or has one edge from each of three distinct owners (two edges of a triangle determine its third edge, so two cannot belong to one different owner). If no base is selected on this triangle, the key lemma contradicts all three owners being multi-page. This exhausts all actual triangles and proves the bound.

## Dependencies and limits

The new endpoint lemma is elementary and independent of the order3 fractional charging scheme. The double-attachment step imports the amended classification, including its unique K5-pair exception and pair disjointness; the false printed Proposition13 is not imported. The earlier correction restores a known fractional theorem; this note concerns a separate integral support-cover construction. Whether this integral bound has appeared in earlier private-page/book arguments is unresolved.

The proof does not imply that every maximum packing, or any optimized maximum packing, satisfies the sufficient parameter threshold. It does not show compatible canonical-center quotas: the cover may put all three edges on one owner and one on its exceptional partner. It is an ordinary graph-theoretic result, not a claim about arbitrary3-uniform hypergraphs.
