> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Opposite-pair resilience for a neutral simplicial degree-four deletion

Frozen ordinary proof candidate v1, TUZA-26, 2026-11-17. Independent review required. This removes the predecessor-wide K4-completion hypothesis from the OPPOSITE-PAIR RESILIENCE step. The subsequent complete reconstruction from a named active residual is a separate obligation and is not silently imported from an archive whose boundary argument used completion.

## Actual setup and enabled residual

Let Q=J+c, where c is a fresh degree-four vertex adjacent precisely to a literal K4 A={a,b,d,e} of J. Assume the conditional minimum-Q premises needed here: proper-subgraph CS, nu(Q)=nu(J)=k, tau(Q)=2k-1, and every actual Q triangle is contained in a minimum Q cover.

The exact leaf packing/cover response in notes/apex_simplicial_degree_four_v1.md gives

    tau(J)=2k-3;
    every A edge is packing-critical in J;
    every opposite pair M is jointly contained in a minimum J cover;
    nu(J-M)=k-2, tau(J-M)=2k-5.

These facts also follow directly: two c-pages on an opposite pair append to J-M; every A edge accepts a c-page; a Q minimum cover containing cab uses exactly two c-spokes and therefore has an old minimum J part containing ab and de.

We prove that EVERY R=J-M is single-edge packing-resilient. All old vertices, background edges and actual outside pages remain present.

## 1. A minimum J cover cannot contain an A triangle

If a minimum J cover contained all three edges of any A triangle, adding just the c-spoke to A's fourth vertex would cover every new c-page. It would cover Q with tau(J)+1=2k-2 edges, contradiction. Thus no minimum J cover contains an A triangle.

This is a concrete one-edge cover saving, not an exchange axiom about minimum covers.

## 2. A hypothetical critical residual and its maximum packing

Fix M={ab,de} and suppose f is critical in R=J-M. Proper CS and cover extension force

    S=J-{ab,de,f} satisfies B,
    nu(S)=k-3=m, tau(S)=2m.

Hence J restores exactly three edges, with nu(J)=m+3 and tau(J)=2m+3. Every maximum J packing has exactly m old S triangles and THREE new triangles, one ordinary page on each restored base. A new triangle using two restored edges would leave room for at most two new packed triangles, and would make the total at most m+2. Thus the three selected ordinary pages are actual and edge-disjoint. The old packing is maximum in every literal S component.

Let C4 denote the four cross edges ad,ae,bd,be of A. Each is an S edge unless it is f. A literal S clique contains at most ONE of these edges: two adjacent cross edges force the absent ab or de, and two opposite cross edges contain all A vertices and again force a missing pair.

For every minimum S cover C_S, the set C_S union{ab,de,f} is a minimum J cover. Every S-supported cross edge belongs to a minimum cover of its literal clique; because different cross edges lie in different cliques, all chosen supported cross edges can be selected simultaneously.

Consequently:

- If f is outside E(A), the supported C4 edges form a matching. Two adjacent supported cross edges, together with ab or de, would give a forbidden A triangle in a minimum J cover. Thus at least two C4 edges are background; if exactly two are background, they are opposite.
- If f is a C4 edge, relabel it ad. Then bd and ae MUST be background: either supported edge could be included in C_S and would complete an A triangle with the restored edges {ab,de,ad}. The remaining be may be supported.

A background S edge belongs to no old packed triangle. If such an A edge is also absent from the three new pages of a maximum J packing, that packing avoids an A edge declared critical in J, contradiction. Equivalently it can accept the fresh c-page on that unused A edge and produce a (k+1)-packing of Q. This is the basic augmentation used below.

## 3. f has no endpoint in A

The ordinary f-page uses no C4 edge. An ab-page has an apex inside A only at d or e, and then uses two adjacent C4 edges. A de-page has an internal apex only at a or b, with the analogous footprint. These two pages cannot BOTH have internal apices: they would share their reciprocal cross edge.

Therefore the three new pages together use at most two C4 edges, and if two, those two are adjacent. Since at least two C4 edges are background and a two-edge background set is opposite, some background C4 edge is unused. The augmentation just described contradicts nu(Q)=k. This excludes the entire disjoint matching placement of f, with no restriction on its outside pages or their supported spokes.

## 4. f is itself a C4 edge

