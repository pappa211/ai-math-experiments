# Exact K5-pair correction and repaired third-integral cover construction

Status: ordinary proof candidate, pending independent reconstruction. This repairs the specific missing case in CKSU arXiv:2001.00257v2 Proposition13 and the Section3 order-three construction. It is not a new numerical bound, a repair of Section4, a proof of Tuza, an author-confirmed erratum, or a claim about an uninspected publication edition. No contact or publication is authorized or performed.

The global purpose is to restore a correctly stated fractional packing tool after the primary-source audit found its printed local classification false. The theorem below has exactly the known target: for every finite simple G and specified maximum triangle packing P, a cover f:E(G)->{0,1/3,2/3,1} exists with every triangle load at least1 and total mass at most2|P|. The newly supplied work is the missing endpoint classification and its compatible charging repair. Integral rounding remains a separate unresolved global obligation.

## Definitions and elementary private-page taxonomy

Let B be the union of the edges of P. A nonpacked triangle is private to a packed member p when its intersection with B consists of exactly one edge of p. That edge is its base; its third vertex is its tip. A packed triangle has type equal to the number of its three edges which occur as bases. All nonpacked triangles meet B, and can contain at most one edge of each packed member.

Two private pages of the same p, on different bases and with different tips, are edge-disjoint and replace p by two triangles. Therefore any two private pages on different bases have the same tip. If two distinct bases occur, their common tip completes a K4, its third face is also private (all its nonbase edges are outside B), and all three bases occur. Applying the preceding restriction to each base shows this tip is unique. Thus the only types are0,1,3; a type3 owner has exactly the three private faces of a K4. A type1 owner has a unique base and a nonempty set of tips. These are maximum-packing statements, not assumptions about chosen subfamilies of private pages.

## Corrected classification of two-attached type[1,1] triangles

Suppose t meets precisely two packed triangles p,q, both type1. One of the following holds, allowing exchange of p,q:

1. t contains a base of p or q.
2. p has exactly one private page, whose tip lies in t.
3. Both p,q have exactly one private page; their bases contain the common vertex of p,q, and the pages have the same tip.
4. There are five distinct vertices v,a,b,c,d such that p=vab, q=vcd, their bases are ab,cd, their full private tip sets are exactly{c,d} and{a,b}, and all four cross edges ac,ad,bc,bd lie outside B. These five vertices induce K5. The residual triangle t is one of vac,vad,vbc,vbd.

Case4 is the missing case in the printed proposition. Here is a complete endpoint proof, not an appeal to its incorrect augmentation step.

Write p=vab, q=vcd and t=vac, with all five vertices distinct. The packed triangles cannot share a second vertex because they are edge-disjoint. The edge ac is outside B because t is doubly attached. If a base lies in t, case1 holds. Otherwise the base of p is either ab or vb, and the base of q either cd or vd.

If both bases contain v, they are vb,vd. A private tip on either base is outside{v,a,b,c,d}: a tip in the other packed triangle would give a second B-edge. Every private page avoids t. Two such pages intersect in an edge exactly when their tips coincide, in which event the shared edge is from v to that tip. If some pair of tips differed, the two pages together with t would replace p,q by three edge-disjoint triangles. Maximal cardinality therefore forces both full tip sets to be the same singleton, giving case3.

If exactly one base contains v, assume the bases are ab and vd. Every private tip of q is outside the five displayed vertices, again because a tip a or b would use va or vb in B. A private page on ab avoids t unless its tip is c. Any such avoiding page and any private page on vd are edge-disjoint: for disjoint bases they could share an edge only if their tips were reciprocally endpoints of the other base, but q's tip is outside all five vertices. An avoiding page would therefore give the same three-for-two augmentation. The entire nonempty tip set of p must be{c}, giving case2. The other mixed case is symmetric.

It remains that the bases are ab,cd. Let X,Y be their full private tip sets. Pages with tips x in X\{c} and y in Y\{a} avoid t. If either set is empty, case2 holds. Otherwise maximality forces every such pair of pages to share an edge. As the bases are disjoint, this requires x in{c,d}, y in{a,b}; the exclusions force x=d,y=b. Consequently X\{c}={d}, Y\{a}={b}. The private pages abd and bcd give cross edges ad,bd,bc outside B, and ac was already outside B. They complete K5, automatically making abc and acd private pages. Hence X={c,d}, Y={a,b}, and case4 follows. This proves all quantifiers of the amended classification.

Call p,q in case4 an exceptional pair. Each packed member belongs to at most one exceptional pair: its unique base determines the opposite vertex v, and its exact two private tips c,d determine the only possible partner vcd. Thus exceptional pairs partition a subset of the type1 owners. Their K5 vertex sets may overlap; no disjoint-vertex claim is needed. Their packed edges are disjoint, and each of their other four edges is outside B. Overlap among these nonpacked edges only saves weight below.

