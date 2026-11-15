# Universal-clique reduction: bounded primary-source overlap audit

Status: **ORIGINALITY UNRESOLVED; CLASSICAL INCIDENCE INGREDIENT IDENTIFIED.** This is a primary-source and frozen-archive comparison, not a new proof audit, formal verification, or claim of publication priority.

Audit began 2026-11-15T06:34:36Z under the unchanged TUZA19 clock (research cutoff 09:23:58Z, hard deadline 09:53:58Z). All downloads, extraction, and file work ran on the verified local Darwin host. No author contact, publication, remote mathematics, or Lean process was used. Requested reviewer controls remain Astra/Ultra; exact serving model and effort metadata were not independently exposed.

## Frozen target and conclusion

Target: `notes/global_routes_universal_clique_reduction.md`, SHA256 `83d9549aae898656b2d09871c5f87c481d6b36116f7ac37d23f534df92f527a1`. An exact snapshot is preserved as `sources/universal_clique_prior_art/candidate_frozen.md`.

The target asserts equivalence of unrestricted Tuza with its restriction to a prescribed fixed clique of universal vertices, or to arbitrarily prescribed fixed minimum triangle codegree; it additionally treats universal vertex plus TF. It obtains these from exact integral replication over a linear, Berge-triangle-free incidence system of arbitrarily large fixed edge/vertex ratio. Its separate consequence is that any universal bound `tau <= 2 nu + C|V|`, with absolute constant C, would imply exact Tuza.

The bounded inspection located no primary source stating these exact Tuza equivalences or the linear-additive-error implication. That absence does **not** establish novelty. The hypergraph existence assertion and random alteration method have clear classical prior art, detailed below. The target can safely be described as an ordinary proof developed in this run, with classical ingredients and unresolved originality of the specific deductions. Do not call its incidence existence lemma new.

## 1. Erdős–Hajnal: the incidence existence ingredient is classical

