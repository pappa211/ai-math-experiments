# TF does not normalize odd covers, even in actual graphs

Status: complete ordinary counterconstruction, with independent fresh challenge requested. It refutes H-BTF and the weaker TF-only factor-two odd-cover gate. The graph family exists by a self-contained probabilistic incidence lemma; no literal large finite edge list or finite verification of that existence construction is claimed. The TF-plus-two-edge-resilience odd-cover gate remains untouched because the constructed graphs have an explicit two-spoke packing blocker.

This result supersedes the open all-rank status recorded earlier in `binary_tf_rank4.md`. Its rank-four theorem remains valid. No originality, Lean or human-verification claim is made.

## Exact theorem

For every integer L>=1, there is a connected finite simple graph W and positive integers n,b such that W has TF and

`|V(W)|=4n+1, |E(W)|=10b+10n, number of actual triangles=20b+10n`,

`tau(W)=4n+4b`,

`nu(W)=2n+2b+mu(H)`,

`pi(W)=4n+tau_B(H)>4n+4b+2Ln`,

where H is a connected n-vertex graph composed of b edge-disjoint K5 triangle blocks, mu denotes ordinary matching number, and tau_B denotes the minimum number of monochromatic edges over a two-coloring of graph vertices.

Since `2mu(H)<=n`, these identities imply

`pi(W)-2nu(W)>(2L-1)n>0`.

In particular `pi(W)>tau(W)`, although EVERY actual triangle lies in some minimum ordinary triangle cover. The ordinary Tuza inequality holds with exact slack

`2nu(W)-tau(W)=2mu(H)>0`.

For every edge uv of H, deleting the two original cone spokes au,av lowers nu(W) by at least one. Thus no two-edge packing-resilience claim is hidden in the construction.

Because every finite simple graph's triangle family is a binary three-circuit restriction, W is also a genuine graphic counterexample to H-BTF: binary addition does not rescue TF-only normalization.

## 1. A general TF/parity lift

Let H be a finite graph with n vertices, such that H has TF and every H-edge lies in a triangle. Form B=cone(H) by adding a new vertex a joined to every H-vertex. For each new spoke av, attach a fresh K5 along that edge: add three new vertices and complete the K5 on a,v and those three vertices. The fresh triples are disjoint and no other edges are added. Call the result W.

The following identities hold for every such H:

`tau(W)=4n+tau(H)`,

`pi(W)=4n+tau_B(H)`,

`nu(W)=2n+nu(cone(H))`.

Moreover W has TF. The proof does not assume packing resilience of H or B.

### All actual triangles and edge ownership

Every triangle is either an old H-triangle, a cone triangle auv for uv in E(H), or a triangle wholly inside one attached K5. A fresh vertex has no neighbour outside its own K5, so it creates no other interface triangle. Each local K5 has only two original vertices a,v; hence all ten of its triangles are new.

The sets E(H) and the n complete attached K5 edge sets partition E(W). Every new spoke is the root of exactly one block.

### Exact ordinary cover cost and TF

Each K5 needs four edges to cover its triangles and has a four-edge odd cover given by the edges internal to a 3+2 partition. Both root values occur among these minimum covers. For a fixed local triangle T, taking T as the three-vertex part gives a minimum four-cover containing T; the root's value is then fixed by that partition, not freely chosen.

A W-cover restricts to a cover of H and to a cover of each K5, giving the lower bound `tau(H)+4n`. For equality, take a minimum H-cover and a minimum root-containing four-cover in every K5. All cone triangles then meet their selected spokes.

To establish TF, produce a minimum global cover containing each triangle:

- For an H-triangle, choose its containing minimum H-cover and select every spoke root in the local four-covers.
- For a cone triangle auv, choose a minimum H-cover containing uv, and select every root. Such an H-cover exists because uv lies in some H-triangle and H has TF. Then uv,au,av are all selected.
- For a local K5 triangle, choose the local four-cover containing it. Select every other spoke root and use any minimum H-cover. If the special root av is unselected, every cone triangle avw remains covered by its other spoke aw. All H-triangles remain covered independently.

