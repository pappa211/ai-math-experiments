# Exact nonincreasing single-pivot repair of the connected-chain control

Status: ordinary corollary reconstructed in TUZA-19 from the frozen TUZA-18 connected-chain family. It concerns only that family and specified packing/initial cover. It is not an unrestricted repair theorem, Lean verification, human review, or originality claim. A bounded local check corroborates it for N=2 through ten.

Use the notation and construction in `chain_archive_audit.md`. Every block initially has heavy H_i=012_i and light L_i=345_i. Call the replacement 23_i to 35_i its odd pivot. It preserves the local minimum support-cover size eight, keeps H_i heavy, and changes its unique light member to J_i=237_i.

**Claim.** Starting at the product of C0, pivot blocks 1,3,5,... in that order. This gives exactly ceil(N/2) one-edge replacements through minimum support covers. Hall deficiency equals one at every state before the last pivot and zero after it. No shorter sequence of one-edge replacements can reach compatibility from the initial cover.

After k pivots, provided 2k<N, blocks 1,...,2k can be paired in adjacent odd/even pairs. For each j=1,...,k use matching edges

    H_(2j−1) -- L_(2j),     H_(2j) -- J_(2j−1).

The first intersection is 0_(2j−1)=5_(2j); the second is 7_(2j−1)=1_(2j). These edges saturate all heavy and light members in the completed prefix. In the unchanged suffix use H_i--L_(i+1) for i=2k+1,...,N−1. Together these give a matching of size N−1, so the deficiency is at most one.

Before the final pivot the last heavy H_N is isolated. Its local light is still 345_N and disjoint from it. The light in block N−1 is also still its old 345_(N−1), because the last pivot is block N−1 when N is even and block N when N is odd; the old light avoids the outgoing vertices 0_(N−1),7_(N−1). No nonadjacent block intersects block N. Thus H_N has no light neighbor, proving deficiency at least one. This establishes equality at every unfinished state, including the initial one.

For even N the last pivot completes the final odd/even pair, and the displayed paired matching saturates all N heavy and light members. For odd N the last pivot produces J_N, which meets H_N at vertex 2_N; append this internal matching edge to the completed prefix matching. The final deficiency is zero in either case.

Every pivot removes exactly one selected support edge and inserts exactly one other, preserving the actual triangle-cover property because it moves between two local minimum P4-cover states. The number of pivots is ceil(N/2). The frozen exact-distance lower bound says every compatible minimum cover differs from the starting cover in at least 2 ceil(N/2) support edges. Each one-edge replacement changes symmetric difference by at most two, so no shorter sequence can reach one. The presented sequence is therefore optimal in number of moves.

The intermediate unmatched suffix light need not be isolated: it can have a neighbor across the completed-prefix boundary. The lower-bound argument correctly uses isolated H_N, rather than claiming the first suffix light has no prefix neighbor.

This resolves the control family under nonincreasing plateau moves. It does not show that arbitrary minimum support covers admit such a path, that their reconfiguration graphs are connected, or that any compatible minimum support cover always exists for arbitrary maximum packings. Any global route needs one of those missing statements with its exact hypotheses. The existing chain obstruction alone cannot decide them.

Reproduction of the finite check:

```sh
source LOCAL_ENVIRONMENT
python -I evidence/source_audit/chain_reconstruction_check.py
```

Run from the TUZA-19 workspace before the original mission cutoff. Its clock assertion deliberately prevents treating the saved command as permission for post-mission research.