Primary: P. Erdős and A. Hajnal, *On chromatic number of graphs and set-systems*, Acta Mathematica Academiae Scientiarum Hungaricae 17 (1966), 61–99, [author-archive scan](https://users.renyi.hu/~p_erdos/1966-07.pdf).

Definition 13.2 (printed p.94) requires every t-edge subfamily, t<=s, to have union size at least `1+(r-1)t`. At s=3 this excludes pair intersections of size two and Berge triangles. Theorem 13.3 and Corollary 13.4 (p.95) provide such r-uniform systems with small independent sets and arbitrarily high chromatic number. The proof on pp.95–97 randomly chooses a superlinear number of edges and deletes bad configurations.

The following is this audit's elementary inference, not their stated wording: choose a vertex-critical subsystem with chromatic number k where k-1>rD. Every vertex then has degree at least k-1, because each incident hyperedge forbids at most one color when extending a (k-1)-coloring after vertex deletion. Hence `r b >= (k-1)N > rDN`, giving b>DN. Circuitlessness survives taking a subsystem. Thus the target's existence lemma is already a consequence of this classical theorem.

Reading limit: visually checked scanned pp.94–95, plus proof outline/ending pp.95–97. Probabilistic estimates were not independently reverified. The target supplies its own proof.

## 2. Guruswami–Sandeep: related alteration machinery, different objects

Primary inspected: [arXiv:2008.07344v2](https://arxiv.org/pdf/2008.07344v2), 10 November 2020. Section 4, Theorem 16 (printed pp.13–15), constructs abstract uniform hypergraphs with near-uniformity cover/fractional-cover gap while avoiding any finite family excluded from all relevant blown-up hypergraphs. Its proof samples hyperedges and removes forbidden configurations, citing further hypergraph independence results. It neither copies an arbitrary graph with exact integral triangle optima nor adds universal graph vertices.

Version caution: p.14 literally says the t=3 construction “will belong” to actual graph triangle hypergraphs. Visual inspection confirms this wording. It conflicts with the near-3 fractional gap and the graph fractional bound; treat it as an apparent wording error, not a realizability theorem. The theorem statement and construction operate on abstract hypergraphs.

The [2025 journal record](https://epubs.siam.org/doi/10.1137/23M1570351), SIAM J. Discrete Math. 39(2), 1312–1334, supplies metadata and abstract. Its full PDF was inaccessible (HTTP 403), so correction of that sentence and exact final theorem numbering are unverified. The author's current bibliography links ECCC TR20-167. No claim is made that the 2020 manuscript and 2025 journal have identical contents.

## 3. Earlier cone constructions do not provide the target equivalence

Primary: Haxell–Kostochka–Thomassé, *A Stability Theorem on Fractional Covering of Triangles by Edges*, [author manuscript](https://perso.ens-lyon.fr/stephan.thomasse/liste/fractuza.pdf), dated 1 March 2010, introduction p.2 (PDF index1).

Their cone construction starts with a **triangle-free** graph H with small independence number. Every cone triangle uses the apex, giving triangle packing equal to matching number of H and triangle cover equal to `|V(H)|-alpha(H)`. This supplies K4-free examples approaching ratio two. The inspected passage gives no reduction from arbitrary hypothetical Tuza counterexamples. The target's arbitrary base, independent copies and positive-defect budget are distinct from this cited scope. Only the relevant introduction was inspected, not the entire stability proof.

Search also located Munaro's thesis cone discussion, explicitly following Haxell et al.; its search excerpt was used only as a lead, not as an independently inspected additional theorem. Weak-saturation cone hits concern a different conjecture of Tuza and were not imported.

## 4. Exact comparison with frozen TUZA16

Archive inspected read-only with `git --no-optional-locks show` at commit `405e41c1eb24739405f4b06d8cdcd5715bb9fd13` in `TUZA-16-global-route-triage-20261103T231208Z`:

- `PROOFS_AND_OBSTRUCTIONS.md`, Sections 3–4;
- `notes/C_FROZEN_PROOF.md`, Sections 1–5 and its final scope assessment;
- `notes/C_PRIMARY_DEPENDENCIES.md`;
- `notes/CONTROL_PROOFS.md`, triangle-free cone controls.

Exact copies and their hashes are in the source receipt. The archive's C1 says, for copy weight M in an N-vertex graph with edge loads at most one,

`nu(X) >= M nu*(G) - e(N)N^2`, where `e(N)->0`.

Its contradiction to integral replication uses **M>=cN^2 for a fixed c>0**. C2, for globally labelled edge-partition gluings, gives exact cover and fractional packing replication, and excludes a positive limiting defect after division by N^2. It expressly discusses subquadratic regimes; sparse exact integral replication is not ruled out. Its partial-slope examples with at most two slopes already have exact integral additivity, but bounded copy/vertex ratio.

The new target instead requires an arbitrarily large **fixed** ratio b/N, to pay a cost linear in N from adjoining a fixed clique. This avoids the quadratic-density premise. The old `o(N^2)` error need not be smaller than b. Also, the new arbitrary copy labellings are not asserted to glue to the global projection required by C2. C1 still applies and is compatible with the target. Therefore the target's stated contrast with TUZA16 is accurate at the inspected scope: it does not refute or bypass a theorem forbidding all amplification; it uses a regime that the old theorem did not exclude.

No new prior-art claim is made for the exact copy-ownership argument itself. High-girth hypergraph substitution is a general combinatorial technique; proving the target self-contained does not establish that this particular application was previously unstated.

## 5. Search coverage and evidence limits

The pass was deliberately limited to cone/universal-vertex or fixed-codegree reductions, additive linear error, the high-girth ingredient, Guruswami–Sandeep, and the specified frozen TUZA16 overlap. Twenty-five targeted queries are recorded in `search_and_inspection_log.json`, together with returned primary-source views and most raw result batches. The first batch's full raw output was not retained; its queries and the subsequently downloaded relevant primary sources are recorded. Search results are discovery evidence only. Secondary snippets and unrelated Tuza conjectures do not support the conclusions.

No comprehensive citation graph, all-language search, older monograph survey, or full Tuza1990 text review was completed. The earlier source audits likewise lacked the full 1990 paper. The full 2025 GS journal paper remains unread. Any of these sources, or an unstated standard consequence known to specialists, could settle priority differently.

Suggested status for the mission record:

**Ordinary reduction with independent proof review elsewhere; classical Erdős–Hajnal incidence existence/alteration ingredient; no exact prior Tuza equivalence located in a bounded primary-source pass; originality unresolved.**

This audit does not establish unrestricted Tuza or certify a hypothetical counterexample. No mathematical test corpus or proof search was run for this assignment.

## Preserved primary identities

| Artifact | SHA256 |
|---|---|
| Erdős–Hajnal 1966 author scan | `739ee86edaa41e80228d9ed4cca7d69078545eb7e94a4310e66a6c1ee6432f98` |
| Guruswami–Sandeep arXiv v2 PDF | `988e0a2a4b20137885bedab42eac386a062f980a511f09e7da161d69a029e7eb` |
| Haxell–Kostochka–Thomassé author manuscript | `72d11853dd726fe6cbcef1c3b61cedb6a0fe886bd62cc2029b81ec227e5f5592` |
| TUZA16 frozen PROOFS_AND_OBSTRUCTIONS | `88b3e16310a3e89c28621081801acb3b32bb30526a9052d57bf6697e9dfafc10` |
| TUZA16 frozen C_FROZEN_PROOF | `aaa75c165295bd04bf2cd712bc171c34f871295a9fe9c14581a140adaa4cc1c0` |

Download URLs, access times, successful bytes, errors, text extractions, rendered pages, search results, and this audit's final manifest are under `sources/universal_clique_prior_art/`. New files only were written; no historical archive or frozen candidate was changed.
