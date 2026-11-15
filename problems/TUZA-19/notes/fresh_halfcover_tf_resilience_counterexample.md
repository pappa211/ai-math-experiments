# TF and two-edge resilience do not force integral cover normalization

Status: explicit fixed-graph counterexample with independently reconstructed literal certificates and an ordinary construction proof. No exact fractional or half-integral optimum, Tuza counterexample, Lean verification, human verification, or novelty claim is asserted.

## Statement and normalization convention

For a finite simple graph G, define tau_k(G) to be the minimum sum of nonnegative integer edge multiplicities z_e such that every actual triangle T satisfies sum_{e in T} z_e>=k. Multiplicities can be restricted to 0,...,k without changing the optimum. Thus tau_1=tau, and the half-integral cover optimum is tau_half=tau_2/2.

The retained 72-vertex graph W has TF and two-edge packing resilience, yet

    tau_half(W) <= 85 < 86 = tau(W),
    nu(W)=49,   2nu(W)=98.

Consequently TF plus two-edge packing resilience does not imply tau_half=tau.

The same graph has an order-three cover of normalized mass 72. These two fixed certificates imply

    for EVERY integer k>=2, tau_k(W)/k <= 85,
    but tau_1(W)=86>85.

Therefore even within TF and two-edge-resilient actual graphs, the assertion “for every nonunit integer order there exists a multi-transversal of normalized cost at most the integer budget B” does not imply an ordinary cover of size at most B. Here B=85. The quantifier is existence at each order, not a claim about every possible multi-transversal.

## Literal graph and triangle ownership

Use Petersen rim vertices 0,...,9. Its edges are i--(i+1 mod 5), (5+i)--(5+(i+2 mod 5)), and i--(5+i), for 0<=i<5. Add adjacent apices a=10 and b=11, each joined to all rim vertices, obtaining B=K2 join Petersen.

Let U={0,1,2,3,4,10,11}, and H=B[U]=K2 join C5. Put D=E(B) minus E(H), with |D|=20. Enumerate D in lexicographic order. For its j-th edge uv, add private vertices p=12+3j, q=13+3j, r=14+3j and complete the K5 on {u,v,p,q,r}. No other edges are added.

Thus W has 72 vertices, 216 edges and 240 actual triangles. Every triangle is either an old B-triangle or lies in exactly one attached K5 with a fresh vertex. This follows because every fresh vertex has neighbors only in its own block, which contains only two old vertices. There are 40 old triangles and ten new local triangles per block.

The edge sets of H and the twenty complete K5 blocks partition E(W). Each old B-triangle outside H contains at least two D-edges: two H-edges would put all three vertices in U, and inducedness would put the third edge in H too. This observation is used for both the integral and half-integral cover constructions.

## Exact half-cover and third-cover

On H, assign weight 1/2 to av and bv for v=0,...,4, and weight zero to ab and the five rim-cycle edges. Every H-triangle has exactly two such spokes, so its load is exactly one. The H mass is five.

For each decorated root uv with fresh vertices p,q,r, assign weight one to

    uv, pq, pr, qr,

and zero to its other six block edges. This is the four-cover obtained from the 2+3 partition {u,v}|{p,q,r}; it contains the root. Every local triangle has load one or three. Every old B-triangle outside H has at least two decorated roots of weight one, so its load is at least two. These cases exhaust all actual triangles.

Because the edge sets partition, the resulting half-cover has total mass

    5 + 20*4 = 85.

Its weights are 1 on 80 edges, 1/2 on ten edges, and zero on 126 edges. The exact complete edge list and every triangle load are retained in `evidence/halfcover_tf_fresh/cover_certificate.json`. The verified actual-load histogram is:

| Triangle load | Number of triangles |
|---|---:|
| 1 | 195 |
| 2 | 5 |
| 5/2 | 10 |
| 3 | 30 |

Independently, uniform weight 1/3 on all 216 edges gives load exactly one on every triangle and has mass 72. This supplies an order-three certificate; its optimality is not claimed.

## Why the ordinary optimum is 86

The core H has cover number six. If ab is selected, the remaining two-apex rim problem has optimum min_S[2|S|+e(C5-S)]. Choosing the same optimum spoke vertex cover at the two apices proves this formula even when a candidate initially uses different spoke sets. Since C5 is 2-regular, the objective is 5+e(C5[S])>=5, so the total is at least six. If ab is omitted, at least one spoke is required at each rim vertex. A five-cover would consist of exactly one spoke per rim vertex and no rim edge, forcing alternate apex choices around an odd cycle, impossible. The cover consisting of ab and all five rim edges attains six.

Every K5 has cover number four: each edge belongs to only three of its ten triangles, so three edges cannot meet all ten; the four within-part edges of a 2+3 partition attain the bound. By the disjoint edge partition, every W-cover has at least

    tau(H) + 20*tau(K5) = 6+80=86

edges. Combine any minimum H-cover with root-containing four-covers in all blocks. Every old outside triangle meets a selected decorated root, so this attains 86. Hence tau(W)=86. The strict comparison with the constructed mass-85 half-cover is certified without computing its optimum.

## Why the graph has TF and packing resilience

