> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Independent universal low-neighbor structure review

Reviewer: separate AI `review` agent, not an author of the reviewed low-degree or overlap declarations. UTC review snapshot: 2026-10-30T19:40:36.360121+00:00. All source inspection, mathematics, logs and retained notes are on the external verification server.

## Verdict and exact scope

PASS: no material mathematical defect, hidden local-existence assumption, missed outside attachment, or weakened universal conclusion was found. The Section 6 low-degree restrictions now follow from actual MinimalObstruction and actual graph degrees/adjacency, rather than merely excluding a collection of named patterns. The optional five-common-neighbor overlap result was also reviewed and found sound. The complete five-degenerate theorem is not yet asserted by these results.

The successful source-hashed log `logs/compile-193331-Tuza06.LowNeighborStructure.log` prints:

```text
@Tuza06.minimal_degree_five_independent :
  ∀ {V : Type u_1} [Fintype V] [DecidableEq V] {G : SimpleGraph V},
    MinimalObstruction G → ∀ {u v : V},
    degreeWithin G univ u = 5 → degreeWithin G univ v = 5 →
    G.Adj u v → False

@Tuza06.minimal_degree_five_neighbors_high :
  ∀ {V : Type u_1} [Fintype V] [DecidableEq V] {G : SimpleGraph V},
    MinimalObstruction G → ∀ {v u : V},
    degreeWithin G univ v = 5 → G.Adj v u →
    7 ≤ degreeWithin G univ u
```

Every degree here is the actual full graph degree, not residual degree. The vertex type is arbitrary finite, and neither theorem assumes a global graph-order or maximum-degree bound, planarity, coloring, an extra forbidden subgraph, or an unproved published input. The universal result explicitly includes every possible neighbor. The printed transitive axiom closures for the independent and high-neighbor results contain only `propext`, `Classical.choice`, and `Quot.sound`.

The current top hashes match the source-hashed successful compiler logs recorded in `LOW_NEIGHBOR_SOURCE_HASHES.json`. That file also records the complete actual local dependency closure. This pass is a semantic read plus inspection of those logs; a later frozen-source exact-type audit and clean reproduction remain separate work.

## Reviewed new source identities

| Module | SHA-256 at this pass |
| --- | --- |
| `Tuza06.AdjacentLow` | `f0ee45ce5ddcce8c3ad83dcaa469d37e74f5a2ab8977c9e7c3c1eebacf85101b` |
| `Tuza06.DominatingCliqueSix` | `bbff610c409e934426f405814cdbc180a8ae607b2f8ab20fc417adbd56258689` |
| `Tuza06.DominatingFive` | `ea641b54944471316807e0dcad499299fadc2be0aadc2f4784deb441d5dc170b` |
| `Tuza06.DominatingNearSix` | `01a122f4b7d13e7b9f184f5cba05a129c9f4a7784b320388b0e119c98497c6ae` |
| `Tuza06.LowDegreeStructure` | `af451b992bc7a0495603d162b367c6a32b78bd7cd97d7971a88f58e4225f57c0` |
| `Tuza06.LowDegreeStructureAdjacent` | `e8e278a500f224af8f5cfcb3a89acf6331629260ef0bfc23dbec993d8eca20a8` |
| `Tuza06.LowDegreeStructureDominatingFive` | `f4150b5e2418bc6bc79a6cc95cf9be9e85e54dc93b1488c28a6e391f94976b34` |
| `Tuza06.LowDegreeStructureTools` | `d94e8cb8c23a0ead580bf4fad1e1bf05229c644504783bd7bc1b12879c489c43` |
| `Tuza06.LowNeighborDominatingClique` | `c537261634d0615d870786647db5eeebbf5f848fff0081ed166070cae3a83e54` |
| `Tuza06.LowNeighborDominatingNear` | `7f8cdb588e42d7c6ad83b030eff8155d50a61b33b7e74128150c816e1d9c89e8` |
| `Tuza06.LowNeighborEndpoint` | `c1a24eace672d6d2e1d749d9a04a7120d472392d36d012c2a83194448af385a0` |
| `Tuza06.LowNeighborEndpointPatterns` | `4d7a88d632f2e5f5d6f44ca4d771bdd237a7fd8e2978be9635fa7ad121c490fa` |
| `Tuza06.LowNeighborEndpointTools` | `7106bb8f88ea0271e71d8471962414544f78b630026b23891b9f9b870265db49` |
| `Tuza06.LowNeighborEndpointUniversal` | `e5c6345d71027f0039a1d4dbded6ec0d7151bf43018fc825a6d8189ebcb1645f` |
| `Tuza06.LowNeighborResidual` | `621044e94b64163725049038990893505b26ea2840e30245694a78455800c187` |
| `Tuza06.LowNeighborStructure` | `ad5aa28666aba2e59f9d21ff2f177ccefbebfea2ce8213d9acdec2758501aca1` |
| `Tuza06.LowNeighborTools` | `78d30fabec0196c946bd196ac59d72a0b524fd7db1c8e23906b51169e459cd2e` |
| `Tuza06.MultiReduction` | `15e08a5d36491abd7e1d2b17c7d0e7279ec260a0e2e5975abb3f14c238341863` |
| `Tuza06.NearClique` | `bc0905959cf014629725d153c33e10c5887ff5c642443ed8b9a7a99e8608f734` |
| `Tuza06.OverlapFive` | `790084e9cf0696d00ecdde39585d564051365815c050eec24a1d3eddb0db9706` |
| `Tuza06.OverlapFiveClique` | `74a02e298024f3a5ef90e7d796273cd801d31d67d014f4ab6dc9acd6a15cb991` |
| `Tuza06.OverlapFiveNear` | `b9b45da3085ca3e41bc949ff325b23a10555fab23efb23d7265fc5cdd4faaad6` |
| `Tuza06.OverlapTools` | `9f82576fdb8c38ed7c661e3199d85bf7e06eb9916293b8746a00302df4260047` |

