> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: P4 packing-gain-two defect gap

Frozen 2026-11-16T21:09:30.926295+00:00. **PASS — PROVED_ORDINARY at the exact stated hypotheses.** Reviewed notes/apex_three_path_defect_gap_v1.md, SHA-256 `881e2bf60939a7017f1fc63298a35d16866be2af4e703cc4015027dae6ccb3ef`. For B(L), missing S={ab,bc,cd}, and r=nu(L), the implication nu(L+S)=r+2 => tau(L+S)<=2r+2 is valid with arbitrary background, shared vertices, disconnected old support, and isolates. Single-edge resilience and connected restored support are not used. No Lean run or new numerical premise is part of this review.

## Cover saturation and allowed page types

An old minimum cover plus S gives tau(Q)<=2r+3, so failure of the conclusion means equality 2r+3. Each restored base then has a B-bare ordinary page: otherwise the whole one-base footprint lemma permits an old minimum cover hitting all ordinary pages on that base, and adding the other two restored edges covers the rest. An ordinary page contains exactly one S edge. On end base ab its apex is external or d, never c; on cd it is external or a, never b; on middle bc it is external. The only additional new triangles are abc when ac is old and bcd when bd is old. Thus the proof's triangle-type exhaustion is complete.

Two edge-disjoint ordinary pages on adjacent restored bases are compatible with a maximum old packing. Each old clique sees at most one spoke per page. If it receives two spokes incident to the common base endpoint, they form an avoidable star. If it receives two disjoint opposite spokes, the two old edges to the common endpoint and the old clique edge between the apices make an old triangle forcing that endpoint into the clique, contradicting a missing base. Hence only avoidable whole footprints remain. A third B-bare page adds no supported footprint. This justifies every triple augmentation with a bare END page. When two pages are bare, the third arbitrary ordinary page has at most one supported spoke per old clique and also appends. The proof does not claim that any two pages on disjoint end bases are always compatible.

## Internal bare end apex

Suppose abd is bare. If a chosen bare cd-page has external apex z, every middle page with apex x!=z forms three edge-disjoint triangles with abd and cdz. The two bare pages make them appendable, a contradiction. Therefore the middle family is confined to z; its required bare page is bcz. But old bd,bz,dz then form an old triangle containing bare edge bd. Thus the chosen bare cd-page must be internal cda, with ac,ad background.

Choose a bare middle page bcx. Any external ab-page at y!=x forms an appendable triple with bcx,cda; a page at x instead creates old triangle acx through background ac. Therefore ab has exactly its internal page abd. The reversed argument gives only cda on the other end. The pair {ad,bc} covers both end pages, every middle page, and both possible two-restored-edge triangles. This contradicts cover gain three. Reversal excludes either internal bare end apex.

## Shared external bare end apex

If abx and cdx are bare at one external x, a middle page at any other apex would make an appendable triple. Thus the middle family is exactly bcx, which must also be bare. All four a/b/c/d-to-x spokes are background. Old crossedges ac,ad,bd would each make an old triangle through x, so all are absent; together with deleted ab,bc,cd this makes all four terminals independent in L. In particular no internal end page or two-restored-edge triangle exists.

If both end families have additional apices y,z different from x, the three pages aby,bcx,cdz are edge-disjoint even when y=z: the two end pages then share only that vertex. Every old clique receives at most one supported spoke in total from the two end pages, because receiving one from each would put two distinct independent terminals in the same clique. This is the specific justified instance of disjoint-end compatibility. Append those pages and bare bcx to contradict gain two. Hence at most one end family varies, and {ab,cx} or {bx,cd} covers every new triangle. This excludes a common bare end apex.

## Distinct external bare end apices

Choose bare abx,cdy with x!=y. Any middle page with another apex forms an appendable triple, so the middle apices are contained in {x,y}. By path reversal take its required bare page to be bcx. Any ab-page at z!=x, including internal z=d or z=y, forms three edge-disjoint pages with bcx,cdy, the latter two bare. Hence ab has only abx. Since ax,cx are old background, ac is absent and abc cannot occur.

If bcx is the only middle page, {bx,cd} covers all ordinary pages and the possible bcd. Otherwise bcy exists. Any cd-page at z!=y, including internal z=a or z=x, forms an edge-disjoint triple with abx,bcy. The bare end page abx plus the adjacent-base compatibility of the other two justifies augmentation. Consequently cd has only cdy. Old bd would make old triangle bdy through background dy, so bcd is absent. The entire new family is abx,bcx,bcy,cdy, covered by {bx,cy}. This exhausts the last case and proves the claimed cover bound.

## Controls and significance

The preserved five-K4 P4 example has old (nu,tau)=(2,4) and restored (5,6), hence packing gain three. It is compatible with this theorem. The proof repeatedly *constructs* gain-three packings to contradict only the explicit gain-two premise; it does not revive the refuted universal gain-at-most-two surrogate. The author's 4096-background check is a separate finite control, not a substitute for or premise of this ordinary all-size proof.

For a conditional minimum Q, a fragile blocker-pair residual gives B after three deleted edges and the exact gain-two/cover-gain-three profile. Such a triple therefore cannot have P4 shape. This result needs no predecessor K4-completion and works at any minimum degree. Combined with the reviewed triangle and star theorems, only the P3-plus-disjoint-edge and three-edge-matching shapes remain among fragile triples. It does not force blockers, settle resilient blocker residual reconstruction, or handle the all-eligible no-blocker branch. No universal availability or Tuza claim follows alone.
