# Fresh independent audit: concentration does not force canonical centres

**Verdict: the exact auxiliary obstruction is correct.** I independently reconstructed the literal graph, the quantification over all maximum packings, both global optimization criteria, all-type1 characterization, canonical-quota impossibility, and the arbitrary-centre positive certificate. There is one minor proof-writing objection, preserved below with a complete replacement calculation. There is no unresolved mathematical objection to the stated theorem.

This is ordinary mathematical reconstruction and AI review supported by independent finite computation. It is not human review, Lean verification, or a proof/refutation of unrestricted Tuza. Originality was not investigated.

## Input isolation and clock

The sole current mathematical input was `notes/packing_routes_concentration_obstruction.md`, SHA-256 `7faef08e207c5ef9dbfd58cc3b42820bb42012a451ce9932a7f68e8b598296c4`, matching the producer manifest. The manifest was accessed only to extract hash strings. No producer checker, producer result, root log, route log, or favorable review was read before or during this reconstruction.

I read the frozen private-triangle/private-K4 definitions in the opening of `notes/criticality_star_pk_theorem.md` and the heavy/light equivalence in `notes/late_star_gluing_obstruction.md`, using read-only `git --no-optional-locks show` at TUZA-18 commit `57708a8413929012d9ca8d15b0f925b3ef6b51e8`. The frozen local-dichotomy note was also read while following its definition pointer; none of its theorem is needed here. Exact source hashes are in `evidence/packing_concentration_fresh/provenance.json`.

Original mission start is 2026-11-15 01:53:58 UTC, research cutoff 09:23:58 UTC, and hard deadline 09:53:58 UTC. This audit began approximately 02:20 UTC and used the owner's local Darwin arm64 host only. The requested configuration was Astra/Ultra. Exact serving metadata is not exposed, so no actual serving-model or effort assertion is made. No Lean or remote computation was used.

## Independent reconstruction of the witness and all actual triangles

Write the core vertices as `a,b,x,c,d,w,y,z = 0,1,2,3,4,5,6,7`. The edge set is exactly the union of `K4[a,b,x,y]`, `K4[c,d,w,y]`, and `acz`. The only cross edge between the exclusive K4 sides is `ac`; its common neighbours are exactly `y,z`. The vertex `z` has neighbours only `a,c`. Consequently the ten triangles are the eight K4 faces and `acy,acz`; there are fifteen edges.

A core packing uses at most one face of each K4 and at most one of `acy,acz`, because the two latter triangles share `ac`. The displayed packing `P0=(abx,cdw,acy)` attains three. A maximum packing therefore has one member from each of these three classes. For `acy`, each K4 has two permissible faces, giving four packings. For `acz`, each has four choices, giving sixteen. Thus all twenty core maximum packings are accounted for.

At each vertex in `S={a,b,x,c,d,w}`, add a K5 with four fresh vertices. A triangle cannot cross a vertex-sum interface: choosing vertices from distinct exclusive sides would require a missing cross edge. Thus every global triangle belongs to exactly one of the seven edge-disjoint blocks. The resulting counts are 32 vertices, 75 edges and 70 triangles. The verifier separately reconstructs every one of the `binomial(32,3)` triples and checks this partition; it does not assume the asserted triangle list.

Every K5 has packing number two. Three packed triangles would leave one edge of the even-degree K5, whereas deleting edge-disjoint triangles preserves degree parity. Every pair of edge-disjoint K5 triangles meets at exactly one vertex and uses all five vertices. There are five possible common vertices and three pair partitions, hence fifteen local maximum packings.

Since triangles and edges partition by blocks, every global maximum packing must attain the local maximum in every block. Conversely all local maxima unite. Therefore `nu=3+6*2=15`, and there are exactly `20*15^6 = 227,812,500` global maximum packings. This assertion concerns all maximum packings, not only the prescribed type1 packing or a selected family.

## Global degree-square optimum and its equality cases

For a core packing Q, put `t=d_Q(v)` at attachment v. In its K5, the common vertex is either v, giving contributions `(2;1,1,1,1)`, or a private vertex, giving `(1;2,1,1,1)`, where the semicolon separates v from its fresh vertices. Moving the common vertex to v changes the global square sum by exactly `2t`. It never decreases that sum, and it increases it strictly for `t>0`.

