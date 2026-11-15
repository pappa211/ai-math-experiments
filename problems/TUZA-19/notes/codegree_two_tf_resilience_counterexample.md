# TF and two-edge packing resilience do not force triangle codegree three

Status: complete ordinary gadget proof with an exact literal certificate; independent fresh review requested. This refutes the proposed minimum-codegree-three consequence of TF plus two-edge packing resilience. It is not a Tuza counterexample and does not refute either odd-cover gate. No novelty or formal-verification claim is made.

## Exact counterexample

There is a finite simple graph W with

`|V|=72, |E|=216, number of actual triangles=240, nu=49, tau=pi=86`

such that:

1. For EVERY actual triangle T, `tau(W-E(T))=tau(W)-3` (TF).
2. For EVERY set S of at most two graph edges, `nu(W-S)=nu(W)`.
3. Five graph edges each belong to exactly TWO actual triangles.

In particular, the two stated minimal-counterexample consequences do not imply triangle-edge codegree at least three. The graph has substantial ordinary Tuza slack, `2nu-tau=12`. No claim is made that all properties of a genuine minimal Tuza violation hold here.

The construction uses a two-edge-resilient base B, an induced TF subgraph H, and twenty K5 attachments. The proof below first gives the general lifting statement, then specifies B,H literally and records the finite base certificate.

## 1. Induced TF core and K5 decoration lemma

Let B be any finite simple graph with `nu(B-S)=nu(B)` whenever `|S|<=2`. Let H=B[U] be an induced subgraph with TF, and assume every edge of H belongs to a triangle of H. Put `D=E(B) minus E(H)`, with `d=|D|`.

For every e=uv in D, add three fresh vertices, distinct for different e, and all edges completing a K5 on u,v and these three vertices. Keep all B edges and add no other edges. Call the resulting graph W. The shared edge uv is that block's root.

**Triangle classification.** A fresh vertex has neighbours only in its own block. Therefore every triangle containing a fresh vertex lies wholly in that K5. Triangles with no fresh vertex are precisely the actual triangles of B. No local triangle is an old triangle because each block has only two old vertices. These are all actual triangles; there are no omitted interface triangles.

**Edge partition.** The sets E(H) and the d complete K5 edge sets partition E(W). Different blocks may share old vertices, but they share no edges. A B-triangle outside H contains at most one H-edge: three old vertices with two H-edges would all lie in U, and inducedness would put their third edge in H as well. Thus every outside triangle has at least two decorated roots.

### Local K5 facts

A K5 has triangle-packing number two. Three edge-disjoint triangles would leave one of its ten edges, impossible because K5 and any edge-disjoint union of triangles have even degree at every vertex. Two packed triangles are explicit.

Its ordinary cover number is four. A triangle-free graph on five vertices has at most six edges: for every edge xy, triangle-freeness gives `deg(x)+deg(y)<=5`; summing yields `sum deg(v)^2<=5m`, while Cauchy gives `sum deg(v)^2>=4m^2/5`, hence `m<=25/4`, so integer m<=6. Deleting the four edges internal to a 3+2 partition leaves K3,2 and attains the bound. These four-edge covers meet every triangle in one or three edges.

Both values of a specified root edge occur in such a minimum cover: put its endpoints together or apart. For a specified local triangle T, the unique 3+2 partition with T as its three-vertex part gives a four-edge cover containing T. This **fixes** the root value according to whether its endpoints lie in the same part; the proof does not claim both root values remain possible while containing that fixed T.

A maximum K5 packing can avoid a specified root uv: with fresh vertices p,q,r, use upq and vpr. K5 also retains a two-triangle packing after deleting any two edges. Up to vertex symmetry, deleted adjacent edges 01,02 are avoided by triangles 034,123; deleted disjoint edges 01,23 are avoided by 024,134. Deleting zero or one edge follows by extending the deletion set to two edges.

### Exact packing number and lifted resilience

Every packing splits into old B-triangles and local block triangles, so it has at most `nu(B)+2d` members. Conversely take a maximum B-packing and a two-triangle local packing avoiding every root. Their union is edge-disjoint. Hence

`nu(W)=nu(B)+2d`.

Now delete an arbitrary edge set S with `|S|<=2`. Call a block affected when S contains one of its edges, including its root. Form a set R of B-edges consisting of the root of each affected block and each deleted H-edge. Every deleted edge contributes to at most one such requirement, so `|R|<=|S|<=2`.

