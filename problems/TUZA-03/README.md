# TUZA-03 — consolidated restoration and boundary verification

The most complete mathematical presentation of TUZA-01–03 is [Triangle Restoration and Packing–Covering Stability in Tuza’s Conjecture](../../papers/tuza-triangle-restoration/main.md) ([PDF](../../papers/tuza-triangle-restoration/main.pdf), [sources and scope](../../papers/tuza-triangle-restoration/README.md)). It includes the complete selected proofs from all three archives.

The earlier [TUZA-02/03 consolidated manuscript](CONSOLIDATED_MANUSCRIPT.md) and its verification reports are preserved below. **Unrestricted two-triangle restoration, OCT-five, and the fixed-$`c<3`$ density extension remain UNPROVED.** Historical originality is not established.

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

This published archive contains selected proof sources and negative evidence. [TUZA-02](../TUZA-02/README.md) retains its own research provenance. The original verification and publication documents are historical records of their frozen package; their preparation-stage wording does not describe the current repository status. The canonical paper is a later editorial integration. The existing Apache-2.0 license is retained.
