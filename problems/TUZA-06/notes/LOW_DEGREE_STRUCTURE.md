> Public derivative of a frozen research record. Operational identifiers are removed. Historical partial/PENDING verdicts and definition-stage comments record their original stage and are superseded by the final public status. Historical hashes authenticate the named original inputs, not changed derivative files; see SOURCE_TO_PUBLICATION.json. Descriptions of retained historical logs and diagnostics refer to the original private record; only the public inventory is distributed. Current verification evidence is linked from PROOF_STATUS.md.

# Actual universal low-degree structure

Status: complete for ordinary manuscript §6, in arbitrary finite ambient graphs, including all outside attachments. The public import is Tuza06.LowNeighborStructure.

Public exact results: minimal_degree_five_independent forbids two adjacent actual degree-five vertices in MinimalObstruction G; minimal_degree_five_neighbors_high proves every actual neighbor of an actual degree-five vertex has degree at least seven.

No specified local-configuration assumptions are exposed. Exact degree-five link classification supplies the full/near six-vertex core. For adjacent degree-five vertices the difficult missing-rim endpoint has one private outside neighbor; NearClique forces its common-rim spokes. The compiled AdjacentLow reduction and actual augmentation contradict minimality. Dominating neighbors use strict local reductions.

For degree six, a dominating neighbor has one private outside neighbor. The near core uses the strict four-triangle reduction. The full core chooses an actual triangle apex on the private edge and uses the strict five-triangle reduction. Symbolic clique reasoning replaced an oversized finite all-reorderings decision.

A missing-rim endpoint of degree six has two arbitrary private vertices p,q. If pq exists, match pq,va,bc with the common-rim cover. Otherwise codegree two supplies distinct rim neighbors a of p and b of q; match pa,qb,vc. Both are balanced three/six reductions, so actual minimality supplies residual K4/K5 triangle components. In the first residual, triangles vtc and atc share tc but va is actually deleted. In the second, triangles vta and cta share ta but vc is actually deleted. The shared-triangle block theorem contradicts the missing cross edge. All ambient attachments remain unrestricted.

All files compile through the shared serialized helper, pinned Lean 4.33.1, with public theorem axioms [propext, Classical.choice, Quot.sound]. No custom axioms, admitted declarations, native_decide, or opaque local premises were introduced. Failed development logs are retained; oversized finite checks were replaced by symbolic membership/cardinality proofs. This auxiliary milestone alone is not the complete five-degenerate theorem.

Source hashes at completion:
lean/Tuza06/LowDegreeStructure.lean: af451b992bc7a0495603d162b367c6a32b78bd7cd97d7971a88f58e4225f57c0
lean/Tuza06/LowDegreeStructureAdjacent.lean: e8e278a500f224af8f5cfcb3a89acf6331629260ef0bfc23dbec993d8eca20a8
lean/Tuza06/LowDegreeStructureDominatingFive.lean: f4150b5e2418bc6bc79a6cc95cf9be9e85e54dc93b1488c28a6e391f94976b34
lean/Tuza06/LowDegreeStructureTools.lean: d94e8cb8c23a0ead580bf4fad1e1bf05229c644504783bd7bc1b12879c489c43
lean/Tuza06/LowNeighborDominatingClique.lean: c537261634d0615d870786647db5eeebbf5f848fff0081ed166070cae3a83e54
lean/Tuza06/LowNeighborDominatingNear.lean: 7f8cdb588e42d7c6ad83b030eff8155d50a61b33b7e74128150c816e1d9c89e8
lean/Tuza06/LowNeighborEndpoint.lean: c1a24eace672d6d2e1d749d9a04a7120d472392d36d012c2a83194448af385a0
lean/Tuza06/LowNeighborEndpointPatterns.lean: 4d7a88d632f2e5f5d6f44ca4d771bdd237a7fd8e2978be9635fa7ad121c490fa
lean/Tuza06/LowNeighborEndpointTools.lean: 7106bb8f88ea0271e71d8471962414544f78b630026b23891b9f9b870265db49
lean/Tuza06/LowNeighborEndpointUniversal.lean: e5c6345d71027f0039a1d4dbded6ec0d7151bf43018fc825a6d8189ebcb1645f
lean/Tuza06/LowNeighborResidual.lean: 621044e94b64163725049038990893505b26ea2840e30245694a78455800c187
lean/Tuza06/LowNeighborStructure.lean: ad5aa28666aba2e59f9d21ff2f177ccefbebfea2ce8213d9acdec2758501aca1
lean/Tuza06/LowNeighborTools.lean: 78d30fabec0196c946bd196ac59d72a0b524fd7db1c8e23906b51169e459cd2e
