# Minimum-cover / eligible-packing exchange route: normalization and a rejected local gate

Ordinary research lane, requested Astra/Ultra; actual precise serving identity is not independently exposed. Original TUZA-19 clock retained (start 01:53:58Z, research cutoff 09:23:58Z, hard deadline 09:53:58Z, 2026-11-15). Computation stayed local on Darwin. No new global Tuza or S/E claim is made. No Lean or human review was performed.

## Sources and scope

Read the pinned published TUZA-14B definitions and relevant mixed-packet, exact-repair, fractional and signed-cut sections at `d4029fbafc3dffc250b50ed237ad81c3206cd1a0`: `README.md`, `PROOF_AND_OBSTRUCTIONS.md`, `notes/TRACK_A.md` A0–A8, and `notes/TRACK_B.md` §§9–11. Exact full-file hashes are in `evidence/mincover_eligible/source_manifest.json`. Some initial batched output of the long notes was truncated; the relevant A and B portions were then read in focused calls.

The published subtree has no `REPORT.md` or `RESEARCH_LOG.md`. The private TUZA-14B report was read at `LOCAL_ENVIRONMENT`, with observed repository HEAD `43ff4ae91f2b51ce1a70cce69e5e2290f2fc1a24`. No `RESEARCH_LOG.md` exists in that private subtree either; its chronological Track A/B notes provide the relevant history. Current TUZA-19 `RESEARCH_LOG.md` was read before the new-route claims. All historical access was read-only, using `git --no-optional-locks` where Git was invoked.

For a globally minimum triangle edge cover C, color C red and its complement blue. An eligible triangle has one or two red edges. Write c=|C| and k for the maximum eligible packing size. S asks k>=ceil(c/2) for every minimum C; E asks it for some minimum C. Both remain open generally. They would imply Tuza because eligible packings are actual edge-disjoint triangle packings. The old private-only failure, mixed-packet existence gap, all-red fractional-mass failures and full-packing-preservation obstructions remain in force.

## Candidate mechanism and exact global implication

Choose a maximum eligible packing P, optionally maximizing the number r of red edges used among packings of size k. Let p1,p2 count its one-red and two-red triangles, and U be the unused red edges. Then

    k=p1+p2, r=p1+2p2, |U|=c-r,
    c-2k = |U|-p1.

Thus an injection from unused reds to the p1 one-red packed triangles would establish S. The intended role of an alternating closure was to build such a charge assignment using actual private witnesses, while allowing the packed two-red triangles to branch into their two edge-disjoint private witnesses. This normalization targets the needed threshold directly and does not demand that a maximum eligible packing extend to a maximum full packing.

The tempting local gate was:

> From every maximum eligible packing that maximizes red-edge coverage, every unused red label can be introduced by a sequence of cardinality-preserving replacements changing at most two old triangles at each step.

This gate would be only an ingredient for the charge injection, not by itself a proof of Hall's condition. It is nevertheless false, even in K7. The exact fixed witness below closes this shallow version decisively.

## K7: a maximum eligible packing isolated under one- and two-member trades

Partition the seven vertices as A={0,1,2}, B={3,4,5,6}. Let C contain every edge inside A or B, so |C|=3+6=9. Its blue complement is K3,4, with twelve edges, and is triangle-free. C is globally minimum: any triangle-free graph H on seven vertices has at most twelve edges. For completeness, for every edge uv of a triangle-free H, d(u)+d(v)<=7. Summing over its h edges gives sum_v d(v)^2<=7h, while Cauchy gives sum_v d(v)^2>=(2h)^2/7. Hence h<=49/4 and the integral edge count is at most twelve. A cover of K7 therefore needs at least 21-12=9 edges.

Every eligible triangle has exactly one red edge and two blue edges. Consider

    P={034,056,135,146,236,245}.

These six triangles are edge-disjoint, use all twelve blue edges and use all six red edges inside B. The two-blue budget proves k=6. All eligible packings have one red edge per triangle, so P also maximizes red-edge coverage among maximum eligible packings. Its unused red labels are precisely 01,02,12.

