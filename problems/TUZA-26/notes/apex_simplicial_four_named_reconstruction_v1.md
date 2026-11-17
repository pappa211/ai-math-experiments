> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Neutral simplicial degree four: complete named reconstruction without global completion

Frozen ordinary proof candidate v1, TUZA-26, 2026-11-17. Independent review required. This closes the reconstruction after the completion-free opposite-pair resilience theorem. It uses only the LOCAL literal K4 neighborhood of the deleted vertex; no other predecessor triangle is assumed to have a K4 completion.

## Actual setup

Let Q be the conditional minimum unknown support in fixed minimum-CS G, and suppose c is a degree-four simplicial vertex with neighborhood A={a,b,d,e}, a literal K4. Put J=Q-c and assume the remaining neutral case nu(J)=nu(Q)=k.

The accepted/proposed preceding operations give

    tau(J)=2k-3;
    all six A edges are critical in J;
    for every opposite pair M, R=J-M is resilient,
    nu(R)=k-2, tau(R)=2k-5.

The last resilience conclusion is notes/apex_simplicial_four_opposite_resilience_v1.md, independently accepted in reviews/opening_simplicial_opposite_resilience_review.md. Fix M={ab,de}. Proper CS and explicit fixed-G minimum-Q reasoning put one active R component C in frozen C12; all other R triangle components are literal tight K4/K5 pieces. Every vertex and background edge is retained.

We use the already accepted minimum-Q exclusion of literal K4/K5 regions with COMPLETE outside-triangle boundary at most two.

## 1. Every old tight component has complete boundary at most two

Fix a literal tight R component D. It contains at most one old A cross edge among ad,ae,bd,be, because any two force the missing ab or de inside its clique.

For each restored base ab or de, the entire ordinary-page family has at most one old D spoke, by the whole-one-base footprint lemma. Every new J triangle is an ordinary page on one of these disjoint bases. A new c-triangle uses an old A edge; if that old edge belongs to D, it must be the sole A cross edge in D.

If D contains no A cross edge, these two ordinary families give a COMPLETE Q boundary of at most two edges. If D contains a cross edge, relabel it ad. The actual internal pages abd and dea both exist in J, because A is a K4. Each already uses the D edge ad. Therefore the whole-footprint lemma forces BOTH entire restored-base families to use no other D edge. All c-pages touching D also use only ad. Its COMPLETE Q boundary is consequently just {ad}.

All actual outside triangles have been counted: old R triangles outside D share no D edge by triangle-component definition; J adds only the ordinary ab/de pages; Q adds only the c-pages on A. Thus the accepted small-boundary theorem excludes EVERY tight R component.

This is the decisive local-K4 replacement for the archive's stronger global-completion boundary argument. No page outside A has been assumed to complete to a K4 or to lie in C.

## 2. Every remaining support vertex lies in C union A union{c}

R now has exactly C as its triangle support, with arbitrary background. Each frozen C12 support has a universal vertex, so every R edge between C vertices is a C support edge: an additional edge would make an old triangle through the universal vertex and join the component.

Let w be a Q support vertex outside C union A union{c}. It lies in no old R triangle and no new c-triangle. Every Q edge incident with w must therefore belong to an ordinary ab- or de-page. All its neighbors lie in A. Those neighbors form an independent set in the old A four-cycle ad,db,be,ea: two adjacent old neighbors would make an R triangle through w. A four-cycle has independence number two, so w would have degree at most two. This contradicts minimum degree four.

Hence every support vertex lies in C union A union{c}. The statement concerns triangle support; isolated ambient vertices are irrelevant.

## 3. Criticality forces exactly one A vertex outside C

Every frozen C12 support has no induced four-cycle. For the fresh models this follows from their clique gluings along edges; any induced cycle through a fresh piece has a clique chord. W5 has no induced four-cycle because a cycle through its universal hub has a chord and its rim is C5. K5-e has only one missing edge and cannot induce a four-cycle, which needs two missing diagonals.

If three A cross edges were C-supported, their endpoints would put all four A vertices in C. The fourth cross edge, being an R edge between C vertices, would then also lie in C, yielding an induced four-cycle because ab,de are absent. The same reasoning excludes two opposite supported cross edges. Thus at most TWO A cross edges are C-supported, and two must be adjacent.

Choose any maximum J packing. Since nu(J)=nu(R)+2 and only the two M edges were restored, it consists of a maximum old C packing and exactly two ordinary pages, one on ab and one on de. These pages cannot both have apices inside A: their reciprocal old cross edge would be shared. An external-apex page uses no A cross edge; an internal-apex page uses two adjacent cross edges. Therefore the two new pages together use at most two A cross edges, adjacent if there are two.

Every A edge is critical in J, so every maximum J packing uses it. A background R cross edge cannot be used by the old C packing and must appear in the new pages. There are therefore at most two background cross edges. Combining this with the at-most-two-supported conclusion shows that there are exactly two of each, both adjacent pairs.

Relabel so that ad,bd are C-supported and ae,be are background. Then a,b,d lie in C, while e lies outside C; otherwise the background edges between C vertices would be supported. The two background edges ae,be must both occur in one internal page, necessarily abe. Thus EVERY maximum J packing contains abe, together with an ordinary de-page whose apex z is outside A. Its apex cannot be a or b, since that would share ae or be with abe. By the support-vertex confinement, z belongs to C.

## 4. Independent-star avoidance produces the final packing

The de-page has old spokes dz in C and ez in the retained background. Together with the background edges ea,eb, this forces {a,b,z} to be independent in C. The pair ab is missing by definition. If az were present, the actual old triangle eaz would contain the background edge ea; similarly bz would make ebz. Both are impossible in R.

All three of a,b,z are neighbors of d in C. This independent triple excludes W5 and K5-e, each of which has independence number two. Hence C is one of the ten fresh K4/K5 edge-glued models. The archived independent-star avoidance theorem supplies a maximum C packing avoiding

    da, db, dz.

Append the following THREE actual Q triangles:

    abe, dez, cad.

They are pairwise edge-disjoint. Their old C edges are only dz and ad, avoided by the selected packing; their other old edges ae,be,ez are background; ab,de were restored; ca,cd are fresh c-spokes. The resulting packing has

    nu(C)+3=(k-2)+3=k+1

triangles, contradiction.

This is an actual augmentation after complete boundary and background confinement. It neither imports a fixed-order census nor infers a packing from cover-edge matchings.

## Completed implication and remaining global scope

The positive-gain simplicial degree-four case is excluded by notes/apex_simplicial_degree_four_v1.md, independently accepted in reviews/opening_simplicial_degree_four_review.md. The neutral opposite-pair fragility case is excluded by the separate completion-free resilience theorem. The present proof excludes its resilient named reconstruction.

After independent acceptance of this note, the conditional minimum unknown Q has NO degree-four vertex whose neighbors form a K4. This includes the genuine one-private-vertex K5-on-K4 configuration and removes both old uses of global predecessor completion: resilience and component confinement.

This does not by itself exclude degree-four vertices with diamond or four-cycle neighborhoods, guarantee a degree-four vertex, or settle the higher-degree availability problem. The unrestricted Tuza conclusion remains separated by those global operations. No C12 enlargement, numerical computation, or historical-priority assertion is part of the proof.
