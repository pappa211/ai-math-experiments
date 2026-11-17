> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Actual-parent critical double residual: the exact square and a supplied low-gain residual

Frozen ordinary candidate v1, TUZA-26, 2026-11-17. Independent review required. This is the selected six-hour actual-parent operation. It neither transfers minimum-Q properties to a parent residual nor names an arbitrary defect-two graph.

## Literal parent and critical branch

Let G be the fixed minimum-edge combined-CS failure with nu(G)=k, tau(G)=2k, all proper subgraphs satisfying CS. Use its archived actual-triangle residual profile and simultaneous extension: for every actual triangle V, G-E(V) has connected single-edge-resilient defect-one support with (nu,tau)=(k-1,2k-3); every two edge-disjoint actual triangles extend together to a maximum G packing. The strict restoration theorem excludes frozen C12 as the support of any such actual single-triangle residual. These are exact archived dependencies, not newly audited universal claims.

Let T,U be edge-disjoint actual triangles; they may share one vertex. Suppose R=G-E(T)-E(U) has defect one and a critical edge e. Then, with m=k-3,

    nu(R)=m+1, tau(R)=2m+1;
    B=R-e satisfies nu(B)=m, tau(B)=2m and B;
    G=B+e+E(T)+E(U), nu(G)=m+3, tau(G)=2m+6.

Indeed proper CS and one-edge cover deletion force the critical deletion to be tight. Edge e is outside the six restored triangle edges. All background and vertex identifications are retained. Since restoring e raises packing, it has an ordinary page already in B+e.

## Exact square: each single-triangle intermediate has defect two

The actual single-triangle residual G-E(U) is resilient with nu=m+2. Deleting e preserves this packing number, so

    nu(B+T)=m+2,

and symmetrically nu(B+U)=m+2. The exact one-triangle restoration formula over B therefore gives new-family packing number two for each triangle.

The actual residual cover number is tau(G-U)=2m+3. Adding one edge raises cover by at most one, and the one-triangle page classification gives a cover of the new family of size at most three. Therefore

    2m+2 <= tau(B+T) <= 2m+3.

Suppose the upper value holds. The complete new family cannot have a two-edge cover, so it is exactly the seven-triangle K5-minus-edge family with two full apices. Every specified spoke belongs to a three-edge cover of that family. If any spoke were supported in B, choose an old minimum cover through it and overlap the new family cover there, obtaining size2m+2. Thus ALL old spokes are background in B. The triangle components of B+T are then one literal C12 K5-e support and the old tight pieces; other background stays arbitrary.

Now insert e. This is triangle-bearing because B+e already has a page, and packing-neutral because both B+T and the actual residual G-U have packing m+2. The accepted neutral-insertion lemma over one C12 active support plus B components, with arbitrary retained background, says this can only complete the K5-e to K5 and MUST raise tau by one. But the assumed upper value already equals tau(G-U)=2m+3, contradiction.

Consequently the exact square is

    nu(B+T)=nu(B+U)=m+2,
    tau(B+T)=tau(B+U)=2m+2.

These two defect-two graphs are NOT named. The C12 lemma above was applied only to the explicitly forced literal K5-e component in the rejected upper-value branch. The separately frozen disjoint-restoration proof consumes precisely this square.

## A bare e-page produces another actual parent residual

The edge e has a B-bare ordinary page E0=ijp, where e=ij and both old spokes ip,jp are B-background. Otherwise the whole one-base footprint in each old clique can be included in a minimum old cover, covering EVERY e-page without e and giving tau(B+e)=2m, contrary to tau(R)=2m+1.

Put P={ip,jp} and B'=B-P. Deleting background changes no old triangle or optimum; B' still satisfies B with (nu,tau)=(m,2m). The actual G triangle E0 is edge-disjoint from T,U because all its edges already belonged to R. Therefore

    H0=G-E(E0)=B'+E(T)+E(U),
    nu(H0)=m+2, tau(H0)=2m+3.

Crucially H0 has the ACTUAL parent residual's connected, supported, single-edge-resilient defect-one support, with arbitrary background retained. It is not selected by the wider minimum-Q order.

The new family of T over B' has packing number EXACTLY ONE: if it had two, exact one-triangle additivity would give an m+2 packing in B'+T, and the disjoint missing triangle U would append to give m+3 in H0. The same holds for U. Thus each new family is a book or a literal K4 family, by the accepted one-triangle classification.

This is a materially stronger supplied interface than an arbitrary seven-edge restoration. A complete ordinary classification of THIS connected resilient low-gain two-triangle residual as C12 would contradict the actual-parent strict restoration theorem. The classification is being split by the actual cross graph when T,U share one vertex; it is not presumed here.

## Exact limits

The old minimum-Q proof that a triangle-plus-edge B restoration has a forced K5-e new family used TWO-edge resilience of Q. A single actual parent residual H=G-T has only single-edge resilience. W5 is an explicit control showing that its every-triangle extension does not replace that missing hypothesis. The present square and bare-page rebase derive their own valid statements and do not import that kernel.

Success would establish resilience only when a double-triangle residual has defect ONE. Defect-two double residuals, selection of an available global reduction, and unrestricted Tuza remain open. The already archived full CS theorem for B plus two missing triangles is used at its true scope and is not reported as a new result.

Dependencies: the actual-parent profile and simultaneous extension stated in the owner mission and PROOF_CHAIN.md; TUZA22 notes/two_triangle_restoration_v1.md, sections1 and lower-branch interface (SHA12121facd2e02c4dd79ec488698ffb7153c7c810b6a76219302c0efdd11c07c7); notes/eligibility_saturation_v1.md Lemma3 and its accepted independent review, whose neutral-insertion statement does not require Q minimality; elementary whole-one-base footprint and clique cover facts. No computation or census was used.
