# Independent expensive vertices in a matching root

Coordinator derivation, shared with Investigator B after blind freeze. Recorded 2026-11-02T13:46:02.341546+00:00. Status: PROVED_ORDINARY as an elementary consequence of Tutte–Berge; novelty unverified. Not a Lean result.

## Lemma

Let H be a finite loopless multigraph, S an independent vertex set, and w(v)=2 for v in S, w(v)=1 otherwise. Then the minimum weighted vertex-cover cost is at most 2 mu(H), where mu is maximum vertex matching. Parallel edges do not affect either parameter, so apply Tutte–Berge to the underlying simple graph.

Choose A subset V(H) attaining the Tutte–Berge formula 2mu(H)=n+|A|-q, where q is the number of odd components of H-A. Let t be the number of those odd components containing a vertex of S. Form I from S-A, together with one arbitrary vertex from each of the q-t odd components disjoint from S. This is an independent set: S is independent and the added vertices occupy distinct components of H-A containing no selected S vertex. Its weight is

w(I)=2|S-A|+q-t >= |S-A|+q >= |S|+q-|A|.

Therefore its complementary vertex cover has weight at most

n+|S|-w(I) <= n+|A|-q = 2mu(H).

This is a constructive consequence once a Tutte–Berge barrier and representative vertices are supplied. It does not require H to be bipartite, perfect, or have bounded degree. Equality examples include a star with its center in S and at least two leaves.

## Interaction defect

For arbitrary S (not necessarily independent), let R be a minimum vertex cover of H[S]. Lower the weight of R from 2 to 1, leaving S-R as the independent weight-2 set. The lemma gives a cover of adjusted weight at most 2mu(H). Restoring weights adds at most |R|. Thus

weighted_vc(H; 1+1_S) <= 2mu(H)+vc(H[S]).

This is a proved inequality, not a universal Tuza bridge. Creating an appropriate matching root for arbitrary graph triangles remains unavailable.

## Use in the claw-free triangle-graph investigation

The proposed explicit multigraph root has one cost-2 hub per nonexceptional K4, shared-edge nodes and private leaves of cost1, and one root edge per graph triangle. Cost2 hubs form an independent set. A selected hub can be realized by two opposite actual edges of its K4; a selected shared-edge node has its actual graph-edge label; a private leaf can be paid by any actual edge of its one associated triangle. Thus a root vertex cover produces a real graph-edge triangle cover of no greater cost.

If the separately proved root construction is correct, nu(G)=mu(H), so the lemma proves tau(G)<=2nu(G) for that class. Isolated K5 and K5-e triangle components are handled separately. Investigator B also found a simpler local two-edge closed-neighborhood proof in this class, so this weighted lemma is an alternative tool, not claimed necessary.

The missing global bridge is substantive: arbitrary triangle-conflict graphs have claws and cannot be line graphs. An exchange or expanded state representation would have to remove those claws while controlling the exact weighted-cover defect. Naming that defect is not a proof that it can be paid.
