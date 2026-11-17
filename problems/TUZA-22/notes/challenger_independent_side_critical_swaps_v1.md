> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Critical spokes and simultaneous triangle swaps for an independent side

Status: ORDINARY_REFORMULATION_CANDIDATE; fresh review required. TUZA-22 challenger, 2026-11-16 local date. This is an exact consequence of minimum-cover optimality and the stated criticality/TF hypotheses, not a packing theorem or an availability claim.

## Setup

Let G have a partition A union B with B independent. Put L=G[A], C=E(L), and m=|C|. Assume C is a minimum ordinary triangle cover. For S⊆E(L), put

    h_G(S)=sum over b in B of tau_vertex(L[S][N_G(b)]).

Use the exact cover formula and global condition from notes/challenger_independent_side_cover_identity_v1.md. In particular h_G(S)>=|S| for every triangle-free L[S]. Call such an S tight if equality holds. At a tight S, choose independently a minimum vertex cover K_b of L[S][N_G(b)] at every b. The cross-spoke set F={b x:x in K_b} has size |S|, and

    (C minus S) union F

is a minimum ordinary cover of G.

## 1. Exact meaning of cross-spoke criticality

For a cross edge e=a b with a in A,b in B, the following are equivalent:

1. tau(G−e)=m−1.
2. There is a triangle-free S with h_G(S)=|S| and h_(G−e)(S)=|S|−1.
3. There is a tight triangle-free S and a minimum vertex cover K_b of L[S][N_G(b)] containing a.

For1=>2, the cover formula for G−e gives some triangle-free S with h_(G−e)(S)=|S|−1. The summand at b can increase by at most1 when a is restored to its neighborhood, and the other summands do not change. Global minimality gives h_G(S)>=|S|, so equality and the exact one-unit increase follow.

The equivalence2<=>3 is the elementary vertex-cover identity: deleting a vertex lowers vertex-cover number by1 if and only if some minimum vertex cover contains that vertex. If a minimum cover contains a, removing a covers the vertex-deleted graph; conversely append a to an optimum cover of the vertex-deleted graph.

For3=>1, the tight swap gives a minimum G-cover containing e. Delete e from that cover after deleting the graph edge e to obtain an (m−1)-cover. The universal bound tau(G−e)>=tau(G)−1 gives equality.

Thus edge cover-criticality forces a tight global swap containing every cross spoke, not merely a local star inequality. Internal C-edges are automatically cover-critical: deleting one lets us delete it from C, and the same universal lower bound is sharp.

## 2. Exact simultaneous constraint from a triangle in a minimum cover

Let f=a c be an internal A-edge and let b in B be a common neighbor, so T=a c b is an actual private triangle relative to C. The following are equivalent:

1. Some minimum ordinary cover D of G contains all three edges of T.
2. There exists a tight triangle-free S with f not in S, together with minimum per-apex vertex covers K_z, such that K_b contains BOTH a and c.

For1=>2, write R=D intersection E(L), F=D minus R, and S=E(L) minus R. The ordinary-cover formula gives L[S] triangle-free, h_G(S)<=|F|, and |R|+|F|=m. Since h_G(S)>=|S|=m−|R|, all these inequalities are equalities. Therefore every per-apex portion of F is minimum, and it contains a,c at apex b. The base f lies in R because T⊆D, so f is not in S.

For2=>1, use the tight-swap construction from the setup. It retains f and selects both spokes a b,c b, so contains T with the same total size m.

The requirement is simultaneous: having one optimum K_b containing a and a different optimum containing c is insufficient. A minimum CS obstruction's universal triangle-in-minimum-cover property would provide the simultaneous form for every actual private page. That property is an additional input, not a consequence asserted for all minimum covers here.

## 3. A precise local continuation, not a completed augmentation

For a simultaneous witness S at T=a c b, consider S plus f. If it contains an internal triangle, its two other edges form an S-path a-x-c. Together with the original page at b, this gives an actual K4 on a,c,x,b whenever x is also in N_G(b); the latter adjacency must be checked and is NOT automatic from the internal path alone.

If S plus f is triangle-free, global optimality forces h_G(S plus f)>=|S|+1. The b-summand does not increase because its optimum K_b already contains a and c. Consequently some other common apex z of a,c has a vertex-cover-number increase when f is added to its induced S-link. Equivalently, every minimum vertex cover of that S-link avoids both a and c; any optimum containing either endpoint would already cover f and prevent the increase.

This produces a triangle-or-sensitive-apex dichotomy. It does not by itself give disjoint witness edges, an alternating-path theorem, a private-packing augmentation, or a universal page-count lower bound. In particular one cannot omit the adjacency check in the internal-triangle branch or substitute separate one-spoke criticality for the simultaneous TF condition.
