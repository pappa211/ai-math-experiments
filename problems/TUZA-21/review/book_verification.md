> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent check of the switched-four-cycle book discriminator

**Accepted scope: ORDINARY_PROOF plus FINITE_CERTIFICATE.** The proposed deduction is correct. On this single eight-vertex graph, every cover produced by the specified support-preserving book construction has at least nine edges, whereas the original permitted optimum is eight. This defeats the universal availability condition `2a-r_new >= k` for that construction. It does not refute PK-all, PK-exists, arbitrary book methods, optional-gain methods, or Tuza.

This reviewer used literal graph geometry and an independently authored pure-Python checker. No producer checker was imported or read. The source construction definition was reconstructed from the copied TUZA-20 note `sources/tuza20/notes/prior_art_book_interface.md`. The argument below is self-contained and does not require Wang's or Haxell's proof body. No historical originality is claimed.

## Literal graph and all triangles

Use subscripts modulo four. The vertices are `x_0,...,x_3,a_0,...,a_3`. The x-vertices induce K4. Each a_i is adjacent exactly to x_(i-1), x_i, x_(i+1). No two a-vertices are adjacent. Let

- `T_i = {x_(i-1),x_i,a_i}` be the prescribed owner;
- `Q_i = {x_(i-1),x_(i+1),a_i}`;
- `U_i = {x_i,x_(i+1),a_i}`;
- `K_i = {x_(i-1),x_i,x_(i+1)}`;
- `b_i = x_(i-1)a_i` and `g_i = x_i x_(i+1)`.

Every actual triangle is one of the four K_i or one of T_i,Q_i,U_i at an a_i. This follows directly from the absence of a-a edges and the three-element neighborhood of each a_i. There are 18 graph edges and 16 triangles.

The four T_i are edge-disjoint. Any packing with q core triangles contains q distinct K_i. Each selected K_i prevents every triangle through its particular a_i: every triangle through a_i uses a core edge of K_i. At most one triangle through any single a_i can be packed, since two two-element subsets of its three neighbors intersect and hence the corresponding triangles share an a_i-edge. Consequently any packing has size at most `q+(4-q)=4`. Thus `nu=4`.

## Original permitted optimum

The support B consists of the four cycle edges g_i and the eight edges a_i x_(i-1),a_i x_i. Q_i meets B only in b_i. U_i meets B in `a_i x_i` and `g_i`; K_i meets B in two cycle edges. Thus Q_i is the unique private page for T_i, and there is no private K4 completion. In particular, `A(P)=B(P)`; the latter equality was also reconstructed directly in the checker, rather than assumed from a type label.

Every permitted cover contains the four distinct bases b_i because Q_i has only that permitted edge. The four triangles U_i give four support clauses `{a_i x_i,g_i}`. These clauses are pairwise disjoint and avoid all bases, so at least four further permitted edges are necessary. Conversely, all four bases together with all four cycle edges cover every T_i,Q_i,U_i,K_i. Therefore `c_G(P)=8=2nu`.

The finite checker additionally establishes unrestricted `tau=6`; this value is not used in the construction obstruction or in the permitted lower bound.

## Exact book construction and all its choices

Select an edge-disjoint family of private pages, with index set I. The source construction takes

`C0(I) = {b_i : i in I} union union_{i not in I} E(T_i)`

and adds the set X(I) of distinct present opposite edges for selected books. Here a selected book T_i,Q_i has opposite edge g_i, and all four g_i are distinct and present. Thus `X(I)={g_i:i in I}` and the output is exactly `C(I)=C0(I) union X(I)`; no further deletion is allowed in the statement being tested.

Two different private pages have different a-vertices and therefore share an edge exactly when their core diagonals coincide. Q_i and Q_(i+2) share their core diagonal. Adjacent-index pages have distinct core diagonals and no other common edge. The feasible index sets are exactly the empty set, four singleton sets, and four adjacent pairs. In particular, `a=|I|<=2`.

The gain g_i belongs to the support of owner T_(i+1). It is a core edge, so it is never any base. Hence for i in I,

`g_i in C0(I) iff i+1 not in I`.

The exact costs follow:

| I | Number of choices | a | r_new=|X minus C0| | |C|=12-2a+r_new |
|---|---:|---:|---:|---:|
| Empty | 1 | 0 | 0 | 12 |
| Singleton | 4 | 1 | 0 | 10 |
| Adjacent pair | 4 | 2 | 1 | 9 |

For example I={0,1} selects bases `a_0 x_3,a_1 x_0` and all edges of owners T_2,T_3 in C0. Gain x_1 x_2 is already in unpaired T_2, while x_0 x_1 is absent from C0. Exactly one extra edge is added.

Every C(I) is an actual triangle cover, as checked against all 16 reconstructed triangles. The book argument also proves this generally: a triangle avoiding C0 must meet both pages of some paired book, since otherwise one could select a disjoint page from every book and augment the maximum packing. A triangle meeting both pages and avoiding their base contains the opposite edge. Adding every present opposite edge therefore covers it.

Consequently the minimum output cost is exactly nine and the universal availability assertion is false at its stated scope. Allowing later deletions changes the construction, so this witness supplies no lower bound for such modified methods.

## Reproduction and evidence limits

From this private workspace:

```sh
source PRIVATE_PATH_REMOVED
python scripts/book_verify.py
```

`results/book_verification.json` retains the literal edges, every actual triangle, the original support and completion reconstruction, all nine book selections with literal C0/X/C sets, an eight-edge permitted cover, a six-edge ordinary cover, and exact finite counts. All 65,536 subsets of the 16-triangle family were visited for the packing calculation (noncompetitive smaller subsets are skipped after their size comparison); exactly 38 maximum packings were found. Cover enumeration visits all allowed subsets of every smaller cardinality before finding the displayed optimum. No random seed, solver, partial case, or UNKNOWN is involved.

The run used Python 3.12.12 on Darwin, a 30-second internal deadline, about 0.107 seconds wall time, and 18,759,680 bytes peak self RSS. It was a light finite enumeration, not a heavy solver/Lean job. No Lean verification, independent kernel checking, external human review, or global theorem follows.
