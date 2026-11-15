# Fresh audit of the CKSU order-three repair

**Verdict: PASS for the frozen mathematical statement and construction.** I independently reconstructed the private-page taxonomy, every endpoint case of the amended classification, exceptional-pair ownership, all credit interactions, and the complete triangle-load proof. I found no mathematical gap. The finite challenge below also passed beyond the isolated K5 control.

This is ordinary AI mathematical review with independent finite computation. It is not human review, Lean verification, an author-confirmed erratum, a Section4 repair, or an integral Tuza proof. The repaired numerical target is the already-known order-three fractional bound.

## Input and source isolation

The mathematical input was `notes/root_cksu_order3_repair.md`, SHA-256

`a0a8b8a2c8cdf3e0c028661bef9ce51c7586b13ffaed695ea99aa02ffe2c7ab9`.

An unchanged snapshot is preserved in `evidence/cksu_order3_fresh/input_statement.md`. No producer checker, producer result, research log, or favorable repair review was read. The verifier was written from scratch with Python's standard library.

I also read the primary PDF's extracted pages6,7,11,12,13,14, covering the definitions, Proposition13 and the Section3 assignment/analysis. The frozen PDF `2001.00257v2.pdf` has SHA-256 `1ec683cf6d609daf53ee967d9f53a93a87c17286ae20a46191070c7ca5688897`. The page-text hashes are retained in the provenance receipt. I did not import the printed Proposition13 as a valid lemma: the classification below is reconstructed independently.

## Exact theorem reviewed

For every finite simple graph G and every specified maximum edge-disjoint triangle packing P, the repaired procedure produces

`f:E(G)->{0,1/3,2/3,1}`

with every actual triangle having total weight at least one and total edge weight at most `2|P|=2nu(G)`. The specified packing is not replaced by a more favorable maximum packing. Exceptional-pair choices and singleton order do not require an additional global selection principle.

A separate locally stable version follows from auditing the exact augmentation premises; it is recorded below without changing the frozen theorem's hash.

## Private pages and the exhaustive local taxonomy

Let B be the full packed support. Every nonpacked triangle meets B, or it could be appended. A nonpacked triangle cannot contain two edges of one packed member, since those two edges already determine that member's three vertices. Thus attachment count equals its number of packed edges.

For a packed triangle, two private pages on different bases with different tips are edge-disjoint: neither tip lies in the packed member, and the two nonbase edge pairs cannot coincide without an excluded endpoint identification. They avoid every other packed member by the private definition, so they yield a one-for-two augmentation. Therefore different private bases share a common tip.

If two bases occur, their pages supply every edge of the corresponding K4. All three edges to its new tip are outside B, so the third face is private too. Any additional tip on any base would disagree with a page on another base, contradicting the same exchange. Hence type2 is impossible and a type3 member has exactly three pages with one tip. The proof uses all actual private pages, not a hand-picked subfamily.

## All doubly-attached endpoint cases

Write a double triangle as `t=vac`, with packed owners `p=vab`, `q=vcd`. The five vertices are distinct, because two packed triangles sharing two vertices would share their edge. The remaining edge ac is outside all of B.

If t contains a type1 base, the first alternative applies. Otherwise a type1 p-base is ab or vb, and a type1 q-base is cd or vd. These are all possible positions.

### Both bases meet v

For bases vb and vd, every private tip lies outside the displayed five vertices. A tip in the other packed triangle would introduce its packed spoke, while a tip in its own packed triangle is not a nonpacked private page. Both pages avoid t. Two such pages share an edge exactly when their tips agree, in which case the common edge is v-tip. Thus differing tips would give three mutually edge-disjoint triangles after deleting p,q. Every pair of choices must agree, forcing the two full tip sets to be the same singleton. This is the third alternative, with the shared edge precisely the one later used by the singleton charging rule.

### Exactly one base meets v

Take bases ab and vd. Every private tip of q is outside the five vertices. A private p-page avoids t unless its tip is c. Any avoiding p-page is edge-disjoint from any q-page: pages on disjoint bases can share an edge only through reciprocal endpoint tips, and q's tip is not an endpoint of ab. Therefore every p-page must have tip c, and there is exactly one. This gives the second alternative. The other orientation is symmetric.

### Neither base meets v

For bases ab and cd, put X,Y for their complete private tip sets. The p-pages with tips in `X minus {c}` and q-pages with tips in `Y minus {a}` avoid t. If either set is empty, its nonempty original tip set is the corresponding singleton and the second alternative holds.

