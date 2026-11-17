> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Two-apex forest links: matching number at most two

Status: PROOF_USING_FINITE_CERTIFICATES, frozen assembly. The all-size ordinary reductions and certificate semantics are separately proved; the last fixed P6 interface has an independent complete-domain and literal-certificate validation. This is not an ordinary proof without finite premises or an all-size formalization.

## Theorem

In a global or edge-subgraph-hereditary class minimum combined-CS failure, let L be a nonempty closed link component at h. If distinct a,b in L satisfy F=L-{a,b} is a forest, then

    nu_match(F)<=2.

This is a necessary local restriction. It neither excludes every two-apex-forest link nor settles the Hamiltonian-cycle-cover equality class.

## 1. Ordinary reduction to one literal shape

The independently reviewed ordinary theorem challenger_two_apex_forest_large_matching_exclusion_v1.md excludes nu_match(F)>=4. Its proof gives explicit WKE tuples violating the accepted simultaneous-cover bound, using only elementary forest alternating reach, Hall's theorem, and the exact perfect/odd-path endpoint cases.

The independently reviewed ordinary sharpening challenger_two_apex_forest_matching_three_reduction_v1.md shows that nu_match(F)=3 can survive only when F is the single path P6 and ab is absent. Its nonperfect boundary is excluded by a complete five-triangle rim augmentation with at most one surviving rim edge in every old block.

Thus the entire matching-three obligation is a graph on the eight vertices0,1,2,3,4,5,a,b, with path edges01,12,23,34,45, no ab edge, and arbitrary a/b neighborhoods in the path. The authenticated minimum link degree and closed connectedness require delta(L)>=2 and connectedness. No other condition is used to prune the finite domain.

## 2. Exact finite domain

The producer enumerates all4096 ORDERED pairs of six-bit apex neighborhoods, with a=6,b=7. It retains exactly2018 graphs satisfying actual minimum degree at least two and connectedness, and rejects2078 for those conditions only. No symmetry quotient, degree upper bound, triangle-count restriction, or presumed equality property is applied.

The independently authored coordinator validator regenerates the entire4096-pair domain and verifies exact equality with the recorded2018 keys. Hence every possible literal P6 remainder in Section1 is included. The all-size reduction is supplied by the ordinary proofs, not by a numerical order cutoff.

## 3. Ordinary certificate semantics

Every certificate except the ordinary small-branch theorem supplies an actual matching P and an actual vertex cover Q of R=L-P, with |Q|<=|P|=r. Deleting every h-spoke into the CLOSED link and P is balanced: the r hub triangles on P use only deleted edges, and P plus hQ covers every lost triangle, including arbitrary outside pages on the removed rim bases. Proper-subgraph CS therefore yields strictness or a literal B residual K with nu(K)=nu(G)-r.

The seven recorded certificate types have these exact meanings:

- ORDINARY_BRANCH_AT_MOST_3 checks at most three actual L vertices of degree at least three and invokes the accepted ordinary all-size three-branch exclusion.
- STRICT has |Q|<|P| and immediately contradicts minimum-CS equality.
- S_COLLAPSE supplies S with L-S triangle-free and exact outside-S matching mates Z, with r>|S|+|Z|. The accepted ordinary simultaneous-cover theorem applies.
- PAID_TRIANGLE_COLLAPSE supplies every actual triangle of L-S and has r>|S|+|Z|+number of those triangles. The independently reviewed ordinary paid-triangle theorem applies, with no disjointness assumption on those triangles.
- B_INCOMPATIBLE supplies an actual shared-edge-connected triangle component of R whose support is not a complete K_t,3<=t<=5. Its triangles would have to lie in one old literal block, whose L intersection is a clique and contributes all its triangles, a contradiction.
- TF_RESIDUAL_EQUAL_MATCHING checks that R is triangle-free and supplies an R matching of size at least r. The accepted ordinary coordinator_TF_residual_equal_matching_exclusion_v1.md rules this out with all outside attachments included. The matching is explicitly disjoint from P; no bipartiteness is inferred.
- RIM supplies an actual L triangle T meeting P and an actual matching M in L-E(T) of size at least r. The r or more hub triangles on M plus T are edge-disjoint. For EVERY residual clique C of sizes2..5, the complete surviving footprint (M union E(T)) intersect E(C) has at most two edges, incident if there are two. Every old block's L intersection is such a clique, so a maximum old packing avoids the entire footprint. Appending r+1 triangles contradicts nu(K)=nu(G)-r. Intersections of size0/1 contribute no rim edge.

These are literal finite conditions for ordinary all-attachment proofs, not optimizer statuses. No outside graph is enumerated.

