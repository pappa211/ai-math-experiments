> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# Route A: exact criticality consequences

Status: PROVED ordinary implications, independently reconstructed during TUZA-07; the source-era review records FINAL_REPORT_AUDIT_A.md and REPORT_DRAFT_INDEPENDENT_AUDIT.md are historical records not included in this public archive. No Lean check. These deductions do not use global equality classification. Novelty is not established.

## Definitions and hypothesis

G is a finite simple graph that violates Tuza and is edge-minimal among actual violations: tau(G)>2nu(G), and every proper edge-subgraph satisfies Tuza. Isolated vertices are irrelevant. Set k=nu(G). This is different from an edge-minimal failure of Tuza plus the K4/K5 equality classification.

## A1. One-edge criticality — PROVED

For every edge e:
nu(G-e)=k, tau(G-e)=2k, tau(G)=2k+1.

Proof. A deletion lowers nu by at most one and tau by at most one. If nu(G-e)<=k-1, then tau(G)<=tau(G-e)+1<=2k-1, contradiction. Thus nu(G-e)=k. Minimality gives tau(G-e)<=2k, while tau(G)<=tau(G-e)+1 and tau(G)>=2k+1 force both asserted cover equalities.

There are no edges lying in no triangle. Otherwise deleting one preserves both optima, leaving a smaller violation. There is only one nonempty shared-edge triangle component: if several existed, each support subgraph is proper and satisfies Tuza; additivity would prove Tuza for G.

## A2. General edge-deletion resilience — PROVED

For every nonempty S subset E(G),
nu(G)-nu(G-S) <= floor((|S|-1)/2).

Proof. Deleting S lowers tau by at most |S|, so
2k+1-|S| <= tau(G-S) <= 2nu(G-S).
Rearrange and use integrality.

In particular, deleting any one or two edges preserves the maximum packing number. Every set of edges meeting every maximum packing has at least three edges. This is a necessary condition, not an unconditional property of tight graphs.

## A3. Every one- or two-triangle packing extends — PROVED

Let P be p pairwise edge-disjoint G triangles with p=1 or p=2. Then
nu(G-E(P))=k-p.
Consequently P is contained in some maximum packing of G.

Proof. A maximum packing in G-E(P) can be appended to P, so nu(G-E(P))<=k-p. A2 with |E(P)|=3p gives the opposite inequality for p=1,2 because floor((3p-1)/2)=p.

For p=1, H=G-E(T) satisfies
nu(H)=k-1, tau(H)=2k-2, sigma(H)=0.
For p=2, H=G-E(P) satisfies
nu(H)=k-2, tau(H) in {2k-5,2k-4}, sigma(H) in {0,1}.

The cover lower bound is tau(G)-3p; the upper bound is proper-subgraph Tuza. A packing of two edge-disjoint triangles can only exist if k>=2; if k=2 the formally listed cover value -1 is automatically impossible.

For p=3, A2 only gives k-4<=nu(G-E(P))<=k-3. Thus the first possible failure of extension of a prescribed triangle packing occurs at three triangles. This is a parallel but distinct frontier from adding a third missing graph edge.

## A4. Nested tight residual and exact wedge loss — PROVED

Take any triangle T=uvw of G, e=uv, H=G-e, and F={uw,vw}. Then:
nu(H)=k, tau(H)=2k;
nu(H-F)=k-1, tau(H-F)=2k-2;
nu(H-f)=k and tau(H-f)=2k-1 for each f in F.

The first two lines are A1 and A3. The packing assertion for deleting e and f is A2. Cover deletion by three triangle edges drops tau by exactly three, so every intermediate deletion along those three edges drops tau by exactly one.

In particular every maximum packing of H meets F. If one avoided both spokes, appending uvw would give k+1 triangles in G. The exact loss of one requires the minimal-counterexample hypothesis, not just that F blocks maximum packings.

## A5. Minimum triangle codegree two — PROVED, known predecessor

Suppose uv belongs to only triangle uvw. Delete uw and vw to obtain K. The edge uv is triangle-free in K, so every K packing appends uvw; hence nu(K)<=k-1. But A2 says deleting two edges preserves k, contradiction.

Thus every edge is in at least two triangles. Equivalently every vertex in each vertex link has degree at least two. This does NOT prove codegree at least three.

## Limitations

The hypotheses involve an actual minimal counterexample. No such graph is known. These identities expose necessary obstruction structure; they do not show it is impossible. Claiming that the residual tight graphs have K4/K5 support would import the unrestricted equality conjecture.

The two-triangle extension fact is degree-independent but is a short consequence of the standard packing-covering inequalities, and may be known. It should not be promoted as a new structural theorem without specific prior-art comparison.