After normalizing all attachments, the global square sum is

`F(Q)=F0(Q)+4H(Q)+48`, where `H(Q)=sum_{v in S}d_Q(v)`.

Each K4 face contributes at most three incidences to S and the central triangle contributes two. Hence `H<=8`, with equality exactly when the two K4 faces are `abx,cdw`. In either central choice this gives `F0=13`, and therefore `F=93`.

Here is a direct check of the bound `F0<=15` that avoids dependence on the enumerator. If the central triangle is `acy`, let r be the number of chosen K4 faces containing y. Each chosen face is `abx` or `bxy`, respectively `cdw` or `dwy`. Then the two a/c degrees are `2-q1,2-q2`, y has degree `1+r`, the other four S vertices have degree one, and z has degree zero. Consequently `F0=13-r+r^2`, with `r=0,1,2`, giving 13,13,15. If the central triangle is `acz`, let `I_a,I_c` indicate whether the relevant K4 face contains a,c, and let r count faces containing y. Since the total incidence is nine,

`F0=9+2I_a+2I_c+r(r-1)<=15`, because `r<=2`.

Thus `H<=7` implies `F<=15+28+48=91<93`. Every normalized F maximizer has core `abx,cdw` and central triangle `acy` or `acz`. All six attachment vertices have positive core degree in these cases, so an unnormalized local K5 would strictly reduce F. Consequently every global F maximizer is already centred at every attachment.

For `acy`, the three core private bases are `bx,dw,ac`, with private pages `bxy,dwy,acz`; every core member is type1. For `acz`, all three other faces of the first K4 are private for `abx`, and all three other faces of the second K4 are private for `cdw`: both have private K4 completions. They are not type1. The centre of any K5 pair is opposite the unique private base of each member, so every K5 member is type1 in either case.

It follows that exactly `2*3^6=1,458` packings globally maximize F, with exactly `3^6=729` all-type1 maximizers. All 729 have precisely the `P0` core; their only freedom consists of independently permuting pair partitions inside the six K5s.

## Lexicographic optimum also quantifies over all maximum packings

Under the same local normalization, `t=0` merely swaps a 1 and a 2 between the attachment and a private vertex, preserving the sorted profile. If `t>=1`, it replaces values `(t+1,2)` by `(t+2,1)`, so the first altered value in descending order increases. Therefore every packing can be normalized without lexicographic loss, strictly if any positive-incidence attachment was not centred.

In a normalized packing, only a and c can reach degree four. The displayed packing has both. Any lex maximizer must therefore have both a,c of core degree two. If the central triangle is `acy`, this already forces `abx,cdw`. If it is `acz`, y has degree at most two, while b,x,d,w can reach three exactly when each lies in its local core face. To attain the four degree-three entries of the displayed packing, both core faces must again be `abx,cdw`.

The maximum descending sequence is exactly

`(4,4,3,3,3,3, twenty-five 1s, 0)`.

Its maximizers are the same 1,458 packings, with the same 729 all-type1 members. Once again every attachment has positive core incidence, so the equality cases cannot hide any off-centre K5 choices.

## Canonical-centre failure for every all-type1 optimizer

Private triangles intersect the entire packed support B in one edge, so each private base is forced in every B-contained cover. In the core this forces `bx,dw,ac`. Once those are selected, the remaining core constraints are exactly

`{ab,ay}, {ax,ay}, {cd,cy}, {cw,cy}`.

Every all-type1 optimizer has canonical core centres a,c,y. Each attached K5 has its common vertex equal to its attachment, so both local packed triangles belong to that attachment's canonical group. Its two bases are forced, and the four crossing apex triangles impose a C4 vertex-cover problem on the four spokes. At least two spokes must be selected. Thus the K5 consumes at least four edges of its canonical group budget.

The group at a has three packed triangles and budget six; after its K5's necessary four, `abx` receives at most two. The same holds for `cdw` at c. The group at y is the singleton `acy`, with budget two. If `ay` were absent, both `ab,ax` would be forced alongside `bx`, exceeding the quota for `abx`. Therefore `ay` is selected. Likewise `cy` is selected. Together with forced `ac`, all three edges of `acy` are selected, violating its quota. No canonical-quota cover exists, at any size.

