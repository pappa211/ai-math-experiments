> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# PK scout: screened reduction and retained obstruction

Disposition: **no supported global PK advance**. PK-all and PK-exists remain open. The provisional lender-only pair-kernel description below was screened out before substantial proof effort. It is an exploratory false simplification, not a new serious global candidate or a refutation of PK.

## Source intake and exact model

Read the frozen TUZA20 final report, status, obligations and review, then the original-support PK definition, common-vertex theorem, private-fibre note, concentration/private-pair controls, multi-page cover bound, TUZA20 gain failures and switched cycles. Further directly inspected the pinned public corrected double-attachment classification and intersecting-singleton refinement; unchanged copies and initial hashes are in `notes/pk_source_additions.json`. The source heading “pending review” in an earlier exploratory note does not override the final published ledger.

For an all-type-one maximum packing P of size k, let R consist of its k private bases and U=B(P) minus R. Every permitted cover contains R, A(P)=B(P), and each actual triangle avoiding R induces either a two- or a three-element subset of U, with distinct packed owners. One needs a hitting set D in U with |D|<=k. Equivalently one seeks at least k spokes I in U such that (E(G) minus B(P)) union I is triangle-free. This is an exact reformulation, not a mechanism or a proved integral extension theorem.

## Rejected exploratory pair-kernel hypothesis

**Exact proposed statement.** Every residual two-spoke clause in an all-type-one maximum packing is explained either by a singleton owner's present opposite/gain edge (its two spokes form a star with that gain) or by an exceptional reciprocal two-page K5 pair.

**Intended relevance and obligations.** A true statement would make the pair system a union of functional lending components and disjoint exceptional pairs, admitting a small boundary representation. Full three-spoke clauses, mixed type-zero/private-K4 owners, completion costs and global compatibility would still require proof. No implication to unrestricted Tuza is claimed from the pair description alone.

**Graph-specific motivation.** The unique page of a singleton owner and its original owner form a literal two-page book; a present opposite edge necessarily lies in the original support. Its two crossing triangles give a pair-star. Exceptional K5 pairs form a second exact pair pattern.

**Reasons to consider.** (1) The gain has a unique packed owner, giving functional rather than arbitrary branching at the owner level. (2) Variable zero/one/two spoke allocations could be retained in a finite component interface, avoiding the already-refuted equal-allocation rule.

**Reasons against.** (1) Shared outside-support private-page edges may create pair clauses without any gain. (2) Even a correct pair kernel does not control real three-spoke clauses; the arbitrary-core embedding and private-pair controls rule out deleting them or retaining only their preferred two literals.

**Cheapest sufficient test.** A single literal maximum all-type-one packing with a residual pair outside the two proposed patterns refutes the description. The common-vertex positive class is a cheap control; it is stronger evidence than extending a census.

**First required lemma.** Prove the two-pattern exhaustion by an actual augmentation, using all private pages and literal endpoints. This would remove only a representation obligation, not integral compatibility.

**Disposition criterion.** Retire upon a missing geometric case; continue only if a corrected representation comes with a new solvable compatibility theorem rather than another exact constraint system.

The hypothesis fails on the six-vertex wheel below. The corrected published classification already includes precisely this missing common-tip case, so incorporating it would return to the existing private-fibre barrier. That is a diagnosis of an omitted known case, not evidence for a cosmetic expanded kernel.

## Complete ordinary counterexample to that description

Let G have hub 0 and rim cycle 1–2–5–4–3–1. Thus

    E = {01,02,03,04,05,12,25,45,34,13}.

Its actual triangles are exactly

    012, 013, 025, 034, 045.

The rim is triangle-free; each triangle contains the hub. Edge-disjoint hub triangles correspond exactly to matchings in the rim five-cycle. Hence nu(G)=2. Specify P={012,034}. Its support is B={01,02,12,03,04,34}. The only private pages are 025 for owner012 and 045 for owner034. The bases are respectively02 and04; both owners are type one, each with exactly one page. Their canonical centres are1,3 and their private tip is5. Both possible gains15 and35 are absent. No owner has a private K4 completion, so A(P)=B(P). There is no exceptional two-page K5 pair.

Triangle013 avoids the bases and has residual clause {01,03}. It is therefore a real pair clause explained by neither proposed pattern. The two private pages share outside-support edge05: this is the common-tip case of the corrected classification, and a special case of the published private-apex fibre geometry.

This graph satisfies PK with room to spare. The forced bases02,04 miss013, so c_G(P)>=3, while {01,02,04} is an original-support three-cover. Thus c_G(P)=3<4=2nu. Ordinary tau is also3: each edge belongs to at most two of the five triangles, so two edges cannot cover them all; the same three-cover attains the bound.

## Verification and limits

`scripts/pk_wheel_pair_control.py` reconstructs the literal edges and every actual triangle, enumerates all triangle packings and all edge subsets for this one graph, and checks the exact values nu=2, c=3, tau=3. It uses only the pinned local Python standard library on Darwin; measured runtime was about0.003 seconds. It imports no producer mathematical script and runs no heavy solver. `data/pk_wheel_pair_control.json` retains the graph, complete triangle family, private pages, all maximum packings, explicit cover and measured runtime. This is a producer check plus an ordinary proof, not an independent reviewer or Lean certificate.

No primary-source priority claim is made. The missing common-tip pattern is already present in the copied project correction, so this screen is deliberately not represented as new mathematical progress. No broad literature or historical suite rerun was needed to reject it.

## Why PK is not currently the main route

The exact corrected pair classification retains singleton lending, common-tip fibre interactions, exceptional K5 states and all actual triple clauses. The prior private-fibre4-for3 exchange gives genuine endpoint restrictions but its degree/mate consequences admit an abstract halfset obstruction; retaining the entire geometry without a new theorem is merely an exact representation. The unique-intersecting-singleton refinement localizes triples but cannot replace their third literal, as the published private-pair control demonstrates. Mandatory gains fail independently in TUZA20. Arbitrary optional gains merely restore the original optimization target.

A concrete next step would have to prove an integral extension/exchange theorem simultaneously for the realized common-tip fibres, inter-fibre lending and full triple constraints, with an availability and termination argument. This scout has no defensible such lemma. There is therefore no reason to spend the mission on a broader PK census or on introducing a new name for that gap. This recommendation retires the screened reduction, not PK or the broader Tuza project; a materially different architecture is still welcome.
