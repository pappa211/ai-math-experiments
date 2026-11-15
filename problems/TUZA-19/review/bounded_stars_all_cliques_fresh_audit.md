# Fresh audit: bounded unions of stars and all clique packing polytopes

Verdict: **PASS as an ordinary mathematical theorem, with the link-component wording clarification below.** No substantive gap found in the all-size construction, orbit mixtures, clique mixtures, or quantitative amplification. This is AI review, not human review or an all-size formal certificate.

Frozen input: `notes/global_routes_bounded_stars_all_cliques.md`, SHA256 `bfb6d0154ffbd225ac7d4c47f2a51d7f4725d8c9a1138bd64d562ebc5673b48a`. The note was preserved unchanged. Review used the statement/proof and declared dependencies, not the producer checker or its output. Earlier messages disclosed the proposed conclusion and root's favorable reconstruction; I independently reconstructed the argument rather than treating those messages as evidence. This reviewer had already audited the quantitative incidence dependency and performed a separate bounded source screen. Hence this is fresh proof reconstruction, not a claim of total historical blindness.

All work was local on the owner's Darwin Mac. Original mission start 2026-11-15T01:53:58Z, research cutoff 09:23:58Z, hard deadline 09:53:58Z remain unchanged. Requested Astra/Ultra; actual serving metadata is not exposed. No Lean, solver, new graph census, or remote execution was used.

## Exact result and quantifiers

For every fixed integer k>=1, all sufficiently far terms of a subsequence r=3*2^j−1 satisfy the displayed conditions (A). For each such CP_r, the one common triangle vector x_T=1/(2r−4) belongs to every full packing polytope on a union of at most k vertex stars, and to every full packing polytope inside an original-graph clique, without bounding clique size. The optimum of this combined coordinate relaxation is m/3=nu+4/3. Its floor is nu+1. The graphs also have TF, two-edge packing resilience, and connected non-WKE vertex links.

Fixing one such r after fixing k, triangle-local incidence amplification gives, for every fixed epsilon in (0,2) and C>=0, graphs with rho−nu>C |V|^(2−epsilon), retaining TF, two-edge resilience, and non-WKE link components. The local distributions depend on the requested set or clique. Their agreement on first marginals is the only shared condition. No joint distribution, intersection distributions, higher-moment consistency, or semidefinite feasibility follows.

## Reconstruction of the packing family and resilience

The three CP5 rows were copied directly from the frozen statement and checked independently by `review/bounded_stars_all_cliques_fresh_base.py`. Each has 12 actual edge-disjoint triangles, 36 used edges, and exactly its advertised four-cycle leave. The three multiplicity patterns are 2+2, 2+1+1, and 1+1+1+1. Output is `evidence/bounded_stars_all_cliques_fresh_base.json`. This is only a positive certificate check, not a search or a replay of the producer's larger finite checks.

For an old CP_r, the new 2r+2 vertices carry 2r+1 perfect-matching factors. Removing one factor defines their new twin parts; assigning each other factor to one old vertex covers each old–new edge once and every permitted new–new edge once. These appended triangles cannot collide with old triangles because they use no old–old edge. The result is CP_(2r+1), with the same old leave and unchanged old twin relation. The explicit round-robin factorization is valid because 2 is invertible modulo 2r+1. The number of appended triangles is 2r(r+1), matching the formula for p_(2r+1)−p_r.

The parity upper bound is exact: m is 1 modulo 3, so exceeding (m−4)/3 would leave one edge; all original degrees and all degrees removed by triangles are even, making that impossible. The recurrence therefore gives maximum packings.

The three four-cycle part patterns exhaust every actual four-cycle. Repeated twin-part vertices must be opposite on the cycle, and part permutations together with twin swaps act transitively on cycles of each pattern. Thus every actual four-cycle can be a maximum-packing leave. Any two adjacent edges extend to a four-cycle using a fresh part. For disjoint edges uv and xy, failure of both cross pairings would force u and v, or x and y, into one twin part. Hence some cross pairing exists. Every two-edge deletion is avoided by a maximum packing; single-edge and empty deletions follow as well.

## Cover and link assertions

Mantel's equality case is used correctly. A triangle-free subgraph of CP_r on 2r vertices cannot attain r^2 edges: equality would be K_(r,r), but every twin pair would lie inside one bipartition class, making both classes even, contrary to odd r. The whole-part cut of sizes r−1 and r+1 attains r^2−1 edges. Therefore tau=(r−1)^2. A triangle's three parts fit on the larger side for r>=5, so some minimum cover contains all three triangle edges. The cut complement meets every triangle oddly, giving pi=tau as well.

A link is CP_(r−1). After any matching deletion it still has independence number at most two: every triple originally contains either a triangle or two incident edges. Hence any remaining-graph vertex cover has size at least 2r−4, while the deleted matching has size at most r−1. The strict inequality holds for r>=5. This checks every matching, not merely a chosen factorization.

## Whole-part local-state argument

The asymptotic conditions (A) are jointly attainable for every fixed k. The potentially restrictive expectation ratio is O_k(1/r), since p_r is quadratic and binom(r−4,3) cubic. The remaining mixture bound also tends to zero. No uniformity for growing k is claimed.

For a maximum packing P with a four-cycle leave, excluding its at most four touched twin parts removes at most eight vertices. Each vertex belongs to at most r−1 packed triangles; therefore p_r>8(r−1) forces a packed triangle entirely in the remaining parts B. Every edge incident with a B vertex is covered.

