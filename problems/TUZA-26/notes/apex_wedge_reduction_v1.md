> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Degree-three wedge: a smaller unknown support or an actual three-edge B restoration

Frozen ordinary candidate v1, TUZA-26, 2026-11-16, awaiting independent criticism. This removes predecessor K4-completion from the DELETION/INTERFACE step. Completing the conditional minimum-Q exclusion still requires the stated P3-plus-edge reconstruction branch.

## Exact hypotheses and already accepted response

Let H be finite simple, triangle-supported with connected nonempty triangle family, single-edge packing-resilient, and tau(H)=2nu(H)−1. Suppose every proper edge-subgraph under consideration satisfies CS. Let v have exactly three neighbors a,b,c, with ab,bc present and ac absent. Write e=ab, f=bc, J=H−v and p=nu(H).

The accepted TUZA25 degree-three wedge response (notes/critical_adjacent_edges_frozen.md) gives

    nu(J)=p, tau(J)=2p−2,
    nu(J−e)=nu(J−f)=p−1.

The only v-triangles are vab and vbc. No K4-completion is assumed for J. Vertex deletion is interchangeable here with retaining v isolated; all subsequent graphs can be kept on H's vertex set.

## 1. The two-edge-deleted predecessor has exact defect one

Put K=J−{e,f}. In H−{e,f}, the retained v-star {va,vb,vc} is triangle-free background, since none of ab,bc,ac is present. Hence H−{e,f} has exactly K's triangle family. Cover extension gives

    tau(K)>=tau(H)−2=2p−3.

Also nu(K)<=nu(J−e)=p−1. Proper-subgraph CS supplies tau(K)<=2nu(K). These inequalities force nu(K)=p−1 and leave tau(K) in {2p−3,2p−2}.

We now rule out tau(J−e)=2p−2. If this held, proper CS and nu(J−e)=p−1 would give B(J−e). Since adding e increases packing, J has an ordinary e-page abx. Its apex is not c, because ac is absent. In a literal old clique containing f=bc, this page has at most the old spoke bx (a cannot be in that clique because ab was absent), so the combined forbidden footprint {bc,bx} is a star of at most two edges. K4/K5 maximum packings avoid it. If f is background there is nothing additional to avoid. Every other old clique receives at most one page spoke and avoids it at full packing size. Thus a maximum (J−e) packing can be chosen avoiding f and the page footprint; appending abx gives p triangles in J avoiding f. This contradicts f's criticality.

Therefore tau(J−e)=2p−3. The symmetric argument gives tau(J−f)=2p−3. Since K is a subgraph of either, the lower bound above now gives

    nu(K)=p−1, tau(K)=2p−3, delta(K)=1,
    nu(K+e)=nu(K+f)=p−1,
    tau(K+e)=tau(K+f)=2p−3.

Both single insertions are ACTUALLY TRIANGLE-BEARING in K. Criticality ensures each edge lies in a J triangle. A triangle containing both e and f would be abc, which is absent. Thus every e-page of J already exists in K+e, and every f-page already exists in K+f.

These are genuine neutral insertions individually; their simultaneous insertion raises nu and tau by one. No assumption of resilience for K has been used.

## 2. If K is resilient, it exposes a strictly smaller unknown support

Assume K is single-edge resilient. Proper CS on its triangle components makes their nonnegative defects sum to one. There is one active connected defect-one component C, all other nonempty triangle components being literal tight K4/K5. Packing additivity transfers resilience to C. Its supported-edge count is strictly smaller than H's: the removed v-spokes were supported in H and cannot belong to C. All original background and vertices remain in K.

The coordinator's accepted neutral-insertion lemma says a graph with one active C12 support and otherwise literal B components, with arbitrary retained background, cannot admit a triangle-bearing edge insertion preserving both nu and tau. Both K+e and K+f do exactly that. Consequently C cannot be C12.

This is a genuine alternative valid for generic H at the stated proper-CS scope: either K is fragile, or it supplies a smaller connected/resilient/defect-one support OUTSIDE C12, with its full actual neutral-edge interface retained in K. We do not classify C using CS alone.