Every displayed cover has `tau(H)+4n` edges. Thus W has TF on its full actual triangle family.

### Exact odd-cover cost

An odd cover of B=cone(H) has spoke indicators x_v. Its cone triangle auv forces the rim indicator

`c_uv=1+x_u+x_v` over F2.

These values automatically satisfy every old H-triangle equation: the three constant terms contribute one, and every spoke term occurs twice. Thus the possible old-rim indicators are exactly the monochromatic-edge indicators of vertex two-colorings of H.

Fix such an odd assignment on B. In the K5 attached to av, a minimum odd cover has four edges for either prescribed root value x_v. Its new edges therefore cost `4-x_v`. Adding the original B cost cancels all spoke contributions:

`sum_(uv in E(H)) c_uv + sum_v x_v + sum_v(4-x_v)`

`=4n+sum_(uv in E(H)) c_uv`.

Conversely every odd cover of W restricts to such an assignment on B and must spend at least four edges in every local K5, giving the same lower bound. The local minimizing states extend independently because all actual triangles have already been classified. Minimizing gives exactly `pi(W)=4n+tau_B(H)`.

### Exact packing cost and old-edge deletions

A K5 has packing number two and admits a two-packing avoiding any specified root edge. For example with root uv and fresh vertices p,q,r, use upq and vpr. Triangle partition gives the upper bound `nu(B)+2n`; combining a maximum B-packing with root-avoiding local packings attains it.

The same proof works after deleting ANY original B-edge set S, including spoke roots:

`nu(W-S)=2n+nu(B-S)`.

Indeed all local root-avoiding two-packings survive, while every remaining old triangle lies in B-S. This identity will preserve the explicit blocker below.

## 2. An incidence graph H with TF but a larger global cut cost

We use the K5-incidence construction developed in `global_routes_critical_cut_obstruction.md`. Its precise source snapshot and hash are retained under `evidence/binary_tf/`. The argument is reconstructed here so that the existence claim is explicit.

For every L>=1, there is a nonempty incidence-connected 5-uniform hypergraph A on n vertices with b hyperedges such that:

1. Distinct hyperedges meet in at most one vertex.
2. There is no Berge triangle (three distinct hyperedges joining three distinct cyclic vertices).
3. Every vertex two-coloring leaves more than Ln hyperedges split other than 2+3.

### Self-contained probabilistic existence

On N vertices select each five-subset independently with probability `p=N^(-15/4)`, and put `m0=p*choose(N,5)`, asymptotic to `N^(5/4)/120`.

For any fixed two-coloring with class sizes r,s, the number of 2+3-balanced five-subsets is

`choose(r,2)choose(s,3)+choose(r,3)choose(s,2)`

`=r(r-1)s(s-1)(N-4)/12`.

Since `r(r-1)s(s-1)<=N^2(N-2)^2/16`, their fraction is at most

`(5/8)*N(N-2)/((N-1)(N-3))<=3/4` for N>=13.

Thus the number X of selected unbalanced sets for this coloring has mean z>=m0/4. Exponential Markov applied to `2^(-X)` gives

`Pr[X<=z/2] <= exp(-(1-log(2))*z/2) <= exp(-z/8)`.

A union bound over all `2^N` colorings shows that, with probability tending to one, every coloring has more than m0/8 selected unbalanced sets, because

`2^N exp(-m0/32) -> 0`.

For a Berge cycle of length ell in {2,3}, specifying its ell cyclic vertices and the other three vertices of each hyperedge gives at most `N^(4ell)` descriptions. Requiring distinct hyperedges gives expected counts at most `N^(1/2)` and `N^(3/4)` respectively. By Markov, the probability that the total short-cycle count exceeds N tends to zero.

