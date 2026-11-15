# Fresh independent audit: TF cone-decoration obstruction

**Verdict: ACCEPTED as an ordinary existence counterconstruction.** The probabilistic incidence lemma, the cone-decoration identities, TF, the graphic binary realization and the explicit two-spoke blocker all reconstruct correctly. No material correction is requested. The result refutes TF-only normalization pi=tau and the weaker TF-only bound pi<=2nu, including in actual finite simple graphs. It does not refute unrestricted Tuza or either gate that also assumes two-edge packing resilience.

The large graph is proved to exist; it was not supplied or generated as a literal finite edge list. The audit does not turn that existence proof into a computational witness claim.

## Inputs, independence and clock

Initial inputs were the assigned frozen mathematical note, its manifest, and the assigned frozen incidence-source proof:

| Input | SHA-256 |
|---|---|
| `notes/binary_tf_cone_decoration_obstruction.md` | `db3a479a74064b0038274cefc0b64bc9356e79d5dfd37706eb89221fb75c7a16` |
| `evidence/binary_tf/cut_obstruction_input.md` | `2ec94c291275ae6d02628ffd227d2acd9bb2c3eee638a1369c40bd8fc053ac1b` |
| `evidence/binary_tf/cone_decoration_manifest.json` | `839bd989f200ca47fed7af39877a17c332b4887084c9a9b71eefff720d8014de` |

Snapshots, including the separately declared rank-five control JSON, are preserved in `review/binary_tf_fresh_inputs/`. Every supplied manifest entry matched its file hash. No producer checker was imported or inspected as source; the review's bounded checker uses only the Python standard library.

This reviewer had earlier mission context involving K5 decorations and TF, but reconstructed the new probabilistic and cone argument from the frozen inputs. The initial assessment was sent to root before running auxiliary checks. No separate favorable review, executive report, external theorem, random hypergraph search or higher-rank census was used.

Requested controls: Astra/Ultra. Actual precise serving model and effort are not independently exposed and are not attested. Original start `2026-11-15T01:53:58Z`, research cutoff `09:23:58Z`, hard deadline `09:53:58Z` were retained. Review clock observed `2026-11-15 04:36:12 UTC`. Host observed Darwin. No Lean, human verification, remote execution or publication occurred.

## 1. Probabilistic existence: every quantifier survives

Fix an arbitrary integer L>=1. On N vertices independently choose each five-subset with probability p=N^(-15/4), and write m0=p*binom(N,5). The proof must simultaneously control every vertex coloring and all short incidence cycles; it does so.

For coloring class sizes r+s=N, the balanced-five-set count is exactly

    binom(r,2)binom(s,3)+binom(r,3)binom(s,2)
       = r(r-1)s(s-1)(N-4)/12.

The product r(r-1)s(s-1) is at most N^2(N-2)^2/16. For r,s>=1, this follows by putting q=rs and maximizing q(q-N+1) at q<=N^2/4; the cases with an empty class are zero. Dividing by binom(N,5) gives the printed upper fraction

    (5/8) N(N-2)/((N-1)(N-3)).

For N>=13 this is at most3/4: clearing positive denominators yields N^2-14N+18>=0. Thus the number X of selected unbalanced five-sets for every fixed coloring is binomial with mean z>=m0/4.

Exponential Markov is applied in the correct direction:

    Pr[X<=z/2] <= 2^(z/2) E[2^(-X)]
                  =2^(z/2)(1-p/2)^M
                 <=exp(-(1-log2)z/2)
                 <=exp(-z/8).

The threshold m0/8 is no larger than z/2. Hence the union bound over all2^N colorings is at most2^N exp(-m0/32), which tends to zero because m0 has order N^(5/4). The retained event says EVERY coloring has strictly more than m0/8 selected unbalanced hyperedges.

For a Berge cycle of length ell=2 or3, choose its distinct cyclic vertices and, for each distinct hyperedge, its three additional vertices. At most N^(4ell) descriptions suffice. Overcounting is harmless; restricting to distinct hyperedges makes the joint selection probability p^ell. Thus the expected numbers are at most N^(1/2) and N^(3/4). Markov gives probability at most N^(-1/2)+N^(-1/4) that their total exceeds N.

Both good events therefore occur simultaneously for sufficiently large N. Delete one hyperedge from each original short cycle, taking the union of those choices. This deletes at most N hyperedges and cannot create a new cycle. For every coloring the remaining bad-edge count is still strictly greater than m0/8-N. Choosing N also so that m0>8(L+1)N makes this greater than LN.

Finally, minimum bad-edge count is additive across incidence components, since components have disjoint vertex sets and their colorings can be selected independently. If each nontrivial component had minimum at most L times its own number of vertices, the total would be at most LN, including any isolated vertices. This contradicts the strict retained bound. One component therefore has more than Ln unavoidable unbalanced hyperedges. It is finite, nonempty, incidence-connected, linear and Berge-triangle-free. This proves the full “for every L there exists” statement, rather than merely a typical-coloring or expected-value statement.

