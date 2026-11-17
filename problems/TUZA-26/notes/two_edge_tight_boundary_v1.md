> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Tight pieces with at most two boundary edges in the minimum unknown core

Frozen ordinary candidate v1, 2026-11-16. Independent review REQUIRED. This is a proposed actual-region reduction for the reconstruction after a blocker-pair deletion. It does not assume a fresh vertex gluing or ignore shared vertices.

## Region and exact transfers

Let H be finite simple. Let D be a literal K4 or K5 subgraph. Define F to be ALL D edges belonging to some actual H triangle not wholly inside D. Suppose |F|<=2. Delete E(D) minus F, retaining every vertex and every other graph edge, and call the resulting graph K. Then K's triangles are exactly the H triangles outside D: every outside triangle uses at most one D edge, and that edge is in F; no D triangle survives since |F|<=2.

Assume either D=K5 or the two F edges, when there are two, are adjacent in D. Put r=nu(D), namely1 or2. A maximum D packing avoids all of F. Partitioning a packing by its D triangles and outside triangles, and appending an avoiding D packing, gives

    nu(H)=r+nu(K).

The same identity holds after deletion of any surviving K edge g, even g in F, because the chosen D packing avoids all F. Therefore single-edge resilience of H implies single-edge resilience of K.

For D=K5, every set A subset F lies in a minimum four-edge D cover. Optimizing an outside cover with the F edges free gives the exact formula

    tau(H)=4+tau(K-F).

For D=K4 and nonempty F with its two edges adjacent if needed,

    tau(H)=2+min_{f in F} tau(K-f).

Indeed an outside cover using no F edge requires two additional D edges; one using one F edge requires one additional D edge; one using both adjacent F edges also requires one additional D edge. Equivalently one may choose a minimum D cover containing one selected f and pay for all outside triangles not met by f. Minimizing over f gives the displayed formula, including outside covers which intentionally use both F edges. For F empty, tau(H)=2r+tau(K).

These formulas concern complete actual triangle families, not induced-vertex regions. They remain valid with arbitrary background and shared vertices.

## Consequences at the conditional minimum Q

Take H=Q, the explicitly minimized connected resilient defect-one support outside C12 inside a fixed minimum-CS G. The earlier independently checked saturation theorem and archived proper-subgraph CS apply. The removed private D edges are nonempty, so K has strictly fewer edges. Its packing is resilient. Each displayed marked-cover quantity equals 2nu(K)-1. Proper CS and monotonicity force

    delta(K) in {0,1}.

If delta(K)=1, every edge of F is cover-ineligible in K. For K5, deleting all F leaves tau unchanged, so no F edge can occur in a minimum K cover. For K4, min_f tau(K-f)=2nu(K)-1=tau(K) and deletion cannot increase tau, so EVERY f has tau(K-f)=tau(K).

If delta(K)=0, K has only literal B triangle components. If delta(K)=1, it has exactly one active connected resilient defect-one component C and otherwise B components. The active support is strictly smaller than Q and therefore in frozen C12 by Q's separate minimum, never merely by proper-subgraph CS.

Every f in F is triangle-supported in K by its definition: an outside H triangle using f survives. Hence in the delta-one case all F edges belong to C, since every edge of a tight B component is cover-eligible in K. Moreover there are no other triangle components: D can join outside components only through the edges in F, which all lie in C. Connectedness of Q's triangle family rules out any others. Thus K's triangle support is exactly C.

## Named-model ineligible-edge geometry

The following finite-family facts require independent verification or ordinary cover derivation before use. They describe the EXACT frozen C12, not an enlarged family.

- In two K4s sharing edge ab, the eligible edges are ab and the opposite private edge in each K4. The eight other edges are ineligible; each joins a or b to a private vertex. Both a,b are universal.
- In a root K4 with one K5 on ab, the four root edges joining a or b to the two other root vertices are exactly the ineligible edges. All K5 edges and the root opposite edge are eligible. Both a,b are universal.
- In a central K4 with two leaves on adjacent edges ab,ac (each leaf K4 or K5), the only ineligible edge is ad, where d is the remaining central vertex. The center a is universal.
- The three-leaf stars, two K5s sharing an edge, W5 and K5-e have no ineligible edges.

