> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh reconstruction of the complete near-triangle-free WKE exclusion

Coordinator, 2026-11-16 UTC. ACCEPT using explicitly declared ordinary class-local historical inputs. Source `notes/challenger_near_triangle_free_wke_exclusion_v1.md`, SHAf6315a9a1da4b26b6a05cf76b5862f9a1e7d4f437536d56e92723fa1edd0c6b9.

The simultaneous-cover theorem excludes witness size>=3, and a larger link matching could contribute at most one surviving edge per B block because L is K4-free. Thus a surviving WKE witness must attain matching number<=2.

I independently checked the new matching-two classification. After choosing ab,cd, the unmatched set U is independent and every U vertex sees at least two matched endpoints. Distinct U vertices cannot be matched to a,b (or c,d), since the other original matching edge would extend to three. If one U vertex sees both a,b, the only remaining possibility n6 gives two triangles; any cross edge joining them extends to a three-matching. Hence all U vertices have exactly the same two neighbors a,c. The edge bd is impossible, and minimum degree forces b,d to see both a,c. This proves the K2,n-2 plus optional base classification with no external matching theorem.

For order5 I reread pinned main.md Section5.1--5.3, not only its degree-five headline: the proof expressly starts with a FIVE-VERTEX LINK COMPONENT of minimum degree2 and supplies eight explicit ordinary cases, including arbitrary outside pages. The four dense cases list complete surviving footprints, the sparse cases are strict or external-page augmentations, and W5 uses the good-base-pair page-cover argument. No ambient degeneracy assumption enters those local arguments. Since an apex-TF link is K4-free, the elementary five-vertex coloring argument applies. For order>=6 the new classification has an apex-forest deletion, already excluded.

Therefore every WKE closed link admitting a triangle-free vertex deletion is excluded, at arbitrary order and outside attachments. WKE availability itself is not asserted. The proof uses no GE, Kotzig or finite table.