By B's resilience, choose a maximum B-packing avoiding R. In every affected block choose a two-triangle K5 packing avoiding its locally deleted edges; it may use the root, which the B-packing avoids. In every unaffected block choose a two-triangle packing avoiding the root. These packings have no edge conflicts, avoid S, and together have `nu(B)+2d` members. Therefore W is two-edge packing-resilient. This covers two deletions in one block, deletions in different blocks, deleted original roots, and deleted undecorated H-edges uniformly.

### Exact ordinary cover number and TF

Every W-cover restricts to a cover of H and to a cover of each K5. The edge partition therefore gives the lower bound `tau(W)>=tau(H)+4d`.

For equality, take any minimum H-cover and, in every K5, a minimum four-cover containing its root. Every outside B-triangle contains at least two selected roots, so all triangles are covered. Thus

`tau(W)=tau(H)+4d`.

For TF, construct a minimum cover containing each possible triangle:

- If T lies in H, use a minimum H-cover containing T, and minimum root-containing covers in all blocks.
- If T is an old B-triangle outside H, it has zero or one H-edge. If it has one, that edge lies in some H-triangle and hence in a minimum H-cover by TF. Choose such an H-cover, and select every decorated root as before. All three T-edges are selected.
- If T is a local K5 triangle, use the local four-cover containing it, with whatever root value this forces. Use root-containing minimum covers in all other blocks and any minimum H-cover. If the special root is unselected, every old B-triangle containing it still has another decorated root, since it is outside induced H. Thus the global cover remains valid, still has `tau(H)+4d` edges, and contains T.

These cases exhaust the actual triangle list. W has TF.

### What happens to codegrees

An old edge gains new common neighbours only when it is itself a decorated root. In particular every edge of H has exactly the same triangle codegree in W as it had in B. This is explicitly a comparison with B, not necessarily with H: an induced subgraph can have outside common neighbours in B.

## 2. The fixed base B and induced core H

Use rim vertices 0,...,9. The Petersen rim R has the fifteen edges

- outer cycle `i -- (i+1 mod 5)` for i=0,...,4;
- inner cycle `5+i -- 5+(i+2 mod 5)` for i=0,...,4;
- five spokes `i -- (5+i)` for i=0,...,4.

The two cycles and their matching give a triangle-free cubic graph. Add adjacent apices a=10,b=11, each joined to all ten rim vertices. This is B=`K2 join R`. It has twelve vertices, thirty-six edges and forty actual triangles: thirty apex-plus-rim-edge triangles and ten triangles abv.

Let H be the induced subgraph on `{0,1,2,3,4,10,11}`. It is `K2 join C5`, with seven vertices, sixteen edges, fifteen actual triangles, and `tau(H)=6`. Thus D has twenty edges.

### Ordinary proof that H has TF and tau six

A cover containing ab must additionally cover the two independent apex copies of the rim edges. If S is used as the spoke set at both apices, the cost after ab is `2|S|+e(C5-S)`. Since the rim is 2-regular,

`2|S|+e(C5-S)=5+e(C5[S])>=5`.

The independent-multicone cover formula proves the same lower bound even when the two apex spoke sets initially differ. Thus an ab-containing cover has at least six edges. A cover omitting ab needs at least one spoke over each rim vertex. Five edges would mean exactly one such spoke at each vertex and no rim edge; the apex choices would have to alternate around C5, impossible. Hence every cover has size at least six. The set consisting of ab and all five rim edges attains six.

For a triangle abv, take ab,av,bv and the three rim edges not incident with v. This is a six-cover containing the triangle. For a triangle auv over a rim edge uv, select uv and exactly one spoke over each rim vertex, alternating the apex choice along the four-edge path C5-uv, with both endpoints assigned to a. This is a six-cover containing auv. The construction for b is symmetric. These exhaust H's triangles and prove TF. Every H-edge lies in at least one of these triangles.

### Exact base packing certificate and resilience

Every B-packing has either zero or one abv triangle. Without one, its rim edges split into two edge-disjoint ordinary matchings of R. With abv, those two matchings avoid v. This is a complete packing classification, not a restricted search family.

The independent standard-library enumeration in `checks/codegree_two_petersen_join.py` lists all 332 ordinary matchings of the explicit fifteen-edge rim. It examines all ordered disjoint pairs, with and without each possible abv triangle. There are 157,258 distinct used-edge masks; their maximum packing size is nine, attained by 960 masks. The receipt contains a nine-triangle packing avoiding EVERY one of the 630 pairs of B-edges. Each certificate is literal: its triangles, edge disjointness, cardinality and avoidance can be checked directly against the thirty-six-edge graph.