## The type[1,3] and type[3,3] cases, reconstructed separately

For a doubly attached triangle t=vac with p=vab and q=vcd, a type3 owner's K4 tip lies outside all five displayed vertices, since otherwise one of its three private faces would have a second packed edge.

If both owners are type3, use their private faces on bases ab and cd, both opposite v. These faces avoid t and are edge-disjoint: their bases are disjoint, and neither tip is an endpoint of the other base. Together with t they augment two packed triangles to three. Thus type[3,3] is impossible.

Suppose p has type1 and q type3. If p's base lies in t, no further condition is required. Otherwise take q's private face on cd. It avoids t. Any private page of p avoiding t is edge-disjoint from that face, since q's tip is outside the five displayed vertices and private-page geometry prevents a reciprocal endpoint collision. Such a page would again augment. Thus p has only the private page whose tip is c, its base must be ab (base vb would use the packed edge vc), and its tip is in t. In particular the nonpacked edge ac of t belongs to that unique private page. This establishes precisely the needed type[1,3] classification independently of the printed proof.

## Repaired order-three assignment

Initialize f=0. All assignments to previously credited nonpacked edges below mean taking the maximum, so credits are never overwritten by smaller values.

- For every type0 packed member, put2/3 on its three edges: cost2.
- For every type3 packed member, put1/3 on the six edges of its private K4: incremental cost at most2.
- For each exceptional pair, put2/3 on its two bases,1/3 on its four other packed edges, and1/3 on its four nonpacked cross edges: incremental cost at most4.
- For every remaining type1 owner with at least two private pages, put1 on its base and1/3 on its other two packed edges: cost5/3.
- Process the type1 owners having exactly one private page in any order. For such an owner put2/3 on its base. For each endpoint u of that base, let e_u be the owner's nonbase edge at u, and e'_u the private page's nonbase edge at u. If f(e'_u)=0, put1/3 on both e'_u and e_u. Otherwise leave e'_u alone and put2/3 on e_u.

In the last rule an already positive nonpacked edge always has weight exactly1/3: the only earlier nonpacked assignments were1/3. The packed edges of this owner were not assigned earlier, since every nonpacked private edge lies outside all of B and packed ownership is disjoint. Thus this step adds exactly2/3+2(2/3)=2. The same disjoint-ownership observation prevents a later rule from lowering or conflicting with an earlier packed-edge weight. Total mass is therefore at most2|P|, with shared nonpacked edges only decreasing incremental costs.

At completion every packed edge has weight at least1/3. Every type1 base has weight at least2/3. Every unique private page has both nonbase edges at1/3. Every type3 private K4 has all edges at least1/3. Every exceptional pair's K5 has all edges at least1/3. These assertions also give weights only in{0,1/3,2/3,1}.

## Complete coverage proof

Packed triangles are covered by their three packed-edge weights. A type3 private page has three weights at least1/3. A singleton type1 private page has base2/3 and both nonbase edges1/3. An exceptional type1 owner has exactly the two internal K5 private pages, all with total at least1. Every other type1 private page has its base weight1. Thus all singly attached triangles are covered.

A nonpacked triangle with three packed edges has load at least1. A doubly attached triangle meeting a type0 owner has a2/3 edge and another packed edge at least1/3. The type[3,3] case cannot occur. For type[1,3], the preceding classification supplies either a base of weight at least2/3, or the nonpacked edge of a singleton private page at1/3; in both cases the total is at least1.

Finally, apply the amended type[1,1] classification. Case1 supplies a base at least2/3 and another packed edge at least1/3. In case2 the unique private tip in t forces t's nonpacked edge to be one of that private page's nonbase edges, which has1/3; together with its two packed edges this covers t. In case3 the two singleton pages share the nonpacked edge from their common packed vertex v to their common tip. When the second owner is processed, this edge is already positive, so its corresponding packed edge in t receives2/3. The other packed edge has at least1/3. In case4 all three edges of t lie in the exceptional K5 and have at least1/3. These exhaust all actual triangles.

Therefore the repaired assignment is a valid third-integral cover of total mass at most2nu(G). No assertion here upgrades this fractional cover to an ordinary cover, repairs the paper's half-integral chains, or validates other uninspected dependencies.

## Evidence plan and source limits

The primary source bytes and original defect are fixed in review/cksu_prop13_independent_audit.md and evidence/cksu_source_audit/. This note imports no faulty proposition: it reconstructs the private taxonomy, all doubly attached cases, weight budget and all triangle loads. A separate finite checker will retain small literal controls; an independent context should reconstruct the proof before this candidate is marked accepted. Originality and publication attribution remain for later human-directed work.
