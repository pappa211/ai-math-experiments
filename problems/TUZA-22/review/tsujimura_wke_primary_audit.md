> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Tsujimura arbitrary-order WKE lemma — primary-source and independent finite audit

Completed2026-11-15 UTC. **ACCEPT Lemma4.1 within its exact domain, as a computer-assisted proof with independently validated finite premises and a reconstructed symbolic lifting argument.** The resulting combined-CS exclusion also uses the separately reviewed Kotzig input. This audit does not validate the paper's other finite obligations or its density theorems.

## Primary source and availability

Yasuhito Tsujimura, *Triangle-overlap cores and density bounds for Tuza's conjecture*, [arXiv:2611.11128v2](https://arxiv.org/abs/2611.11128v2), submitted8Nov2026 and revised10Nov2026; arXiv DOI10.48550/arXiv.2611.11128. Lemma4.1 states WKE for finite graphs with minimum degree2, maximum degree4, at most two degree3 vertices and at most two degree4 vertices, allowing disconnected graphs and unbounded order. AppendixC gives path suppression, finite bases and subdivision lifting. It explicitly conditions the lemma on finite checks F007–F008. The v2 PDF's unpublished-supplement notice is stale: current arXiv metadata and the [public Zenodo record](https://zenodo.org/records/24047493) identify open package1.0.0, DOI10.5281/zenodo.24047493, dated10Nov2026. The package is supplementary to v1; this audit checks the v2 lemma's actual stated finite domain directly against its data.

The inspected PDF hash is `2ea5b6166a5d61b20624c34823ad5d40a96f618448431a6fafd5b6f5fd98bb7d`. Its receipt is `literature/Tsujimura_2611.11128v2_receipt.json`. Relevant files only were fetched from the official ZIP using HTTP byte ranges. `literature/tsujimura_zenodo_24047493/range_intake_receipt.json` preserves URL, exact ranges, response content-range strings, per-range hashes, per-file SHA-256 and ZIP CRC checks. The total archive bytes transferred were241132; the150069342-byte archive was NOT fully downloaded or fully hashed. Its MD5 is therefore recorded as publisher-reported, not locally verified. Both certificate hashes match the fetched package manifest. The guide, terms, provenance, manifest and two checker sources were preserved; neither producer checker was read or executed before or during independent verification. Local verification is permitted by the package terms; original package materials should remain local or be obtained from the official release.

## Independent finite method and completeness

`scripts/wke_primary_independent_validator.py` was written from the mathematical definition and raw literal records. It does not import producer code or use the producer path descriptions. Each saved graph is rebuilt from its vertex count and edge pairs. The checker asserts simplicity, connectivity, degree conditions, matching membership and disjointness, cover membership, the size inequality, and coverage of every edge outside the matching. It then reconstructs all maximal paths by walking actual degree2 vertices, checking that every graph edge is accounted for exactly once.

For each degree profile, the required domain is independently generated from all nonnegative loop counts and off-diagonal multiplicities satisfying the branch degrees, with connected support. Loops consume two degree units. Every loop receives parity representative3 or4. Parallel nonloop paths receive length1 for an actual direct edge, length2 for positive even length, and length3 for odd nondirect length; at most one direct edge per vertex pair is allowed. Interchangeable paths are enumerated as multisets. Canonicalization considers every degree-preserving permutation of the branch vertices. Comparing signature sets therefore establishes coverage; saved record counts alone are not used as a completeness argument.

| Branch degrees | Connected labeled suppressed models | Canonical parity signatures | Saved literal records |
|---|---:|---:|---:|
| no branches, cycles | cycle case |2|2|
|4|1|3|4|
|3,3|2|16|32|
|4,4|2|24|80|
|3,3,4|7|249|339|
|3,3,4,4|56|6744|10431|

All10888 literal records passed. Every reconstructed actual domain equaled its independently generated required domain: zero missing signatures, zero extras, zero invalid witnesses, zero UNKNOWN. The two mixed domains have maximum base orders16 and22. The other bases have maximum order12. Differences between saved record counts and canonical counts are expected repetitions, not missing cases.

The exact output is `evidence/wke_primary_independent_verification.json`; script SHA-256 is `9fb1e79f6e459d6a051970f017caa950167ca25d86e498e1da0ba16a9d511683`. Input hashes are F007 `f7137f40d85f3640527187d10845f05547f9e6e339814eabb7bcc46f3fa46e0e` and F008 `42d800f58b05855e4ceea597c41ce2c7ef007d03910798e4e5c5f7d39f474151`. The bounded process receipt `operations/wke_primary_independent.json` records0.703s wall time,72.516MiB sampled process-tree peak,60s/2200MiB caps, exit0, no termination. The checker requires only standard Python and exact integer/set operations; no nauty, graph census, optimizer or solver was used. This is not formal proof-assistant verification.

## Reconstructed arbitrary-order implication

Here is the independent mathematical reconstruction. In a connected graph of minimum degree2, each vertex that is not a branch has degree exactly2. If no branch exists the graph is a cycle. Otherwise maximal internal-degree2 paths partition the edges and form a connected multigraph on the branches, with loops permitted and degree preserved. The parity of the number of odd-degree vertices excludes a lone degree3 branch. Under the lemma's bounds, the six rows above exhaust every connected component. No component can contain some unlisted degree profile; disconnected components are handled separately.

Reducing paths to the three nonloop representatives or two loop representatives preserves simplicity and the branch degrees. The resulting parity signature is in the validated domain. A signature equality provides an isomorphism between the reduced graph and a saved base, so its checked matching/cover pair transfers to the reduced graph. Vertex labels and ordering of internally disjoint parallel paths have no mathematical role.

To increase an edge uv to u-a-b-v, start with a matching M and a vertex cover Q of the complement of M, with |Q|<=|M|. If uv lies in M, replace it by ua and bv, and add a to Q. The only additional nonmatching path edge is ab, which is covered. If uv is not in M, some endpoint lies in Q; add ab to M, and add the new vertex next to the opposite endpoint to Q. Both new outer edges are then covered. Both constructions increase the matching and cover sizes by exactly one and preserve every other incidence. Iteration reconstructs all original path lengths. Taking unions over disconnected components preserves the matching/cover property and its size inequality. This proves the arbitrary-order statement from the validated finite premise.

## Scoped combined-CS consequence

Apply the separately reviewed theorem `notes/triangle_free_wke_link_exclusion_v1.md`: a minimum-edge failure of combined CS has no closed link component that is both triangle-free and WKE. Consequently it has no triangle-free closed link component with maximum degree at most4, at most two degree3 vertices and at most two degree4 vertices; minimum degree2 comes from the already established edge-codegree condition. Other components, outside vertices, outside rim pages and graph order are unrestricted. The conclusion combines our symbolic strictness proof, Kotzig's declared theorem, and the independently checked finite premise above.

Triangle-freeness is essential to the present CS transfer. The primary WKE lemma itself permits triangles; that does not automatically extend the equality/CS argument to nontrianglefree links. Nor does this lemma establish availability of any such link in every minimum obstruction. Petersen-type non-WKE links and larger branch profiles remain outside the scope. No unrestricted Tuza or equality conclusion follows from this audit.
