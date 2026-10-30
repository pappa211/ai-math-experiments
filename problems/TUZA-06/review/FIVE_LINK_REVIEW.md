> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Independent five-link classification review

Reviewer: separate AI `review` agent, not an implementer of the five-link modules or finite coverage generator. UTC review completed: 2026-10-30T19:24:04.467958+00:00. All source inspection, independent bounded computation, retained results, and review artifacts are on the external verification server.

## Verdict and exact theorem scope

PASS: no material mathematical defect, missing outside-attachment case, unproved finite coverage claim, or weakening was found. The exact five-neighbor classification is a substantive completed structural theorem for arbitrary finite simple graphs that are actual MinimalObstruction graphs. It does not itself complete the five-degenerate global induction.

The successful compiler log `logs/compile-190851-Tuza06.FiveLinkClassification.log` reports source SHA-256 `017e8aab18a10333fcc3cf7f812bee0abb6ddf3b6f0cc6ede5b09adc695dab1c`, exit status zero, and the full type:

```text
@Tuza06.minimal_degree_five_configuration :
  ∀ {V : Type u_1} [Fintype V] [DecidableEq V] {G : SimpleGraph V},
    Tuza06.MinimalObstruction G → ∀ {v : V},
    Tuza06.degreeWithin G Finset.univ v = 5 →
      ∃ i : Fin 6 ↪ V, i 0 = v ∧
        (Tuza06.FiveLinkConfiguration G i Tuza06.fiveNearCore ∨
         Tuza06.FiveLinkConfiguration G i Tuza06.fiveCliqueCore)
```

`FiveLinkConfiguration` requires the exact full neighborhood of the designated hub and exact induced adjacency on the six named vertices. `fiveCliqueCore` is the complete K6 edge set; `fiveNearCore` removes exactly the rim edge {1,2}, not a hub edge. Thus their degree-five links are exactly K5 and K5 minus one edge. No maximum ambient degree, ambient order bound, coloring, planarity, additional forbidden subgraph, published local theorem, or residual classification assumption remains in the theorem type. There is no missing universal quantifier over possible outside attachments. Five-degeneracy is not needed for this local structural theorem and is not silently assumed.

The printed transitive axiom closure is exactly `propext`, `Classical.choice`, and `Quot.sound`. This pass independently reviewed source semantics and the actual compiled type/axiom log; the final frozen-source audit and fresh reproduction remain separate acceptance work. In particular this is not a claim that the entire global target is already verified.

## Exact source identities

`FIVE_LINK_SOURCE_HASHES.json` records all 125 local dependency-module hashes found from actual imports, including the 64 chunks and eight group modules, earlier reviewed infrastructure, and reused Tuza source. Public Mathlib remains separately pinned. Important newly reviewed identities are:

