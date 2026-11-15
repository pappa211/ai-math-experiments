# Fresh addendum audit: asymptotic ordinary tightness and odd-cover gap

**Verdict: PASS.** Frozen at 2026-11-15T09:19:27Z by `batched_odd_fresh`. This is a short ordinary corollary review, independent of the producer's derivation, using the previously reconstructed and frozen construction and exact identities. The earlier fresh audit and manifest are unchanged.

Target: `notes/root_batched_odd_asymptotic_slack.md`, SHA256 `7cbe5c47364408799b25f683205f1e265aeb7d9afa8d9f008aadc98457a44e2d`.

The original mission clock is unchanged: start 2026-11-15T01:53:58Z, research cutoff 09:23:58Z, hard deadline 09:53:58Z. The same Darwin host and native pinned environment were used. No new mathematical computation, census, solver, Lean, environment, or external source was required. Only this review and its companion manifest were created during this follow-up.

Fix the finite seed S first and gamma in (1/2,1), then take the same unbounded amplifier sequence and even q. The verified bounds are h<=N, 1<=g_i<=q, k<=h/q+r, q=o(N), and Nq=o(b). Since L_i=2(q+g_i+3)<=4q+6, each local graph has e_i=O(q^2) edges, uniformly over the permitted g_i. Therefore

    |E(W) minus E(H)|<=sum_i e_i=O(k q^2)
       =O_S(Nq+q^2)=O_S(Nq).

This upper bound harmlessly counts shared A-edges more than once. Also |t_i-a|=O(q^2), so the exact cover constant B=sum_i(t_i-a)+a is O_S(Nq). Its explicit expansion in the earlier audit is nonnegative, although only the absolute bound is needed for the limits.

An old maximum packing remains a W-packing, giving nu(W)>=bnu(S). The verified upper bound nu(W)<=bnu(S)+sum_i floor(e_i/3)+qh/2 gives

    nu(W)=bnu(S)+O_S(Nq).

Together with the exact identities tau(W)=btau(S)+B and pi(W)=b beta(S)+B, and Nq/b -> 0, these yield

    nu(W)/b -> nu(S)>0,
    tau(W)/b -> tau(S)=2nu(S),
    pi(W)/b -> beta(S)>2nu(S).

The denominator limit is positive because the seed contains a K5 block. Quotient limits consequently give

    tau(W)/(2nu(W)) -> 1,
    pi(W)/nu(W) -> beta(S)/nu(S)>2.

The earlier explicit full-batch packing proves tau(W)<2nu(W) for every sufficiently large sequence member. Thus the first ratio approaches 1 from below in the stated sense; no monotonic convergence is asserted or needed. If d=beta(S)/nu(S)-2>0, choose eta=d/2. Convergence then gives pi(W)>(2+eta)nu(W) for every sufficiently large member. The constant depends on the fixed seed; there is no asserted uniform numerical eta.

The graph, TF property, connected non-WKE links, and almost linear universal-vertex and triangle-codegree thresholds are unchanged. The interpretation about near equality is correct for relative ordinary tightness: the family has tau/(2nu) tending to 1 while retaining a fixed multiplicative odd-cover excess. This does not prove small absolute additive slack, does not concern actual violating graphs, and supplies no exact minimal-counterexample arithmetic or resilience.

No correction is required. This remains ordinary mathematics with AI review, not a huge generated graph, Lean certificate, human verification, novelty determination, H-O2 result, or resolution of unrestricted Tuza. Target and dependency hashes, including both earlier frozen review files, were checked before and after this write and left unchanged. All work on this follow-up stops at this freeze.
