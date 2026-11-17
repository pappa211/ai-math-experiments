> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Actual-parent successor: the proposed B branch is already closed

One-page decision/discriminator note, TUZA-26. No new search or historical survey was started. Only the exact restoration source and its independent review were checked.

**Literal hypotheses.** Let G be a minimum-edge failure of combined CS, with nu(G)=k and tau(G)=2k, all proper edge-subgraphs satisfying CS. Take ANY actual edge-disjoint triangles T,U; they may share one vertex. The archived simultaneous-extension theorem gives

    R=G-E(T)-E(U), nu(R)=k-2.

Cover extension and proper CS give 2k-6<=tau(R)<=2k-4, so its defect is 0,1,or2. If R is B, writing m=k-2 gives the precise restoration profile

    G=R+E(T)+E(U), nu(G)=m+2, tau(G)=2m+4.

**Status: PROVED_ARCHIVED, not a new successor.** The exact frozen TUZA22 theorem states full CS for B plus two edge-disjoint missing triangles, with arbitrary old clique components, background, and outside incidence. Its lower equality branch is exactly the displayed gain-two/cover-four profile and concludes B(G). The independent review explicitly reconstructs that branch for disjoint triangles and for one shared vertex. Thus the proposed R=B discriminator is already available and contradicts the chosen non-B G. In the actual-parent task only defect-one and defect-two R remain. Simultaneous extension itself already relies on the SAME full theorem, so this is a reuse of its full scope, not an additional independence claim.

**Mandatory equality control.** In K5 on abcde, take T=abc and U=ade. They share a and are edge-disjoint. R is the triangle-free K2,2 on {b,c} versus {d,e}, plus isolated a: nu(R)=tau(R)=0. Restoring the two triangles gives nu=2,tau=4 and B(K5). This is precisely the allowed complete-four-cross-edge case in the archived lower-branch proof. The correct conclusion is B(G), not impossibility of equality. K5 packing two is explicit; three would leave a one-edge complement and violate even triangle-union degrees. Four cover edges suffice by a 3+2 partition, while three hit at most nine of ten triangles.

**Ranked genuine next discriminator, subject to critic approval before work.** The nearest nonduplicative actual-parent branch is: suppose R has defect one and is fragile at e. Proper CS then gives

    B=R-e, nu(B)=k-3=m, tau(B)=2m;
    R=B+e, nu(R)=m+1, tau(R)=2m+1;
    G=B+e+E(T)+E(U), nu(G)=m+3, tau(G)=2m+6.

Here e lies outside both restored triangle edge sets and already creates a triangle in B+e. It may have arbitrary endpoint incidence with T,U. A paid exclusion/classification of THIS gain-three/cover-six seven-edge restoration would prove resilience of a defect-one actual double-triangle residual. The two-triangle theorem does not apply directly, since its predecessor B+e is defect one rather than B. No defect-two graph may be named, and merely obtaining resilience would still leave the subsequent actual-parent availability/naming bridge open.

A tight-B admission control for that next interface is disjoint K4 and K5: delete a triangle from each and delete the book spine in the K5 remainder. B is triangle-free, restoring the spine gives nu=tau=1, and restoring the two triangles gives nu3,tau6 with B(G). Any proposed equality theorem must retain this B outcome. This is a proposed scope check only, not authorization for a new catalogue or an assertion that the seven-edge theorem has been proved.

**Exact source pins.** TUZA22 `notes/two_triangle_restoration_v1.md`: SHA256 `12121facd2e02c4dd79ec488698ffb7153c7c810b6a76219302c0efdd11c07c7`; its `review/two_triangle_restoration_independent_review.md`: `f716b04d855d19e62788e9caa85aa927826eab2053682897280344d716b53ba9`. The copied simultaneous-extension note in TUZA25 `sources/tuza22_initial/9_two_triangle_extension_minimal_v1.md`: `5d04171d00d09db1759ae058df20155f942f3aa2f714b5ce662b9b8cd5f5be97`; its independent review: `ed4005749adec37374132cda3fecb1bc82f46f571c3105e89d73fcf0a994afa2`. Full absolute paths and integrity hashes are retained in evidence/apex_source_paths.json. No computation was run.
