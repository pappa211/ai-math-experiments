> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent reconstruction: Candidate02 is false

Status: **REFUTED**, with ordinary proofs and an independent finite certificate. This refutes mandatory preselection of every singleton gain. It does not refute PK-all, PK-exists or unrestricted Tuza. For this graph the specified permitted optimum is exactly2nu; its unrestricted optimum is smaller.

## Literal graph and full triangle scope

Vertices are0,...,11. Take the union of the complete graphs on these five vertex sets:

- K={0,1,2,4,5}, a K5;
- B0={0,1,3,6};
- B1={1,6,7,8};
- B2={1,8,9,10};
- B3={1,3,10,11}.

The last four are K4s. There are29 edges and26 actual triangles. Every actual triangle lies in exactly one of the five displayed blocks. This can be checked directly from neighborhoods or the complete list in `data/verifier_candidate02_counterexample.json`; all26 were independently reconstructed from the union edge set, including crossing candidates. No triangle is excluded by fiat.

Specify the packing

    P={013,124,025,167,189,{1,10,11}}.

The six triangles share no edge. Every triangle in any packing belongs to one of the five blocks. A K4 contributes at most one edge-disjoint triangle. A K5 contributes at most two: three triangles would leave one edge, contradicting even vertex degrees. Hence every packing has size at most2+4=6. Thus nu(G)=6 and P is maximum. The independent enumerator additionally lists all891 maximum packings and checks all657800 seven-triangle subsets for overlap. This is a packing upper-bound certificate, not a claim that permitted covers were tested for every one of those891 packings. The root's earlier cover scan stopped after512 packings and remains partial at that scope.

## Privacy and allowed edges

The exact private pages, in packing order, are

    036,145,045,678,{8,9,10},{3,10,11}.

Their private bases are

    R={03,14,05,67,89,{10,11}}.

Each owner has exactly one private page and one private base. There is no private K4 completion. Therefore A(P)=B(P), the18 packed edges, and every permitted cover contains R.

The canonical centre and private apex give the gains

    16,25,24,18,{1,10},13.

They are six different packed spokes. None is a selected base. In particular, this witness has no unused budget from base gains or repeated gains.

## Candidate02 obstruction: constrained optimum thirteen

Let F be the set of all six gains. The twelve-edge set R union F misses exactly triangle012. Since |F|=k=6, a spoke set containing F within the claimed k-edge budget must equal F itself. It fails the real three-literal residual clause {01,02,12}.

Every cover containing R union F therefore has at least thirteen edges. Adding01 gives a valid thirteen-edge permitted cover. Thus the exact forced-gain optimum is13>2nu=12. No literal was shortened or omitted, and no alternative packing or allowed set is used.

## Original permitted optimum twelve

The six bases are forced. The following actual triangles give six residual clauses with pairwise disjoint physical edge sets:

| Triangle | Residual clause |
|---|---|
|016|{01,16}|
|178|{17,18}|
|{1,9,10}|{19,{1,10}}|
|{1,3,11}|{13,{1,11}}|
|024|{02,24}|
|125|{12,25}|

Consequently at least six additional spokes are required, and c_G(P)>=12. The set

    R union {02,13,16,18,{1,10},25}

is a permitted cover of all26 triangles and has size twelve. Therefore c_G(P)=12=2nu(G).

The cover replaces just mandatory gain24 by02, preserving coverage and hitting012. This shows why a successful global mechanism must be able to revise gain choices, rather than merely spend leftover gain savings. It does not demonstrate a need to alter both lending cycles or a long coupled-repair obstruction.

## Unrestricted optimum ten

Let H=B0 union B1 union B2 union B3. The common edges of adjacent H-blocks are the four spokes

    13,16,18,{1,10}.

These form a cyclic order of block interfaces; all other H edges belong to one block. If an H-cover selects r of the shared spokes, and t blocks have both their shared spokes selected, then

    |C|+r = sum_i |C intersection E(Bi)| >= 8+t.

Each K4 needs at least two cover edges. If its two shared spokes are both selected, they are adjacent edges of that K4, and at least one more edge is needed. This explains the extra t term.

For a subset of the four cyclic spokes,8+t-r is at least six. Equality six occurs only when r=2 and the chosen spokes are opposite in the cycle. Each block must then use exactly two opposite cover edges. In B0 its selected shared spoke is either13 or16, whose opposite edge is06 or03. Hence a six-edge H-cover cannot contain01.

A six-edge H-cover exists:

    {13,18,06,67,{9,10},{10,11}}.

Thus tau(H)=6; any H-cover containing01 has at least seven edges. The only edge common to K and H is01. For a full G-cover omitting01, the restrictions need at least4+6=10 distinct edges. For a cover containing01 they need at least4+7-1=10. The union of the displayed H-cover and the K5-cover{01,24,25,45} gives ten edges. Therefore tau(G)=10.

These ordinary arguments agree with an independent exact hitting-set computation. The full inequalities are

    tau(G)=10 < c_G(P)=12=2nu(G) < forced_gain_cover_optimum=13.

## Verification boundaries and next obligation

The checker reconstructs this graph from its five complete blocks, not from producer edge data, and only then compares its literal edges and triangles with the root's record. It independently verifies P, maximum cardinality, privacy, allowed set, forced-gain failure, exact original optimum, and unrestricted optimum. Both cover optima have ordinary lower-bound proofs above; no unchecked solver result is required. There is no Lean formalization or novelty claim.

This is a load-bearing refutation of Candidate02's universal quantifier over fixed all-type-one maximum packings. The repair must permit revising gains within and across lending cycles while preserving all two- and three-owner clauses. The witness alone supplies no general existence or termination theorem, and mixed type-zero/private-K4 obligations remain open.