| Module | SHA-256 |
| --- | --- |
| `Tuza06.FiveLinkClassification` | `017e8aab18a10333fcc3cf7f812bee0abb6ddf3b6f0cc6ede5b09adc695dab1c` |
| `Tuza06.FiveLinkLabeling` | `882bedf04689143ae6e23d9dedd9820317e0c08192753f98415fe160331962c7` |
| `Tuza06.FiveCoverage` | `4fb8ceacb49679a51570c3e35cca3b980b317da5208ede5f8e414b9a656862db` |
| `Tuza06.FiveCoverage.Basic` | `cc15a9457ce47edfc5a8b3664011113aede374ede5b6514b224d29f2a3991d5d` |
| `Tuza06.SparseLinksK221` | `661779b559f28762fc762265cc28c7a87e1d4d3298d48d558e889ed10c6139d6` |
| `Tuza06.SparseLinksBadPages` | `df9dff2c721b9904a197720a0aca5e762409987dcd9f753c8d22bfeb7f4bfca6` |
| `Tuza06.ExternalPageGeometry` | `09bedd26c976d4af189007f163b840f260119d198c87c300aa35133a2d99f85c` |
| `Tuza06.K221Finite` | `7435205377a75a55647cd97e1e0ca4eb9260dab283bae71c798c408a22bcd511` |
| `Tuza06.FiniteAugmentation` | `03016533ec899e93e8a110c52571d43fdbcad794e5c3bf24faaf9af8fd095fb2` |
| `Tuza06.PatternTools` | `5ee81b5c417b4c1569c1a160b36d9476945f1cf6989b8751b2b1fc6d558cff55` |
| `Tuza06.MatchingReduction` | `03c4ee92e4f635badaf10a998a5f51651de8d375ed01afb5f23d614b56eb88e0` |
| `Tuza06.SparseLinksTools` | `473eb80352686802a453851e7e9333fe4420ff5abfebec5d540c2640c1737e31` |
| `Tuza06.SparseLinksPage` | `51b0f434f88a5635c62bad4a283baa8c8c05933a785f4be26f1be023be1d730d` |
| `Tuza06.SparseLinksK23` | `1785078b60d0fb4764d82357ee46ad26b78e1946c8bf371a6d8fa4549fa379d5` |
| `Tuza06.SparseLinksC5` | `fbd922bbaea013c580b2374a78cb750ce16ecda26c8ed896238354eccf841ee7` |
| `Tuza06.DenseLinkOne` | `fcc776569fda749900f4201b476e037a3e49f01b80b6eec428093412e15c8416` |
| `Tuza06.DenseLinkTwo` | `e2d7a420ea8ce545273d63b298e6315f660a4a245dabdaae368a140222ccbfd8` |
| `Tuza06.DenseLinkThree` | `6975320560704f3b802d8a0f0d833ba8f30be7b9f0dda63198040abad7a7eb17` |
| `Tuza06.DenseLinkFour` | `6d4073adef0d496555673af1c5bef83f50b3c7ae94877f0bb828673847dce490` |
| `Tuza06.DenseExtraLink` | `e8fe6bec5baabb48dfdf86064448d9b1a09d184c344e442e0303f052faa29b8f` |
| `Tuza06.BowtieLink` | `c3bf5e7c81428cea6d1e8b3701de2fbfb7d4bd204516c14b09bbcf85aa2f3081` |

Earlier reviews cover the true extremal parameters, component/decomposition equivalence, arbitrary residual block compatibility, exact minimality accounting, codegree two, and all small links. This pass read the actual additional pattern-lifting, dense cases, sparse cases, symbolic page geometry and K221 closure, labeling, and finite coverage source.

## Genuine five-vertex coverage

`FiveCoverage.Basic.slot` lists exactly the ten unordered pairs on Fin 5; it contains no loops, duplicate slots, or omitted graph edges. `graphEdges` selects arbitrary subsets via ten Boolean bits. `exists_graph_encoding` constructs such a bit function for EVERY genuine edge set E contained in `edges univ`, using a checked slot-cover lemma. `Eligible` tests actual vertex degrees in that decoded graph and requires minimum degree at least two.

The eleven representatives are explicit edge sets. They cover all minimum-degree-two link types: the four dense 3-colorable cases, bowtie, K23, C5, K221, K4 with one extra degree-two vertex, K5 minus one edge, and K5. There are eleven eligible types, while the 3-colorable subset has eight; these are not contradictory counts. Via complementation the eleven are exactly the eleven five-vertex maximum-degree-at-most-two graph types. Thirteen is incorrect.

The 120 relabelings are actual `Equiv.Perm (Fin 5)` values, constructed from swaps, so every supplied relabeling is a bijection by construction. The Lean proof does not need an assumed assertion that its list contains all possible permutations: it supplies and checks an actual relabeling witness for every eligible encoding. The complete theorem states equality of the relabeled edge set with a representative, not merely equality of degree sequences or a numerical orbit identifier.

Each of the 64 chunks fixes bits 4–9 and kernel-checks all sixteen choices of bits 0–3, with explicit representative/permutation witnesses. The eight group modules reconstruct the input function from those bit choices, and the top theorem cases on all remaining high bits. The final `classify` theorem first encodes an arbitrary actual edge set, transfers the actual minimum-degree condition to Eligible, then obtains a genuine edge-set relabeling. No symmetry-reduction coverage is assumed without proof, and no bounded ambient-graph approximation occurs.

## Independent bounded finite check

