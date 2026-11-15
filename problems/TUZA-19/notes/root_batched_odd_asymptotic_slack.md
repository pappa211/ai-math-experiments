# Asymptotic ordinary tightness of the batched odd-cover obstruction

This is an ordinary corollary of notes/root_batched_odd_cover_obstruction.md and notes/root_batched_odd_cover_exact_identity.md. Fix the finite seed S and exponent gamma in(1/2,1), then let the explicit amplifier parameter grow.

The new edge count is O_S(Nq): each local graph has O(q^2) edges, there are at most h/q+r batches, and q=o(N). Consequently the cover constant B is O_S(Nq), and the frozen packing bounds give

    b nu(S) <= nu(W) <= b nu(S)+O_S(Nq).

The lower bound is just the old packing; the stronger full-batch certificate separately proves strict ordinary slack. Since Nq=o(b), the exact cover identities imply

    nu(W)/b -> nu(S),
    tau(W)/b -> tau(S)=2nu(S),
    pi(W)/b -> beta(S)>2nu(S).

In particular

    tau(W)/(2nu(W)) -> 1 from below,
    pi(W)/nu(W) -> beta(S)/nu(S)>2.

Thus a fixed constant eta>0 exists (depending on the fixed seed), such that all sufficiently large members have pi(W)>(2+eta)nu(W), while tau(W)<2nu(W) and their ordinary ratio approaches the conjectured bound. TF, connected non-WKE links, and the almost linear universal/codegree threshold are unchanged. There is no uniform numeric eta independent of the seed and no two-edge-resilience or H-O2 claim.

This observation explains why an odd-cover argument cannot be repaired merely by asking for near equality in ordinary Tuza on the normalized class. It says nothing about actual violating graphs, which have positive defect, or about the additional exact minimal-counterexample conditions.
