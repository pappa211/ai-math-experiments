# Exact odd-cover identity for the batched obstruction

This is a short ordinary strengthening of the frozen proof notes/root_batched_odd_cover_obstruction.md (SHA240f03702de1bc3f2deadb1be99307c27de26849607b2bd50e8ecd2cffcca4f7). It does not change the construction or any scope boundary.

In that proof, H is a role-labelled amplification of the fixed seed S, and each batch lies inside one independent role part. Its exact formula is

    pi(W)=B+min_z[uncut_H(z)+sum_i u_i(g_i-u_i)].

Every coloring has uncut_H>=b beta(S), and all batch penalties are nonnegative. Conversely take the role-consistent lift of an optimal coloring of S. It attains uncut_H=b beta(S), and every batch is monochromatic, so every penalty vanishes. Hence the exact identity is

    pi(W)=B+b beta(S),
    tau(W)=B+b tau(S)=B+2b nu(S).

In particular the exact ordinary-versus-odd gap is

    pi(W)-tau(W)=b[beta(S)-tau(S)]>0.

The separate upper and lower packing bounds in the frozen proof establish tau(W)<2nu(W)<pi(W) for sufficiently large parameters. An exact value of nu(W) is not supplied or needed. Two-edge packing resilience remains unestablished, so no H-O2 counterexample is claimed.

This equality was independently observed by global_routes and the fresh odd-cover reviewer after the producer proof was frozen. No computation or additional theorem is required.
