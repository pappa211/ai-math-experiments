# PK covers confined to an arbitrary original maximum packing

Status: complete ordinary proof candidate; independently reconstructed by the apex track from the derivation; frozen-text critic review requested. Historical originality unestablished. The underlying one-apex Tuza theorem is prior project work; the additional assertion here concerns the permitted set A(P) of EVERY originally specified maximum packing.

## Exact theorem and intended role

Let H be finite simple. Suppose each nonempty connected component of its full triangle family under shared graph edges has literal support K3, K4, or K5. These block edge sets are disjoint; graph vertices may be shared; arbitrary triangle-free background edges are allowed. Add one vertex z with arbitrary neighborhood X, obtaining G. Let P be ANY maximum triangle packing of G, B its edge support, and A(P) the union of B with all private K4 completions as defined in `apex_private_k4_gate.md`. Then G has a triangle cover C contained in A(P), with |C|<=2|P|.

This includes the entire connected-cut obstruction family. It also covers the K3/K4 descendants arising when a vertex is deleted from a known K4/K5 equality block. It does not prove that the hypotheses persist after another arbitrary apex addition, or that every hypothetical minimal violation has this form. It therefore supplies a genuine scoped certificate for the global PK candidate, not its missing universal existence theorem.

## 1. Every actual triangle and the original packing state

Every G triangle is an old block face or an apex triangle zxy based on a link edge xy in H[X]. The apex triangles of P give an ordinary matching M in the link. Its edges are disjoint from all old packed faces.

A K3 block has at most one M edge. If it has none, its old triangle must belong to P, since otherwise that triangle could append. If it has an M edge, its old triangle cannot belong to P.

A K4 block has at most two M edges. With zero M edges it has exactly one old packed face by maximal cardinality. With one M edge it also has exactly one: a face avoiding that rim edge exists and could append if there were none. With two M edges they are opposite and every face meets one, so there is no old packed face.

Every K5 block has exactly two old packed faces. It has at most two M edges, and two edge-disjoint faces avoiding any such matching exist. For two matching edges12,34, take faces135 and245; cases of one or zero matching edges follow by extending that matching to two within K5. Replace all old faces in this block by these two: other block supports are edge-disjoint and the chosen faces avoid M, so if fewer than two old faces were present this would enlarge P. A K5 has no three edge-disjoint faces, by the even-degree/one-edge-leave argument recorded in the type-budget gate. Thus the count is exactly two.

## 2. Normalize without introducing an apex spoke

For each K3 with a packed apex triangle, replace that triangle by the old K3 face. For each K4 with two packed apex triangles, retain one, remove the other, and insert an old face avoiding the retained rim edge. These operations preserve packing size, introduce no new apex triangle or spoke, and do not conflict with other old supports. They leave the set of used K4 blocks unchanged.

Let P' be the resulting maximum packing and M' its apex rim matching. It has no K3 edges and at most one edge per K4. Let a,b,c count the K3,K4,K5 blocks, and m=|M'|. Then

    |P|=|P'|=a+b+2c+m.

M' is inclusion-maximal among link matchings avoiding K3 edges and using at most one edge per K4. Otherwise add a candidate xy with both endpoints unmatched. In an unused K4 choose a face avoiding xy; in a K5 choose two faces avoiding the enlarged matching (still of size at most two); a background edge meets no old face. Appending zxy after these blockwise choices would enlarge P'. This proves maximality without assuming that arbitrary matchings extend to maximum ones.

## 3. Cover the K3 blocks inside the ORIGINAL permitted set

For each K3 block abc, cover its old triangle and every apex page based in it with at most two edges from A(P), as follows.

If |X intersect {a,b,c}|<=1, the original P contains its old face, so any old edge lies in B and covers the sole relevant triangle. If the intersection has size two, say {a,b}, then ab is in B: it belongs either to the original old face or to the original apex triangle on that block. The edge ab covers both relevant triangles.

Suppose all three vertices are neighbors of z. The block and its pages form a literal K4.

- If original P contains abc and some spoke, say za, lies in B, choose za and the opposite old edge bc, both in B. If none of za,zb,zc lies in B, the K4 is a private completion of abc, so any opposite pair is in A(P).
- Otherwise original P contains an apex face, say zab. Choose ab and zc if zc is in B. If zc is outside B, then ac and bc are also outside B: this block has no old packed face, cannot have another matching rim edge, and shares no old support edge with another block. The K4 is therefore a private completion of zab, making that same opposite pair available in A(P).

These cases are exhaustive, including spokes already used by P on triangles based in other blocks.

## 4. Cover K4 and K5 blocks and the remaining apex pages

For each used K4 choose the opposite pair containing its M' edge; for an unused K4 choose any opposite pair. This costs two per block and lies in original A(P): an originally unused K4 had one old P face and no packed rim edge, hence is its private completion; an originally one-rim K4 had an old face containing the opposite edge, so the chosen pair lies in B; an originally two-rim K4 already had the two opposite matching edges in B, and normalization retained one of them.

For a K5, its two original old P faces have the form oab and ocd. The four edges {oa,ob,ab,cd} lie in B and cover every K5 triangle. A triangle avoiding o contains ab or cd; a triangle through o either contains a or b and meets oa or ob, or is ocd and meets cd. Choose this four-edge cover independently in each K5.

Finally add every spoke at an endpoint of M'. These 2m spokes are all in original B. Old triangles and all K3-based apex pages are covered. A remaining uncovered apex triangle zxy has both endpoints unmatched by M', and its rim edge is not in a K3. By maximality it cannot be a background edge, an unused K4 edge, or any K5 edge. In a used K4 it must be the edge opposite the selected M' edge, which the chosen old cover already contains. Contradiction.

Thus the union covers every actual G triangle. Its size is at most

    2a+2b+4c+2m = 2|P|,

and every edge lies in ORIGINAL A(P). Possible overlaps of chosen spokes only decrease size. QED.

## Dependency and scope accounting

The positive one-apex inequality and the maximal-matching cover mechanism are already in published baseline d4029fbafc3dffc250b50ed237ad81c3206cd1a0, `problems/TUZA-07/notes/CONSTRUCTIVE_AND_STAR_THEOREMS.md` (SHA256124e50e3f564316b88e2cf5048fcd206f61d1c8230d8f0798891ed1bb7dafe41). The complete proof above independently verifies the additional confinement and arbitrary-original-P quantifier, rather than treating a cover for a modified packing as a cover in A(P).

No Aharoni/HNS equality classification, unknown unrestricted tight-graph structure, Ramsey catalogue, solver optimum, or Lean result is imported. The class is not closed under iteration; that missing global step remains explicit.
