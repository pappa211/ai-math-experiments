> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Exact degree-five link classification

Completed on the external verification server at 2026-10-30T19:10:41.865293+00:00.
Top-level compiler/type/axiom log: `logs/compile-190851-Tuza06.FiveLinkClassification.log`.

## Completed exact theorem

`minimal_degree_five_configuration` proves, for arbitrary finite simple G:

    MinimalObstruction G → degreeWithin G univ v = 5 →
      ∃ i : Fin 6 ↪ V, i 0 = v ∧
        (FiveLinkConfiguration G i fiveNearCore ∨
         FiveLinkConfiguration G i fiveCliqueCore).

Here `fiveNearCore = edges (univ : Finset (Fin 6)) \ {{1,2}}` and `fiveCliqueCore = edges univ`. The five link vertices are labels 1 through 5 and the hub is label 0. `FiveLinkConfiguration` states the **actual exact hub neighborhood** and the **full graph adjacency equivalence on the six embedded vertices**. No maximum-degree condition or restriction on the rest of G is present.

The successful log prints the complete theorem type with implicit parameters and reports exactly `propext`, `Classical.choice`, and `Quot.sound`. All finite cases and arbitrary-attachment analytic cases in this closure are proved; no additional mathematical input, sorry/admit, custom axiom, unsafe/native shortcut, or desired global theorem is assumed.

## Actual graph-to-finite reduction

`FiveLinkLabeling.lean` first enumerates the actual five neighbors of v by a Fin5 embedding. `linkEdgesOn` is the genuine induced graph-edge set on those labels, and `linkEdgesOn_pair` proves its exact adjacency interpretation. The completed UniqueEdge/small-link theorem supplies two distinct neighbors for each label. Thus the actual link meets the min-degree-two hypothesis of the lead's fully checked `FiveCoverage.classify` theorem.

Coverage returns one of eleven representatives and an explicit permutation. The neighborhood embedding is composed with the inverse permutation, preserving the actual neighborhood range. A proved finite-embedding extension and fixed front permutation prepend the hub. `five_configuration_from_neighbors` then proves the actual six-vertex core adjacency equivalence. No graph coding, relabeling, core-versus-full-family substitution, or attachment condition is merely declared equivalent.

The final module eliminates representatives 0–8 through actual local realizations of the completed dense/sparse reductions. Representatives 9 and 10 are exactly the near-clique and clique. The lead's finite coverage exhausts all 1024 labeled five-vertex edge sets, with 253 eligible min-degree-two graphs in eleven unlabeled types. This is the authorized finite local-link classification, not a broad ambient graph census.

## Sparse K23 and C5 cases

`SparseLinksK23.excluded` and `SparseLinksC5.excluded` are complete arbitrary-graph exclusions from actual minimality plus exact core configuration. Both use the ordinary matching two/four reduction and a three-packing containing an arbitrary external page. The finite augmentation has seven labels: hub0, five neighbors1–5, and one **arbitrary** outside apex6. Kernel-checked surviving-edge footprints include every possible residual clique intersection, including cliques with further outside vertices.

The outside apex is not assumed to come from a bounded graph. `extendFiniteEmbedding` appends any actual vertex outside the core to the embedding. `SparsePagePattern.no_external` realizes every field of the finite augmentation in the full G. `SparsePagePattern.excluded` uses all graph triangles on one chosen rim edge: any wholly local such triangle must be its hub face (a checked full-core statement), while any nonlocal one has the arbitrary forbidden outside apex. That would make the rim edge unique, contradicting the proved UniqueEdge theorem. No symmetry over all rim edges or unproved external-page existence assertion is needed.

An initial bare seven-label footprint decision reached the fixed memory cap. It was replaced by a proved transfer from six-label, 64-subset certificates using `footprint_of_pattern`. The successful proof retains arbitrary outside graph vertices; reducing the finite label set did not restrict attachments.

## K221 case

`minimal_no_k221_link` and `SparseLinksK221.excluded` are complete for the canonical core missing rim edges12 and34. All finite local witnesses are supplied by the lead's compiled `K221Finite.lean`.

