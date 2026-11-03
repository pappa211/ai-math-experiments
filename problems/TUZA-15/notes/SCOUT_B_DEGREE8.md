# Degree-eight vertex subsuming degree five

Scout B's complete post-sharing proof, received in three messages and preserved by the coordinator on 3 November 2026. The coordinator checked the displayed fixed-core packing rows. Independent criticism is recorded separately. Initial reducing tuples and case organization are from Puleo Lemma7.5; the residual-diamond and page-family lifts are the new work in this mission. This is not claimed as an independently rediscovered initial proposal.

## Statement and common helpers

Let G be a minimum combined obstruction, with the accepted robustness, codegree>=2 and degree-five link theorem. Suppose d(u)=8, d(v)=5, and u subsumes v. Set W=N(v)-{u} and Z=N(u)-N[v], of sizes4 and3. The vertex v has no Z-neighbor; G[W] is K4 or K4-e. Put B0=G[{u,v} union W]. Every triangle at u or v lies in B0 or uses an edge from u to Z. Outside incidence is unrestricted. We prove this configuration impossible.

**H1, fixed-core facts.** K6 has four edge-disjoint triangles avoiding any single edge or any two disjoint edges: extend the avoided edges to a perfect matching and decompose its complement. For missing matching12,34,56 the four triples135,146,236,245 work. Thus K6-e also has a four-packing. Every K6 edge is contained in a six-edge cover given by the within-part edges of a3+3 vertex partition. A three-packing can avoid any three-edge star: if the forbidden edges are wu,wa,wb and the other vertices are v,c, take wvc plus a maximum two-packing on K5[{u,v,a,b,c}] avoiding vc, using known K5 avoidance.

**H2, all singleton-u WKE tuples are excluded here.** Let L=G[N(u)]. Suppose M is a matching in L and Q covers L-M with |Q|<=|M|. The hub triangles on M, K=G-u-M and X=M union {uq:q in Q} give a reducing tuple. A strict size inequality contradicts minimality; equality forces B(K).

The residual induced graph on {v} union W is K5 or K5-e minus a matching of at most two edges. Unless it is an untouched K5, it contains an induced diamond. Indeed its missing-edge graph has one to three edges and maximum degree at most2. With one missing edge, omit a nonendpoint to obtain exactly one missing edge on four vertices. With two missing edges omit a degree-one vertex. With three missing edges there is a degree-two vertex (three disjoint edges cannot fit on five vertices); omit it. In each case the remaining four vertices form a diamond. Its two triangles share an edge while the missing diagonal precludes literal residual clique support.

In the untouched K5 exception, M has no edge inside {v} union W. The vertex v is unmatched, since all its L-neighbors are in W. An eight-vertex L then has |M|<=3, whereas Q must cover the surviving K5 and has size at least4, again impossible. This proves H2 without assuming irreducibility.

## I. Z is independent

Each z in Z has at least two W-neighbors by the codegree bound on uz. Let J be the bipartite W–Z graph. Its matching number is2 or3. If3, augment a three-edge J matching by vw, where w is the unique uncovered W vertex. With Q=W this gives a size4 singleton WKE tuple, excluded by H2.

Suppose the matching number is2; choose a two-vertex cover QJ of J by Konig. Put A=N_W(Z). If |A|=2, write A={a,b}, W-A={t1,t2}. Every z joins both a,b. Take M={az1,bz2,t1t2} if t1t2 exists, otherwise M={az1,bz2,vt1}. Then Q={v,a,b} covers L-M. Apply H2.

Thus |A|>=3. If W=K4-w1w2, choose w in A-{w1,w2}, z0 in Z adjacent to w, and w' the fourth W vertex. The five-packing

{uw'w1,vww1,uvw2,ww'w2,uz0w}

and X=E(W) union {uv,z0w} union {uq:q in QJ} form a strict5/9 tuple to K=G-u-v-X. The W edges and uv cover all core hub triangles, QJ-spokes cover all uZW triangles, Z has no internal edges, and every noncentral packed base belongs to X. Contradiction.

If W=K4, choose z0w and a page zab, with z in Z, a,b in W and w outside {a,b}. Such a choice exists: if some Z-neighborhood has at least three vertices use the same apex; otherwise all are two-sets whose union has size at least3, and a vertex in one pair lies outside another. Delete u,v,E(W),z0w to obtain K. A core four-packing avoiding uw plus uz0w gives5; X=E(W) union {uv,z0w} union uQJ has10 edges and covers every lost triangle, so B(K). A core four-packing avoiding the disjoint edges uw,ab, together with uz0w and zab, gives6 triangles. Even when z=z0 these are edge-disjoint since w is outside {a,b}. The entire surviving footprint consists only of the page spokes. W is independent in K, so each residual block sees at most one. This contradicts the forced increment5.

## II. Z has an edge, except the full-W/all-active case

Choose z1z2 in E(Z), with third vertex z0. Put Z*={z in Z:N_W(z) is nonempty}. First handle W=K4 with |Z*|<=2 and every W=K4-e case. Choose S subset Z containing Z*, of size max(2,|Z*|). Delete u,v,E(W),z1z2 to obtain K. A four-packing of B0 plus uz1z2 gives5 triangles on deleted edges. Let