In particular every ineligible edge has a universal endpoint. Two distinct ineligible edges can occur only in the first two cases. If disjoint, their endpoints include both universal vertices, whose joining edge is a third C edge. If adjacent at a private vertex, the two universal endpoints are adjacent, again a third C edge. If adjacent at a universal vertex and their private endpoints are in the same clique, those private endpoints are adjacent. In the sole remaining case they join one universal vertex a to private vertices u,v in different K4s of the double-K4 model. Then the second universal vertex b gives the old diamond on a,b,u,v, with missing edge uv.

## The defect-one K case cannot have two boundary edges

All F edges are ineligible C edges. Suppose F has two. Since D is a clique, it contains every edge among their endpoints. Any such edge that is in C also survives in K, so it MUST be retained in F: otherwise the definition of K would have deleted it. The third-old-C-edge cases above are therefore impossible.

In the remaining diamond case F={au,av}, D contains a,u,v and thus uv. The second universal vertex b cannot lie in D, because then the old C edge ab would be a third retained edge. But bu,bv are old C edges in K. The actual triangle buv in Q is consequently outside D and uses its edge uv. By definition uv must belong to F, contradiction. This explicitly counts the crossing triangle that would be missed by treating two boundary edges as a free gluing.

Thus |F|=1, say f. Its universal endpoint in C implies D and C share exactly the two endpoints of f: any further C vertex w in D would produce an old C edge from that universal endpoint to w, a third D edge surviving K, impossible. No private D vertex can have an edge outside D in Q: that edge is triangular (Q is a support); if its triangle is outside D it survives in K, making the private vertex a C vertex, contradiction. Thus this is a genuine fresh K4/K5 edge attachment to C. Its defect remains one and resilience holds, so the archived exact fresh-edge defect-one classification puts Q in C12, contradiction. The single-edge attachment case cannot occur in the minimum unknown Q.

## The tight K case is named or has defect at least two

Now K satisfies B. Every f in F belongs to a tight component. If two F edges lay in the same component, that literal clique would contain their endpoint union; because D is also complete, a third edge among those vertices would be both in K and D, impossible after deletion of E(D) minus F. Thus distinct F edges lie in distinct K components. Triangle connectivity of Q makes these the only K components.

For D=K5 with two boundary edges, deleting F from these two distinct components reduces tau(K) by two. The exact formula gives delta(Q)=2, contradicting defect one. For D=K4, the allowed two boundary edges are adjacent; the resulting triangle family is a central K4 with two literal K4/K5 pieces attached on those adjacent edges. Each meets D only on its prescribed edge, since an additional shared vertex would give another retained D edge. The two old pieces already share the common central endpoint and cannot share an extra vertex without sharing an edge and being the same component. Thus this is exactly a fresh two-leaf C12 model. The same argument with one boundary edge gives two fresh K4/K5 cliques sharing an edge, again C12. With F empty the D family is a separate component, incompatible with connected defect-one Q.

Consequently the proposed theorem is:

    The minimum unknown Q has NO literal K5 with at most two
    outside-triangle boundary edges, and NO literal K4 with at most
    two such edges unless those two edges are opposite.

This is an actual forbidden paid region, not a claim that it is available everywhere. Its boundary is the complete set of outside-used D edges; all vertices/background remain in the deletion. The measure is supported-edge count of the active K support inside the fixed G. The comparison never leaves that universe.

## Concrete role after blocker descent

If a blocker-pair residual Q-{e,f} is resilient, its active component is named C12 and its remaining components are tight K4/K5. For a tight component D and disjoint restored edges e,f, the whole-one-base footprint lemma bounds the outside boundary by two old edges. This candidate would force every such component to be a K4 with exactly two opposite boundary edges. Those opposite-edge K4 regions are the precise remaining response obstruction; their packing cannot avoid both boundary edges at full size.

For adjacent restored edges, the two ordinary-page footprints plus the possible two-restored-edge triangle bound the old tight boundary by three edges. The two-edge cases would be excluded; the three-edge case requires an explicit geometry check (not supplied here). It may produce a literal triangle boundary and a genuine degree-three/four clique leaf. That is a concrete next argument, not an assumed availability conclusion.

All-size reconstruction from a resilient blocker residual and the no-blocker branch remain OPEN. Global R is not assumed. Combined with a future available paid reduction for every remaining Q, the fixed-G chain would prove universal CS, hence Tuza; the universal availability arrow is still OPEN.