This argument applies to every one of the 729 all-type1 F/lex optimizers: a permutation of the four fresh vertices in each K5 changes only its pair partition and leaves all constraints and budgets invariant. The finite verification tests every core cover state and all fifteen local K5 packing forms; the symmetry argument supplies the universal quantifier over pair partitions.

## Exact optima and the positive arbitrary-centre certificate

The unique minimum core support cover is `{bx,dw,ac,ay,cy}`, of size five and loads `(1,1,3)` on `P0`. Each attached K5 has support optimum four; all its minimum support covers have local loads `(1,3)` up to order. Since triangle constraints partition by blocks, the global support optimum for each of the prescribed packings is exactly `5+6*4=29`.

A slightly stronger witness-specific fact also follows: the unrestricted edge-cover optimum is `tau=29`. Each K4 requires two edges, and `acz` requires a further edge from `{ac,az,cz}`, disjoint from both K4 edge sets. Hence the core has unrestricted optimum five. K5 has unrestricted optimum four, checked by the independent exhaustive local edge-subset enumeration (also immediately from the maximum triangle-free subgraph bound). Additivity over the same blocks yields 29. This extra calculation is confined to the witness and is unnecessary for refuting the canonical rule.

For arbitrary centres, pair each K5 heavy member with its local light partner at the attachment, and pair core heavy `acy` with light `abx` at a. The remaining core light member is a singleton. Each pair spends four edges on two members; merging groups that share a centre preserves the budget. This also directly reconstructs the frozen heavy/light equivalence in the direction used here. The verifier constructs a saturating heavy-to-light matching and checks the literal 29-cover against all seventy triangles.

## Preserved objection and limitations

**Minor proof-writing objection.** The input says `F0<=15` follows either from listing the twenty cases or from the displayed incidence upper bounds and total incidence nine. The former route is valid. The latter bounds, by themselves, are insufficient: the formal degree assignment `(d(a),d(c),d(y),d(z),d(b),d(x),d(d),d(w))=(2,2,3,0,1,1,0,0)` satisfies those bounds and sums to nine but has square sum nineteen. It is not realizable by a core maximum packing; ruling it out uses additional packing structure. The two-case calculation above supplies precisely that structure. This is not a counterexample to the theorem and does not leave its proof unsupported, since the stated enumeration alternative is valid.

The result refutes selection of the canonical opposite-private-base centres after either genuine global concentration optimization. It does not refute existential choice of centres together with the cover, private-K4 support, changing to a mixed packing, or any condition particular to a hypothetical minimal Tuza counterexample. Indeed half the global concentration maximizers are mixed, and the all-type1 maximizers already admit compatible arbitrary-centre covers of size 29. The audit makes no claim that this auxiliary obstruction advances an unrestricted Tuza proof by itself.

## Reproduction and evidence

Run locally in the TUZA-19 workspace:

```sh
source LOCAL_ENVIRONMENT
python3 review/packing_concentration_fresh_verify.py
```

The independent standard-library verifier imports no producer code and reads no producer certificate. It reconstructs the graph from this audit's stated block construction, enumerates all actual triples, all subsets of each ten-triangle local family, all local edge-cover subsets, and all 1,280 global degree profiles with their multiplicities. Global quantification rests on the proved block factorization and private-coordinate symmetry, not on claiming to list 227,812,500 global packings one by one.

- `evidence/packing_concentration_fresh/input_statement.md`: unchanged snapshot of the audited mathematical input; later producer corrections do not alter this review target.
- `review/packing_concentration_fresh_verify.py`: independent verifier, pinned to that snapshot hash.
- `evidence/packing_concentration_fresh/verification.json`: full reconstructed edge/triangle lists, packing, private pages, cover, matching, exact counts, source and verifier hashes, and core profiles.
- `evidence/packing_concentration_fresh/provenance.json`: input isolation, frozen source identities, mission clock, local host boundary and development note.

An initial verifier run stopped at a tuple-order assertion for P0. The packings have unordered members; the assertion was corrected to set equality and the full run passed. No discrepancy in the mathematical claim was involved. The final result is PASS.
