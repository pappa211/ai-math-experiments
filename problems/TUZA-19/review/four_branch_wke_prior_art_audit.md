# Focused primary-source prior-art audit: four-branch WKE and high-codegree 5-core

The inspected primary sources do not state the unrestricted four-branch WKE lemma or its unrestricted high-codegree 5-core localization. The lemma is strictly broader **as a statement** than Tsujimura's printed Lemma 4.1. This bounded search does not establish historical novelty, nor rule out a deduction from older results under another formulation.

The reviewed candidate is `notes/root_four_branch_wke.md`, SHA256 `67011b7544cd8d8c516a738572c10f5d828b5631c3d8ce491fcd08ae3f71ce99`; an exact copy is preserved in `sources/four_branch_wke_prior_art/reviewed_statement.md`. This is an attribution/scope audit, not a second proof or certificate-domain audit. Parent reports independent mathematical review separately.

## Established ingredients and exact comparisons

### Puleo: definition, reduction and earlier sufficient conditions

Primary: Gregory J. Puleo, *Tuza's Conjecture for Graphs with Maximum Average Degree less than 7*, arXiv:1308.2211v3 (13 April 2015), published in European Journal of Combinatorics 49 (2015), 134–152, DOI https://doi.org/10.1016/j.ejc.2015.03.006 . Primary PDF: https://arxiv.org/pdf/1308.2211v3 .

Definition 4.1, printed page 9, is exactly the candidate's matching M and vertex cover Q of L−M with |Q|≤|M|. Definition 4.2 and Lemmas 4.3–4.4, pages 9–10, supply edge reducibility and the WKE-link reduction. These are established tools requiring explicit attribution.

Section 4 also proves: no odd cycle longer than three implies WKE (Proposition 4.8); connected order at most four implies WKE (Corollary 4.9); specified small matching-number cases (Corollary 4.10); an independent set of size n−3 for connected n≥6 implies WKE (Corollary 4.12); and a criterion on connected orders five and six (Proposition 4.13). The latter uses maximum degree greater than one in the **complement** of L; the overbar was checked visually because text extraction can omit it. None is stated as an arbitrary-order bound of four vertices of degree at least three.

Reading boundary: Section 4 and its reduction definitions/lemmas, printed pages 9–14; related introductory scope checked. No claim that the candidate cannot be derived by further work from this paper's tools.

### Tsujimura: direct methodological and localization antecedent

Primary: Yasuhito Tsujimura, *Triangle-overlap cores and density bounds for Tuza's conjecture*, arXiv:2611.11128v2, revised 10 November 2026. Primary HTML: https://arxiv.org/html/2611.11128v2 ; PDF: https://arxiv.org/pdf/2611.11128v2 .

Lemma 4.1, printed page 9, permits arbitrary order and disconnected links, but requires minimum degree at least two, maximum degree at most four, at most two degree-three vertices and at most two degree-four vertices. Appendix C.1 supplies exactly the two-vertex subdivision lift used in the candidate. C.2–C.3 treat the corresponding suppressed profiles, including (3,3,4) and (3,3,4,4), using finite certificates.

Theorem 1.2 localizes to the **4-core** of the codegree-at-least-three subgraph under b(G)≤4 and Δ(H4(G))≤2. Its survivor R may be a proper subgraph of G[K]. Appendix E separately concerns ordinary cores of G, not an unrestricted 5-core of the high-codegree subgraph.

The candidate removes the link maximum-degree/profile restrictions, permits four branches of any degrees, and consequently removes both ambient overlap restrictions while using a 5-core. Attribute the subdivision operation and core-localization template to this source. Do not describe those ingredients as new. No supplement or density proof was audited here.

### Other direct primary WKE comparisons

Amrit Kandasamy, *Tuza's Conjecture for Graphs of Maximum Degree at Most 10*, arXiv:2610.15269v1 (11 October 2026), https://arxiv.org/html/2610.15269v1 . Lemma 3.1 states a WKE classification for connected links with minimum degree two, maximum degree three and **order at most ten**, with the Petersen graph and a specified ten-vertex graph R as exceptions. The source cites its own computational package for this classification. This is an order-bounded subcubic result, not the arbitrary-order/unbounded-maximum-degree four-branch statement. Lemmas 2.3 and the references attribute the basic WKE reduction to Puleo. No package replay or full theorem audit was performed.

Anish Gupta, *Tuza's conjecture for graphs of maximum degree at most seven*, arXiv:2608.06538v1, https://arxiv.org/html/2608.06538v1 . Lemma 4.5 asserts that a connected non-WKE graph on **seven vertices** has at least three vertices of degree at least four. The degree-codegree translation in Corollary 4.7 applies that finite classification to seven-regular minimal-counterexample links. It does not state an arbitrary-order four-branch condition. Only those directly relevant definitions and statements were inspected; its computational catalogue was not replayed.

## What the comparison establishes

The candidate has the same WKE quantifiers as Puleo: M need not be maximum, and Q covers the edges outside M. There is no change of definition creating an artificial distinction.

The candidate includes all links in Tsujimura Lemma 4.1 and additional degree profiles. For example, a subdivided K4 has four degree-three branches, a profile excluded by that lemma even when its maximum degree is three. This example only establishes strict scope containment; it does not prove that those additional individual graphs were historically unknown to be WKE. Some are already immediate from Puleo or elementary arguments.

The proposed localization is also distinct from merely removing low-degree vertices of the ambient graph. Its peeling graph is formed from edges of codegree at least three, and the candidate puts no upper bound on ambient degree or codegree. The appropriate comparison is Tsujimura Theorem 1.2, not its ordinary-core Appendix E. Both constructions preserve a defect inequality to a survivor **contained in** the induced initial core; neither statement identifies the survivor with that full induced graph.

This pass found no exact prior unrestricted four-branch statement and no exact prior unrestricted high-codegree 5-core localization. That is the search result, not a priority verdict. A useful private description is: “an independently certified extension of the branch-degree domain in Tsujimura Appendix C, using Puleo's WKE reduction; historical originality unresolved.” Do not use “first,” “new theorem in the literature,” or equivalent priority language on this evidence alone.

## Search and preservation limits

The focused pass began 2026-11-15 at 05:47:38 UTC and stayed within the parent's twenty-minute limit and the original mission clock. Search families covered WKE spelling variants, four branch/high-degree vertices, subdivisions, relevant subcubic classifications and high-codegree cores. Exact queries are preserved in `sources/four_branch_wke_prior_art/search_log.json`. Only primary texts support the mathematical comparisons; secondary search hits were discovery aids or discarded.

Saved primary bytes and complete receipts are in `sources/four_branch_wke_prior_art/`. In particular:

- Puleo v3 PDF SHA256: `822c158830f76c61edbb3a32e308b113059318718129c6ee8380b3e91fb3d241`.
- Tsujimura v2 PDF SHA256: `2ea5b6166a5d61b20624c34823ad5d40a96f618448431a6fafd5b6f5fd98bb7d`.
- Kandasamy v1 HTML SHA256: `2c423ab18a4fa7a609311aa5af8df8d6a4535a709c1404a576d2011c5892edc2`.
- Gupta v1 HTML SHA256: `d810d84c6bb6e4d5beb3995d5e3dfa73276337ed38b9128fe84dc5fda5f74fc3`.

The receipt records requested/resolved URLs, retrieval times, byte counts, versions and reading boundaries. Relevant PDF statements were checked visually. No comprehensive citation traversal, supplement inspection, alternative-name classification search, human review, author contact or publication occurred. All file handling was on the authorized local Darwin host. Requested reviewer controls were Astra/Ultra; precise serving metadata was not exposed.
