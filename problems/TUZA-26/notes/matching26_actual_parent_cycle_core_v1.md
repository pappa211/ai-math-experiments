> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Actual-parent tight triple cube: paid subcases of the distinct-intersection core, v1

Frozen ordinary partial reduction, TUZA-26, 2026-11-17. Independent review requested. This does NOT close the entire tight triple cube. The remaining full-apex cyclic configurations are stated explicitly below. No computation or census.

## Exact scope and complete mixed family

Let B have literal K4/K5 triangle components, nu(B)=m,tau(B)=2m, retaining arbitrary background and shared vertices. The three missing edge-disjoint triangles are

    T=abx, U=bcy, V=caz,

with all six displayed vertices distinct. Assume the actual-parent tight triple cube:

    each single restoration: (nu,tau)=(m+2,2m+2),
    each pair restoration:   (nu,tau)=(m+3,2m+5),
    G=B+T+U+V:               (nu,tau)=(m+4,2m+8).

The individual complete new families have q=2. The archived one-triangle classification leaves: (i) families covered by two restored bases; (ii) one-full-apex K4 family plus nonempty extra pages on one base, covered by that base and the opposite old spoke; or (iii) the exceptional two-full-apex K5-e family. These descriptions include the central triangle and all ordinary pages, with no omitted extra apices.

The only possible old edges among the six core vertices are

    ay,bz,cx,xy,xz,yz.

Besides the individual new families, all mixed triangles are exactly the central abc and the following nine conditional triangles:

    aby,bcx,bxy, abz,acx,axz, bcz,acy,cyz.

Each occurs precisely when its needed old closing edge is present. In particular abc, using one edge from each restored family, is never omitted.

## 1. Three two-base covers give a direct seven-edge cover

Suppose each individual new family has a cover consisting of two of its own restored base edges. Take their union F, of size six. Let L be the three unselected bases, one from each restored triangle.

Any H-triangle not already hit by a minimum B-cover together with F must be mixed and contain at least two edges of L. The three edges of L cannot form a three-star: such a star would have a common endpoint in all of T,U,V, whereas their pairwise intersections are distinct.

For any three-edge simple graph not forming a three-star, all actual triangles containing at least two of its edges are hit by one of its edges. The elementary cases are: a three-edge path, where all such triangles contain the middle edge; a wedge plus a disjoint edge, where there is only the wedge triangle; a matching, where there is none; or a triangle, where all three wedges close to the same triangle. These are exhaustive. Thus one additional edge hits every remaining mixed triangle, including abc if it remains.

A minimum B-cover, F, and that edge give

    tau(G)<=2m+7,

contradiction. This is a literal cover saving at all sizes, independent of any bound on old attachments.

## 2. A shared-pair full-apex payment

The following lemma is not restricted to the six-vertex core. Let two missing triangles be

    A=hab, D=hcd,

where h,a,b,c,d are distinct. Suppose their complete individual new families are nonexceptional q=2 families with:

- a unique full A-apex p and nonempty extra ordinary ha-pages har, r in R;
- a unique full D-apex q and nonempty extra ordinary hc-pages hcs, s in S.

All extra pages are on the indicated bases. Assume the same single gains (2,2) and pair gains (3,5) over B. Then this interface is impossible.

### Forced background edges

The covers {ha,bp} and {hc,dq} cover the entire individual families. Hence bp and dq must be background in B: if either were supported, a minimum B-cover through it plus its paired base would give a single-restoration cover gain at most one.

The union {ha,bp,hc,dq} covers every mixed triangle except possibly hbd. Thus bd must be present and background. If absent, the four edges already give pair cover gain at most four. If supported, include bd in a minimum B-cover and obtain the same saving. It follows also that p!=q: otherwise the old triangle bpd would contain the background edge bd.

All apices p,q,R,S lie outside {h,a,b,c,d}. For full apices this follows from the missing h-to-other-terminal edges; the same missing edges exclude core apices of ha- and hc-pages. Every one of these apices is adjacent to h in B.

We use this last fact without suppressing any crossing triangle: if an old clique contains two distinct such apices alpha,beta, its old alpha-beta edge and the old h-alpha,h-beta edges create an old triangle. Therefore that clique also contains h. It consequently cannot contain a,b,c,or d, since all four h-to-core edges are absent from B.

