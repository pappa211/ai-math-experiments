> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Unbounded two-hub neighborhood: exact residual and fragile repairs

Frozen ordinary proof candidate, TUZA-26. This extends the same actual vertex operation beyond degree four. It is not an assertion that every higher-degree neighborhood has this form.

## Actual interface and neutral profile

In the accepted conditional minimum-Q setting, write nu(Q)=k, tau(Q)=2k-1. Assume c has exactly the neighbors {x,y} union U, where U is independent, |U|=t>=2, every leaf is adjacent to both hubs x,y, and the only optional edge in the neighbor link is xy. All outside edges and triangles remain arbitrary.

Delete the two edges cx,cy. Every c-triangle disappears, so two-edge packing resilience of Q gives

    J=Q-c, nu(J)=k.

Adding cx,cy to a J cover proves tau(J)>=2k-3. Choose a minimum Q cover containing the whole triangle cxu, for any u in U. It contains exactly two c-spokes, cx and cu: a third would leave a J cover of size at most 2k-4. Its old part therefore contains xu and every edge yw with w in U-{u}. Consequently

    tau(J)=2k-3, delta(J)=3;
    every link edge is packing-critical in J;
    M={xu,yv}, u!=v, is jointly contained in a minimum J cover;
    R=J-M has nu(R)=k-2, tau(R)=2k-5, delta(R)=1.

The packing equality for R follows because its deletion drops at most two, while any packing of size k-1 there would accept the disjoint c-pages cxu,cyv and exceed k.

If R is fragile at f, proper CS forces

    S=R-f in B, nu(S)=k-3=m, tau(S)=2m;
    J=S+{xu,yv,f}, nu(J)=m+3, tau(J)=2m+3.

Every maximum J packing is an old maximum S packing plus three ordinary pages, exactly one per restored base. Each base has a B-bare ordinary page; otherwise minimum old-clique covers through that base's whole one-edge-per-clique footprint, plus the other two bases, save one cover edge. Background edges are retained throughout.

The two-leaf forbidden-cover pairs must NOT be imported here. The valid general forbidden configurations are the FULL stars {xw:w in U} and {yw:w in U}: a minimum J cover containing either entire star extends by one opposite c-spoke to cover Q too cheaply. A two-edge subset of such a star is not enough when t>2.

## 1. Absent hub edge: every opposite residual is resilient

Suppose xy is absent. We show that the fragile S interface above is impossible, using the already established Q triangle codegree bound at least two.

Take a bare ordinary xu-page xup. Its apex p lies outside {x,y} union U: another leaf is nonadjacent to u, and apex y would require absent xy. In particular c is not adjacent to p. The two old spokes xp,up have no S triangle. Apart from the given xu-page, neither can acquire a triangle through the other restored base yv, whose endpoints avoid both spokes. They cannot acquire a c-triangle either.

Thus each spoke must have another Q triangle through f. For one edge f to share a triangle with both xp and up, it must either be xu or be incident to p. It is not xu. Hence f=pq for some q distinct from x,u, and the actual f-pages pqx and pqu must be present. In particular xq and uq are old S edges. (The f-page is ordinary: p is outside the link, and q=x or u would make f one of the old bare spokes.)

Now take a bare ordinary yv-page yvr. The identical argument forces r to be an endpoint of f, so r is p or q.

* If r=p, the old edges xp,pv,xv form an S triangle, contrary to bareness of xp and pv. The edge xv is retained because u!=v.
* If r=q, the old edges xq,qv,xv form an S triangle, contrary to bareness of qv.

Both cases fail. Thus no critical deletion of R can lead to B, and every opposite residual R is resilient under proper CS. No C12 naming or boundary exclusion is used in this repair.

This conclusion does not yet exclude the absent-hub neighborhood: its resilient named restoration remains a separate obligation.

## 2. Present hub edge and at least five leaves: full exclusion

