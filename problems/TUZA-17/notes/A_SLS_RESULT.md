# SLS is false: a complete eligible six-vertex obstruction

Verdict: **REFUTED** for the exact supported-link slack assertion frozen in A_SLS_PROPOSAL.md. **AC is not refuted**: the same graph satisfies AC. The coordinator suggested the wheel seed after this follow-up was assigned; the Track A agent independently reconstructed its triangles, colouring, optima, all minimum covers and state arithmetic. This is a shared-context follow-up, not a blind independent audit. Independent final verification NOT_RUN.

## Exact graph, link and colouring

Let H have vertices 0,1,2,3,4,5. Vertices 0,...,4 form the cycle C5, and 5 is adjacent to all of them. Thus

    E(H) = {01,04,05,12,15,23,25,34,35,45}.
    X = {0,1,2,3,4}.
    L = H[X] = C5.

Every L edge lies in an H triangle, so L_old=L. Its complete actual triangle family is

    015,125,235,345,045.

No other triangle exists, since the rim C5 is triangle-free. An explicit eligible triangle-edge-3-colouring is

    edge: 01 04 05 12 15 23 25 34 35 45
    colour:2  1  0  2  1  2  0  0  1  2.

Every listed triangle has colours {0,1,2}. Thus this is the required triangle-edge colouring, not a substituted vertex-colouring condition. The link is induced and triangle-free, and every link edge genuinely interacts with an old triangle.

## Exact old optima

Every H triangle uses two of the five spokes at vertex5, hence nu(H)<=2. Triangles015 and235 are edge-disjoint, giving nu(H)=2.

Every graph edge belongs to at most two of the five triangles. Two cover edges can therefore hit at most four triangles. Thus tau(H)>=3. The set

    C={05,25,34}

covers all five triangles, proving tau(H)=3. Consequently D(H)=2*2-3=1.

## Every minimum cover fails SLS

Any minimum H cover has three edges. If it contained at least two rim edges, its triangle coverage would be at most 1+1+2=4 (and at most3 for three rim edges). Therefore every minimum cover contains at most one rim edge.

If it contains no rim edge, then L-C=C5 and vc(L-C)=3. If it contains one rim edge, then L-C is the path on five vertices and vc(L-C)=2. Therefore every minimum cover has residual vertex-cover number at least2. The displayed C has exactly one rim edge, and {0,2} covers L-C, attaining2. Hence

    lambda_old(H,L)=2 > D(H)=1.

This defeats the existential quantifier over ALL minimum covers. It does not rely on selecting one poorly chosen minimum cover. More explicitly, there are exactly ten minimum covers: five sets of three spokes whose omitted rim vertices are independent, and five sets comprising two nonadjacent spokes plus the unique remaining uncovered rim edge. The exhaustive certificate lists every one.

## The graph is packing-edge-stable despite slack one

Deleting a rim edge removes one page and leaves a two-page packing, since C5 minus one edge has a matching of size2. Deleting a spoke at rim vertex i removes its two incident pages; the remaining bases form C5-i, a four-vertex path with a matching of size2. Thus

    nu(H-e)=nu(H)=2 for every e in E(H).

So SLS is already false on the packing-edge-stable D=1 class. The additional essential-edge hypothesis in the earlier positive D=1 theorem is absent here, exactly as required. This is an obstruction to that stronger slack-only intermediate rule, not to AC on stable D=1 graphs.

## Exact apex state and why AC survives

Add vertex6 adjacent exactly to X. Then G=I2 join C5. Its complete ten-triangle family consists of the five pages at5 and the five at6.

Each apex can support at most two packing triangles because their bases form a C5 matching. Hence nu(G)<=4. The four triangles

    015,235,126,346

are edge-disjoint, so nu(G)=4 and a=4-2=2. Consequently the AC residual budget is

    D(H)+2a=1+4=5.

The same minimum cover C={05,25,34} leaves residual vertex cover {0,2}, so its compatibility cost is3+2=5<=2nu(G)=8. AC holds comfortably.

In fact tau(G)=5. For any cover let F be its chosen rim edges. At each apex its chosen spokes must cover C5-F, so its size is at least |F|+2vc(C5-F). For |F|=0,1,2,3,4,5 the corresponding lower bounds are respectively6,5,6,5,6,5: a three-edge subgraph of C5 cannot have vertex cover1, while the other bounds follow immediately from the remaining paths. Thus every G cover has size at least5. The set {05,25,34,06,26} attains5. A nonminimum old H cover consisting of all five rim edges also covers G with5 edges, but does not improve on the compatible minimum old cover. No minimum-versus-all-cover discrepancy in the AC inequality is asserted.

## Consequence for the surviving proof task

The supported link cannot generally be paid for from D(H) alone. Apex packing gain can be necessary even when every link edge is old-supported and H is packing-edge-stable with D=1. This is a genuine interaction obstruction to SLS.

The witness does not reach the current difficult AC numerical window: m=mu(L)=2 and b=D+2a=5, while the first remaining frontier requires m=b-1>=4 (after the already proved small-budget cases). In particular it supplies no counterexample to a minimum-cover compatibility theorem for stable slack-one residuals in that frontier. Any future proof must couple old-supported link states with the actual packing gain; separating their budgets as SLS does loses valid instances. We do not introduce a patched SLS statement, enlarge constants until tests pass, or recommend a new campaign on this one counterexample.

## Evidence and reproduction

`checks/a_sls_w5.py` reconstructs every actual H and G triangle, checks the explicit edge colouring and induced-link eligibility, exhaustively computes both packing and cover optima, lists all ten minimum H covers, computes each residual ordinary vertex-cover number, and verifies a two-packing after each of the ten H edge deletions. It imports no historical checker or optimisation library. All arithmetic and set checks are exact.

Saved evidence: `evidence/a_sls_w5.json`, `evidence/a_sls_w5.log`, and `evidence/a_sls_w5.limits.json`. The run applied20s CPU/alarm bounds and the existing inspected watchdog with30s wall and256MiB sampled-RSS bounds. It completed normally; no process remains. The ordinary proof above establishes the finite optimality claims independently of merely trusting the program's conclusion.

From the mission workspace:

    source LOCAL_ENVIRONMENT
    python checks/run_bounded.py 30 256 evidence/a_sls_w5.log python checks/a_sls_w5.py

The exact SLS assertion is REFUTED/FINITE_CHECKED with a complete ordinary witness proof. The literal AC target retains its existing unresolved global status.
