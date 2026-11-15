# K5 incidence blocks defeat a vertex-global cut even under two-edge packing resilience

Status: complete ordinary proof draft; independent review not yet requested/completed. This is an auxiliary architecture obstruction, not a Tuza counterexample. Originality is unestablished. It adapts the frozen TUZA-18 K4-incidence cut construction to K5 blocks specifically to retain two-edge maximum-packing resilience.

Write τ_B(G) for the minimum number of graph edges whose deletion makes G bipartite, equivalently the minimum number of monochromatic edges over all two-colorings of V(G).

## Exact refuted claim and theorem

The candidate claim was: every connected finite simple graph G satisfying

1. τ(G−e)=τ(G)−1 for every edge e (edge cover-criticality), and
2. ν(G−S)=ν(G) for every edge set S with |S|≤2,

has a vertex cut whose monochromatic edges number at most2ν(G).

This claim is false. More precisely, for every positive integer L there is a connected finite simple G with

    ν(G)=2b,  τ(G)=4b,  τ_B(G)>4b+2L|V(G)|,

for some b>0, while conditions1–2 hold and every graph edge has triangle codegree exactly3. Its triangle-edge components are separate literal K5 blocks.

Thus adding these two genuine necessary conditions for an edge-minimal Tuza violation does not rescue a SINGLE vertex-global cut bound. The construction does NOT satisfy all minimal-counterexample arithmetic: τ=2ν, not2ν+1; deleting a triangle in a K5 block leaves a book with cover number1, so τ(G−E(T))=4b−3 rather than2ν(G)−2=4b−2. The actual simultaneous deletion-tightness gate H-D is not refuted.

## Elementary incidence existence lemma

For every L≥1, there is a nonempty incidence-connected5-uniform hypergraph A, with n vertices and b edges, such that:

- distinct hyperedges meet in at most one vertex;
- there is no Berge cycle of length3;
- every vertex two-coloring leaves more than L n hyperedges whose split is neither2+3 nor3+2.

A Berge cycle of length ℓ uses distinct hyperedges A1,…,Aℓ and distinct cyclic vertices v1,…,vℓ with {vi,v(i+1)}⊆Ai. Berge2-cycle absence is exactly linearity.

**Proof.** For sufficiently large N, independently select each5-subset of [N] with probability p=N^(−15/4). Put μ=p binom(N,5), asymptotic to N^(5/4)/120.

Fix a two-coloring with classes r,s=N−r. Its number of balanced5-subsets is

    binom(r,2)binom(s,3)+binom(r,3)binom(s,2)
      = r(r−1)s(s−1)(N−4)/12.

Since r(r−1)s(s−1)≤N²(N−2)²/16, the fraction of balanced5-subsets is at most

    (5/8) N(N−2)/((N−1)(N−3)) ≤3/4   for N≥13.

For the last inequality, multiply positive denominators: it is equivalent to N²−14N+18≥0, valid at and above13. Thus the number X of selected unbalanced edges for this fixed coloring has mean z≥μ/4.

For any binomial X of mean z, exponential Markov applied to2^(−X) gives

    Pr[X≤z/2] ≤ 2^(z/2)(1−p/2)^M
               ≤ exp(−(1−log2)z/2) ≤ exp(−z/8),

where M is its number of trials. Therefore

    Pr[there exists a coloring with at most μ/8 bad edges]
       ≤2^N exp(−μ/32) →0.

For ℓ∈{2,3}, describe a Bergeℓ-cycle by its ℓ cyclic vertices and the three other vertices of each5-edge. There are at most N^(4ℓ) descriptions. Restrict to descriptions with distinct hyperedges; each occurs with probability p^ℓ. Hence the expected total number Y of short Berge cycles is at most

    N^(1/2)+N^(3/4).

Markov yields Pr[Y>N]≤N^(−1/2)+N^(−1/4)→0. For sufficiently large N choose a realization where every coloring has more than μ/8 bad edges and Y≤N. Delete one hyperedge from each short cycle, taking the union of the chosen edges. At most N edges are deleted, no cycle is created, and every coloring of the remainder has more than μ/8−N bad edges. Choose N large enough also that μ>8(L+1)N. The remainder therefore has more than L N unavoidable bad edges.

The minimum number of bad edges is additive over incidence components because their vertex sets are disjoint and can be colored independently. If each component Ai had at most L|V(Ai)| unavoidable bad edges, their sum would be at most L N, contradiction. Retain one component with strictly more. It is nonempty and has no isolated vertex. This proves the lemma with all quantifiers. No external high-girth hypergraph theorem is imported.