### Distinct extra apices augment the pair

If r in R and s in S are distinct, take the four actual triangles

    har, abp, hcs, cdq.

They are edge-disjoint. Their only possible common h-spoke would require r=s; full apices are external to the core, so there is no reciprocal terminal/apex collision.

After discarding the known background edges bp,dq, their supported old footprint is contained in

    hr,ar,ap,hs,cs,cq.

An old clique containing h can see only hr,hs, an adjacent pair. An old clique not containing h contains at most one of the distinct apices among r,p,s,q. Its footprint is then a star on that apex with at most two edges, one to a and one to c. This includes the allowed equalities r=q or s=p. Thus every clique footprint is a singleton or an adjacent pair. Old maximum packings avoid these footprints and append the four pages, giving nu(B+A+D)>=m+4, contrary to the assumed gain three.

Since R,S are nonempty, all their cross choices must therefore agree: R=S={w}.

### The common extra apex also augments

Now w,p,q are pairwise distinct: w is an extra apex, different from both unique full apices, and p!=q was proved above. Take

    hbd, haw, abp, cdq.

These four actual triangles are edge-disjoint. The edges bd,bp,dq are background. Their supported old footprint is contained in

    hw,aw,ap,cq.

An old clique containing h can contain only hw. A clique not containing h can contain at most one of w,p,q, so it can contain at most one displayed footprint edge. Thus an old maximum packing avoids the footprint and appends all four triangles, again giving m+4. This proves the shared-pair lemma.

The operation is a cover saving to 2m+4 OR a four-packing over B. It does not use minimum-Q naming, a degree bound, or any extra resilience hypothesis.

## 3. Consequence when all three individual families have one full apex

Apply Section 2 to the distinct-intersection core. If all three individual families are nonexceptional one-full-apex types, let f_T,f_U,f_V denote their extra-book bases. For the T/U pair sharing b, at least one extra-book base must be opposite b; for U/V sharing c, at least one must be opposite c; for V/T sharing a, at least one must be opposite a. Explicitly,

    f_T=ax or f_U=cy,
    f_U=by or f_V=az,
    f_V=cz or f_T=bx.

A family can satisfy at most one of the three displayed clauses, since its two required bases would differ. All three clauses must therefore be supplied exactly once, leaving only

    (f_T,f_U,f_V)=(ax,by,cz)
       or             (bx,cy,az).

Every other all-one-full-apex configuration is paid by an actual pair cover/packing contradiction. The two listed cyclic configurations remain OPEN here; the statement is a necessary restriction, not a support classification.

## 4. Precise remaining obstruction, without promotion

Section 1 closes the case where all three families admit two-base covers. Section 2 closes any pair of nonexceptional full-apex families whose extra books both use the shared vertex, giving the cyclic restriction above. Mixed types, and cases with an exceptional family, still require their actual old footprints and crossing triangles to be paid. The separately authored shared-exceptional-family lemma may remove two exceptional families; it is not a premise of either proof here.

A second exact cover discriminator is useful but not solved here. If some minimum B-cover hits all ordinary page families on two of the central bases ab,bc,ca, add all six outer edges ax,bx,by,cy,cz,az and the remaining central base. Every new triangle is then hit, including the central abc, and the cover has size at most2m+7. The failure of this criterion can arise from B-bare central pages or a genuine inability to include two distinct adjacent old-K4 footprints in one minimum old cover. Neither obstruction is silently assumed absent.

The presence of the actual central triangle abc also gives the actual single residual B plus the outer six-cycle, with parameters (m+3,2m+5). This numerical profile alone is not named or used as a completed reduction.

Dependencies: archived TUZA22 notes/two_triangle_restoration_v1.md Section1 (SHA12121facd2e02c4dd79ec488698ffb7153c7c810b6a76219302c0efdd11c07c7) and its independent review; elementary K4/K5 adjacent-pair avoidance and edge eligibility; the exact cube in notes/apex_actual_parent_triple_selection_v1.md Section4. The disjoint-pair exclusion in notes/apex_actual_parent_triple_B_disjoint_v1.md supplies the broader route context only. No global triple selection, universal extension, family enlargement, computation, or finite-domain completeness claim is made.