The closure reuses the independently reviewed actual five-link classification, small-link robustness, support handling, true extrema, literal component equivalence, and exact minimality reductions. I read the additional realization, private-neighbor, pattern, residual-triangle, and universal assembly files rather than inferring them from earlier pattern exclusions.

## Degree-five adjacent vertices: actual private neighbor construction

The exact classification of the full degree-five link provides a six-vertex K6 or K6-minus-one-rim-edge core, with the original hub's entire neighborhood fixed. A dominating degree-five neighbor already has five distinct known neighbors in that core; `core_neighbor_range` uses equality of cardinalities to prove it has no outside neighbor. The four-packing/seven-cover finite reduction is then realized from actual graph adjacency and actual center-neighborhood bounds. The near-core variant uses checked reorderings whose packed triangles avoid the genuinely absent rim edge.

For a missing-edge endpoint of a near core, the known internal neighbor set is exactly the four labels {0,3,4,5}. `near_endpoint_private_neighbor` subtracts this known subset from its actual degree-five neighbor set and obtains a singleton. It then proves that singleton vertex p is genuinely outside the whole original six-vertex core: every internally labeled actual neighbor of the endpoint is already in the known four-set. Thus the proof does not assume a private neighbor exists or silently treat a named vertex as distinct.

`near_endpoint_private_spokes` applies the actual near-clique property of the endpoint's full link. The original hub is not adjacent to p, by its exact full neighborhood. This gives an actual missing pair inside that endpoint's neighbor set. Every other required pair involving p and a common rim vertex is distinct from that missing pair, so it must be an actual graph edge. The seven-vertex embedding therefore contains the original two adjacent centers, three common rim vertices, and their two distinct exclusive neighbors. Their distinctness follows from p being outside the old core; the other exclusive neighbor is an old core label.

The actual adjacent-five realization checks all required initial and augmenting triangle edges, bounds BOTH center neighborhoods inside the seven labels, and verifies the only forbidden center/exclusive-neighbor pairs. Its Upper edge set permits the optional edge between the two exclusive neighbors, so this adjacency is never silently excluded. `AdjacentLow` derives exact four/eight residual equality and uses a five-packing whose surviving footprint has at most two forbidden edges at each vertex of a deleted independent terminal triple. The proven arbitrary-block footprint theorem chooses compatible maximum residual packings; arbitrary additional residual vertices are allowed.

`minimal_degree_five_independent` classifies the arbitrary neighbor into every possible canonical label. Near missing endpoints use the private-neighbor argument; the other three near labels and all five clique labels use the dominating argument. The second near endpoint is handled by an explicitly checked swap preserving the exact configuration. Thus no universal neighbor case is missing.

## Degree-six dominating neighbors

`core_dominating_six_private_neighbor` starts with five distinct actual internal neighbors and actual degree six. Their complement in the neighbor set has cardinality one, producing a unique genuine outside vertex p. The proof of outside-core membership uses actual graph irreflexivity and the five known neighbors; it does not suppose an arbitrary outside label can be added while preserving injectivity.

For a dominating neighbor in a near core, the four-packing/seven-cover reduction includes the unique external spoke in its cover. Checked reorderings account for the three possible dominating labels and keep all selected packing edges actual. All possible edges from p to noncentral core vertices remain allowed in Upper, and the center-neighborhood field is proved from the exact derived neighbor set. This is the ordinary strict near-core reduction.

For a dominating degree-six neighbor in a complete core, the actual edge to p belongs to a full graph triangle, by the already proved minimal-edge support theorem. Its third vertex must be one of the four common rim vertices: it lies in the center's exact neighbor set, differs from p and the center, and cannot be the original hub because that hub has no outside neighbor. The proof therefore constructs the required second spoke from p to a rim vertex; it does not assume that spoke exists. Twenty checked choices cover every pair of distinct center/rim labels. The five-packing/nine-cover reduction is realized with the original core, the actual external triangle, and all relevant arbitrary outside attachments. No unproved K6 packing-avoidance premise remains.

