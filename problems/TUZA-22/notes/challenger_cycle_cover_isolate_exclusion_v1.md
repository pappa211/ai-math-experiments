> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Exclusion of the one-isolate/no-apex-edge path-forest domain

Status: PROOF_USING_FINITE_CERTIFICATES, independently validated fixed subdomain. This is a local theorem and does NOT depend on the unfinished original fourteen-shape completion.

In a minimum combined-CS failure, globally or in an edge-subgraph-hereditary class, there is no K4-free connected closed link L with nonadjacent vertices a,b such that F=L-{a,b} is a union of paths of total matching number at most two and EXACTLY ONE isolated vertex.

If F has no nontrivial path, L has only three vertices and is excluded by closed-link robustness. Otherwise its nontrivial components are exactly one of P2,P3,P4,P5,P2+P2,P2+P3,P3+P3. Add the one isolate and all ordered a/b neighborhoods, with ab absent. This gives26944 raw graphs; only actual minimum degree>=2, connectedness and K4-freeness are filtered. Exactly2422 are eligible. The domain is an independently regenerated SUBDOMAIN of the fourteen-shape framework, not a quotient or a selected sample.

Every eligible graph has a literal certificate. Counts are: ordinary at-most-three-branch472; ordinary apex-unicyclic930; S-collapse91; RIM69; B-incompatible14; paid-triangle collapse634; STRICT146; triangle-free residual equal-matching66. There are zero UNKNOWN and no timeouts. The added optional maximum-degree-two residual rule was unused and is not a dependency of this finite theorem.

The ordinary certificate semantics are exactly those independently audited in challenger_two_apex_forest_matching_two_bound_v1.md Section3, plus the ordinary apex-unicyclic rule: the supplied vertex w has a connected remainder L-w with equal edge and vertex counts, so the accepted ordinary full apex-unicyclic theorem applies. Every matching, cover, paid actual triangle count, residual component, whole-clique rim footprint and explicit residual matching is recorded. Arbitrarily many outside vertices/pages are handled by those ordinary theorems, not enumerated.

The coordinator independently regenerated all seven path partitions and all26944 neighborhoods, proved exact equality with the2422 eligible keys, and validated every literal certificate without importing producer code. Five negative controls were rejected: false unicyclic remainder, omitted paid triangle, non-residual matching, missing domain record, wrong apex mask. The result is INDEPENDENTLY_VALIDATED_FINITE_SUBDOMAIN with0UNKNOWN. Producer monitoring:0.482041s,27.8125MiB,60s/2200MiB cap. The earlier original-domain UNKNOWN records are preserved and are not reclassified by this local theorem alone.

This proves the stated local exclusion. Its use in a different vertex link requires the separately proved full-link identity and domain transfer. In particular the dependency direction is ACYCLIC: ordinary rules prove this subdomain; this theorem may then support a global cycle-cover certificate in the original domain. No certificate here invokes that global certificate or a completed one-cycle-cover CS theorem.

Frozen files:
- scripts/challenger_cycle_cover_isolate_interface.py:15c620ca94b89679c88e1034540b696d61e0500b1a204d2c57e1d69487c61241;
- evidence/challenger_cycle_cover_isolate_interface.json:bc4e2582b77fe74e6e86a23f3c29ac2f035414730cac243ef2a56b48e7f85ab4;
- operations/challenger_cycle_cover_isolate_interface.json:ab21817d11f49d8d20752bfd2494e605d12f3b61cecbfbac861e8e10122ff84f;
- scripts/coordinator_cycle_cover_isolate_validator.py:4c05f020d5ee7b7bb04bacd15860be9d44005b18ce6ff212e749f5a70c4cb274;
- evidence/coordinator_cycle_cover_isolate_validation.json:9f00087d22ec766e5f183fc2ea7bd38cdb8a4adb90905a0ced2408309cadff18;
- operations/coordinator_cycle_cover_isolate_validation.json:3e659536c0db2e09ee04e3ae25e8268a1bee14b804267203f6f869051198347d.

Ordinary sources retain their frozen hashes: apex_unicyclic_full_exclusion_ordinary_v2.md3adee37d0c9badaeec2b57088b694816bd811eef727dbcf2d5d9f4576c4e43c4; coordinator_TF_residual_equal_matching_exclusion_v1.md1c40a0c8be58ca926e7f35175448dc80c0d891c22128a6596af9a379775d88b6; wke_residual_triangle_count_collapse_v1.md8143c49ad20f0dc7ef5d9d585be5d759b346be2ff1cf9b31ffab3e6f1cc57865; three_branch_cs_link_exclusion_v1.mddd530b892b10279fda98b195522f1027376deadfbce7a769ae2aec28d62bafa4. No GE, Kotzig, all-size formalization or external human review is claimed.