Given S, completing its touched twin parts to Z gives t<=k parts. For t>=3, a random t-subset of B has expected internal packed-triangle count at most p_r binom(t,3)/binom(|B|,3)<1. This counts three distinct parts for every triangle. The integer count therefore vanishes for some choice U0. A different choice U1 contains the exhibited B triangle. Relabel these choices to Z. Both resulting leaves avoid Z, and mixing them at lambda=8 binom(t,3)/((2r−4)R1) is legitimate because 0<lambda<1.

After symmetrizing over inside parts, outside parts, and all twin swaps, triangles meeting Z form exactly three orbits, according to whether they contain 1, 2, or 3 Z vertices. Fixing the expected internal count gives p3=1/(2r−4). Every inside-Z edge is covered, so

    (2t−4)p3+(2r−2t)p2=1.

Every crossing edge is covered, so

    (2t−2)p2+(2r−2t−2)p1=1.

Both denominators needed to solve successively are positive because t<=r−4. These equations give p2=p1=p3. They count endpoints and excluded twin parts correctly. The t=2 case has no type-3 triangles and starts with its inside-edge equation; t=1 has no inside graph edge and only type-1 triangles. Neither exceptional case imports a nonexistent orbit. Restricting every sampled packing first to T_Z and then T_S preserves feasibility of the full packing polytope; local maximality is unnecessary.

These local distributions may each extend to a distribution on global maximum packings. They are different extensions for different S, so there is no contradiction with the common vector's total mass exceeding the global maximum-packing size.

## Clique certificates and objective

For every 3<=s<=r, the balanced sizes a,b,c sum to s and satisfy a,b<=c. Triangles (i,j,i+j mod c) have distinct edges between the first two classes. For a fixed vertex in either of those classes, the third coordinate is injective over the other class, so no edge to the third class repeats. This produces ab edge-disjoint triangles without any imported complete-graph optimum.

The residue calculations for ab−s(s−1)/12 are correct in all three cases s modulo 3, including s=3,4,5. Therefore binom(s,3)/(2r−4)<=ab for all s<=r. Permuting the valid packing uniformly over Q and mixing it with the empty packing at the displayed lambda_s gives every clique triangle marginal exactly 1/(2r−4). This proves membership in the entire clique packing polytope, not merely its cardinality inequality.

The uniform objective is 8 binom(r,3)/(2r−4)=m/3. A singleton-star packing polytope implies the capacity constraint for each incident graph edge. Summing all edge capacities gives the reverse bound 3 sum_T x_T<=m. Thus the stated relaxation optimum and additive gap are exact.

## Incidence amplification and wording clarification

The accepted dependency uses linear fixed-uniformity incidence systems with no Berge triangle. Linearity makes graph-edge ownership unique; if an actual triangle had two owners it would violate linearity, while three owners would form a forbidden Berge triangle. All graph triangles are therefore copy-local. The exact packing and cover numbers add.

For a global S of size at most k, each S_i inside one copy also has size at most k. Independent choices of the copy's local-state distributions produce actual global packings, even when one vertex belongs to many copies, because graph edges are copy-disjoint. Empty S_i requires no marginal condition. Every clique of size at least three is inside one copy: an initial triangle has one owner and any further clique vertex forms a triangle sharing an already owned edge. All clique constraints therefore pass.

TF passes by taking the appropriate minimum cover in the owning copy and arbitrary minimum covers elsewhere. Two deleted edges either share an owner or lie in two copies; the copy resilience applies in both cases. A vertex link is a disjoint union of inherited CP_(r−1) links, since copies through that vertex share no second vertex. Thus **every link component is non-WKE**, although a whole link can be disconnected.

This resolves the only wording objection: Section 1's phrase that amplifications retain all the preceding structural properties must not be read as retaining connected full links. The base CP_r links are connected and non-WKE; amplified links have non-WKE components. Section 7 states the correct componentwise property. No mathematical correction to the construction is needed.

The fixed seed has 2r vertices, so the quantitative incidence constant depends on this fixed seed size, not on the growing ambient N. The bound b>=N^2 exp(−C_r sqrt(log N)) gives b/N^(2−epsilon) tending to infinity for each fixed epsilon>0. Since 2−epsilon>0 and |V(H)|<=N, the claimed additive obstruction follows. The seed is fixed before N grows; there is no unlicensed uniformity in r, k, or the incidence constant.

## Dependencies, preserved objections, and limits

Declared dependencies inspected: the CP5 frozen note (SHA256 `58a6165eb965c00ae7c0fc711b9bdaf22a99809c616b2e8e04447bafccb32b07`), its separate erratum, and quantitative amplification (SHA256 `4ddc162df0ceb5072b948d64cf7d09df1e2e7641d66dceb038aecce6cbb48d53`). The CP5 sentence equating the K5 edge-count upper bound with two is wrong and remains preserved in the original; its erratum supplies the parity correction. The present unified proof avoids that optimum entirely through the Latin-rectangle packing. The new link-connectedness ambiguity is preserved above.

No remaining substantive objection was found. The result blocks exact or fixed-power-saving additive recovery of nu from this combined first-coordinate relaxation, even under TF, two-edge resilience, and non-WKE link components. It is not a Tuza counterexample, not a parity-cover obstruction, and not a claim about all higher-moment hierarchies or rounding methods. Here pi=tau=(r−1)^2 and 2nu−tau=(r^2+2r−11)/3>0; amplification preserves this cover slack. The bounded primary attribution audit is separate at `review/cocktail_party_local_polytope_source_audit.md`; novelty remains unresolved.

Reproduce the only new computation with the pinned local environment and `python3 review/bounded_stars_all_cliques_fresh_base.py`. Evidence and hashes are indexed in `evidence/bounded_stars_all_cliques_fresh_manifest.json`.
