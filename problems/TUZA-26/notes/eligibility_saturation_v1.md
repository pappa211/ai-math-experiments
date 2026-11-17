> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Cover eligibility saturation of the conditional minimum unknown core

Frozen draft v1, 2026-11-16. Status: ordinary proof candidate awaiting independent criticism. All graphs are finite simple; all actual triangles count, packings may share vertices, and triangle components are connected through shared graph edges. No unrestricted result is claimed.

## Precise universe

Fix a minimum-edge CS failure G, subject to the archived minimum-CS and C12 strict-restoration lemmas at their stated scopes. CS is tau <= 2nu with equality precisely for B (literal K4/K5 triangle-component supports). Let Q minimize supported-edge count among connected nonempty, triangle-supported, single-edge-packing-resilient, defect-one supports outside the frozen C12, arising in proper edge-subgraphs of this fixed G. This collection is nonempty by the archived residual/restoration chain. Every proper edge-subgraph used here satisfies CS because it lies inside G. Every strictly smaller connected/resilient/defect-one support inside G is C12 by the separate Q minimum, never by CS alone.

Write k=nu(Q), tau(Q)=2k-1. An edge is eligible if it belongs to some minimum triangle cover. A blocker pair is a distinct edge pair whose deletion lowers nu. A blocker loses exactly one packing unit, by single-edge resilience and one further deletion.

## Lemma 1: no two-edge B residual in Q

The archived all-size two-edge-B classification applies to every connected resilient defect-one graph with such a deletion, independently of the original-parent profile. It gives K5-e or a root K4 with one or two attached literal K4/K5 triangle components, the two attachment edges adjacent. These supports belong to frozen C12. The only apparent extra vertex-identification freedom in the two-attachment case is absent: the old pieces already share the common endpoint of the adjacent attachment edges; sharing an additional vertex would give a shared edge and merge distinct old triangle components. Each old piece has no other root vertex, by the missing-pair constraints in the classification. Thus the support is the literal fresh construction in C12. This contradicts Q outside C12.

Dependence: TUZA22 notes/resilient_defect_one_two_edge_B_classification_v2.md, including its actual-page compatibility proof. This is an archived theorem application, not a new classification.

## Lemma 2: blocker pairs are simultaneously eligible

For a blocker {e,f}, R=Q-{e,f} has nu(R)=k-1. Cover extension gives tau(R)>=2k-3 and proper-subgraph CS gives tau(R)<=2k-2. The upper value would be tight and hence B, contrary to Lemma 1. Consequently

    tau(R)=2k-3, delta(R)=1.

A minimum R cover together with {e,f} is a minimum Q cover. Therefore every blocker pair occurs together in a minimum Q cover; in particular neither member is ineligible. We do NOT claim R is resilient or connected. This proof addresses all actual edges, retaining background.

Equivalent useful consequence: if e is ineligible, Q-e has unchanged nu and tau, and it is single-edge resilient because e has no blocker partner.

## Lemma 3: a named active support cannot absorb a neutral triangle-bearing edge

Let R be any finite simple graph with arbitrary retained background. Suppose its triangle components consist of one active C12 support C and any number of literal K4/K5 tight supports. Let uv be absent from R. If R+uv has a new triangle and nu(R+uv)=nu(R), then C=K5-e, uv is its missing internal edge, there are no new pages with apex outside C, and the new triangle family is exactly the old family with C completed to K5. In particular tau increases by one. Thus insertion cannot preserve BOTH nu and tau.

Proof. For every new page uvx, each old tight clique sees at most one of ux,vx: containing both would put u,v in the clique despite uv being absent. Its maximum packing avoids that footprint.

If C is one of the ten fresh edge-glued models, the archived independent-star avoidance theorem supplies a maximum C packing avoiding the whole star {xu,xv}, since {u,v} is independent in R. Combine with the tight-piece avoiding packings and append uvx. This increases nu, a contradiction. The use of arbitrary shared vertices causes no issue: triangle-component supports are edge-disjoint, and all pages are actual graph triangles.