## 4. Complete evidence and independent validation

All2018 eligible records have certificates, with zero UNKNOWN:

| certificate | count |
|---|---:|
|ORDINARY_BRANCH_AT_MOST_3|161|
|PAID_TRIANGLE_COLLAPSE|1348|
|STRICT|298|
|S_COLLAPSE|98|
|TF_RESIDUAL_EQUAL_MATCHING|24|
|RIM|42|
|B_INCOMPATIBLE|47|

The one authorized producer run completed in0.356523 monitored seconds, peak sampled RSS25.34375MiB, under10s/2200MiB. Its domain, script, admission and evidence were frozen before independent validation. No rerun, resampling or order expansion occurred.

The coordinator validator independently checked all actual triangles, matching and cover premises, exact S-mates and paid triangle counts, bad components, every relevant residual clique for RIM, and the explicit triangle-free residual matching with its dependency hash. It also rejected five negative controls: duplicate P edge, omitted paid triangles, P reused as an R matching, false rim triangle, and missing domain record. The validation status is INDEPENDENTLY_VALIDATED_FINITE_INTERFACE with2018 records and0UNKNOWN; monitored runtime0.242s, peak35.89MiB.

Therefore the P6 interface is excluded. Together with Section1 this proves the theorem.

## 5. Exact Hamiltonian-cycle-cover consequence

If C is a selected Hamiltonian cycle meeting every actual G triangle, then for a vertex v with selected neighbors a,b every edge of its link avoiding a,b belongs to C. Each closed component containing at most one selected neighbor would be an apex-forest link or a forest and is already ordinarily excluded. Thus the whole link is connected, contains both a,b, and F=L-{a,b} is a union of paths and isolates.

The theorem gives matching number at most two. At most one F isolate is possible, because two isolates would be degree-two internal vertices of two nondirect length-two parallel a-b paths, excluded by the ordinary parallel-thread theorem. Every nontrivial path has at most three times its matching number vertices. Hence |V(F)|<=7 and every vertex of a hypothetical minimum-CS graph with such a cover has degree at most9.

The remaining path-forest matching-number-at-most-two shapes are not resolved by this theorem. The maximum-degree-nine statement and the matching-two restriction retain the finite P6 premise. The earlier maximum-degree-twelve restriction from the ordinary matching-three bound remains independently ordinary.

## Frozen sources and evidence

Ordinary reduction sources:
- challenger_two_apex_forest_large_matching_exclusion_v1.md:336006afd3adfa51e842bff9e30544f29a59735b15ac7752763737d3515654e1;
- challenger_two_apex_forest_matching_three_reduction_v1.md:bfff33a3b97a8e7340ed94500ea8bec7903898a0b6214122918091556fc6a630;
- coordinator_TF_residual_equal_matching_exclusion_v1.md:1c40a0c8be58ca926e7f35175448dc80c0d891c22128a6596af9a379775d88b6;
- wke_residual_triangle_count_collapse_v1.md:8143c49ad20f0dc7ef5d9d585be5d759b346be2ff1cf9b31ffab3e6f1cc57865;
- three_branch_cs_link_exclusion_v1.md:dd530b892b10279fda98b195522f1027376deadfbce7a769ae2aec28d62bafa4.

Finite files:
- scripts/challenger_p6_two_apex_interface.py:c972c43f25d2b413bbdf382e4b42712ea99a767b43adcb6b72ee3e08da3e5a96;
- operations/challenger_p6_two_apex_admission.md:0c49674397ce6c5d7709fc43430ee4ea7eb9796393436276da4cc9059e550467;
- evidence/challenger_p6_two_apex_interface.json:490f12d9a3b61c0f691a1105d414da5ee1b495d16edab1d5424b8c8c42db5136;
- operations/challenger_p6_two_apex_interface.json:f27da88be34ed58509b81a429301db1cede05a5f527f552f8d94b9d69025ebd8;
- scripts/coordinator_p6_interface_validator.py:99fef232e2de92925730b208102f62c47ebab050b3de6970d115a4208fc2902d;
- evidence/coordinator_p6_interface_validation.json:9b3747018fef9a0282afd106af3e209e043149d0b1e1544f06346119f3e52c9f;
- operations/coordinator_p6_interface_validation.json:58e3b89318ac42790794eb4bec64b98f33e78ab32056cc24b3c40bc112f5a799.

Fresh ordinary reduction reviews are review/two_apex_forest_large_matching_independent_review.md and review/two_apex_forest_matching_three_independent_review.md. The finite label is not removed by the fact that every individual certificate rule has an ordinary proof.