For the conditional minimum unknown choice H=Q INSIDE THE FIXED G, the second alternative is impossible. C lies in a proper edge-subgraph of G, qualifies for the same wider minimum-Q collection, and has strictly fewer supported edges. Its being outside C12 contradicts that explicit minimum. Thus K must be fragile in the minimum-Q application.

## 3. A fragile K yields THREE restored edges over B, not six

Let g be packing-critical in K. Then nu(K−g)=p−2. Cover extension and proper CS force

    2p−4=tau(K)−1 <= tau(K−g) <= 2nu(K−g)=2p−4.

Hence L=K−g satisfies B and has nu(L)=p−2,tau(L)=2p−4.

Now retain the v-star BEFORE doing reconstruction:

    L' = L + {va,vb,vc} = H−{e,f,g}.

The v-star is background in L': v has only neighbors a,b,c, and all three possible neighbor edges ab,bc,ac are absent. Thus L' and L have exactly the same actual triangles, so B(L') holds with the same packing and cover values. The correct full restoration is

    H=L'+{ab,bc,g},
    nu(H)=nu(L')+2,
    tau(H)=tau(L')+3.

This is EXACTLY the new three-edge B-restoration profile. The three v-spokes have not been discarded; they are retained as old background and generate the two wedge pages when ab,bc return. No six-edge theorem and no K4-completion are required for this interface.

Because g belongs to K, it is distinct from ab,bc and from every v-spoke. Since ac is absent, the restored set {ab,bc,g} has precisely one of these shapes:

- three-star, if g is incident with b;
- P4, if g joins a or c to a vertex outside {a,b,c};
- P3 plus a disjoint edge, if g misses {a,b,c}.

A triangle is impossible because its closing edge would be ac. A three-edge matching is impossible because ab,bc are adjacent.

## 4. Current reconstructed branches and remaining payment

The reviewed TUZA26 three-star theorem forces H's literal support to be W5 in the star branch. The reviewed P4 theorem makes the path branch impossible, since its gain-two cover increase is at most two. The P3-plus-edge branch is the remaining precise reconstruction obligation at this freeze. It is being treated by the independent geometry worker; no result is assumed before its proof is frozen and reviewed.

If that final branch also forces a member of frozen C12 (or gives a cover saving), a conditional minimum unknown Q cannot have the supplied degree-three wedge. This would discharge that actual degree-three case without predecessor K4-completion. It still would NOT force a degree-three vertex in an arbitrary Q, address the other neighbor shapes without proof, or reduce a core of minimum degree at least four.

## Region, boundary, induction and statuses

The actual removed region is v with its three incident edges, followed by deletion of the explicitly named edges ab,bc and, in the fragile branch, g. The complete first boundary is {a,b,c}; all other vertices/edges of H remain, and the later g endpoints are retained explicitly. This is a deletion/reconstruction alternative, not an unsupported generic inequality transfer. The resilient branch decreases supported-edge count in the exact fixed-G minimum universe. The fragile branch restores the three named edges over a B base WITH the entire v-star and all other background retained, so every crossing triangle is included by the general three-edge theorems.

Implication chain:

1. Minimum CS failure -> fixed-G minimum unknown Q: CONDITIONAL on archived profile/strict restoration.
2. Q has a supplied degree-three wedge -> exact K profile above: ordinary proof candidate, awaiting review; depends on accepted TUZA25 response and proper CS.
3. K resilient -> smaller qualifying unknown support -> contradiction: ordinary argument using the accepted neutral-insertion theorem and explicit Q minimality.
4. K fragile -> actual three-edge B restoration with the displayed profile: ordinary proof candidate, awaiting review.
5. Star/P4 -> named W5/contradiction: reviewed TUZA26 scoped theorems.
6. P3-plus-edge -> named support or paid saving: OPEN at this freeze.
7. Excluding all such degree-three wedges -> universal availability: OPEN; higher-degree cores and other cases remain.
8. Universal CS -> unrestricted Tuza: PROVED logically.

This yields a concrete narrower unresolved bridge and preserves the exact smaller-state semantics. W5 is the sharp control: its K is a fragile triangle, so unconditional resilience descent remains false. The P4 gain-three control remains outside the gain-two profile, and generic TUZA25 resilience-descent failures are not contradicted. No numerical graph census or historical novelty claim is part of this proof.
