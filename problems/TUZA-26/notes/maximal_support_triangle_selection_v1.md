> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A legitimate extremal triangle selection: no bare restored page

Frozen ordinary lemma v1, TUZA-26, 2026-11-17. Fresh independent review requested. This is a finite actual-graph selection rule, not a new global classification or an assertion about every deleted triangle.

## General statement and hypotheses

Let X be a finite simple graph with at least one triangle. Assume that EVERY actual triangle is wholly contained in SOME minimum edge triangle cover of X (the minimum cover may depend on the triangle). For each triangle T define s(T) to be the number of edges lying in actual triangles of X-E(T). Choose T maximizing s(T) over all actual triangles of X; ties may be resolved arbitrarily.

Then the restoration of T over H=X-E(T) has NO ordinary page whose two old spokes are both background in H. Explicitly, if T=abc and p is outside {a,b,c}, and bcp is an actual X-triangle, at least one of bp,cp belongs to an actual H-triangle. The same holds for the other two bases of T.

This supplies a valid extremal order over actual triangle residuals of one fixed graph. It does not maximize over arbitrary replacement graphs and does not use minimum-Q naming.

## Proof

Suppose E0=bcp is an ordinary page with both bp and cp background in H. Let H'=X-E(E0). Passing from H to H' deletes only the background edges bp,cp and restores ab,ac; bc is absent from both graphs. Consequently every H-triangle survives in H'. In particular, every supported edge of H is still supported in H'.

If H' has a triangle using ab or ac, it has at least one additional supported edge, so s(E0)>s(T), contrary to the choice of T. It remains to show that the absence of such a triangle contradicts the full-triangle minimum-cover hypothesis.

If no triangle through ab or ac survives in H', every X-triangle through either restored edge meets {bc,bp,cp}. The only possibilities, by actual graph incidence, are abc, abp, acp. For example, a triangle containing ab and bc is abc; a triangle containing ab and bp is abp; ab and cp are disjoint edges and cannot occur in one triangle. The ac case is symmetric. Thus all triangles through ab or ac lie within these three listed faces; abp or acp may be absent when ap is absent.

Take a minimum X-cover C containing all three edges ab,ac,bc, as supplied by the hypothesis. Remove ab and ac, retain bc, and add ap if that edge exists. Every triangle previously relying on ab or ac is still hit: abc by bc, and the only possible other faces abp,acp by ap. Every other triangle keeps its old cover edge. This gives a cover with at most |C|-1 edges, a contradiction. If ap is absent, deleting ab,ac alone is already a saving.

Therefore H' must contain a new triangle through ab or ac, giving the strict supported-edge increase and contradicting maximality. No bare ordinary restored page exists.

## Applications at their exact scopes

For the actual minimum-CS parent G, every triangle T lies wholly in a minimum G cover: tau(G-T)=tau(G)-3 by the accepted actual single-residual profile. Thus there exists an actual triangle T with the stated no-bare-page residual property. Its residual retains all the archived actual-parent properties. No assertion is made that an arbitrary prescribed pair or triple contains this selected T.

The wider minimum Q also has the full-triangle cover property by the independently accepted all-triangle defect-two theorem, so the same selection rule is available there. This does not identify the defect-two support of Q-T, prove connectedness for it, or force a paid operation.

In the common-center low-packing B cube, if T=abc is this globally selected triangle and U=ade,V=afg, a B-bare opposite-base page bcp with p outside the seven core vertices would have both bp,cp background even in H=G-T=B+U+V. Neither edge has an endpoint among the U/V terminals, so it cannot enter a newly restored triangle. The general lemma excludes such a page for this selected T. This is CONDITIONAL on the cube containing the selected triangle; no such availability is inferred.

## Controls and remaining gap

K4 does not satisfy the hypothesis: its minimum cover has size two and cannot contain a whole triangle. K5 does satisfy it; after deleting a triangle, every restored ordinary page has supported spokes in the residual. These controls distinguish the cover hypothesis from ordinary resilience.

The rule offers a concrete valid selection order, but not a complete selection theorem for defect-one pairs or the remaining restoration cube. In particular it cannot be used to declare all three opposite-base families bare-free, or to assume a failing triple contains the selected T. No numerical work, C12 naming, or unrestricted Tuza conclusion is involved.
