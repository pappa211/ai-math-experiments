> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Actual-parent triple extension: exact failure structure and shared-vertex payment, v1

Frozen ordinary proof candidate, TUZA-26, 2026-11-17. Independent review requested. No numerical work. This note does not claim that every three edge-disjoint triangles extend simultaneously: the vertex-disjoint restoration case remains a separate obligation.

## Exact actual-parent interface

Let G be the fixed minimum-edge failure of combined CS, with nu(G)=k, tau(G)=2k, and every proper edge-subgraph satisfying CS. Use only the accepted actual-parent facts: every actual single-triangle residual has parameters (k-1,2k-3); every two edge-disjoint actual triangles extend simultaneously to a maximum G-packing. The newly accepted double-residual theorem says a defect-one double residual is single-edge-resilient, but the two arguments below in fact do not need that extra resilience.

Take edge-disjoint actual triangles T,U. Put R=G-E(T)-E(U), and suppose tau(R)=2k-5, so nu(R)=k-2 and R has defect one. Let V be any triangle of R. A failure of V to extend to a maximum R-packing means

    nu(R-E(V)) <= nu(R)-2.

The first result identifies the exact support in this failure case. The second result proves that V must then be vertex-disjoint from BOTH T and U. No minimum-Q degree, boundary, two-edge-resilience, or minimality assertion is transferred to these residuals.

## 1. A nonextendable triangle forces K5-e plus B

Write n=nu(R)=k-2 and B=R-E(V). Cover extension gives

    tau(B) >= tau(R)-3 = 2n-4.

Proper CS, combined with the assumed failure, gives

    2n-4 <= tau(B) <= 2nu(B) <= 2n-4.

Thus nu(B)=n-2=m, tau(B)=2m, and the equality clause of CS forces B: its triangle components are literal K4s and K5s. All old background and arbitrary old shared vertices remain in this actual residual. We have

    R=B+E(V),   nu(R)=m+2,   tau(R)=2m+3.

Write V=abc. The exact one-triangle packing interface of archived two_triangle_restoration_v1 Section 1 gives q_V=2. Its complete new-family classification says a q<=2 family has a two-edge cover unless it is exactly the seven-triangle K5-e family on abc and two distinct full apices x,y. A two-edge new-family cover would contradict tau(R)=2m+3. Therefore the entire new family is

    abc, abx, acx, bcx, aby, acy, bcy.

Every old spoke ax,bx,cx,ay,by,cy is background in B. Indeed every one lies in a three-edge cover of this new family: for ax or ay use {ax,ay,bc}, and permute a,b,c for the others. If a spoke were supported, choose a minimum B-cover containing it and add the other two new-family cover edges. This would give tau(R)<=2m+2. The edge xy is absent, since otherwise axy would be an old triangle containing a background spoke.

Hence the triangle components of R consist exactly of one literal K5-e component

    C=K5[{a,b,c,x,y}]-xy

and the unchanged old K4/K5 components of B. They may share vertices but no triangle-support edges. No connectedness of R is asserted, and all remaining old background edges are retained. This is a constructive naming of this precise failure interface, not a classification of arbitrary defect-one graphs.

### Sharp control

Take R=K5-e itself, with missing xy and V=abc the triangle on its three universal vertices. Then nu(R)=2, tau(R)=3, R is single-edge-resilient, and R-V is the triangle-free K2,3. Thus V does not extend to a maximum R-packing. The conclusion above must allow this graph. Adding separate old K4/K5 triangle components, including admissible shared-vertex arrangements, does not change the local obstruction. Resilience alone therefore cannot prove triangle extension.

## 2. Shared-vertex restoration gives an actual-parent cover saving

Suppose V shares a vertex with U. Since their edge sets are disjoint, they share at most one vertex. Relabel

    V=abc,  U=ade.

Let B and C be those constructed in Section 1. The seven labels a,b,c,d,e,x,y are distinct. In particular x,y cannot equal d or e: ax,ay are old B edges while ad,ae are restored U edges and hence absent from B.

The actual single-triangle residual H=G-E(T)=B+E(V)+E(U) satisfies

    nu(H)=m+3,   tau(H)=2m+5.