Otherwise every avoiding pair must share an edge, or it augments p,q by three triangles. With disjoint bases, a shared edge requires reciprocal endpoint tips. After the exclusions, the only possibilities are p-tip d and q-tip b. Thus `X minus {c}={d}` and `Y minus {a}={b}`.

The pages abd and bcd place ad,bd,bc outside B. Together with the already nonpacked edge ac, these are all four cross edges of a K5. They also make abc and acd private, so the full tip sets are exactly `{c,d}` and `{a,b}`. This is precisely the added fourth alternative. No further outside tip or alternative endpoint position remains.

### Type[1,3] and type[3,3]

A type3 K4-tip is outside all five displayed vertices: otherwise one of its three private faces would contain an edge of the other packed member.

For two type3 owners, choose the private pages on ab and cd. They avoid t and are edge-disjoint because neither tip can be a reciprocal base endpoint. These pages and t augment the packing, so type[3,3] is impossible.

For type[1,3], with q type3, take q's private face on cd. If p's base is not in t, every p-page avoiding t is edge-disjoint from this face, again because q's tip is outside the five vertices. An augmentation would follow. Thus every p-page meets t, which is possible only for base ab with sole tip c. Its edge ac is t's nonpacked edge. This is exactly the credit needed; it does not rely on the defective [1,1] proposition.

## Exceptional pairs do not double-charge an owner

For an exceptional owner p, its unique base ab determines the opposite vertex v, while its exact tip pair `{c,d}` determines the only possible packed partner vcd. Hence each packed member belongs to at most one exceptional pair. Pairing is a matching on the set of packed owners, not a claim that the K5 vertex sets are disjoint.

The packed edges of different owners are disjoint. Every cross edge credited by an exceptional pair lies outside ALL of B. Consequently it cannot be a packed edge charged under another rule. If two exceptional K5s share a credited edge, that edge is nonpacked for both and is assigned only one weight of 1/3. Such an overlap reduces total cost; it cannot consume a second packed owner's budget or suppress required weight.

The same separation applies to edges credited by type3 K4s and private singleton pages. A private nonbase edge is outside the entire packed support, not just outside its own owner.

## Mass accounting, including earlier singleton credits

Type0 costs exactly two. A type3 K4 costs at most six times 1/3, hence at most two. An exceptional pair costs at most

`2*(2/3)+4*(1/3)+4*(1/3)=4`.

This repair is budget-compatible: compared with the original multi-page type1 rule, it lowers the two bases from one to 2/3 and spends the released mass plus the unused per-owner budget on the four cross edges. Every remaining multi-page type1 owner costs 5/3.

When a singleton owner is processed, all three of its packed edges are still unassigned. Its two private nonbase edges are distinct and outside B. An already positive one has weight exactly 1/3, regardless of whether it was first credited by a type3 K4, an exceptional pair, or an earlier singleton.

At either base endpoint, a new private edge plus a 1/3 packed edge adds 2/3, while an existing private credit plus a new 2/3 packed edge also adds 2/3. Adding the base's 2/3 therefore costs exactly two. Processing one endpoint cannot change the other endpoint's case: its private edges are distinct, and no private nonbase edge is packed. Later operations do not reduce these weights. Thus any singleton order works and total mass is at most `2|P|`.

## Every actual triangle is covered

The exhaustive attachment partition is packed, private, double, or three-attached; no triangle avoids B.

- Packed triangles have three packed edges of weight at least 1/3.
- Type3 pages lie in their credited K4. Singleton pages have a 2/3 base and two 1/3 private edges. Exceptional owners' private pages lie in their credited K5. Other type1 pages have a base of weight one.
- Three-attached triangles have three packed edges of weight at least 1/3.
- A double triangle with a type0 owner gets 2/3 from that owner and at least 1/3 from its other packed edge.
- The type[3,3] case does not occur. Type[1,3] has either a type1 base of weight at least 2/3, or the singleton private edge ac of weight 1/3 in addition to its two packed edges.
- For type[1,1], the first alternative supplies a 2/3 base; the second supplies the singleton private nonpacked edge; the fourth puts all three edges in a credited exceptional K5. In the third alternative, both singleton pages share v-tip. Whichever owner is processed second sees that credit and assigns 2/3 to its corresponding packed edge of t; the other packed edge has at least 1/3.

