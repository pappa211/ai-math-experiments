# TUZA-03 — consolidated restoration and boundary verification

The [consolidated manuscript](CONSOLIDATED_MANUSCRIPT.md) presents freshly audited TUZA-02/TUZA-03 results. **Unrestricted two-triangle restoration, OCT-five, and fixed c<3 density extension remain UNPROVED.** Historical originality is provisional.

Completed conditional Lean deductions are full exact-equality restoration, full essential-edge restoration, closed-boundary equality deletion, the stable floor packing-loss bound, and the companion stability criterion. Their exact published inputs are in [Lean verification](LEAN_VERIFICATION.md). Flat restoration, the mixed/shared-apex exact-two-apex bowtie theorem, and exact compression have complete audited ordinary proofs and are not Lean-formalized here.

- [Final assessment](FINAL_ASSESSMENT.md)
- [Publication readiness](PUBLICATION_READINESS.md)
- [Theorem inventory and scope boundaries](THEOREM_INVENTORY.md)
- [Independent mathematical audit](MATHEMATICAL_AUDIT.md)
- [Independent statement fidelity review](review/LEAN_STATEMENT_FIDELITY.md)
- [Independent reproduction](review/INDEPENDENT_REPRODUCTION.md)
- [Primary-source scope and originality review](literature/SOURCE_AUDIT.md)
- [Reproduction instructions](reproduction/README.md)
- [Separate campaign provenance](provenance/CAMPAIGNS.md)
- [Publication/source manifest](provenance/PUBLICATION_MANIFEST.json)

The final verification rebuilt project sources in an isolated project, checked the exact compiler and all pinned dependency revisions, audited theorem types and transitive axioms, and replayed every module containing declarations through Lean's kernel. Existing compiled dependencies were reused; this was not a cold Mathlib rebuild or an external prover check. Input hypotheses remain assumptions even when the axiom report contains only the standard three axioms.

This is a curated text-only publication candidate. It contains selected proofs and negative evidence, not wholesale private research archives. [TUZA-02](../TUZA-02/README.md) retains its own research provenance. TUZA-01 is unchanged in the proposed overlay. Commit, push, release, and publication require separate owner authorization. The existing Apache-2.0 license is retained.