## Full graph construction and all actual triangles

Make each hyperedge of A an actual K5 on its five vertices, adding no other graph edges. Linearity makes block edge sets disjoint. Every actual graph triangle is contained in one block: if two of its edges have the same block, all three vertices belong to that block and uniqueness places its third edge there; if all three edges have distinct blocks, they form a forbidden Berge3-cycle. There are therefore exactly10b graph edges and10b actual triangles. The graph is connected because the incidence graph is connected.

The nonempty shared-edge triangle components are exactly the individual K5 blocks. Vertices can belong to several blocks; no graph edge does.

## Exact packing and covering values

In K5, two edge-disjoint triangles exist, for instance012 and034. Three would consume nine of its ten edges. Every vertex of K5 and of a triangle union has even degree, so the one-edge remainder would have even degrees, impossible. Hence ν(K5)=2.

A K5 edge lies in exactly three of its ten triangles, so three graph edges cannot cover all ten triangles. Four suffice: take the edge inside a two-vertex part and all three edges inside its three-vertex complement. Hence τ(K5)=4.

Actual triangles and graph edges factor over blocks. It follows that

    ν(G)=2b,  τ(G)=4b.

Every edge has triangle codegree3.

## Exact criticality and resilience checks

Every K5 edge belongs to some minimum four-cover: place its endpoints in one side of a2+3 partition. Deleting that edge leaves a three-cover of K5−e, and deleting one edge can reduce τ by at most one. Thus τ(K5−e)=3 and, blockwise, τ(G−e)=4b−1.

Deleting any two edges from K5 preserves a two-packing. There are two symmetry types, with vertices0,…,4:

- deleted01,02: use triangles034 and123;
- deleted01,23: use triangles024 and134.

Each displayed pair is edge-disjoint and avoids both deleted edges. A single deletion follows by adding any distinct edge to the forbidden set. In G, at most two deleted edges affect each block, and block edge sets are disjoint. Choose the corresponding surviving two-packing independently in every block to obtain2b triangles. Hence ν(G−S)=2b for every |S|≤2.

## Vertex nonsaturation also holds

For a vertex v lying in r blocks, removing v turns those r K5s into K4s and leaves every other block unchanged. No new triangles arise on deletion. Thus

    ν(G−v)=2b−r.

The FULL neighborhood link G[N(v)] consists of r vertex-disjoint K4s: neighbors from distinct incident blocks cannot be adjacent, since that would create a cross-block triangle through v. Its ordinary matching number is2r. Hence

    ν(G−v)+μ(G[N(v)])−ν(G)=r≥1.

Moreover every maximum link matching is perfect in each K4. Removing those matching edges from G−v leaves each affected K4 as a triangle-free C4. Therefore for every such maximum matching M,

    ν((G−v)−M)=2b−2r=ν(G−v)−r.

The precise vertex-nonsaturation and maximum-link-matching packing-loss properties from frozen TUZA-17 notes/A_CRITICAL_NONSATURATION.md therefore hold, with explicit gaps. They do not exclude this control. The source theorem uses Tutte–Berge for actual minimal violations; the displayed values here are elementary direct block computations and do not import that theorem.

## Cut lower bound

A block split2+3 has exactly4 monochromatic edges. A split1+4 has6, and a split0+5 has10. Consequently every coloring gives at least

    4b + 2·#{unbalanced blocks} > 4b+2L n

monochromatic graph edges. The block edge sets are disjoint, so no correction term is needed. Minimizing proves the theorem.

## Scope, overlap and live remainder

Frozen source: TUZA-18 commit57708a8413929012d9ca8d15b0f925b3ef6b51e8, notes/apex_pruned_critique.md proves the K4 incidence obstruction to its precisely defined packing-guided cut/pruning architecture; notes/criticality_connected_pc.md gives a robust probabilistic incidence construction and a one-apex connected triangle-component obstruction. Those texts do not assert the genuine two-edge packing resilience established here. The present argument is an adaptation, not an independent discovery of the incidence construction.

This new graph allows an independent balanced cut inside EACH triangle component, which exactly attains4b. Therefore it does not refute a componentwise cut rule, nor a claim restricted to one shared-edge triangle component together with criticality and resilience. That strengthened combination is not promoted to a proof candidate: no operation or availability theorem has been supplied. No larger search, connecting gadget or process is authorized merely to hide this material limitation.

Verification: all-size ordinary proof above; no Lean verification, finite literal large witness, independent fresh-context audit, or human review yet.