### An explicit sufficient ambient size, supplied independently by the reviewer

The asymptotic argument is already sufficient. To make its quantifiers especially transparent, set

    q=3840(L+1),    N=q^4,    p=q^(-15).

For N>=20,

    binom(N,5)>N^5/240,

because the product of the four factors (1-j/N), j=1,...,4, exceeds1/2. Therefore

    m0/N > q/240 =16(L+1),

which is stronger than the required8(L+1). Using log2<3/4, the coloring failure probability is less than exp(-N/4)<1/4. The short-cycle failure probability is at most1/q+1/q^2<1/4. Thus their sum is below one, and a good realization exists. No realization is generated by specifying this very large ambient N; it is an explicit parameter bound in the ordinary proof only. The fixed L=1 parameter inequalities were also checked with exact rational arithmetic.

## 2. The incidence graph H: all actual triangles and optima

Replace each retained five-hyperedge by a complete K5. Linearity makes their graph-edge sets disjoint. For any actual graph triangle, if two edges belong to one block then their three endpoints lie in that block, and edge uniqueness puts the third edge there too. Otherwise the three edge-owner blocks are distinct and yield a forbidden Berge triangle on the three actual vertices. This exhausts every actual graph triangle.

Consequently H is connected with exactly10b edges and10b triangles. Packing and ordinary cover costs add across the literal edge-disjoint triangle blocks, even though the blocks may share vertices. Each K5 has nu=2 and tau=4, giving nu(H)=2b and tau(H)=4b.

Taking a triangle's three vertices as the size-three side of a 3+2 partition produces a minimum four-cover containing that whole triangle. Independent local choices prove TF for H. Every H-edge lies in a triangle. The same local covers are odd, so pi(H)=4b as well.

For a SINGLE global vertex coloring, a block contributes4,6 or10 monochromatic edges for splits2+3,1+4 or0+5. More than Ln unbalanced blocks therefore imply

    tau_B(H)>4b+2Ln.

There is no conflict between pi(H)=4b and this larger cut cost: odd triangle equations only require independently valid local edge states, whereas a vertex coloring must agree at every shared vertex. The cone is precisely what later forces that global consistency.

The source proof's additional edge-criticality and two-edge resilience of H also check blockwise. Every edge lies in a local minimum cover, and each K5 retains a two-packing after at most two deleted edges. The source's neighborhood calculations are consistent too: a vertex in r blocks has a link of r disjoint K4s, with no cross-link edges because those would form forbidden extra triangles. None of these ancillary properties is mistaken for resilience of the later cone or W.

## 3. General cone-decoration lemma

For any finite H with TF and every edge in an H-triangle, add a universal cone vertex a and attach a fresh K5 on each spoke av, with three new private vertices per spoke. Every fresh vertex's neighbors are confined to its block. Therefore every actual triangle is either an H-triangle, a cone triangle auv, or a local triangle of one new K5. The attached K5s have only two old vertices, so all ten local triangles per block are new. E(H) together with the complete attached clique edge sets partition E(W).

The ordinary lower bound tau(W)>=tau(H)+4n follows from that edge partition. A minimum H-cover and root-containing minimum local covers attain it. TF follows by the three exact cases in the note:

- contain an H-triangle in the H part;
- contain auv by choosing an H-minimum cover containing uv and selecting every spoke;
- contain a local triangle in its fixed balanced four-cover, selecting every other spoke.

In the last case the chosen local triangle fixes the special root value. If it is unselected, every affected cone triangle still has its other spoke selected. The proof correctly does not require root flexibility while fixing that local triangle. Thus

    tau(W)=4n+tau(H), and W has TF.

For odd covers, let x_v be the spoke indicator in the old cone. Its triangle equations force

    c_uv=1+x_u+x_v.

Every H-triangle then automatically has odd load. The permitted old rim assignments are exactly monochromatic-edge indicators of vertex colorings of H. A local K5 has odd optimum4 for either root value x_v, so its new edges cost4-x_v. Summing cancels the old spoke contribution x_v, and minimizing gives the EXACT identity

    pi(W)=4n+tau_B(H).

The lower bound and extension both use the complete triangle classification, so no unproved parity-extension hypothesis is hidden here.

Each attached K5 has packing number two and a two-packing avoiding its root. Separating old cone triangles from local block triangles yields

    nu(W)=2n+nu(cone(H)).

The same upper/lower argument remains valid after deleting ANY set S of original cone edges, since the root-avoiding local pairs survive:

    nu(W-S)=2n+nu(cone(H)-S).

This deletion identity does not apply to arbitrary fresh-edge deletions, nor does the note claim it does.

## 4. Exact cone packing and the explicit failure of resilience

For the incidence H, a cone packing has at most2b old H-triangles and at mostmu(H) apex triangles, since their rim edges must form an ordinary matching. Hence nu(cone(H))<=2b+mu(H).

For a maximum ordinary matching M of H, each K5 block contains at most two M-edges. Choose two local triangles avoiding those edges in every block. Their union avoids every rim edge of M and can be combined with the apex triangles on M. Shared vertices cause no edge conflict, and apex spokes are distinct because M is a matching. Therefore

    nu(cone(H))=2b+mu(H).