Suppose xy is present and t>=5. The unmarked leaves W=U-{u,v} have size at least three. In R, all triangles xyw for w in W remain. They share the edge xy, and their apices are pairwise nonadjacent.

### Fragile R

If deleting f makes R into B, then f must be xy. Deleting any other edge destroys at most one of these book pages, leaving at least two triangles through xy with nonadjacent apices. They cannot lie in a literal old clique component, contradicting B.

Thus S=J-{xu,yv,xy}. Fix w in W and suppose xw is supported in an old S clique D. D contains x,w, but not y because xy is absent, and not any other leaf because U is independent.

Its COMPLETE outside-Q-triangle boundary has at most two adjacent edges:

* The c-pages contribute only xw.
* The entire ordinary xy-page footprint is exactly xw, forced by the actual page xyw and the whole-one-base footprint property.
* The ordinary xu-pages contribute at most one further edge xq, incident with x.
* The yv base has neither endpoint in D and contributes no old D edge.
* The only triangles using two restored bases are potentially xyu and xyv; their old edges yu,xv do not belong to D, since y,u,v are outside D. The two disjoint bases xu,yv cannot occur together in a triangle.

This includes every actual Q triangle, including c-pages and mixed restored-edge triangles. The accepted minimum-Q boundary exclusion removes D. The same argument applies to yw. Therefore every one of the 2|W| unmarked spokes is background in S.

Every maximum J packing consists of m old triangles and three ordinary pages. Its xu and yv pages cannot have another leaf as apex, and cannot have the other hub as apex because xy is a restored edge and that would be a mixed page. Thus neither page uses any unmarked spoke. The ordinary xy-page can use the two spokes of at most one unmarked leaf. At least one other unmarked spoke remains unused by this maximum packing, contrary to its criticality in J. This excludes fragile R.

### Resilient R

A resilient defect-one R has one active C12 component and zero-defect B components, by proper CS and minimum-Q naming. All the old book pages xyw belong to one triangle component. Since two independent apices already exclude B, they must lie in that active C12 component.

No frozen C12 model has an edge with three pairwise nonadjacent common neighbors. This follows directly from its construction:

* In a fresh central-K4 star, common neighbors of an edge lie in one clique, except for an attachment edge, whose common neighbors lie in its central clique and its one attached leaf clique. Each such group is a clique, so an independent choice has size at most two.
* For two K5s sharing an edge, the two private common-neighbor groups are cliques; every other edge lies in one clique.
* In K5-e the only nonadjacent common-neighbor pair consists of its two peripheral vertices.
* In W5, a hub-rim edge has the two adjacent rim positions as its common neighbors; a rim edge has only the hub.

The three independent unmarked apices therefore contradict C12 naming. Both possible resilience statuses of R are impossible. Hence the actual neighborhood with xy present and t>=5 is excluded in minimum Q.

## Controls, scope, and remaining obligations

The bare neighborhood alone does not imply the neutral profile. With xy present, the graph consisting only of the hub triangle {c,x,y} joined to t independent leaves has nu=tau=3 for t>=3: the three hub edges cover every triangle, and three differently based pages at distinct leaves pack. Deleting cx,cy leaves packing number one. With xy absent, the analogous graph has nu=tau=2 for t>=2 and deleting cx,cy leaves no triangles. Both fail the required two-edge resilience; they are not counterexamples to the paid operation.

Proved here, subject to independent review: the exact all-t neutral interface; resilience of every opposite residual in the absent-hub case; and complete exclusion of the present-hub case for t>=5. The absent-hub named reconstruction and the present-hub cases t=3,4 remain open in this note. No generic two-leaf forbidden-pair assertion has been used with extra leaves. No enumeration or numerical computation was run.

Sources are the accepted core profile, ordinary B footprint facts, the complete adjacent-two-edge boundary theorem, and the frozen C12 construction. Root proposed the present-hub independent-book discriminator; apex_challenger independently checked its complete boundary and supplied the absent-hub bare-page repair.
