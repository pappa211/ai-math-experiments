> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent verifier: bounded intake and Candidate 01

This review used the local Darwin Mac, the existing pinned Python 3.12.12 environment, and independently written standard-library code. No producer mathematical checker was imported. No Lean result, solver trace or unrestricted theorem is claimed. The checker was reconstructed from the mission definitions before any producer implementation was inspected.

## Peer-review artifact availability

The supplied attachment directory contains only the mission text. Searches for FCZnw, the stated 145-million and 1,814,400 counts, and PK-all in the current Math Proof 2 project and TUZA-19 workspace found no Claude scripts, inputs or receipts. The distinctive new-witness/count terms were also absent from the public pinned repository and its TUZA-16-19 publication workspace. Historical PK-all notes are present, but are not the new reported census. This is a bounded relevant-workspace search, not a claim about unrelated folders.

Consequently the producer's graph-universe completeness, packing enumeration, orbit reductions, timeout handling, integer overflow, early exits and 14 partly checked graph identities cannot be audited. The through-ten/~145-million, K10/1,814,400, 1,137 larger-graph, and nineteen cost-changing connected-graph claims remain REPORTED_UNVERIFIED. No full replay was attempted without the source package. The work below independently verifies a smaller explicit universe and the named numerical witness.

## Independent exact semantics and controls

`checks/verifier_exact.py` reconstructs all triangles from graph edges. It exhaustively enumerates edge-disjoint triangle subsets in increasing index order, retaining every maximum-cardinality packing. Its sole packing prune is the number of remaining triangles, an admissible cardinality upper bound. Privacy uses intersection with the entire original support. Private K4 completions require all three other faces to be private for that same original owner. Cover existence is an exact finite hitting-set recurrence. It removes supersets of already present clauses, which preserves hitting-set existence; it never shortens a clause by deleting a literal.

For named finite controls, a separate combinations loop enumerates every allowed edge subset through the first feasible cardinality, independently checking the recurrence's optimum. Every triangle subset of size nu+1 is checked for overlap, certifying the packing upper bound without relying on maximality. Arbitrary-precision Python integers avoid fixed-width overflow. There is no orbit reduction. The bounded census checks every maximum packing, with no exit after finding one successful packing. An outer deadline is recorded, although no timeout occurred. It is not an interrupt deadline inside a graph; graph orders are tiny and the complete run took about one second.

The validator rejects all five deliberate corruptions: omitted actual triangle; deleted edge from a minimum cover; overlapping packed triangles; falsely asserted private completion; nonmaximum packing. See `receipts/verifier_controls.json`. The first implementation required a packing's tuple order to match enumerator order; this was corrected to set equality before accepting any control receipt. Candidate diagnostics initially printed unavailable outside-support edges in pair clauses; they were corrected to intersection with support and rerun. Those unavailable edges could not be selected and did not change feasibility or counts.

## Exact graph6 witness

The documented small-order graph6 convention reads n=ord(first)-63, then six-bit characters in most-significant-bit order, mapping bits to (0,1),(0,2),(1,2),(0,3),... . The independent decoder and the already installed NetworkX 3.7 `from_graph6_bytes` agree on FCZnw. Attempts to retrieve the primary McKay format page timed out; no successful remote format-page inspection is claimed.

FCZnw has labelled edges

    03 05 06 14 15 16 24 25 26 36 45 46 56

and exactly the nine triangles

    036 056 145 146 156 245 246 256 456.

There are eight maximum packings, each of size three. Every four-triangle subset overlaps. The specified packings P={036,145,246} and P'={056,145,246} differ by private pages in both directions. Neither original allowed set has a private K4 completion, so each equals its own nine-edge support.

For P, an optimum allowed cover is {06,14,15,26,45}, of size five. All 1+9+36+84+126 allowed subsets of sizes zero through four fail; exactly three of the 126 five-subsets cover. For P', an optimum cover is {06,14,24,56}, of size four. All 1+9+36+84 allowed subsets of size below four fail; two of the 126 four-subsets cover. Literal sets and all counts are preserved in `data/verifier_controls.json`.

Thus the numerical witness is FINITE_CERTIFICATE. Since the move is reversible, an unconditional non-increase statement over all directed private-page rotations is REFUTED. Both costs are below 2nu=6; this is not a PK-all counterexample or a reason by itself to start an oriented rotation program.

## Semantic controls

K4 has nu=1 and permitted optimum two; K5 has nu=2 and permitted optimum four. Therefore the respective lowered budgets 2nu-1 fail. K5's complete one-spoke-per-owner system has no solution; its two owners are the permitted exceptional pair and a 3/1 allocation works.

The eight-vertex private-pair core has 16 edges, thirteen actual triangles, 36 maximum packings, nu=3 and restricted optimum five for the displayed packing. The shortened false clause system fails. Restoring the actual third literal gives the prescribed one-per-owner solution. The unequal selection gives the valid five-edge cover. These statements remain separate from K5's genuine equal-allocation obstruction.

## Smaller exhaustive range

Every labelled graph on vertex sets range(n), n=0,...,6, was generated by all binary edge masks. This universe is complete by construction and does not import a catalogue-completeness assertion.

| n | Fully checked graphs | Maximum packings checked |
|---|---:|---:|
|0|1|1|
|1|1|1|
|2|2|2|
|3|8|8|
|4|64|73|
|5|1,024|1,408|
|6|32,768|58,769|
|Total|33,868|60,262|

Zero failures, zero partial graphs, zero UNKNOWNs. The empty maximum packing is counted once in each triangle-free graph. This is finite evidence only; it is not independent confirmation of the full reported through-ten census.

## Candidate 01: certified refutation