Deleting spokes over a vertex set X only restricts the apex matching to H-X; the same construction gives

    nu(cone(H)-{ax:x in X})=2b+mu(H-X).

For ANY H-edge uv, append uv to a matching of H-{u,v}. This proves mu(H-{u,v})<=mu(H)-1. With S={au,av}, the decoration deletion identity yields

    nu(W-S)=2n+2b+mu(H-{u,v}) <= nu(W)-1.

Thus the graph has an explicit two-edge blocker for every edge of H. The fact that au and av are now K5 roots does not remove them from the old cone edge set or invalidate the identity. This is exactly the hypothesis missing from both stronger gates involving two-edge resilience.

## 5. All parameters, inequalities and binary realization

The three disjoint triangle families and edge partition give

    |V(W)|=4n+1,
    |E(W)|=10b+10n,
    |T(W)|=20b+10n,
    tau(W)=4n+4b,
    nu(W)=2n+2b+mu(H),
    pi(W)=4n+tau_B(H)>4n+4b+2Ln.

Since2mu(H)<=n,

    pi(W)-2nu(W)>2Ln-2mu(H)>=(2L-1)n>0.

H is nonempty and contains a K5, so mu(H)>0. Hence

    2nu(W)-tau(W)=2mu(H)>0.

Thus ordinary Tuza holds strictly, while the odd-cover bound fails. No inequality direction or factor of two is lost in passing from the incidence graph to the cone and the decoration.

The graphic binary representation is exact. Give every non-a vertex its own basis vector e_v, represent av by e_v and uv by e_u+e_v. Simplicity makes the edge vectors distinct and nonzero. A sum of three distinct edge vectors is zero precisely when the corresponding three-edge subgraph has even degree at every vertex; parity at a follows from the other vertex parities. In a finite simple graph a nonempty even-degree three-edge subgraph is a triangle. Thus the binary three-circuit family is exactly the actual graph triangle family, and covers, odd covers, packings and triangle deletions coincide. No abstract hypergraph is being passed off as a graph counterexample.

## 6. Separate bounded checks and their limits

The independently authored `review/binary_tf_fresh_checker.py` uses no producer implementation. It verifies the local K5 facts exhaustively: tau=pi=4, ten minimum covers, both root values, one minimum cover containing each specified triangle, and all56 deletion sets of size zero, one or two admitting a two-packing.

It also reconstructs the separately prescribed eleven-point rank-five control, enumerating all additive triples and all2^11 cover subsets. There are exactly the five listed triples; tau=2 with unique minimum cover{1,2}, pi=3, and TF fails. Its actual seven-vertex double-star cone has exactly the same five triangle triples under the stated edge labels. This small control is correctly NOT used as a TF counterexample.

The exact L=1 ambient-size arithmetic check only verifies parameter inequalities for the probabilistic proof. It does not sample a hypergraph, list a large W, or computationally verify the existence construction.

Auxiliary checker SHA-256:

    8db32f7c41720de465c732550905d8128293c8cfd12bcc894981658c2c54efab

Output `evidence/binary_tf_fresh/auxiliary_checks.json`, SHA-256:

    2eda848890494587bb4eb1acb78fe7cdaab879895eb2b7e4dfe44b7786501635

Reproduce only these bounded checks with:

```sh
source LOCAL_ENVIRONMENT
python3 review/binary_tf_fresh_checker.py
```

## Objections tested and resolved

1. **Expected imbalance versus all colorings:** the union bound explicitly covers all2^N colorings.
2. **Short-cycle deletion destroys the imbalance margin:** at most N hyperedges are removed, and m0>8(L+1)N preserves the strict margin.
3. **Connected-component selection loses the normalized bound:** minima add across disjoint incidence components, so some component keeps a strict bound relative to its own n.
4. **Probability count assumes independent overlapping hyperedges:** selection is independent by five-subset, and the cycle count restricts to distinct hyperedges; overlaps of vertices do not affect independence.
5. **Graph closure creates extra triangles:** linearity plus Berge-triangle exclusion proves exact ownership, and cone/fresh triangles are separately classified.
6. **Local odd covers already impose a global cut on H:** they do not; only the cone equations force the vertex-global rim assignment.
7. **Containing a local triangle leaves its root freely selectable:** it does not, but the other spoke covers every affected cone triangle.
8. **The cone's old packing conflicts with its matching:** local K5 two-packings avoid every matching edge, and only edge disjointness is required.
9. **Decoration repairs the blocker:** the original-edge deletion identity proves that it persists.
10. **The rank-five control or symbolic formulas are advertised as the large finite witness:** the note consistently separates them and makes no such claim.

No unresolved mathematical objection remains at the stated scope. Historical originality is unassessed. The appropriate verification status is an independently reconstructed ordinary probabilistic existence proof, with small auxiliary finite checks; it is not a literal-large-witness computation, human review or Lean/kernel proof.
