# Base-free triples force an intersecting singleton pair

Status: ordinary refinement of the frozen multi-private integral-cover lemma. The original note `notes/root_multi_private_integral_cover.md`, SHA256 `4791afd96e876088764cf13c37082e9fca23a1ee9a4f2a8ef12d84fcb324176b`, and its independent audit remain unchanged. No unrestricted Tuza, novelty, or Lean claim is made.

## Stronger exact statement

Fix a maximum triangle packing P. Let T be a nonpacked actual triangle with three packed edges, belonging to three type1 owners, and suppose T contains none of their private bases. Then at least two owners have exactly one private page. More precisely, two of the singleton owners have unique private pages sharing an edge outside E(P).

The hypotheses concern these three owners only; the remaining members of P can have arbitrary types. All private-page sets below are the full sets relative to this specified P.

## Endpoint proof

Use the six distinct vertices and old-tip restrictions established in the frozen lemma. A cyclic base orientation would make every choice of three private pages edge-disjoint, giving a four-for-three augmentation with T. Hence the orientation is noncyclic. Relabel it as

    T=012, owners A=01a, B=12b, C=20c,
    private bases 0a, 1b, 0c.

Let X,Y,Z be the nonempty private-tip sets of A,B,C. Their only permitted tips among the six displayed vertices are b,c,b, respectively. For tips x in X, y in Y, z in Z, the A and B pages never intersect. The A and C pages intersect exactly when x=z. The B and C pages intersect exactly when y=c and z=b.

If any choice avoids both collisions, its three pages together with T augment P. Therefore maximum cardinality forces

    for every x in X, y in Y, z in Z:
        x=z OR (y=c AND z=b).                 (*)

This immediately proves the two-singleton assertion. If Y has at least two tips, choose y!=c; then (*) forces X and Z to be the same singleton. If Y is a singleton and both X,Z have at least two tips, choose z!=b and then x!=z, contradicting (*). Thus two multi-page owners cannot occur.

For the stronger common-edge conclusion, classify (*) exactly. If Z={b}, it forces X={b} or Y={c}. If Z contains w!=b, it forces X={w}; there can be no second element of Z distinct from b,w. If b is also in Z, it further forces Y={c}. Consequently the only possibilities are:

1. X=Z={w}, with Y unrestricted;
2. Y={c} and Z={b}, with X unrestricted;
3. X={w}, Y={c}, Z={b,w}, where w!=b.

In case1 the unique A and C pages share 0w. In case2 the unique B and C pages share bc. These shared edges lie outside packed support by privacy.

Case3 is impossible for a maximum packing, although it really is an obstruction to selecting three private pages. The old-tip restriction gives w outside all six displayed vertices. Its pages force the edges needed for the three actual triangles

    02b, 0cw, 12c.

These three triangles are edge-disjoint. Their packed edges belong only to B=12b and C=20c; all other edges come from the displayed private pages and lie outside E(P). They replace those two owners by three, leaving A and every other packed member unchanged. This is a three-for-two augmentation. It eliminates case3 and proves that an intersecting singleton pair always exists.

This proof explicitly distinguishes the private-page selection obstruction from an actual maximum-packing obstruction; endpoint closure supplies the additional triangles eliminating case3.

## Sharpness on an actual graph

Take K5 on vertices {0,1,2,b,c}. Add a vertex a adjacent to0,1. Add two distinct vertices w,t, each adjacent exactly to0,a. Specify

    P={01a,12b,20c}.

Every triangle outside the K5 contains edge0a, so a packing has at most one outside triangle and at most two inside the K5. Thus nu=3, attained by P. The private bases of the three owners are 0a,1b,0c, with full private-tip sets

    {w,t}, {c}, {b}.

The central triangle012 avoids all three bases and has exactly two singleton owners. Their unique private pages1bc and0bc share bc. Hence “at least two singleton owners” is sharp, even when the third owner has multiple pages.

This graph has eight vertices, sixteen edges and thirteen actual triangles. Its cover number is five: every cover needs four K5 edges and at least one edge from the disjoint-edge outside triangle0aw; a minimum K5 cover together with0a attains five. Thus it is not a Tuza counterexample. No TF or two-edge resilience assertion is made for this local sharpness control.

## Preserved failed control

Before the extra augmentation was recognized, the seven-vertex graph formed by the three owners and pages0aw,1bc,0bc,0cw was tested as a realization of case3. It has nu=4, so the displayed three-owner packing is not maximum. A four-packing is

    {01a,02b,0cw,12c}.

The exact graph, all triangles, private-page lists, and maximum packing remain in `evidence/multi_private_fresh/two_singletons_receipt.json`. This failed attempt was useful because it exposed the three-for-two exchange above; it is not retained as a valid counterexample.

## Verification and global limits

The independent checker `review/multi_private_two_singletons_checker.py` tested148,176 fixed endpoint assignments with at least two multi-page owners, all343 nonempty-subset cases of the collision predicate on the representative old tips and two fresh labels, the case3 augmentation, and the two prescribed finite controls. It reconstructs every actual triangle for the controls and verifies their exact packing and cover parameters. This is a fixed local-lemma check, not a graph census or a search for a new global family.

Checker SHA256: `2d19a5c9382891aa64474b4ed2e8af3e5816348924e01e925c40a7f5dc9744a6`.

Receipt SHA256: `505013bf1632ba0edc849561477bf7321d4b71693a2a69f8419c293e66d43e6f`.

The original cover bound3nu-2m+2p remains valid and unchanged. The refinement localizes base-free triple constraints to pairs of singleton owners whose private pages intersect. It does not prove that these pair constraints and all double-attachment constraints admit a globally affordable integral cover, nor that any optimized maximum packing satisfies the sufficient parameter threshold.

All work is ordinary proof plus exact local Darwin checking, with no Lean run, external message, or publication. Requested controls were Astra / Ultra; actual serving identity and applied controls are not independently exposed. The original research cutoff remains 2026-11-15T09:23:58Z.
