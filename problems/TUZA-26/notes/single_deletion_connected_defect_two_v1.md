> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Every single-edge predecessor is one resilient defect-two support

Frozen ordinary proof candidate, TUZA-26. All triangles are actual, triangle components use shared edges, and arbitrary retained background is included. No global rigidity or historical-originality claim is made.

## Neutral insertion over several named active components

Let R have triangle components each either a frozen C12 support or a literal tight K4/K5 support. Let e=uv be absent, and suppose Q=R+e has connected nonempty triangle support, creates at least one new triangle, and nu(Q)=nu(R). Then every old component touched by a new page is K5-e with missing pair uv; no tight component is touched. If Q is triangle-supported, its literal support is a family of fresh K5s sharing their common edge uv, with all other vertices mutually disjoint.

To prove this, consider any actual new page uvx. If its two old spokes belong to different old components, or at least one is background, each component receives at most one forbidden edge. Every C12 support is single-edge resilient, and literal K4/K5 supports also have a maximum packing avoiding any one edge. Combine those avoiding maxima and append uvx. This raises packing, contrary to the hypothesis. Consequently BOTH old spokes of every page belong to the SAME old component D.

Such D cannot be a literal clique: it contains u and v, forcing absent uv to be an old clique edge. Therefore D is C12. If nu(D+uv)>nu(D), combine a larger D+uv packing with maximum packings of all other old components. The only newly used edge is uv, absent from every old component; hence this gives a larger Q packing. Thus nu(D+uv)=nu(D). The accepted named neutral-packing-insertion lemma, applied to D alone, forces D=K5-e with missing pair uv, and its insertion completes D to K5.

All actual new triangles have now been accounted for: each is internal to such a completed component. Any old component not touched by them remains a separate shared-edge triangle component in Q. Connected Q support therefore forces every old component to be touched. In particular no old tight component remains.

Two touched K5-e components already share u,v. They cannot share any further vertex x, because both would contain old edge ux, contradicting distinctness of triangle components. Their three remaining vertices are thus mutually fresh. A background edge not in one of the completed K5 supports lies in neither an old nor a new triangle. It cannot be present if Q is triangle-supported. This proves the literal reconstruction, with no unrecorded freshness assumption.

For exactly two old active components, Q is precisely two K5s sharing uv, one of the frozen C12 models. For one it is K5. More generally r completed K5s share only uv; their actual packing and cover values are 2r and 3r+1 (r>=1), but the general formula is not needed below.

## Application to the conditional minimum Q

Use the independently composed core theorem: every Q edge is cover-eligible, Q is two-edge packing resilient, and every actual edge lies in at least two triangles. Fix ANY actual e and put K=Q-e. Then

    nu(K)=nu(Q)=k,
    tau(K)=tau(Q)-1=2k-2,
    delta(K)=2,

and K is single-edge resilient by two-edge resilience of Q.

Proper-subgraph CS makes all component defects nonnegative and every zero-defect component a literal K4/K5. Component additivity leaves only two possibilities: one active defect-two component, or two active defect-one components. In the latter case resilience passes to both, each is strictly smaller than Q, and explicit minimum-Q reasoning names both as C12. Reinsert e. It is triangle-bearing because Q is supported; packing is unchanged. The preceding neutral-insertion theorem yields exactly two K5s sharing one edge, contradicting Q outside C12. Hence K has exactly one active connected defect-two support.

There cannot be an additional tight component D. Relative to K, every newly restored triangle uses e, and the entire ordinary e-page footprint in a fixed old clique has at most one edge. Thus D has complete outside-triangle boundary at most one in Q. The independently accepted complete-boundary exclusion forbids it. Equivalently, a page carrying such a spoke and at most one active-component spoke appends over resilient component maxima, so a tight component cannot connect to the new family while preserving packing. Triangle connectivity then excludes it. Either argument retains all background.

Finally K has no background edge. For any surviving f distinct from e, at most ONE actual triangle containing f can also contain e, because two distinct graph edges lie together in at most one triangle. Since f lies in at least two Q triangles, some f-triangle survives deletion of e. Thus every surviving edge is still triangle-supported.

Therefore, for EVERY edge e of the conditional minimum unknown Q,

    Q-e is itself connected through triangle edges,
    triangle-supported, single-edge resilient, and defect two.

This is a global structural restriction, not a naming of that defect-two support or a contradiction.

## Exact remaining mechanism

Every restored e-page uvx supplies a blocker pair {ux,vx} in K=Q-e: if a maximum K packing avoided those two spokes, appending the page would raise nu(Q). Each single spoke deletion preserves nu(K), so the pair loses exactly one. Thus each single-edge predecessor is a connected resilient defect-two graph with a specified family of incident two-edge blockers, one for every page of its missing edge. Reinserting the missing edge preserves nu and raises tau by one. The current minimum-Q rule does not classify these defect-two supports.

If the pending triangle-residual reconstruction also proves every Q triangle lies in some minimum cover, these particular blocker deletions in K have defect TWO, not defect one: K-{ux,vx}=Q-E(uvx) has nu=k-1 and tau=2k-4. This is a materially different response from blockers in the original defect-one core; the earlier naming step cannot simply be repeated.

Implication: conditional minimum-CS framework -> composed minimum-Q constraints (PROVED_ORDINARY plus VERIFIED_FINITE, archived foundations retained) -> the displayed universal single-deletion profile (ordinary candidate, independent review pending) -> a paid operation for every remaining defect-two predecessor/missing-edge interface (OPEN) -> no CS failure -> Tuza (last logical implication PROVED). Global R is not a premise.