Candidate 01, frozen by the coordinator before this test, requires preselecting gains F and allows additional spokes only from nonlenders, with an exceptional K5 pair's combined budget two. The independent candidate checker tests the actual residual clauses (including triples), identifies every singleton gain, and exhausts the stated allocation choices. All its named controls pass when eligible. In the same labelled n<=6 corpus it finds 720 failing maximum-packing states on n=6; none occur below six. The first fifty literal failures are retained in `receipts/verifier_candidate01.json`, not a claim that the whole failure collection was stored.

A smallest-order witness is G=K6 minus edges35 and45, with

    P={013,025,234}.

Its 13 edges are every pair except35,45. Its thirteen triangles are 012,013,014,015,023,024,025,034,123,124,125,134,234. Degrees at0,1,2,5 are odd, while degrees at3,4 are even. Four packed triangles would leave one edge, contradicting preservation of degree parity under removal of edge-disjoint triangles. The displayed three-packing therefore is maximum. Exhaustive verification also checks all715 four-triangle subsets and finds18 maximum packings.

The private pages are, respectively,014,125,124; the forced private bases are01,25,24. All three owners are singleton type one, and no private completion is allowed. The gains are34,01,13. Hence L contains every owner and F={34,13}; Candidate 01 permits only S=empty. The real residual triangle023 has clause {02,03,23} and remains uncovered. The candidate is therefore false without deleting any real literal or using an abstract hypergraph.

For completeness, the exact residual clauses are

    {02,03,23}, {03,34}, {13,23}, {13,34}.

Their intersection is empty, so one spoke cannot suffice after the three forced bases. The two spokes03,13 hit all four. Thus the unrestricted permitted optimum is exactly c_G(P)=5, with cover{01,03,13,24,25}. This is strictly below2nu=6. It refutes Candidate01, not PK-all, PK-exists or Tuza.

The obstruction exposes a particular lost saving: gain01 is already a selected base but its lender was still barred from every discretionary selection. Adding03 to F repairs the candidate cover at total cost six, spending that unused coupon. A meaningful next hypothesis may allow global reuse of base-gain/repeated-gain savings; no such theorem is established here.

## Candidate02 finite scope and root structured-search review

The frozen Candidate02 allows all unused gain budget to be spent anywhere. The independent checker tests it on the same n<=6 universe, without extending graph orders: all27,646 eligible all-type-one maximum packings (including empty packings) pass. This includes repair of all720 Candidate01 failures. There are no UNKNOWNs. The certificate is finite, not a proof of gain extension or all-type-one PK.

The coordinator's structured generator produced560 labelled instances on orders11–14. There are544 distinct labelled edge sets with order retained; no isomorphism deduplication was performed. The repeated-instance count is not an independent-trials statistic. The root reports509 completely checked instances and51 capped after512 packings. Its triangle-conflict maximum recursion is exact; enumeration preserves increasing indices, and cap handling declares partial only after another maximum packing exists. The allowed-set test that all three apex spokes are present and outside the original support is equivalent to all three completion faces being private. Its hitting-set lower bound uses pairwise disjoint residual clauses; superset removal preserves the solution set. Its C02 call subtracts every forced edge exactly once from the budget.

An independent replay selects one least-triangle instance for each generator-family/order pair and two first-failure instances. For these14 instances it independently enumerates every maximum packing, then checks the same first512 prefix where relevant. All14 nu values, full-versus-partial flags, prefix counts and candidate results agree. The3,023 independently checked prefix packings include752 eligible all-type-one states and240 Candidate01 failures; none fails Candidate02 or PK. The extra all-packing enumeration in the two minimum examples confirms1156 maxima for the capped quota-block n12 example and540 for the capped private-pair n12 example. Complete details are in `receipts/verifier_root_sample.json`. This replay is a sample, not a second complete check of all560 instances.

## A switched lending cycle without a common centre

A descriptive idea suggested that directed cycles in the lending graph might share one canonical centre. No universal theorem is accepted: the following actual eight-vertex graph refutes that conclusion. Let x_i=i for i=0,1,2,3 (indices modulo4), take the entire K4 on the x vertices, and add a_i=4+i adjacent exactly to x_{i-1},x_i,x_{i+1}. Put

    T_i={x_{i-1},x_i,a_i}, base_i=x_{i-1}a_i,
    Q_i={x_{i-1},x_{i+1},a_i}, gain_i=x_i x_{i+1}.

The four packed triangles are edge-disjoint; every owner is singleton type one with sole private page Q_i. Each gain is a spoke of T_{i+1}. The lending graph is therefore one directed4-cycle, while canonical centres are0,1,2,3, all distinct.

The graph has18 edges and16 triangles. Each peripheral a_i contributes at most one triangle to a packing, because two triangles through a_i share one of its three incident edges. All core triangles lie in K4, so at most one core triangle can be packed. If one is packed, it uses three of the six core edges; every peripheral triangle also uses one core edge, so at most three peripheral triangles coexist with it. Thus nu<=4, attained by the displayed P. Independent enumeration finds38 maximum packings.

All four bases are forced. The four actual triangles {x_i,x_{i+1},a_i} give pair clauses {x_i a_i,gain_i}. These are disjoint physical spoke sets, so every permitted cover needs at least four more edges. All four gains suffice after the bases are selected. Hence c_G(P)=8=2nu. This refutes only the common-centre cycle simplification; it satisfies Candidate02 and PK-all at equality.

The same descriptive extraction on the existing n<=6 corpus finds60 directed cycles at n5 and3240 at n6, all with a common centre. The eight-vertex control demonstrates why this smaller observation cannot be promoted to an all-size structural claim. `data/verifier_switched_four_cycle.json` preserves the exact graph, triangles, packing, privacy, allowed set, all maximum packings, optimum cover and complete finite lower bounds; `receipts/verifier_lending_cycles.json` records the extraction.