For sufficiently large N choose a realization satisfying both properties. Delete one hyperedge from each short Berge cycle, taking the union of those deletions. At most N hyperedges are removed; no new cycle appears. Every coloring of the remaining hypergraph still has more than `m0/8-N` unbalanced hyperedges. Choose N large enough that `m0>8(L+1)N`; the remainder then has more than LN unbalanced edges under every coloring.

Minimum unbalanced-edge count adds over incidence components. If every nontrivial component had minimum at most L times its vertex count, their sum would be at most LN, a contradiction. Retain a component with the strict inequality. This proves the claimed finite existence lemma. It is an ordinary probabilistic existence proof, not a statement that a particular large hypergraph was generated or exhaustively checked.

### Actual graph and its local optima

Turn each hyperedge into a K5 on its five vertices. Linearity makes the K5 edge sets disjoint. Every actual graph triangle belongs to one block: if two of its edges belong to the same block, all three vertices and the third edge belong there; otherwise its three distinct blocks form a forbidden Berge triangle. Thus H has exactly `10b` edges and `10b` actual triangles. It is connected.

K5 has packing number two and cover number four. The packing upper bound follows because three triangles would leave one edge of the even-degree K5, which is impossible for an edge-disjoint triangle union. For covering, three edges hit at most nine of the ten triangles, while a 3+2 internal-edge cover has size four. Therefore

`nu(H)=2b`, `tau(H)=4b`.

Every K5 triangle is contained in a minimum four-cover: take its three vertices as the three-part of a 3+2 partition. Combining these independently proves TF for H, and every H-edge lies in a triangle.

A block split 2+3 has four monochromatic edges; a 1+4 split has six, and a 0+5 split has ten. Consequently every vertex coloring of H has more than `4b+2Ln` monochromatic edges. Thus

`tau_B(H)>4b+2Ln`.

The distinction is essential: H's minimum odd covers can choose states separately in each triangle block, so `pi(H)=tau(H)=4b`; its SINGLE vertex-global cut must obey all vertex identifications and incurs the larger cost. The cone in Section 1 forces exactly that extra global consistency.

## 3. Exact packing number of the cone and the two-spoke blocker

A cone packing splits into an old H-packing and apex triangles whose bases form a matching M of H. Hence

`nu(cone(H))<=2b+mu(H)`.

For the reverse inequality, choose a maximum matching M of H. In each K5 block, M uses at most two edges, since those edges have distinct endpoints among five vertices. K5 retains a two-triangle packing after deleting any two edges. The two symmetry cases have explicit certificates: deleted 01,02 permit 034 and 123; deleted 01,23 permit 024 and 134. Thus every block has a two-packing avoiding its M-edges. Their union is compatible with all apex triangles on M and has `2b+mu(H)` members. Therefore

`nu(cone(H))=2b+mu(H)`.

The same reasoning works after deleting apex spokes over any vertex set X:

`nu(cone(H) minus {ax:x in X})=2b+mu(H-X)`.

Now take any H-edge uv. Adjoining uv to a matching of H-{u,v} proves `mu(H-{u,v})<=mu(H)-1`. Consequently

`nu(cone(H)-{au,av})<=nu(cone(H))-1`.

Section 1's old-edge deletion identity then gives the exact retained blocker in W:

`nu(W-{au,av})=2n+2b+mu(H-{u,v})<=nu(W)-1`.

The spokes au,av remain ordinary graph edges of W even though they are roots of their attached K5s. This explicitly identifies the missing hypothesis in the stronger TF-plus-resilience gate.

## 4. Parameters, binary realization and refuted scopes

For the H just constructed, W has:

- n old H-vertices, one cone vertex, and 3n fresh vertices, totalling 4n+1;
- 10b old H-edges and ten edges in each of n spoke-root K5s, totalling 10b+10n;
- 10b old H-triangles, 10b cone triangles, and 10n local triangles, totalling 20b+10n.

