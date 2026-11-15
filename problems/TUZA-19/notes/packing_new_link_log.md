# Reactivated link-reduction pass

Parent task: a conceptual pass on minimal-counterexample vertex splitting, WKE links, and explicitly paid grouped reductions; maximum35 minutes, original TUZA-19 clock unchanged. First clock read for this pass: 2026-11-15 04:56:21 UTC. Active research stopped after roughly15 minutes because no global payment mechanism emerged.

Primary source consulted: Gregory J. Puleo, arXiv:1308.2211v3, https://arxiv.org/pdf/1308.2211v3, Definitions2.1/4.1 and Lemmas2.2/4.4. The reducible-set and WKE mechanisms are attributed to that source. Local source controls: notes/root_triangle_full_criticality.md, notes/global_routes_k11_control.md, notes/codegree_two_tf_resilience_counterexample.md, and the retained literal TF decoration receipt. Public baseline and old archives were read-only.

Proposed operation and weakest link: for every v and link matching M, the standard lift has debt d=vc(L-M)-|M|. It succeeds exactly under the sufficient accounting inequality sigma(H)+2g>=d, H=G-v-M, sigma=2nu(H)-tau(H), g=nu(G)-nu(H)-|M|. An actual minimal violation has sigma+2g<=d-1. No availability theorem forcing a violating choice of v,M was found. General grouped certificates have the same debt ledger. Induction only gives nonnegative residual slack, not the amount needed.

Consequential attacks and results:
- General reducible U in K_n must have r=|U|>=(2n-1)/13, even when its compatible packing is anywhere in G. More generally a certificate borrowing b units obeys2n<=13r+1+6b/r. Complete proof uses all graph triangles and elementary packed-edge resource counts.
- Elementary doubling of a C4-leave packing constructs K_(6*2^j-1), all of which are TF, edge-cover-critical, and two-edge packing-resilient. Therefore no bounded-size general reducible-group gate follows from these premises. These controls have substantial Tuza slack, not the arithmetic of an actual violation.
- K11 residual K10-minus-perfect-matching has nu12, tau16, slack8, paying WKE deficit3. K5 has debt0. The existing72-vertex TF decoration has60 fresh K4 links and hence explicit WKE vertices. These controls validate payment where it is actually present, but provide no universal source of payment.
- Pure vertex-split repair h<=2 packing loss fails on EVERY nontrivial K5 neighbor partition. Allowing unspecified residual slack does not cure availability: splitting off a single neighbor is equivalent to edge deletion, and under criticality/resilience its paid condition is exactly the original Tuza inequality.

Producer verification command, run once and PASS:

    source LOCAL_ENVIRONMENT
    python checks/packing_new_link_debt.py

Scope: all15 partitions of four neighbors in the fixed K5; complete-family construction through orders5,11,23; literal K11 residual packing/cover and lifted29-cover; reconstruction of all240 triangles and60 fresh links in the one retained decorated graph. Full literal edge/triangle and positive certificate lists are in evidence/packing_routes/packing_new_link_debt.json, with a hash pointer to the already retained full decorated graph. No broad census, SAT process, Lean process, or remote computation was run. No test failure occurred. The all-size theorem and recursion are ordinary proofs; finite checks do not substitute for them. Independent review is pending.

Decision: freeze this pass and stop active work. The unresolved obligation is a structural argument providing enough residual slack or extra compatible packing gain at SOME local/grouped reduction of a genuine minimal violation. Neither TF, two-edge resilience, nor the exact triangle-deletion arithmetic was converted into such a payment. No unrestricted proof or counterexample is claimed.

Original start2026-11-15T01:53:58Z; research cutoff09:23:58Z; hard deadline09:53:58Z. Requested Astra/Ultra; exact serving metadata unexposed. Private Darwin workspace only. No new approval questions or user-facing external messages were required.

Frozen at 2026-11-15T05:11:47.234167+00:00