Relabel f=ad. The ordinary ab-page can have an internal apex only at e; it then uses ae,be. The ordinary de-page can have an internal apex only at b; it then uses bd,be. These internal pages cannot both occur because they share be. The ordinary ad-page has no internal apex: apex b would require missing ab, and apex e would require missing de.

Thus at least one of the two forced background edges ae,bd is absent from all three new pages. It is absent from the old packing as well, and the same augmentation gives the contradiction. This handles the three-edge-path placement without applying the earlier, different gain-two theorem.

## 5. f has exactly one endpoint in A

Relabel f=at, with t outside A. The ordinary f-page uses at most one C4 edge, and can do so only with apex d or e. The other two ordinary pages are on ab and de, with at most one having an internal apex.

If neither has an internal apex, at most one C4 edge is used, so a background one is unused and augments. It remains to treat the possible internal page.

### The ab-page is abd

By swapping d,e, this covers either internal ab-apex. The de-page is deq with q outside A. If the f-page uses no C4 edge, the unused pair {ae,be} is adjacent, so at least one is background and augments. If it uses a C4 edge, it cannot use ad, already used by abd; hence its apex is e and the page is ate.

The only unused C4 edge is g=be. If g is background, augment. Suppose it is supported, in its unique old clique D_g. The supported-cross-edge matching condition forces bd and ae to be background. The clique D_g contains b,e and excludes a,d, since ab,de are absent in S.

The abd page has no old spoke in D_g: bd is background and ad has both endpoints excluded. The deq page has no old spoke in D_g either. Its dq spoke cannot lie there because d is excluded. If eq lay there, q would lie in D_g and bq would be an old clique edge. The actual old triangle bdq would then use the background edge bd, impossible.

The ate page has background spoke ae. Its only possible D_g footprint is te, which is incident with g at e. A maximum K4/K5 packing avoids two incident edges. Replace the old packing inside D_g by a maximum avoiding g and te (or just g if te is not there), and leave every other old and new triangle unchanged. This remains a maximum J packing but avoids g. It contradicts criticality of g; equivalently append cbe to obtain k+1 triangles in Q.

### The de-page is dea

It uses ad,ae. The f-page cannot use a C4 edge without sharing one of these, so neither bd nor be is used by any new page. Those two unused edges are adjacent, so at least one is background and augments.

### The de-page is deb

The ab-page is abq with q outside A. If the f-page uses no C4 edge, one of the adjacent unused edges ad,ae is background and augments. Otherwise swap d,e if necessary so that the f-page is atd, using ad.

The only unused C4 edge is g=ae. If background, augment. If supported, its old clique D_g contains a,e and excludes b,d. The matching condition makes ad and be background.

The deb page has no D_g spoke: be is background and bd has excluded endpoints. The atd page has no D_g spoke: ad is background and td cannot lie in D_g because d is excluded. For the abq page, bq cannot be in D_g. If aq lay there, then eq would be an old clique edge and the actual old triangle beq would contain background be, impossible.

Thus the three new pages avoid every old D_g edge. Replace its old maximum by one avoiding g. Again obtain a maximum J packing avoiding critical g, or append cae for a direct (k+1)-packing of Q.

The three subcases exhaust internal ordinary pages up to the permitted relabelings. This excludes every placement where f has one A endpoint.

## 6. Result and exact remaining reconstruction

All possible locations of the actual edge f have been excluded. Therefore R=J-M is resilient for EVERY opposite matching M of A. The proof used no K4 completion for triangles outside A, no bounded-order census, and no hypothetical fresh attachment. It kept all ordinary-page footprints and repaired the only supported unused-edge obstruction inside its literal old clique.

Proper CS and explicit minimum-Q reasoning now give one strictly smaller named resilient defect-one active component of R, with possible tight components and retained background. That is a legitimate enabled descent. However, the archived subsequent component-confinement theorem used predecessor-wide K4 completion to put external ab/de pages into that active component. This note DOES NOT assume that boundary conclusion automatically survives. Complete reconstruction from the now-resilient residual remains a separate actual-region obligation.

The positive packing-gain simplicial degree-four case is separately excluded in notes/apex_simplicial_degree_four_v1.md. Together the two notes provide a paid positive-gain reduction and a completion-free neutral opposite-pair resilience theorem; they do not yet prove that all simplicial degree-four vertices are absent in minimum Q.
