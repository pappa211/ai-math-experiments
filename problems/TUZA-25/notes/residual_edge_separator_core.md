> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Residual edge separators isolate a three-connected core

Frozen ordinary proof candidate for independent review, TUZA-25. This is a precise conditional decomposition using proper-subgraph CS. The packing/cover transfer is elementary separator accounting; no historical novelty is asserted (archived SEP machinery is related). It does not classify the resulting core.

## Exact transfer across one shared edge

Let A,B be finite simple edge-subgraphs such that V(A) intersection V(B)={u,v}, E(A) intersection E(B)={f}, f=uv, and H=A union B. Thus every actual H triangle belongs to exactly one side. Suppose H preserves its triangle packing number after every single-edge deletion. Then:

1. nu(H)=nu(A)+nu(B), and A,B each preserve packing after every single-edge deletion.
2. tau(H)=tau(A)+tau(B)-epsilon, where epsilon=1 exactly when f belongs to some minimum triangle cover of each of A and B; otherwise epsilon=0.
3. Writing delta=2nu-tau, delta(H)=delta(A)+delta(B)+epsilon.

Proof. Put p_A=nu(A), q_A=nu(A-f), and analogously for B. The triangle families of H-f are edge-disjoint, so nu(H-f)=q_A+q_B. Appending a maximum A-f packing to a maximum B packing, or vice versa, gives

    nu(H) >= max(q_A+p_B,p_A+q_B).

Resilience makes nu(H)=q_A+q_B, forcing q_A=p_A and q_B=p_B. The partition of every H packing by side gives the reverse upper bound p_A+p_B, hence additivity.

For any e in E(A) other than f, append a B maximum packing avoiding f to an A-e maximum packing. The same triangle partition gives nu(H-e)=nu(A-e)+p_B. Resilience of H therefore forces resilience of A at e. The edge f was already handled; B is symmetric.

Every H cover restricts to covers of both sides, and its cardinality is the sum of the restriction sizes minus one exactly when it contains f. Hence tau(H)>=tau(A)+tau(B)-1, while a union of minimum side covers gives tau(H)<=tau(A)+tau(B). Equality in the lower value requires minimum restrictions containing f on both sides, and such covers conversely attain it. This proves2, and3 is algebra.

## A two-vertex separator of the triangle support

Let S be the graph of actual triangle-supported edges of a finite graph H, with their endpoints. Assume its nonempty shared-edge triangle support is connected. Then S has no cut vertex: a triangle lies within one ordinary block, and different blocks share no graph edge, whereas the triangle family is shared-edge connected.

If {u,v} is a two-vertex separator of S, then uv must be an edge. Otherwise partition the components of S-{u,v} into two nonempty sides. Every actual triangle lies on one side, and the two sides share no graph edge, contradicting shared-edge triangle connectivity. With uv present, let A,B contain the separator edge and the respective component sides. Every triangle belongs to one side, and each side's triangle support is shared-edge connected: any path of triangle intersections from one side to the other must first use the common edge uv, so a triangle can reach uv entirely within its own side. Every side edge is triangle-supported there. Therefore the preceding transfer applies to S=A union B.

Triangle-free background edges of H are not used to define this separator; their endpoints and edges must still be retained for subsequent restoration. They change neither the parameters nor any conclusion about S.

## Defect-one consequence with legitimate CS induction

Assume further that S is single-edge packing-resilient, delta(S)=1, and every proper edge-subgraph of S satisfies CS. The latter premise holds for every actual triangle residual of a minimum-edge CS failure, but is not being assumed for arbitrary resilient graphs.

For the two proper separator sides, proper-subgraph CS gives delta(A),delta(B)>=0. The transfer identity

    1=delta(A)+delta(B)+epsilon

has only these possibilities:

* Both sides have defect0 and epsilon=1. Each side is tight and satisfies CS, hence B. Its triangle support is connected, so each side is one literal K4 or K5. Thus S consists of two cliques freshly glued along f.
* Exactly one side has defect1, the other defect0, and epsilon=0. The zero-defect side is one literal K4 or K5. Every edge of that clique is minimum-cover eligible, so f must be cover-ineligible on the defect-one side. Removing the tight side's private vertices leaves a connected, resilient, defect-one graph with the same proper-subgraph CS premise. Reversal is a fresh neutral clique edge attachment.

This identifies an actual removable clique region whenever a two-vertex separator exists. Its correctness is the exact transfer above; availability is conditional on the separator, not claimed universally.

Iterate the second case while a two-vertex separator exists. The supported vertex/edge count strictly decreases. Either the first case is reached, giving a literal fresh K4/K5 edge-gluing construction on reversal, or the process terminates at a connected resilient defect-one support with no two-vertex separator. It is already2-connected, and a resilient triangle support cannot be K3, so it has at least four vertices and is3-vertex-connected.

Thus every actual minimum-CS triangle residual is either in the archived fresh edge-gluing class or obtained from a3-vertex-connected resilient defect-one core by neutral fresh K4/K5 edge attachments. The former is already excluded by archived strict restoration. This leaves a specific core classification/transfer obligation rather than arbitrary clique-gluing language.

## Named cores and surviving obligation

Both W5 and K5-e have every supported edge eligible for a minimum cover. Hence neither can admit the first neutral attachment when reversing the decomposition. If either is the terminal core, the support is just that core. The W5/K5-e strict restoration proof in residual_wheel_restoration.md excludes these actual residuals as well.

Consequently, under the reviewed results just cited, any remaining actual minimum-CS triangle residual has a3-vertex-connected defect-one, single-edge-resilient core different from W5 and K5-e. The every-triangle-extends property also passes to this core: whenever nu(H)=nu(A)+nu(B), a maximum H packing containing a prescribed A triangle partitions into maximum packings on both sides, so its A restriction extends that triangle. Apply this at every peel. In contrast, no transfer of the no-two-edge-B-deletion condition is asserted. Background edges may connect vertices across peeled pieces and are not discarded from the parent restoration problem.

This is not a classification of every graph in frozenF: triangle and K4 overlaps may remain inside the3-connected core. It is not a proof of Tuza or CS. The next concrete obligation is to control such cores, or obtain a restoration-compatible replacement that retains the boundary/background response. A repeated census of already recognized fresh-edge trees does not address that obligation.

Dependencies: elementary actual-triangle accounting; proper-subgraphCS at the explicitly stated scope; K4/K5 edge eligibility; archived fresh-edge strict restoration. The transfer and recursive decomposition proofs are supplied in full above.