The core H has TF. For an apex triangle abv, use ab,av,bv and the three rim edges not incident with v. For a rim triangle auv, use uv and one spoke at each rim vertex, alternating along the path C5-uv with both endpoints assigned to a; the b version is symmetric. Each is a six-cover containing the specified triangle, and every H-edge belongs to an H-triangle.

TF lifts to W as follows. A triangle inside H can use its containing minimum H-cover, with all roots selected. An old triangle outside H has at most one H-edge; if present, choose a minimum H-cover containing that edge and select every decorated root. For a local K5 triangle, its containing four-cover may force its root either selected or unselected; use that cover in its block and root-containing minimum covers elsewhere. If the special root is unselected, each old triangle through it still contains another decorated root. In every case the resulting cover has 86 edges and contains the specified triangle. Thus every actual triangle occurs fully in a minimum cover.

The base B has packing number nine. At most one triangle abv can occur. If it occurs, the two apex matchings on the remaining nine rim vertices have at most four edges each, giving at most nine triangles. Without it, a ten-packing would require two disjoint perfect matchings of the Petersen rim. The independent verifier enumerated its six perfect matchings from the literal fifteen-edge list and checked that every pair intersects, excluding this case. A literal nine-packing establishes equality.

The retained base certificate contains a nine-packing avoiding each of the 630 pairs of B-edges; all certificates were rechecked against the independently built graph. The local K5 deletion certificates were likewise checked for every deletion set of size at most two. These are positive literal witnesses, not trusted summary flags.

Every W-packing has at most nine old triangles and two local triangles per block. Conversely combine a maximum B-packing with a local two-packing avoiding the root in each block. Therefore nu(W)=9+40=49.

For a set of at most two W-edge deletions, require the base packing to avoid every deleted H-edge and the root of every affected block. These requirements involve at most two B-edges. Use a maximum base packing avoiding them. In an affected block use a two-packing avoiding its local deletions; in every unaffected block use a two-packing avoiding its root. All pieces are edge-disjoint. This proves two-edge resilience. The fresh checker also rebuilt and checked the resulting 49-packings for all 23,220 W-edge pairs; zero and single deletions follow by extension to a pair.

## Combining the two certificates at every nonunit order

Let z2 be twice the half-cover, so every triangle has integer load at least two and sum_e z2_e=170. Let z3 be the all-one edge vector, with triangle load exactly three and total 216.

For even k>=2, use

    z^(k)=(k/2) z2,
    sum z^(k)=85k.

For odd k>=3, use

    z^(k)=z3+((k-3)/2) z2,
    sum z^(k)=216+85(k-3)=85k-39.

The coefficients are nonnegative integers. Every triangle receives load at least k, and every edge multiplicity is at most k. This proves the all-k statement from two explicit finite vectors; it is not an unbounded computation or an optimality assertion. Positive combinations of orders two and three cover every integer order at least two, while supplying no order-one certificate.

The budget comparison is

    85 < tau(W)=86 < 2nu(W)=98.

Thus both proposed normalization conclusions fail at budget 85, while the graph satisfies Tuza with slack twelve. The counterexample does not contradict any theorem guaranteeing a fractional or half-integral cover within 2nu.

## Exact verification and provenance

The independent checker is `review/halfcover_tf_fresh_checker.py`. It imports no producer code. It reconstructs B,H,D,W from the stated formulas, enumerates all actual triangles, and compares them to the retained literal graph. It exhaustively checks tau(H)=6 and tau(K5)=4, validates all 240 minimum-cover TF certificates, all 630 base pair-deletion certificates, all 56 local K5 deletion cases, and all 23,220 reconstructed W pair-deletion certificates. It then writes every edge multiplicity and all 240 triangle loads for the new covers.

This is one fixed graph and its prescribed certificates, not a graph search. Input copies and hashes are retained under `evidence/halfcover_tf_fresh/inputs/`. The primary inputs are:

| Input | SHA256 |
|---|---|
| `notes/codegree_two_tf_resilience_counterexample.md` | `ae0bd41560dae51e58f5197a46eb5cd62e7859f10fb7aeb2f488178c052da1a4` |
| `evidence/codegree_two/petersen_join.json` | `d517e3fd66923c02b079a66fad6291b66676235bb434a90d4b38375a036d5fb4` |
| `evidence/codegree_two/tf_lift_witness.json` | `3dbd56433357c22745b2a96a733685874b94a9ed7c24463e27b88cdadd1def7e` |

New checker SHA256: `30ccf2aca6598fbfe2bc5be628aaf1313032fbf274fcbdd9a2cd3182dc258602`.

Exact edge/load certificate SHA256: `8662604994074d5a5b1231c2eb574a8b2f4bf08e67d6e890bb1c791863d9df38`.

The receipt is `evidence/halfcover_tf_fresh/receipt.json`. Reproduce locally with the existing pinned environment and `python3 review/halfcover_tf_fresh_checker.py`.

The original mission clock remains start 2026-11-15T01:53:58Z, research cutoff 09:23:58Z, hard deadline 09:53:58Z. Computation was local Darwin; no remote computation, publication, environment changes, or Lean run occurred. Requested model controls were Astra / Ultra; actual serving controls are not independently exposed. The new certificates were proposed by root and independently reconstructed here; this note does not label itself an independent review by another agent.