There is also a short upper-bound check independent of the large state count. If abv is used, each apex matching lies on nine rim vertices and has size at most four, giving at most nine triangles. Otherwise a packing of ten would be two disjoint perfect matchings of the cubic Petersen graph. Its six possible perfect matchings all have complements consisting of two odd 5-cycles; therefore no complement can be partitioned into the two perfect matchings required. This six-matching fact can be checked directly from the fifteen-edge literal list, or by the small matching enumeration. A displayed nine-packing establishes equality.

Consequently `nu(B)=9`, and B is two-edge packing-resilient. The finite assertion used in the lifting lemma is fully retained, rather than inferred from typical Petersen properties.

The direct B candidate was initially tested for the desired TF/codegree assertion and failed: it has `tau(B)=pi(B)=12`, but every minimum cover selects ab, while a minimum cover omitting ab costs thirteen. No minimum cover contains a rim-based triangle fully. B is nevertheless edge-cover-critical and two-edge packing-resilient, with codegree-two rim edges. Thus it separately shows that the original H-O2 premises without TF do not force codegree three. The decoration construction repairs TF while retaining an induced TF core's codegree-two edges.

## 3. Parameters and exact certificates of W

Attach a fresh K5 along every B-edge outside H, using fresh vertices `12+3j,13+3j,14+3j` for the j-th decorated edge in lexicographic order. There are twenty blocks. Therefore

- vertices: `12+3*20=72`;
- edges: `36+9*20=216`;
- triangles: `40+10*20=240` (all ten local K5 triangles are new);
- packing number: `9+2*20=49`;
- cover number: `6+4*20=86`.

The five outer-cycle edges `01,12,23,34,04` each have common neighbours exactly a,b in B. They are undecorated, so their codegree remains exactly two in W. No K5 fresh vertex adds a triangle on these edges.

The ordinary cover optimum is also an odd-cover optimum. Color a,b oppositely and alternate the outer C5 colors with a single monochromatic rim edge, giving a six-edge odd cover of H. Extend those vertex colors arbitrarily to the rest of B. Their monochromatic edges give an odd cover of B. In each attached K5 use a minimum odd four-cover with the root value prescribed by that B assignment. If its root indicator is x, its new edges contribute `4-x`, cancelling the objective contribution x of that decorated B-edge. The final total is `6+4*20=86`. Since every odd cover is an ordinary cover, `pi(W)=tau(W)=86`.

`checks/codegree_two_tf_lift.py` reconstructs the graph, enumerates every actual vertex triple, validates a minimum containing cover for each of its 240 triangles, and checks a 49-triangle packing for all 23,220 unordered pairs of its 216 edges. Zero- and one-edge deletion cases follow by extending them to pairs. It independently validates all 630 retained base certificates before using them and exhaustively checks the local K5 packing cases. No assumed positive outcome is substituted for checking the generated packing and cover objects.

## 4. Reproduction, isolation and scope

Run locally from the TUZA-19 workspace:

```sh
source LOCAL_ENVIRONMENT
python3 checks/codegree_two_petersen_join.py
python3 checks/codegree_two_tf_lift.py
```

Evidence:

- `evidence/codegree_two/petersen_join.json`: literal base graph, all forty triangles, the complete base pair-deletion certificate, exact cover/packing counts, and the failed-TF control.
- `evidence/codegree_two/tf_lift_witness.json`: full W edge and triangle lists; five codegree-two edges; 240 minimum-cover TF certificates; an optimum odd cover and packing; local K5 deletion certificates; and a digest of the deterministic full lifted deletion-certificate sequence.
- `evidence/codegree_two/input_manifest.json`: frozen mathematical note and evidence hashes for fresh challenge.
- `evidence/codegree_two/provenance.json`: original clock, host boundary, dependencies and preserved failed first candidate.

No broad graph census was run. The computation concerns one fixed Petersen join and its fully specified decoration. The all-size lifting proof explains every global quantifier, while the finite certificate establishes the small base's resilience. A fresh independent reconstruction is requested; at this point this note does not claim one has occurred.

The original mission clock remains 2026-11-15 01:53:58 UTC through research cutoff 09:23:58 UTC and hard deadline 09:53:58 UTC. All computation ran locally on the owner's Darwin Mac, using the pinned Python standard library. Requested controls were Astra/Ultra; exact serving metadata is not exposed and is not asserted. No Lean, remote execution, public publication, or human verification occurred.