The general lift and the exact cone packing formula prove all identities in the theorem. The inequality `2mu(H)<=n` yields `pi(W)>2nu(W)`, while `tau(W)<2nu(W)` follows from the positive matching number of the nonempty H.

To realize W as a binary restriction, fix its cone vertex a as a root and assign a distinct basis vector e_v to each of its other 4n vertices. Represent edge av by e_v and any other edge uv by `e_u+e_v`. All edge vectors are distinct and nonzero because W is simple. Three distinct edge vectors sum to zero exactly when their three graph edges form a triangle: the corresponding three-edge subgraph has every vertex of even degree, which in a simple graph forces a three-cycle. Thus the binary three-circuit family is EXACTLY the actual triangle family of W.

This refutes:

- H-BTF: TF implies `pi=tau` for every binary geometry restriction.
- The graph-only normalization TF implies `pi=tau`.
- The weaker graph/binary claim TF alone implies `pi<=2nu`.

It does not refute the original H-O2 premise combining cover-criticality with two-edge resilience, or the strengthened premise combining TF with two-edge resilience. W fails the latter condition explicitly. Nor does it refute unrestricted Tuza: its ordinary cover satisfies the inequality with slack.

## 5. The bounded rank-five control, kept separate

Root also supplied a small non-TF control showing why the unconditional rank-four theorem cannot extend unchanged. Let the six spoke points be

`u=1, v=2, p=4, q=8, r=16, s=31`

in F2^5, so their sole relation is the even relation `u+v+p+q+r+s=0`. Add the five rim points

`u+v=3, u+p=5, u+q=9, v+r=18, v+s=29`.

The resulting eleven points have exactly the five prescribed spoke-spoke-rim triangles. Its unique minimum cover is `{u,v}`, of size two; adding the central rim point gives an odd three-cover, and the unique two-cover is not odd. Hence `tau=2, pi=3`, and TF fails. The five-triangle family is also the actual triangle family of the cone over a six-vertex double-star.

`checks/binary_tf_rank5_control.py` checks only this prescribed point set, all its actual additive triples, and all 2^11 cover subsets. It is not a rank-five census and is not used as a counterexample to H-BTF. Its role is solely the boundary control preceding the structural construction above.

## 6. Evidence, provenance and verification level

The K5-incidence source was read from `notes/global_routes_critical_cut_obstruction.md` and preserved unchanged as `evidence/binary_tf/cut_obstruction_input.md`; its SHA-256 is recorded in the manifest. The incidence existence proof, TF/parity lift, exact cone packing formula and surviving blocker are reconstructed in this note. No external literature theorem or unpublished black-box result is imported.

The large counterexample is an existence family with exact symbolic formulas in n,b,mu(H),tau_B(H). No particular large incidence hypergraph, literal W edge list, or numerical exact optimum is claimed to have been computed. This distinction does not weaken the ordinary existence refutation, but it is a material reproduction boundary: a literal finite instance would be separate work and was not needed or attempted after the all-size proof settled the claim.

Files:

- `notes/binary_tf_cone_decoration_obstruction.md`: complete counterconstruction.
- `evidence/binary_tf/cut_obstruction_input.md`: frozen incidence-source proof.
- `checks/binary_tf_rank5_control.py` and `evidence/binary_tf/rank5_control.json`: separate prescribed small control.
- `evidence/binary_tf/cone_decoration_manifest.json`: frozen hashes.
- `evidence/binary_tf/cone_decoration_provenance.json`: clock, requested metadata, source identity and verification limits.

Original mission clock remains start 2026-11-15 01:53:58 UTC, research cutoff 09:23:58 UTC, hard deadline 09:53:58 UTC. All computation was local Darwin with pinned Python's standard library. Requested configuration Astra/Ultra; actual serving metadata is not exposed and is not asserted. No higher-rank census, explicit-large-instance search, remote execution, Lean, human review or public publication occurred. Independent fresh review is requested; it has not yet been claimed in this note.
