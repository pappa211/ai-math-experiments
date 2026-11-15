# TUZA-17 late internal review and proof-development disclosure

This is a separate follow-up to CRITIC_ORIGINAL.md, whose bytes remain unchanged. Original mission deadline remains 2026-11-04 02:45:12 UTC. The critic was asked to inspect the newly frozen SLS/core witnesses and K4-ear reductions, then explicitly requested by the user to examine the precise AC numerical boundary. Requested configuration remains Astra / Ultra; actual serving metadata is not exposed. This is not separately commissioned independent final verification.

**Verdict:** no defect found in the late frozen results at their exact scopes. SLS and SMALL-CORE are refuted by the stated finite eligible graphs. The K4-ear minimum-cover reduction is valid, including arbitrary apex membership. The final deterministic version and the degree-two companion are sound ordinary counterexample-preserving implications. Full AC and global availability remain unresolved.

**Independence qualification:** the critic contributed the simplification of the exceptional marked K4-ear case now frozen in B_FROZEN_ADDENDUM_5.md. The coordinator and Track B scout checked that contribution. Accordingly, review of that final step is collaborative proof development, not a wholly blind audit by this critic. The earlier original critique remains a fresh no-history review. The user-requested budget-five proof in BOUNDARY_CRITIC.md was likewise developed by this critic and independently checked in-session by the coordinator; no commissioned final-audit claim follows.

## 1. Supported-link slack: exact refutation, correct target

I compared A_SLS_PROPOSAL.md with A_SLS_RESULT.md. The original assertion asks for existence of a minimum H cover with vc(L_old−C)≤D(H). The result refutes precisely that assertion, not AC.

For H=W5 with its five rim vertices marked, every rim edge supports exactly one old triangle, and every spoke supports exactly two. The exact explicit triangle-edge colouring is rainbow on all five actual triangles. The spoke upper bound gives nu(H)=2, and the triangle-incidence count gives tau(H)=3. A three-edge cover can contain at most one rim edge; hence every minimum cover leaves a C5 or a P5 in the link, requiring at least two vertices. The displayed minimum cover attains two. Thus lambda_old=2>D=1 for ALL minimum covers.

The ten minimum-cover enumeration is correct: five minimum covers consist of three spokes, and five consist of two nonadjacent spokes plus the remaining uncovered rim edge. Each edge deletion preserves an old two-packing, so the example is genuinely in the stable slack-one class. Its two-apex extension has nu=4 and tau=5. The AC budget is b=5 and lambda=2, so AC holds; no minimum-versus-arbitrary-cover failure is claimed. The exact all-cover lower bound for tau(G)=5 correctly treats the number of selected rim edges separately.

## 2. Stable slack-one core and attachment states

The initial SMALL-CORE assertion in B_INITIAL.md is universal over eligible, packing-edge-stable, triangle-connected slack-one graphs and asserts nu≤2. The eight-vertex graph in B_CORE_LIMITATION.md satisfies those hypotheses and has nu=3, so it refutes exactly that assertion.

The attachment adds a K4 on uvab with only uv old. Every new triangle is a Q face. Since two faces share an edge, at most one new face appears in any packing; the face uab avoids all old edges and appends to any old packing. Therefore the packing increment is exactly one.

The cover formula min(t_+(uv)+1,t_-(uv)+2) is correct in both directions. Restricting to old edges still covers all old triangles. With uv selected, at least one private edge is needed and ab suffices; without uv, at least two private edges are needed and an opposite pair suffices. If uv belongs to no minimum old cover, its forced-cover cost is exactly tau+1, so the total cover increment is exactly two. This is not a hidden cover exchange assumption.

Packing stability, rainbow colouring and triangle connectivity also transfer under the stated hypotheses. For a private deleted edge, use an old maximum packing avoiding uv and any surviving new face. For an old deleted edge, append a face avoiding uv. The four new faces exhaust all triangles involving the fresh vertices. The old overlap example has the unique minimum cover {01,23,45}. The first attachment gives (nu,tau)=(3,5); the next gives (4,7). The eight-vertex graph has seven minimum covers and only edge03 excluded from every one; the ten-vertex graph has 33 minimum covers and no edge excluded from all of them. The proposed iteration stops on this branch. No unbounded family or replacement bounded-core theorem is established.

## 3. K4-ear reduction: original objections and answers

### Could normalization change a minimum cover to a nonminimum one?