This proves the claimed cover for all actual triangles. No assumption that distinct private structures are vertex-disjoint is used.

## Separate corollary: two-member local stability suffices

The frozen note assumes maximum P. Auditing every use of that premise shows the following weaker condition suffices:

There is no `R subset P` with `|R|<=2` and no collection of `|R|+1` pairwise edge-disjoint actual triangles whose edges avoid `E(P minus R)`.

The zero-member case supplies attachment to B. The one-member case supplies the private-page taxonomy. The two-member case supplies every double-triangle classification. Each displayed replacement avoids the retained packed members by the private or double attachment definition. All remaining ownership, charging and coverage arguments are independent of maximum cardinality.

Therefore the same construction gives total mass at most `2|P|` for every packing with this local stability property. Repeatedly perform one of these augmentations until none remains. Packing cardinality increases at every step and is bounded by `floor(|E(G)|/3)`, so the process terminates. Testing collections of at most three actual triangles and their packed conflicts is polynomial in the finite triangle list. Thus this corollary does not require solving the maximum-packing problem first.

This is still an order-three fractional cover result. It supplies no integral rounding theorem and no repair of the paper's separate half-integral chain arguments.

## Independent finite challenge beyond K5

`review/cksu_order3_fresh_verify.py` imports no producer code or certificate. It generates all graph triples, computes private pages directly from the complete packed support, independently detects exceptional pairs, applies the assignment in integer thirds, and checks every actual triangle load and the total mass.

Its bounded endpoint domain is every one of the 256 six-vertex graphs containing the fixed packed pair `012,034` and double triangle `013`. Exact packing enumeration finds 91 in which that prescribed two-packing is maximum; every one is checked.

Four fixed controls are then tested on ALL their maximum packings and ALL singleton processing orders:

| Control | Vertices | Edges | Triangles | nu | Maximum packings |
|---|---:|---:|---:|---:|---:|
| K5 | 5 | 10 | 10 | 2 | 15 |
| Two exceptional K5s, a private K4 and a singleton diamond sharing a nonpacked edge | 12 | 28 | 26 | 6 | 432 |
| Two singleton owners with the common-tip configuration | 6 | 10 | 5 | 2 | 5 |
| Mixed type1/type3 endpoint case | 6 | 11 | 8 | 2 | 12 |

Including separate checks of the prescribed control packings, this gives 559 packing-review instances and 55,101 singleton orders. The count includes those intentionally repeated prescribed controls; it is not a claim of 559 globally distinct graphs or packings.

All four [1,1] alternatives and both [1,3] branches occur. The checks include exceptional/exceptional shared-edge credits and singleton reuse of type3, exceptional and singleton credits. Every actual triangle has at least three integer-third units, and every assignment uses at most six units per packed member. Literal representative graphs, pages, exceptional pairs, orders, weights and triangle loads are retained in the receipt.

One verifier-only bookkeeping error was caught: the first run's final branch-coverage assertion noticed no recorded [1,3] singleton case because the counter's first-case predicate incorrectly included the type3 owner's three bases. Restricting that predicate to the type1 base corrected the tally; the complete run passed. All triangle-load and mass checks had already passed. This was not a defect in the frozen proof and is preserved in provenance.

## Source alignment, limits and reproduction

The inspected arXiv v2 Section3 target is exactly the four-level weight set reviewed here. Its original assignment gives 5/3 to a multi-page type1 owner and omits the exceptional K5 treatment. The repaired rule changes precisely those exceptional owners and adds their cross-edge credits; the rest of the singleton accounting is preserved and checked against the expanded overlap possibilities.

This audit establishes the standalone corrected argument. It does not assert that every other statement in the paper is repaired, that a different edition contains the same defect, or that the result is new. No author contact or publication occurred.

Reproduce locally from the TUZA-19 workspace:

```sh
source LOCAL_ENVIRONMENT
python3 review/cksu_order3_fresh_verify.py
```

Evidence is in `evidence/cksu_order3_fresh/verification.json`, with input snapshot, provenance and manifest alongside it. Original mission start is 2026-11-15 01:53:58 UTC, research cutoff 09:23:58 UTC and hard deadline 09:53:58 UTC. All computation ran on the owner's Darwin Mac. Requested controls Astra/Ultra; precise serving metadata is not exposed and is not asserted. No Lean, human review, remote computation or publication is claimed.