The other actual double residual H-E(V)=G-E(T)-E(V)=B+E(U) has packing number k-2=m+2 by simultaneous two-triangle extension. Therefore the exact one-triangle interface gives q_U=2. In particular its complete individual new family contains two edge-disjoint ordinary U-pages; its central triangle intersects every ordinary page and cannot occur in such a pair.

### Every U two-packing must use both special C spokes

Take any two edge-disjoint ordinary U-pages. Their complete old B footprint in each old clique is a star of at most two edges, by the exact one-triangle packing proof: a,d,e are independent in B. Thus these pages append to a maximum B-packing.

If their total C footprint has at most one edge, a maximum two-packing of C can avoid that edge, because K5-e is single-edge-resilient. Such a C packing uses only restored V edges and the six background B spokes, so it does not meet the old B packing. Together these packings give m+4 triangles in H, a contradiction.

An ordinary U-page can use a C edge only as follows: an ad- or ae-page has apex x or y and uses ax or ay. Indeed d,e are outside C, while the potential spokes ab,ac are absent from B. An ordinary de-page has no C edge. Therefore every U two-packing has the form

    adx, aey     or     ady, aex.

Fix the first form after swapping x,y if needed. In particular dx and ey are old B edges.

### Determine the entire U-family

There is no ordinary de-page dez. If z differs from x, it pairs with adx; if z=x, it pairs with aey. Either pair has at most one C edge, contrary to the preceding argument.

Every ordinary ad- or ae-page has apex in {x,y}. An ad-page with another apex pairs with aey and has at most one C edge; the ae case is symmetric using adx. There cannot be an additional ady-page: its old spoke dy, together with the already present ey, would create the forbidden ordinary de-page dey. Likewise an aex-page would create dex. Consequently the complete individual U-family is exactly

    ade, adx, aey.

All mixed triangles between V and U are absent. Such a triangle would be abd,acd,abe, or ace. If bd or cd were an old edge, its triangle with dx and bx or cx would be an old B-triangle through a background C spoke. If be or ce were old, its triangle with ey and by or cy would do the same. Thus none of these four cross edges exists.

We have now accounted for all actual H triangles: old B triangles, the seven C triangles, and the three displayed U triangles. The four edges

    {ax, ay, bc, ad}

cover every new triangle. The first three cover C; ad covers ade and adx, while ay covers aey. Together with a minimum B-cover this gives

    tau(H) <= 2m+4 < 2m+5,

the required actual-parent contradiction. All old background and all old clique intersections were retained throughout.

Interchanging T,U proves the same conclusion for a shared vertex with T. Thus if V fails to extend to a maximum defect-one double residual R, V must be vertex-disjoint from both deleted triangles T and U.

## Exact status and dependency boundary

PROVED CANDIDATE: failure of triple simultaneous extension at a supplied defect-one double residual forces the literal K5-e-plus-B support above, and the offending triangle is vertex-disjoint from both deleted triangles. The shared-vertex part is an actual-parent cover payment, not merely a new residual profile.

OPEN HERE: the case V vertex-disjoint from both T and U. Naming R does not by itself invoke the archived strict SINGLE-triangle restoration theorem: R is a DOUBLE residual. No such invalid composition is asserted. Root is independently analyzing the remaining vertex-disjoint restoration.

Read-only dependencies:

- TUZA22 problems/TUZA-22/notes/two_triangle_restoration_v1.md, Section 1, SHA256 12121facd2e02c4dd79ec488698ffb7153c7c810b6a76219302c0efdd11c07c7, and its independent review SHA256 f716b04d855d19e62788e9caa85aa927826eab2053682897280344d716b53ba9.
- The exact actual-parent single-residual and simultaneous-extension statements recorded in notes/actual_parent_critical_square_v1.md; no extra minimum-Q premises from that note or elsewhere.
- The new notes/actual_parent_double_residual_resilience_v1.md supplies the motivating resilient interface, but resilience of R is not used in either proof above. Only the explicit resilience of the literal five-vertex C is used.

There is no computation, census, defect-two naming, or claim of a global available reduction.