The reviewer wrote `checks/independent_five_coverage.py`, using only the Python standard library. It imports no author's generator or checker. It parses the ACTUAL Lean slot list, representatives, and nested chunk witness tables. It checks all ten slots, all 1,024 encodings exactly once, the group import coverage, and every stored eligible relabeling witness. Independently, it enumerates all ordinary permutations and canonical edge-set images to count isomorphism classes, and tests 3-colorability directly.

Results in `checks/independent_five_coverage_results.json` and `.log` are PASS:

- 1,024 encodings, 253 with minimum degree at least two, eleven isomorphism types;
- 212 eligible 3-colorable graphs, eight isomorphism types;
- all 253 stored eligible relabeling witnesses correct;
- all 120 constructed relabelings distinct and equal as a set to all permutations;
- all 64 chunks included exactly once across the eight groups;
- representative labeled counts 30,60,60,10,15,10,12,15,30,10,1.

This is the authorized bounded five-vertex check. It is not a broader graph census, an arbitrary-attachment enumeration, or a substitute for the Lean proof. The same independent script checks only one additional fixed six-vertex K221 core, described below.

## Faithful transport to an actual degree-five vertex

`minimal_degree_five_representative` starts with the ACTUAL full neighbor set of an arbitrary degree-five vertex and enumerates only those five vertices using an injection. It defines its induced link edge set from actual two-cliques in G. The proved edge-codegree-two result provides two distinct full graph triangles on every hub spoke, and hence two distinct neighbors in the actual link. Thus Eligible is derived from actual minimality, not supplied as a separate mathematical hypothesis.

After finite classification, the inverse permutation is composed with the original neighbor labeling. The proof establishes exact adjacency in the relabeled representative using equality of edge sets, then prepends the original hub by an injection disjoint from its neighbors. Every graph triangle inside the local core corresponds exactly to a triple whose three edges are in the explicit core edge set. No selected triangle subfamily replaces the full local graph family.

`minimal_degree_five_configuration` then exhausts all eleven representatives. For each of the nine excluded types, it proves that the actual graph configuration realizes the precise local pattern fields needed by the relevant exclusion theorem. Finite membership checks establish every matching edge, forbidden pair, and augmenting triangle used. The remaining two representatives are proved equal to exactly fiveNearCore and fiveCliqueCore. No relabeling or residual witness remains an undischarged assumption.

## Dense and bowtie local exclusions

The generic `FiniteAugmentation` structure contains finite combinatorial fields: a matching, a link cover, an independent augmenting family with strict cardinal gain, complete old-edge support, genuinely missing residual pairs, and a complete clique-footprint certificate. It does not contain an assumed Tuza inequality or equality classification field. Each concrete dense pattern fills these fields by ordinary finite proofs.

`RealizesAugmentation` requires actual graph neighborhood equality, actual graph matching edges, absence of specified graph edges, and membership of each augmenting triangle in the full graph triangle family. The classification proof constructs every field from actual adjacency. The singleton matching reduction permits Q to overlap matching endpoints; its proof classifies all hub triangles and every old packed edge without assuming disjointness of Q and M.

The crucial `footprint_of_pattern` projects ANY actual residual clique k onto the labels lying in it. The finite certificate is checked for EVERY subset of the label set whose forbidden pairs are absent. It then proves exact equality between the ambient forbidden-edge intersection and the injective image of that projected finite intersection. Consequently arbitrary additional vertices of k, and arbitrary outside attachments, cannot create an unaccounted footprint. The maximum residual packing avoiding that footprint is constructed using actual K4/K5 blocks, and the displayed augmenting family contradicts exact balanced accounting.

The four dense Section 5.1 patterns and the additional K4-plus-degree-two case follow this route. The bowtie uses the same actual matching framework with strictly fewer cover vertices than matching edges, giving a strict reduction directly. These are full actual graph exclusions once realized, rather than conditional appeals to published local lemmas.

## Sparse K23 and C5: arbitrary external pages

`SparsePagePattern.no_external` takes an arbitrary genuinely outside apex, extends the six-label injection by that vertex, and realizes a checked seven-label augmentation in G. The hub cannot be adjacent to that outside apex because the full hub neighborhood is exactly the five named vertices. All old forbidden edges, matching edges, local augmenting triangles, and the new external page are verified in the actual graph. The finite footprint transfer still quantifies over arbitrary residual cliques, including outside vertices beyond this chosen apex.