## Nondominating degree-six neighbors and outside p/q selection

For a missing-edge endpoint of the near core, `near_endpoint_two_private_neighbors` starts with the four known internal neighbors and actual degree six. Their complement has cardinality two, producing distinct p,q. It proves BOTH p and q lie outside the entire six-vertex core and proves the exact full neighbor set is {p,q} union {0,3,4,5}. The constructed Fin 8 embedding is injective because of those proved outside and distinctness facts.

If p and q are adjacent, the actual matching pq, va, bc is instantiated. If they are nonadjacent, `near_endpoint_private_two_rim_neighbors` applies the actual full graph codegree-two theorem at the spoke to each private neighbor. All possible third vertices are classified using the exact degree-six neighbor set: self is impossible, the other private neighbor is excluded by the nonedge, and the original degree-five hub is excluded by its exact neighborhood. Hence each private neighbor sees two distinct vertices of the common rim triple. The proof selects distinct representatives for p and q and checks all six rim permutations to place those actual spokes at the canonical labels. No assumed bounded attachment test or Hall/Konig input is used.

The matching cover is valid even though Q consists of the three common rim vertices and overlaps matching endpoints. The general matching reduction has already proved that no disjointness of Q and M is required.

## Missing residual edges cannot be repaired externally

`ResidualOverlapPattern.excluded` establishes the residual contradiction directly in the actual graph. Its two specified graph triangles avoid the deleted hub and all deleted matching edges; `retained_matching_triangle` proves they survive the full actual vertex/edge deletion, including its spoke family. They share a genuine edge. Their selected cross endpoints are distinct and their connecting edge lies in the deleted matching, so that edge is absent from the entire residual graph.

For adjacent p,q, the residual triangles are {0,2,5} and {3,2,5}, sharing {2,5}, with deleted cross edge {0,3}. For nonadjacent p,q, they are {0,2,3} and {5,2,3}, sharing {2,3}, with deleted cross edge {0,5}. All finite known-edge, matching, avoidance and membership facts are proved in the pattern definitions.

Actual minimality and balanced matching accounting classify the residual components. Two residual triangles sharing an edge must be in one residual clique component, so every cross edge between them must be present. This contradicts the actual deleted edge. An additional outside vertex cannot repair a missing edge between existing support vertices. The proof therefore avoids the hazard of merely seeing a K5-minus-edges drawing without proving actual residual absence.

The universal degree-six exclusion checks all near and clique labels. Finally an arbitrary neighbor of a degree-five vertex is triangle-supported, has actual degree at least five by the proved robustness theorem, and cannot have degree five or six by the completed universal exclusions. Arithmetic gives actual degree at least seven. Isolated ambient vertices do not enter this argument.

## Multi-center realization trust boundary

The generic `FiniteReduction` and `RealizesReduction` interfaces are substantive but transparent. A realized reduction proves every center's ACTUAL full neighbor set lies inside the finite label image. Therefore every original graph triangle incident with a deleted center is entirely in that image. Its preimage has three vertices, all its edges satisfy the proved Upper bound, and the finite cover certificate hits it. This is a complete arbitrary-attachment proof, not an inference from finite graph enumeration. Packed old edges outside the centers are likewise proved to belong to X. The footprint transfer chooses maxima of actual residual clique components and accounts for all surviving selected edges. No graph extremal theorem appears as an unproved certificate field.

## Optional universal five-common-neighbor exclusion

I also read `OverlapFive.lean`, `OverlapTools.lean`, and the complete/near finite patterns. `neighbors_eq_of_five_common` proves equality of the two actual five-element neighbor sets from the intersection cardinality five. A distinct nonadjacent second center is proved outside the original six-vertex core. Its adjacencies to all old core labels follow from equality of the complete neighbor sets. The seven-label realization proves exact local adjacency, both center-neighborhood bounds, and every packed triangle from actual graph edges.

The clique case has a six-packing/ten-cover strict reduction; the near case has a five-packing/nine-cover strict reduction. Both use the fully proved multi-center transfer. `minimal_no_five_common` therefore excludes five common neighbors for every actual pair with the stated degree-five, distinctness and nonadjacency hypotheses. This does not by itself prove the still separately assembled four-/three-common-neighbor cases or the full LowOverlap conclusion.

## Remaining status

No new Lean compilation was run by this reviewer in this pass. Successful complete-type/axiom logs were inspected, and the source hashes were matched to those logs. The later final frozen-source review must audit all declarations claimed at closeout and reproduce the completed closure in a fresh project with the recorded pins and an honest statement of compiled-dependency reuse. The global five-degenerate theorem remains a separate assembly objective until the actual universal overlap theorem, graph reconstruction and final implication have all compiled and passed those checks.
