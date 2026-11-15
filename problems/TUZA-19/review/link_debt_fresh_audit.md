# Independent audit: link debt and large reducible groups

**Verdict: ACCEPT the stated ordinary results.** The reducible-set definition matches the primary source, including unrestricted placement of its packing. The universal group-size bound and paid variant are valid for those exact certificate quantifiers. The complete-graph construction supplies the asserted infinite TF and two-edge-resilient family. The link and splitting conclusions are correctly limited to accounting identities and specific obstructions, rather than a global payment theorem. No mathematical repair is required.

## Input, source check, and review scope

The frozen input is `notes/packing_new_link_debt.md`, SHA256 `6ea116c410e09f184a52ca564edfb86c8028a4b1c83313750c19a881b9e77e32`. Its hash was checked and its exact bytes copied before reading/reconstruction to `review/link_debt_fresh_inputs/packing_new_link_debt.md`.

I reconstructed the proof from that frozen note. I did not read or import the producer checker or its result file. I separately consulted [Puleo, arXiv:1308.2211v3, Definitions 2.1 and 4.1 and Lemmas 2.2 and 4.4](https://arxiv.org/pdf/1308.2211v3), PDF pages 4–5 and 9–10. Definition 2.1 requires nonempty U, edge-disjoint triangles S anywhere in G, and edges X satisfying: |X|<=2|S|; no triangle of G-X meets U; and every S-edge with both endpoints outside U lies in X. There is no condition requiring every member of S to meet U. The WKE definition uses some matching M and a cover of L-M of size at most |M|; it does not require M maximum. The note imports these definitions accurately.

Requested model controls were Astra / Ultra; actual serving identity and applied controls are not independently exposed. This is ordinary AI mathematical review, not human or Lean verification. The original clock remains start 2026-11-15T01:53:58Z, research cutoff 09:23:58Z, hard deadline 09:53:58Z. All computation was local Darwin in the existing pinned environment. The primary-paper access was read-only source verification; no remote computation or publication occurred.

## Universal link and group accounting

For every vertex v and every matching M in its actual neighborhood graph, the triangles vxy for xy in M are edge-disjoint. They use only edges incident to v or edges of M, so they append to every packing of H=G-v-M. A cover of H plus M and the spokes to a vertex cover Q of L-M covers every triangle: the only remaining ones pass through v and have a base outside M, which Q meets. Choosing Q minimum gives the exact definitions in the note, although the extension need not itself be a minimum cover.

Writing d=|Q|-|M|, sigma=2nu(H)-tau(H), and g=nu(G)-nu(H)-|M| gives g>=0 and

    tau(G)-2nu(G) <= d-sigma-2g.

No maximum-matching assumption occurs. For an edge-minimal Tuza violation, deleting any edge and then adjoining it to a cover proves tau(G)<=2nu(G)+1; strict violation gives equality. When v is incident with an edge, H has strictly fewer edges, so its slack is nonnegative. The displayed inequality therefore gives exactly 0<=sigma+2g<=d-1. It supplies an unpaid positive deficit, not a payment certificate.

For a general group certificate, compatibility ensures that no S-edge survives in H=(G-X)-U: edges incident with U disappear, and all remaining S-edges belong to X. Thus every H-packing appends to S even when some S-triangles are wholly outside U. Likewise X plus any H-cover meets every original triangle. These facts yield the grouped inequality with b=|X|-2|S| and g=nu(G)-nu(H)-|S|. It remains valid for positive or negative b. An upper bound |X|<=2|S|+b also gives the corresponding inequality with that upper-bound b. Nothing here establishes the additional slack/gain needed to pay a positive b.

## Complete-graph bound with S anywhere

Let r=|U|>0, q=n-r, d count X-edges wholly outside U, and i count the other X-edges. Let s_j count triangles of S with j vertices in U. Edge-disjointness and compatibility give

    d>=3s_0+s_1,
    2(s_1+s_2)<=rq,
    s_2+3s_3<=r(r-1)/2.

In particular, the s_0 term is present: a wholly outside packed triangle requires all three of its edges in X. Multiplying the budget inequality by three and subtracting 2d yields

    d+3i <= 6 sum(s_j)+3b-2d
         <= 4s_1+6s_2+6s_3+3b
          = 4(s_1+s_2)+2(s_2+3s_3)+3b
         <= 2rq+r(r-1)+3b.

This is the consequential cancellation. The proof neither drops the outside packed triangles nor silently restricts their locations.

For each u in U, its outside neighbors joined by spokes not in X form A_u. Every pair in A_u must have its rim edge in X, since otherwise that pair with u forms an uncovered actual triangle. For a=max|A_u| this gives d>=a(a-1)/2, while i>=r(q-a). Substituting gives

    rq <= 3ra-a(a-1)/2+r(r-1)+3b.

For integer a>=0, the quadratic term is maximized at a=3r or 3r+1 and equals (9r^2+3r)/2. Relaxing the actual restriction a<=q can only enlarge this upper bound. Division by positive r and addition of r yields

    2n <= 13r+1+6b/r.

Setting b=0 proves the unqualified reducible-set bound. Conversely the same inequality gives the stated necessary debt b>=r(2n-13r-1)/6. This is an all-size ordinary proof for every permitted U,S,X, including empty S, triangles wholly outside U, and U=V(K_n). The finite checker is supplementary.

## Infinite actual-graph family

The initial K5 packing is valid and leaves the stated four-cycle. In the doubling step, each F_j is a perfect matching on the n+1 new vertices. Every finite pair x,y occurs in the unique matching indexed by (x+y)/2 modulo odd n; division by two is valid for every odd n, not just primes. Each infinity edge also has a unique matching. Consequently the matchings partition the new complete graph. Attaching F_j to old vertex j uses every old-new edge once and every new-new edge once, with no old-old edge added. Thus the exact old four-cycle remains the entire leave for every iteration.

The orders obey n_{j+1}=2n_j+1, giving n_j=6*2^j-1. Their edge count is one modulo three. Improving the displayed packing would leave precisely one edge, impossible because complete-graph degrees are even and deleting edge-disjoint triangles preserves degree parity. Hence nu=(n(n-1)-8)/6.

Any two distinct complete-graph edges lie in a four-cycle, whether adjacent or disjoint. A vertex permutation takes the displayed leave to that cycle, giving a maximum packing avoiding both edges. Extending smaller deletion sets to a pair covers sizes zero and one. This proves the full two-edge resilience quantifier, not merely an example pair.

The triangle-free edge bound proves tau(K_n)=(n-1)^2/4 for odd n. For any specified triangle, put its three vertices in the larger part of a balanced partition; that part has size at least three. The complement of the resulting maximum bipartite subgraph is a minimum cover containing all three specified edges. Hence the graph is TF. A specified edge can likewise lie in one part, giving edge-cover-criticality.

Together with the group bound, these graphs rule out every fixed upper bound on reducible-set size derived solely from TF and two-edge resilience. They have explicit positive Tuza slack, so they do not refute an assertion that additionally assumes violation tightness or the stronger simultaneous deletion conditions. Allowing large groups or groups with certified payment also remains outside this obstruction.

## Complete-family residual payment

For nonempty M in K_{n-1}, its deletion creates an independent pair but no independent triple, so vc(K_{n-1}-M)=n-3. The largest matching minimizes the deficit at (n-5)/2; the empty matching has cover number n-2. Thus for n>5 these links are not WKE.

For n>=11 in the constructed sequence, choose v outside the four-cycle leave. Its incident packed triangles cover every spoke and yield a perfect matching M in the link. Removing those triangles leaves a packing of H=K_{n-1}-M with the same leave. Its regular even degrees and edge count modulo three certify maximum size.

Put q=n-1. Equality in the triangle-free edge bound on q vertices forces K_{q/2,q/2}. Since q/2 is odd, that graph cannot be a subgraph of H: each missing matching pair would have to remain inside one part, making both part sizes even. The next lower integer edge count q^2/4-1 is attained by parts of sizes q/2-1 and q/2+1 made from whole matching pairs. Therefore tau(H)=(q/2-1)^2. The stated nu(H), sigma(H), g=0 and d formulas follow, with sigma-d=(q^2-2q-20)/12>=0 for q>=10. K5 is correctly separated as the case H=C4 and zero deficit/slack.

For the fresh vertices in a private K5 edge decoration, the neighborhood is exactly the other four block vertices, forming K4. Its perfect matching leaves C4, whose vertex-cover number is two, giving d=0. This local structural observation is sound. I did not reread or rerun the complete retained 72-vertex TF/resilience certificate; its global claims were not needed for this audit.

## Splitting and scope

The edge bijection under a neighbor partition is exact. Surviving triangles are precisely those whose two neighbors lie in the same part, and the lost ones have them in different parts. Covers extend at cost at most the lost-triangle hitting number h; packings pull back without edge collisions. Thus h<=2[nu(G)-nu(G_split)] is a sufficient independent repair condition once Tuza is available for the split graph.

For K5, the lost-triangle hitting number is the vertex-cover number of the complete multipartite cross-link graph, namely 4 minus the largest part size. The four nontrivial partition types therefore have h=1,2,2,3. Their split packing numbers are 2,2,2,1, and none satisfies the independent repair inequality. Literal enumeration confirms all 15 partitions including the trivial one. The first three nontrivial split types have (nu,tau)=(2,3),(2,2),(2,2), so actual residual slack can pay their debt; the argument does not claim otherwise.

A split isolating one neighbor creates a leaf edge; after discarding that edge its triangle system is exactly that of G-vw. Under edge-cover-criticality and packing resilience, its paid condition simplifies to tau(G)<=2nu(G), exactly as stated. Calling this uncomputed slack available would be circular.

The induction caveat must be read conditionally: deleting newly triangle-free edges reduces edge count only when such edges actually arise. For example, the K5 split of type 2+2 has no triangle-free edge. In general one can select a putative counterexample lexicographically by edge count and then triangle count, so a split with fewer triangles and unchanged edge count is covered by the induction choice. The note explicitly warns that splitting is not automatically a proper edge subgraph; no invalid induction is used in its results.

## Independent checks and exact artifacts

`review/link_debt_fresh_checker.py` is independent standard-library code with no producer imports. Its retained pinned-environment run passed:

- literal packings and exact leaves for K5, K11 and K23;
- all 1,530 pairs of deleted edges in the fixed K5 and K11 controls, with explicit mapped maximum packings;
- minimum-cover constructions containing every specified triangle in those three complete controls;
- the K11 residual packing and cover certificates, including the 29-edge extended cover;
- all 222,198 compatible K5 choices of nonempty U, arbitrary packing S, and X, including 8,460 states containing a packed triangle wholly outside U;
- all 15 K5 neighbor partitions and exact packing, covering and lost-triangle hitting numbers.

The all-size group bound, infinite construction and parameter optimality rely on the ordinary proofs above. These bounded checks do not replace them and do not constitute an expanded graph census.

| Artifact | SHA256 |
|---|---|
| Frozen note and input snapshot | `6ea116c410e09f184a52ca564edfb86c8028a4b1c83313750c19a881b9e77e32` |
| `review/link_debt_fresh_checker.py` | `b065b655e62ca824d0516e3c3a7c4ff1c9c967583333b19bba7f5ca7a1e60dab` |
| `evidence/link_debt_fresh/results.json` | `5afc873aede57346245aa36a22f3a78824b1f18afe493951005d98b2ace66e61` |

The audit accepts the exact bounds, construction, and stated obstructions. It establishes no global paid-link availability theorem, unrestricted Tuza result, formal verification, human review, or external novelty claim.