No. Put J=H0−uv after removing the two private tips. Restricting any ear-graph cover to J gives a J cover K. A cover without uv requires at least two private Q edges; one with uv requires at least one. Replacing the ear contribution by {uv,ab} never increases cardinality and covers every restored old triangle (through uv) and every Q face. Conversely every J cover lifts. Hence tau(H')=tau(J)+2, and every minimum J cover lifts to a MINIMUM H' cover. A normalized minimum H' cover restricts to a minimum J cover. Both directions are proved.

### Could normalization worsen the residual link?

In addendum3, both tips are outside X. No private Q edge lies in the link, and adding uv can only remove a link edge, so the normalization cannot increase the residual vertex-cover number. Together with the lift, this proves the exact lambda identity, not just one inequality.

For arbitrary markings the concern is real: if X meets Q in {u,a}, a private edge ua is a link edge and replacing it by uv,ab can restore a leaf. The proofs explicitly handle that case, rather than extending the lambda identity without justification. Triangle-freeness makes |X intersect Q|≤2, so the case list is exhaustive. Marked private vertices have no outside neighbors, preventing hidden new link edges.

### Could new apex triangles invalidate the packing identity?

The exact nu(G')=nu(G)+1 identity in addendum3 requires both tips outside X; it is not used without that premise. Addenda4/5 use only packing LOWER bounds when tips are marked. For nonexceptional markings, a Q face appends to any packing of J plus its smaller apex. Every Q-face edge is absent from that smaller graph.

In the exceptional case, set Y=X0 minus {u}. The two triangles zua and vab are actual, mutually edge-disjoint, and have NO edge in R=J+zY. The zu spoke is absent because u was removed from the marking; every other appended edge uses a removed private tip. Thus nu(G')≥nu(R)+2. A minimum J cover lifted by uv,ab, together with a residual-link vertex cover and vertex u, costs at most 2nu(R)+3≤2nu(G')−1. The extra vertex u covers both the new leaf and all old link edges incident with u. Arbitrary old outside incidence is retained.

### Does the operation require unknown optima or two hidden assumptions?

The original frozen addendum4 has a valid two-case proof according to the effect of deleting zu. I checked both directions and the minimum-cover lifts; neither case is erroneous. The later addendum5 uses the simpler deterministic choice above, supplied by this critic. It needs only AC for the explicitly smaller pair (J,Y), with Y determined solely by the marking pattern. No packing oracle, residual-slack oracle or two-branch recursion is needed. The earlier valid proof is preserved unchanged.

### Is the degree-two companion also safe?

Yes. If a has exactly the adjacent neighbors u,v, its only triangle is uva. Deleting a and uv gives J, and every cover normalizes to a J cover plus uv; hence tau(H)=tau(J)+1. The link acquires at most one leaf at marked a, since both old neighbors cannot be marked without a forbidden link triangle. Its residual cover costs at most one extra vertex. The ear triangle appends to every packing of J plus the smaller apex because all three of its edges were removed. The total cover increment at most two is paid for by a packing increment at least one. All smaller instances inherit eligibility.

Both operations strictly reduce size and preserve AC counterexamples if any exist. Neither proves an ear exists in every eligible graph. They constrain smallest AC counterexamples, not the distinct edge-minimal Tuza counterexample object without an additional global apex-availability theorem.

## 4. New independent finite checks

`checks/critic_late.py` was newly authored and imports no producer checker, exact_core.py or earlier critic program. It reconstructs complete actual triangle families, solves packing by an exact conflict recurrence, enumerates minimum covers by cardinality, and computes residual ordinary vertex-cover numbers independently.

`evidence/critic_late.json` records:

- W5: all ten minimum covers, exact (nu(H),tau(H),lambda,nu(G),tau(G))=(2,3,2,4,5), and old packing stability under each edge deletion.
- All three core stages: (nu,tau,number of minimum covers)=(2,3,1),(3,5,7),(4,7,33), complete cover lists, and each edge's packing-deletion value. The forbidden-edge lists verify the claimed finite stopping point.
- Every four-vertex old graph, every marked old edge, and every eligible marking of its six-vertex ear extension: 8,112 marked instances, including 2,976 exceptional leaf cases and 5,136 other cases. The exact cover identity, outside/nonexceptional lambda identity, exceptional residual-cover bound, actual apex packing lower bounds and resulting AC inequalities all pass. Proper four-colourability supplies eligibility for all old graphs in this finite domain and extends over the ear.

The test is supplementary: it does not replace the universal normalization or prove global ear availability. The final deterministic exceptional proof was contributed by this critic, so these independently implemented finite checks do not make its mathematical authorship blind.

The watchdog completed in 1.245 seconds, with sampled peak RSS 18,776,064 bytes and Python peak 18,825,216 bytes. Bounds were 60 seconds and 512 MiB sampled RSS, not an OS-enforced address-space cap. No process remains.

## 5. User-directed boundary review

The dedicated record is BOUNDARY_CRITIC.md, with independent finite controls in `checks/critic_boundary.py` and `evidence/critic_boundary.json`. It proves the matching-three cover bound, excludes m≥5 at budget four, retains the distinction between every minimum cover and existence at saturation, and establishes AC for b≤5 via an unbounded classification of triangle-free mu=4, vc=6 graphs and a tight-residual contradiction.

The next numerical stratum not covered by those proofs is b=6, m=5, vc(L)=lambda=7. The record explicitly separates a verified connected eleven-vertex link of those matching/cover parameters from an actual H realizing budget six. It also gives an actual easy eligible b=6,m=5 instance with vc(L)=5, which is not the hard stratum. No search-based nonexistence claim is made. Any later construction or theorem from the assigned scout must be checked separately before claiming full realizability or further eliminating that boundary.

## 6. Integrity and final status

The original review SHA-256 remains

    4c98d4569101a20bd59d89666faf15b4554a693645f6798f50ac98fd3c523d36.

Late frozen input hashes, new checker/evidence hashes and this report are recorded in `evidence/critic_late_inputs.json`. All writes by this critic are confined to the authorized private mission workspace with umask077. No historical source edits, installs, remote computation, messages to third parties or publication occurred.

Retained statuses: SLS REFUTED; SMALL-CORE REFUTED; finite attachment iteration limited to the exact checked stages; K4-ear and degree-two-ear transfer PROVED_ORDINARY at their explicit hypotheses; AC b≤5 PROVED_USING_PUBLISHED_INPUT through saturation and tight-residual transfer; full AC and global reduction availability UNRESOLVED; historical originality UNESTABLISHED; new Lean and independent_final_verification NOT_RUN.
