> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: triangle residuals without blocker pairs

Frozen 2026-11-16T21:12:16.468815+00:00. **PASS — PROVED_ORDINARY at the exact stated quantifiers.** Reviewed notes/no_blocker_triangle_residual_v1.md, SHA-256 `1b8687398d782e8e31c5da2048abe1511ffefe77e15fbd9fa51620ad27f61e49`. This is an elementary structural refinement; no finite computation, Lean verification, or historical-originality claim is a premise.

## Two-edge resilience and the no-B conclusion

Let every deletion of at most two actual Q edges preserve k=nu(Q), and let T be any actual triangle. Deleting two T edges and then the third gives nu(Q-E(T))>=k-1; appending T to any residual packing gives the reverse bound. Thus nu(L)=k-1 for every T. This independently proves every-triangle extension in this stronger branch and does not inherit it from the original parent.

If B(L), its triangle components are literal K4/K5 supports with additive packing m=k-1. After restoring only one T base, two-edge resilience requires packing m+1, so each of the three base families has an ordinary page. No multi-restored-edge triangle is possible in this single-base graph. The terminals are independent in L. Two pages on different bases and with distinct apices are edge-disjoint, and the whole footprint in each old clique is a star of at most two edges: it contains at most one terminal. Maximum old clique packings avoid these footprints and append both pages, contradicting nu(Q)=m+1.

Therefore opposite base families cannot have distinct apices. All three families are nonempty, so comparison with one fixed page and then back forces every family to consist of exactly the one page at a common apex x. Together with T, these are precisely the four new faces of an actual K4. Two opposite edges of that K4 form an actual two-edge deletion set hitting all new triangles. Every surviving triangle is an old L triangle, so packing is at most m, contradicting two-edge resilience. This proves B(L) is impossible.

The argument permits arbitrary old background and shared vertices of old components. It needs no defect assumption, connected support, CS, or degree bound. No assertion of residual resilience follows.

## Conditional minimum-Q consequences

In the single-edge-resilient minimum-Q class, absence of blocker pairs is exactly two-edge resilience. Its defect-one value tau(Q)=2k-1 gives tau(L)>=2k-4. Proper-subgraph CS gives tau(L)<=2k-2, and equality would force B(L), which the lemma excludes. Therefore tau(L) is exactly 2k-4 or 2k-3; since nu(L)=k-1, these are defect two and one respectively.

The stated minimum-cover dichotomy is exact. If a minimum Q cover contains E(T), deleting those three cover members covers L with size2k-4, and the lower bound forces equality. Conversely, a residual cover of size2k-4 together with E(T) is a Q cover of size2k-1 containing all three T edges. This establishes defect(L)=2 iff some minimum Q cover contains the entire triangle.

## Relevance and limits

The result gives a fresh, valid triangle-extension property and a cover-based defect dichotomy in the no-blocker branch, including minimum-degree-at-least-four cores. It does not prove a suitable triangle exists, that a defect-one residual is resilient or connected, that it is named by the minimum-Q choice, or that restoration yields a contradiction. Those membership and reconstruction obligations remain open. It is not an available paid reduction or a proof of Tuza by itself.