Any other eligible six-packing must again use every blue edge. Hence a cardinality-preserving replacement has to repartition exactly the blue edges released by its removed members.

A one-member replacement cannot be nontrivial: its two freed blue edges uniquely determine the old triangle.

For a two-member replacement, a new triangle whose red edge lies in B would have to use one of the two freed B-red edges, because every other B-red edge is still occupied. Such a red edge can be paired with its two freed blue spokes only at its original A vertex; at the other removed triangle's A vertex, this would require the same B-pair as the other old member, impossible because old red edges are distinct. Thus any new triangle of this kind equals an old member. If both genuinely new triangles instead use red edges inside A, the only possible A-red edge is the pair of the two removed members' A vertices. Both new triangles would then share that red edge, which is forbidden. Therefore no nontrivial two-member trade exists.

Nevertheless there is a three-member trade:

    remove {034,135,245}; add {013,024,125}.

The resulting six-packing is eligible and introduces all three previously unused red labels at once. No intermediate maximum packing can reach it through one- or two-member trades because P has no first such move.

A weaker direct private-witness projection already fails: for each unused A-edge ij, its four private witnesses are ijb with b in B. Their two blue edges belong to the two distinct members of P centered at i and j. Every such witness therefore hits exactly two packed triangles, never a single old member.

The literal checker `checks/mincover_eligible_trade.py` independently enumerates all 35 actual triangles, identifies the eligible family, verifies the cover and packing certificates, and exhausts all changes of exactly one, two or three old members. Its retained result is:

    exact nontrivial neutral trades: size 1 -> 0, size 2 -> 0, size 3 -> 4.

Full graph, C, P and every three-member trade are in `evidence/mincover_eligible/trade_results.json`. Reproduce from the mission workspace:

```sh
source LOCAL_ENVIRONMENT
python3 checks/mincover_eligible_trade.py
```

This is a fixed, small diagnostic witness, not a new census. It is not a Tuza or S/E counterexample: c=9 and k=6, comfortably above the target ceil(9/2)=5. Historical originality is unassessed. Earlier TUZA-14B already used K7 for a different full-packing/cover-cardinality obstruction; this calculation does not replace or strengthen that claim automatically.

## Why unrestricted closure has not advanced the global proof

For an admissible red set S containing no all-red triangle, the exact old repair identity is

    beta(S)=|F(S)|+vc(H_S) >= |S|,

where F(S) is forced by two-red triangles whose red pairs are removed, and H_S encodes the remaining unhit private blue pairs. A proposed closure built from private blockers must account for both effects below:

1. Two-red triangles can force blue edges not present in the selected private-witness neighborhood. Ignoring them makes a Hall or cover-replacement certificate invalid.
2. The reached red set may contain all three edges of an actual all-red triangle. No selection of blue repair edges can cover that triangle once all its reds are deleted. One must either retain an adequate red transversal or construct an actual mixed packing move that resolves it.

Adding those conditions returns exactly to the previously recorded nonlocal mixed-packet/exchange availability problem. The scalar identity |U|-p1 isolates the deficit but does not provide a new theorem controlling those conditions. Even reachability of every unused red separately would not prove a simultaneous injection or preserve disjointness of all chosen witnesses.

## Decision log

- Reconstructed minimum-cover and eligible-packing definitions and the old availability gaps before proposing a gate.
- Tried the direct unused-red-to-packed-T1 charging normalization; exact arithmetic is valid, but it is only a restatement of the target deficiency.
- Tested the shallow neutral-exchange gate on one concrete graph. K7 decisively refutes it, with exact minimum exchange size three for the exhibited isolated state.
- Re-examined unrestricted closure. The additional T2 forced edges and T3 admissibility condition recover the old TUZA-14B bridge; no independent min-max theorem or credible new availability proof emerged.
- Stop this lane after preserving the witness and gap. Increasing the trade radius or expanding the bounded graph domain would not presently advance the general implication. A materially new simultaneous matching/cover-exchange theorem is still required.
