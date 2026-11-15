# Final internal check: unbounded Petersen limitation

Reviewed within the original TUZA-17 mission. Earlier frozen critic files are unchanged. This is the final assigned targeted review; no additional development or heavy computation was performed.

**Verdict: PASS at the exact stated scope.** B_FRONTIER_MATCHING_CERTIFICATE.md correctly packages the sufficient AC certificate and proves that it is not universally available among triangle-free links. The q-Petersen family is not an AC counterexample or a demonstrated full apex instance at budget m+1.

## Positive certificate

The theorem uses m=b−1, a MAXIMUM link matching M with vc(L−M)≤b, and |R_L|≤m−2. An explicit F subset M with vc(L−F)≤b is sufficient by monotonicity; conversely M itself is a permissible F. No extension of an arbitrary prescribed matching is assumed.

Under AC failure no minimum H cover contains M. The exact forced-cover identity m+tau(H−M) therefore exceeds tau(H) by at least one. This forces tightness of H−M through the correctly directed Aharoni/apex-packing inequalities. The K4 face argument then forces every old-supported M edge into the intersection R_L of all maximum link matchings. Covering the equality blocks and those edges proves |R_L|≥m−1, contradicting the premise. Every step agrees with the separately checked generalized criterion and tight-frontier proof. Equality structure is used only for the justified eligible tight residual.

## Petersen geometry and all maximum matchings

The literal outer-cycle, inner-star-cycle and spoke construction is a cubic triangle-free graph on ten vertices. A mixed four-cycle would have two spokes and would require the same pair of indices to differ by both ±1 and ±2 modulo five; impossible. Four spokes cannot form a cycle because spokes are a matching. Thus its girth is five.

The five spokes give a perfect matching. Every maximum matching is therefore perfect, and removing it leaves a spanning 2-regular graph. Girth five makes that residual either one ten-cycle or two five-cycles.

I independently checked the supplied non-Hamilton argument:

- A Hamilton cycle crosses the cut between the two layers a positive even number of times, so uses two or four spokes.
- With two spokes, each layer contributes a spanning path of its five-cycle. The common two endpoint indices must be adjacent in both cycles, which is impossible.
- With four spokes, rotate the omitted spoke to index zero. The outer edges are forced to be u4u0, u0u1 and u2u3. The inner edges are forced to be v3v0, v0v2 and v1v4. Together with spokes1–4, these form the two cycles u0−u1−v1−v4−u4−u0 and u2−u3−v3−v0−v2−u2. They cannot be Hamiltonian.

Therefore EVERY perfect matching leaves exactly two C5s, and vc(P−M)=6.

The empty forced-edge intersection is also correct. The all-spoke matching avoids every horizontal edge. For any specified spoke i, choose another spoke j; add the perfect matching of each layer with index j deleted. This gives a perfect matching avoiding i.

As an independent ordinary check of the supplemental list, a perfect matching must use an odd number of spokes, since each layer has five vertices. Five spokes give one matching. One spoke j gives exactly one matching of each remaining four-vertex path, yielding five more. Three spokes would leave the same two indices to be matched horizontally in both layers, again requiring differences ±1 and ±2 simultaneously. Thus there are exactly SIX perfect matchings, in agreement with every entry of evidence/b_petersen.json. No finite-search completeness claim is needed for this count.

## Exact unbounded conclusion and limitation

For L equal to q disjoint Petersen copies, q≥2, ordinary matching and cover parameters add over components. Every maximum matching has size m=5q and is perfect on every component. Hence

    R_L is empty,
    vc(L−M)=6q>5q+1=m+1

for EVERY maximum matching M. The inequality is strict precisely because q≥2. In fact no smaller subset F of any such M can rescue the certificate: L−M is a subgraph of L−F, so vc(L−F)≥6q as well.

Thus even an empty forced-edge intersection does not guarantee either form of the matching-deletion certificate. This is an exact unbounded limitation on that link-only sufficient mechanism. It does not exclude other mechanisms using old-H geometry or different state information.

Taking H=L is eligible because H is triangle-free, but then all G triangles are apex pages, nu(G)=mu(L)=m and tau(H)=0, giving b=2m rather than m+1. No eligible surrounding H with the frontier budget has been constructed by this witness. No Tuza or AC counterexample follows, and the low-budget positive theorems are unaffected.

Status: sufficient certificate PROVED_USING_PUBLISHED_INPUT through the scoped Aharoni/HNS step; Petersen-family limitation PROVED_ORDINARY, with the six-matchings evidence supplementary. Historical originality UNESTABLISHED. New Lean and independent_final_verification NOT_RUN. This critic has finished the assigned work and has no running computation.