Suppose C is W5 or K5-e. If the page footprint contains at most one C edge, single-edge resilience of C gives the same augmentation. Thus any page must have both old spokes inside C, forcing u,v,x all into C. In particular uv is an internal nonedge. Since C has a universal vertex, every edge of R between C vertices already belongs to C: any extra edge would create an old triangle through the universal vertex. Therefore no hidden internal background edge changes this comparison. Pages outside C have no C spoke and would augment, so none exists.

For W5, each internal nonedge is a rim chord, say 02 on rim 0,1,2,3,4 with hub h. In W5+02 the three triangles 012, h23, h40 are edge-disjoint; nu rises from two to at least three. Combine with old tight components to contradict unchanged nu.

For K5-e, its unique internal nonedge completes K5. All pages stay in C and no other actual triangle family changes. Component additivity gives unchanged packing (both values two) and cover increase from three to four. This proves the lemma. No finite census is a premise.

## Theorem: every edge of Q is eligible

Suppose e is ineligible. Lemma 2 implies Q-e is single-edge resilient, while the elementary eligibility identities give nu(Q-e)=k and tau(Q-e)=2k-1. Its triangle-component defects are nonnegative by proper-subgraph CS and sum to one. There is exactly one active defect-one component; all others are literal K4/K5. Component packing additivity passes resilience to the active component. Its support has strictly fewer supported edges than Q, remains inside a proper edge-subgraph of fixed G, and is therefore C12 by the explicit Q minimum.

Restore the actual deleted edge e, keeping every background edge and vertex. Since Q is triangle-supported, it creates a page. Both nu and tau were unchanged by deletion, contradicting Lemma 3. Hence every edge of Q belongs to some minimum triangle cover.

## Consequences and exact remaining availability gap

This is a global constraint on the simultaneous failure of the named deletion/restoration mechanisms, applying also when minimum degree is at least four. It does not force a degree-three vertex, an apex, a K4-completed predecessor, or an applicable leaf. Every single deletion Q-e has defect two; all blocker pairs are simultaneously contained in a minimum cover and have a defect-one residual, whose resilience remains OPEN. All-eligibility alone is not a contradiction: W5 and K5-e are named controls.

Implication chain:

1. Failure of universal CS -> fixed minimum G with a nonempty eligible minimum-Q collection: CONDITIONAL on the exact archived minimum-CS / strict-restoration lemmas.
2. Minimum Q -> three-vertex-connected: archived PROVED_ORDINARY at its scope.
3. Minimum Q -> no <=2-edge B deletion: archived classification application, proof above, awaiting current independent review.
4. Minimum Q -> every edge eligible and blocker pairs jointly coverable: NEW ordinary candidate proved above, awaiting review.
5. Exclusion or paid reduction for every such all-eligible minimum Q -> no CS failure: OPEN availability/restoration theorem.
6. Universal CS -> unrestricted Tuza: PROVED by forgetting equality classification.

This route needs only the conditional Q class, not global R. Global R -> universal CS remains the stronger sufficient route subject to archived restoration, and global R itself remains OPEN. Neither all-eligibility nor this result is a Tuza proof.

Concrete next argument: analyze a blocker residual Q-{e,f}, whose defect is now exactly one. If it is fragile, any further critical deletion yields a B residual after three edges, with total packing loss two and cover loss three. Use actual geometry of that three-edge set (matching, star, adjacent pair plus edge, P4, or triangle) and simultaneous-cover constraints to prove resilience or identify an exact reconstruction exception. If blocker residuals are resilient, the separate minimum names their active components and exposes a two-edge restoration interface. In parallel, the no-blocker case is a genuinely two-edge-resilient all-eligible core and requires a different available operation; no inference from density is made.

Cheapest meaningful falsification: reconstruct the two-edge-B-to-C12 step and Lemma 3 with arbitrary shared/background vertices; test named controls for the simultaneous blocker-cover identity at its outside-C12 scope. Testing named examples cannot validate availability on unknown cores. Fresh critic must check the fixed-G minimality and all quantifiers.