`SparsePagePattern.excluded` uses the actual no-unique-triangle-edge theorem. Every local triangle on its selected rim base is checked to be the unique hub face. Any other full graph triangle on the base would have an outside apex, and the previous symbolic argument excludes it. Thus K23 and C5 links are excluded without testing a bounded number of possible attachments.

## Symbolic K221 external-page argument

`k221_balanced` removes every edge inside the six-vertex core, retaining all outside vertices and other edges. Its four-packing appends to every residual packing. All eight rim edges cover every lost local triangle and every external page. Hub-edge pages are necessarily local because the hub's entire neighborhood is known. Actual minimality and a specific deleted graph edge supply the proper-residual Good conclusion, so exact four/eight accounting and residual component classification follow.

`k221_external_page_repr` proves that every external page over the six-vertex core has a genuine rim base and exactly one apex outside the core. It does not assume a fixed finite apex set or identify pages with arbitrary test triples.

For two disjoint pages with good bases, `K221Finite.good_pair_three` provides an actual checked local three-packing avoiding both bases. Exact old-edge geometry proves the whole local packing avoids both pages. The previously proved arbitrary two-page augmentation constructs a compatible maximum residual packing and produces nu(residual)+5, contradicting the exact four-triangle drop. Therefore every disjoint external-page pair has bad-partner bases.

The general `bad_partner_page_cover` then proves the necessary cover bound SYMBOLICALLY. If the family is already pairwise intersecting, use the proved intersecting-triangle lemma. Otherwise choose two disjoint pages with bases f,g, which must be bad partners. The checked bad-partner relation is symmetric and assigns at most one partner to each rim edge. Hence every page on a third base must intersect both selected pages. The exact geometry theorem proves that two external pages on distinct bases intersect only if they have the same outside apex and their bases meet. Thus a third-base page forces the two original apices to coincide; the original bases must then be disjoint, since their pages were edge-disjoint.

Every remaining page also has that common apex. For a page on f or g, its intersection with the chosen third-base page is forced by uniqueness of bad partners; for a page on any other base, intersections with the original pair force it. A finite terminal certificate shows every possible base in this case meets the two-vertex terminal set {1,2}. The two corresponding spokes from the common apex cover the whole family. If no third base occurs, the two base edges themselves cover it. This reasoning covers both adjacent bad partners (where a third base would be impossible) and disjoint bad partners, with equal or unequal original apices, and allows arbitrarily many other outside vertices before the argument forces their absence from the family.

The mapped version proves this statement after an arbitrary injective embedding of the local rim. All finite partner and terminal conditions are checked in K221Finite, rather than asserted by an unperformed symmetry argument. Finally the local four-cover and external two-cover give an increment at most six, contradicting the required eight. The ordinary proof's intermediate lower bound on tau(F) has simply been combined with the same contradiction; no hypothesis is weakened.

The independent fixed-core check verifies K221 has twelve triangles, packing number four, cover number four, all 28 rim pairs with exactly 24 good and four bad pairs, and the complete partner-matching and terminal-hit condition. It does not verify arbitrary attachments by enumeration; those are handled by the symbolic proofs just reviewed.

## Trust boundary and remaining global obligations

The exact top-level compiled statement has only actual MinimalObstruction and actual degree five as mathematical inputs. Published Puleo/Botler local lemmas, global Tuza, and the desired global equality classification are not external assumptions in this completed closure. Standard `decide` proof terms and explicit finite witnesses are kernel checked; no native or unsafe shortcut is introduced. Final source-freeze audits must still verify all current source hashes and print complete types/axioms, followed by clean source reproduction and established serial kernel replay where supported.

At this review the full five-degenerate theorem still requires deriving the universal low-neighbor restrictions and overlap theorem from their realized local patterns, constructing the exact two-arm configuration from the peeling conclusions, forcing its cross edges, and eliminating the minimal obstruction using the already completed final-core exclusion. This five-link milestone discharges a major earlier gap, but should not be reported as the completed global inequality or equality necessity.