`k221_balanced` proves actual four/eight accounting: the embedded four-packing appends to every residual packing after deleting all core edges, and the eight rim edges cover every lost triangle. Exact residual equality and its clique-component classification follow from actual minimality.

`k221_external_page_repr` classifies **every** nonlocal lost triangle as a page over one of the eight genuine rim edges with one outside apex. A triangle using a hub edge is forced local by the exact hub neighborhood. This is a symbolic arbitrary-graph classification.

`k221_pages_bad` proves that any edge-disjoint page pair has one of the four bad base pairs. Otherwise the checked local three-packing avoiding its two good bases combines with the two pages and compatible maximum residual block packings, contradicting nu(G)=nu(H)+4.

`bad_partner_page_cover` proves the key page-family result for arbitrary bases/apices. If the family is intersecting, use the proved two-cover lemma. Otherwise choose disjoint pages on bad partner bases. Any third base is good with each chosen base because bad partners form a matching, so its page must intersect both. With no third base, the two chosen bases cover the family. With a third base, exact page geometry forces all relevant apices to coincide; the original bad bases are then disjoint. The finite terminal-hitting certificate makes every possible base meet terminals1 or2, so the two corresponding outside spokes cover the entire family. `bad_partner_mapped_page_cover` proves the finite-to-ambient transfer. No bad-pair symmetry is assumed and no outside-attachment enumeration is used.

The page family therefore has cover number at most two. The finite four-cover of the local core plus that page cover and a minimum residual cover give increment at most six, contradicting the balanced increment eight. This is equivalent in purpose to the ordinary lower bound tau(F)>=4 followed by its bad-pair page argument; every step is discharged formally.

## Exact source identities

- `lean/Tuza06/SparseLinksBadPages.lean`: `df9dff2c721b9904a197720a0aca5e762409987dcd9f753c8d22bfeb7f4bfca6`.
- `lean/Tuza06/SparseLinksC5.lean`: `fbd922bbaea013c580b2374a78cb750ce16ecda26c8ed896238354eccf841ee7`.
- `lean/Tuza06/SparseLinksC5Page.lean`: `a33bff21cd4cc09c2e04524cefa6d9f83d3b9b5b1907a660f176b0bdb45c6ea8`.
- `lean/Tuza06/SparseLinksK221.lean`: `661779b559f28762fc762265cc28c7a87e1d4d3298d48d558e889ed10c6139d6`.
- `lean/Tuza06/SparseLinksK23.lean`: `1785078b60d0fb4764d82357ee46ad26b78e1946c8bf371a6d8fa4549fa379d5`.
- `lean/Tuza06/SparseLinksK23Page.lean`: `4928b5f5b3d033b6043bc4e1a2111cd18cedc35d42a865b3236dbbc9f98f57fa`.
- `lean/Tuza06/SparseLinksPage.lean`: `51b0f434f88a5635c62bad4a283baa8c8c05933a785f4be26f1be023be1d730d`.
- `lean/Tuza06/SparseLinksTools.lean`: `473eb80352686802a453851e7e9333fe4420ff5abfebec5d540c2640c1737e31`.
- `lean/Tuza06/FiveLinkLabeling.lean`: `882bedf04689143ae6e23d9dedd9820317e0c08192753f98415fe160331962c7`.
- `lean/Tuza06/FiveLinkClassification.lean`: `017e8aab18a10333fcc3cf7f812bee0abb6ddf3b6f0cc6ede5b09adc695dab1c`.

## Trust and remaining scope

All compilation was serial on the external verification server through `build_serial.py`, under the fixed 1900 MiB Lean limit and 240-second process bounds. No frozen source or earlier checkpoint was modified. Failed diagnostic logs remain, including internal `sorryAx` recovery output from failed elaborations; the accepted final compiler/type/axiom reports contain only the standard three axioms. Source has no placeholders.

The exact degree-five classification is completed. It is not by itself the full five-degenerate inequality/equality theorem. Low-neighbor pair reductions, overlap restrictions, global peeling, and the final-core induction assembly must be assessed separately by the lead. Subsequent complete reproduction and final review are recorded in the current proof status. The ordinary five-degenerate theorem and qualified priority status are unchanged.

