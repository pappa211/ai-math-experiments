# Shared-context reconstruction of connected pruned-cut obstruction

Reviewed exact source `notes/criticality_connected_pc.md`, SHA-256 `aa6793e8674c1c01e447f966de04c34768e97d8d63659688eb17743608c1e63c`. Status: no mathematical gap found in the stated theorem. This is a new reconstruction by a collaborator who already developed the original K4-block cut obstruction; it is NOT an independent fresh-context audit.

Checked the uniform bad-block binomial tail, the N^(1/2)+N^(3/4) expected short-cycle bound, edge-deletion margin and component extraction. Checked all actual H and G triangles, the single shared-edge component and codegree assertions, the at-most-floor(n/2) exceptional blocks, and every nonexceptional-block cut case. In particular a monochromatic block opposite the apex has all three nonpacked star edges fixed; one cannot reuse the old exact local cost formula, but the claimed lower bound3 is sound. Summing gives strictly more than2b+n, while all packings have size at most b+floor(n/2).

Independently reconstructed the positive Tuza certificate: a maximal ordinary matching using at most one rim edge per K4 gives b+m packed triangles, and opposite-pair block covers plus its endpoint spokes give a cover of size2b+2m. Maximality treats unused blocks; the opposite edge treats used blocks. No actual triangle is omitted. The architecture refutation therefore remains separate from Tuza.

No additional finite computation is needed for this ordinary probabilistic proof. Historical originality, Lean verification, human review, and unrestricted Tuza remain outside this review.
