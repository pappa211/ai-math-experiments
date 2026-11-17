> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Ordinary exclusion of every three-neighbor four-cycle bouquet

Frozen 2026-11-16. Primary derivation: challenger, using a simultaneous cover choice after a balanced packing containing rim triangles. Status: ordinary proof candidate for fresh reconstruction. No WKE existence is asserted.

## Statement

Work in the accepted proper-subgraph-minimal CS-failure framework. Let h be a vertex and L a closed connected component of its induced link. Suppose L has vertices

    {w} union {a_i,b_i,c_i,d_i : 1<=i<=t},   t>=2,

and exactly the following edges: each a_i b_i c_i d_i a_i is a four-cycle, and w is adjacent to a_i,b_i,c_i but not d_i. There are no edges between different four-cycles. Then this link cannot occur.

All outside vertices, edges and triangles are unrestricted. Other closed components of the link at h are allowed and are kept. The minimum-CS inputs are: every graph edge belongs to at least two actual triangles; every proper subgraph satisfies combined CS; and the usual balanced deletion consequence, reconstructed below. This theorem is local and all-size.

## 1. A balanced reduction with rim triangles

For each i take the following three triangles:

    w a_i b_i,     h a_i d_i,     h b_i c_i.

They are mutually edge-disjoint, including between components. The whole packing P has size3t and avoids hw. Put

    D_i={wa_i,wb_i,a_i b_i,a_i d_i,b_i c_i},  D=union_i D_i.

Delete D and ALL spokes from h to vertices of L, including hw, to obtain K. The triangles of P use only deleted edges, so

    nu(G)>=nu(K)+3t.

Every lost triangle using a D edge is covered by D. Any other lost triangle uses h and an edge of L−D. The latter consists exactly of the two-edge paths

    w-c_i-d_i.

Thus D together with {h c_i:1<=i<=t} covers every lost triangle and has size6t. Closedness of L ensures that a triangle through a deleted spoke cannot have its third vertex in another link component. Therefore

    tau(G)<=tau(K)+6t.

The graph K is proper. Since K satisfies CS, tau(K)<=2nu(K), and the displayed inequalities imply tau(G)<=2nu(G). A minimum CS failure cannot be strict, because strictness satisfies CS. Hence all these inequalities are equalities, K is tight, and B(K) follows. Equivalently one may invoke the accepted balanced-deletion lemma with the explicit full lost-triangle cover above.

## 2. The cycle edges c_i d_i all survive in triangle support

The edge c_i d_i has exactly one common neighbor within {h} union V(L), namely h. In L it has no common neighbor: w misses d_i, and the four-cycle has no diagonal. Minimum-CS codegree at least two gives another actual page c_i d_i z.

The apex z lies outside N(h). Indeed, if z were another neighbor of h, the rim edges c_i z,d_i z would put it into the same closed link component L, contradicting the explicit local graph. The two spokes to z are therefore outside D and outside the deleted h-spokes. The entire triangle c_i d_i z survives in K. In particular EVERY c_i d_i is a triangle-supported K edge.

## 3. Simultaneous old-cover prescription and the saving

The graph K induced on V(L) has exactly the edges of the paths w-c_i-d_i, and is triangle-free. Every literal K4/K5 triangle block of K therefore contains at most two vertices of L. Consequently any old block contains at most one edge with both endpoints in L, and in particular at most one of the prescribed edges c_i d_i. Each old K4/K5 has a minimum cover containing any prescribed single edge. Choose these minimum covers simultaneously over all old blocks. Their union C_K is a minimum K cover and contains every c_i d_i.

Now C_K union D union {hw} covers ALL actual G triangles. Old triangles are covered by C_K. Every new triangle using a D edge is covered by D. The only other lost triangles are h w c_i and h c_i d_i; the former meet hw and the latter meet the already prescribed c_i d_i. There are no further lost triangles by closedness, as in Section1.

Hence

    tau(G)<=tau(K)+5t+1 < tau(K)+6t=2nu(G),

where t>=2 supplies the strict saving. This contradicts the assumed minimum CS failure.

## Scope and dependencies

This eliminates precisely the all-three-neighbor C4 bouquets left by the accepted ordinary apex-pseudoforest boundary and the full-neighbor C4-component exclusion. Those two theorems, together with this lemma, imply full ordinary exclusion whenever L−w is a pseudoforest; an assembly should cite their exact scopes separately. The t=1 case is already covered by ordinary apex-unicyclic exclusion and is not claimed to be strict by this particular saving.

The argument does not find a WKE matching: it uses one rim triangle and two hub triangles per component. It controls the WHOLE outside loss and the simultaneous prescribed old cover. No finite certificate, GE, Kotzig theorem, or bound on t or outside attachments is used.