X=E(W) union {uv,z1z2} union {uz:z in S}.

This covers all lost triangles: v/core u triangles meet E(W) or uv; uZW triangles meet a Z*-spoke; uZZ triangles meet an S-spoke since at least two of the three Z vertices are in S; all deleted bases are selected directly. All noncentral packed edges are in X. If W=K4-e and |S|=2, the cover has9 edges, a strict contradiction. The remaining balanced cases are as follows.

### IIa. W=K4 and |S|=2

Here |X|=10. Let F be the full family of triangles with a W-edge base and apex outside B0. Any such page combines with a core four-packing avoiding its base and uz1z2 to give6 triangles. Its only surviving edges are page spokes; each block sees at most one because W is independent. Thus F is empty. A six-edge core cover, the two uS spokes, and z1z2 cover all lost triangles at cost9<10. Contradiction.

### IIb. W=K4-ab, with other vertices c,d, and |S|=3

Again |X|=10. Define F as above. A core four-packing avoiding cd exists by the perfect-matching decomposition omitting {ab,cd,uv}. Together with uz1z2 and a cd-page it gives6 compatible triangles. Hence F has no cd-page; its bases belong to {ac,ad,bc,bd}.

For any distinct two such bases f,g, there is a three-packing of B0 avoiding both. Up to swaps a↔b and c↔d, these are all types:

| Forbidden bases | Three triangles in K6-ab |
|---|---|
| ac,ad | auv,bcu,bdv |
| ac,bc | auv,bdu,cdv |
| ac,bd | auv,bcu,cdv |

If two F-pages were edge-disjoint, their corresponding three-packing, uz1z2 and those two pages would give6 triangles. The complete surviving footprint comes from the two pages. Each residual block contains at most one W vertex, so its footprint is a star of at most two edges. Therefore F is pairwise edge-intersecting.

Disjoint W bases cannot support intersecting pages, because their apices lie outside W. Bases ac and ad could support intersecting pages only with the same apex x, which would force an actual xcd page, already excluded. The same holds for bc and bd. Consequently all F bases lie in {ac,bc} or all lie in {ad,bd}, including empty or singleton cases. The corresponding five-edge cover

Cc={ac,bc,uv,ud,vd}, or Cd={ad,bd,uv,uc,vc},

covers the core and every page in F. They are the existing within-part edges of partitions {a,b,c}|{u,v,d} and {a,b,d}|{u,v,c}. Add all three uZ spokes and z1z2. The increment is5+3+1=9<10 and covers every lost triangle. Contradiction.

## III. W=K4, all three Z vertices active, and z1z2 exists

Let z0 be the third Z vertex. For ANY chosen w in N_W(z0), put

Kw=G-u-v-E(W)-z1z2-z0w,
Xw=E(W) union {uv} union uZ union {z1z2,z0w}.

The latter has12 edges and covers every lost triangle. A core four-packing avoiding uw plus uz1z2 and uz0w gives6 triangles using only deleted edges. Therefore B(Kw) and the forced packing increment is6.

Let F be all W-edge pages with apex outside B0. If a member has base f not incident to w, take a core four-packing avoiding the disjoint edges uw,f and append uz1z2,uz0w and that page. The resulting7 triangles are disjoint even if the apex is z0, because f avoids w. The only surviving footprint consists of the page spokes, at most one per residual block. Contradiction. Thus every F base is incident to w.

If z0 has a second W-neighbor w', repeat the SAME valid argument with Kw'. It follows that every F base is incident to both w,w', hence the only possible base is ww'. More neighbors only restrict it further.

If z0 has exactly one W-neighbor w, suppose F has distinct bases wa,wb. Their apices are different: a common apex x would force page xab with base avoiding w. Thus those two pages are edge-disjoint. Neither apex is z0, which has only one W-neighbor. Let c be the fourth W vertex. Take a core three-packing avoiding uw,wa,wb using wvc and two K5 triangles on {u,v,a,b,c} avoiding vc. Append uz1z2,uz0w and the two pages to obtain7. No page uses z0w, and the core avoids both page bases and uw. The ENTIRE surviving footprint is from the two pages; a block contains at most one W vertex, so sees a star of at most two edges. Contradiction.

Thus in all cases F has just one possible base f, or is empty. Choose a six-edge core cover containing f (any if F is empty). Add the three uZ spokes, z1z2,z0w and a minimum Kw-cover. Every lost triangle is hit: a triangle through u/v is in B0 or uses uZ; one on a deleted W edge lies in B0 or F; the other deleted bases are directly covered. The increment is6+3+2=11<12. Contradiction.

## Conclusion and scope

All possibilities for G[W] and G[Z] have been exhausted. No minimum combined obstruction has a degree-eight vertex subsuming a degree-five vertex. With the separately proved degree-seven case and the old degree<=6 exclusion, no degree<=8 vertex subsumes degree5.

No bound was imposed on outside pages, crossing triangles, repeated page apices, graph order or other degrees. The argument uses no finite graph census and no degree-six classification. Its fixed-core facts are explicitly witnessed. The page classifications use actual graph triangle closure and the whole per-block footprint; arbitrary-star avoidance in K5 is never asserted.
