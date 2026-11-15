# Source access correction and frozen-proof provenance

The frozen `notes/global_finite_incidence_gate.md` sentence pointing to a downloaded source directory is inaccurate. The discovery delegate's direct ECCC PDF download failed with ConnectionResetError (Errno 54); no downloaded PDF or SHA-256 exists. The original proof bytes are preserved for review hashes rather than silently rewritten.

The coordinator and fresh critic independently inspected the primary PDF through the web tool on 14 November 2026: https://eccc.weizmann.ac.il/report/2020/167/download/ . Guruswami and Sandeep, *Approximate Hypergraph Vertex Cover and generalized Tuza's conjecture*, introductory Theorem 3, PDF page 4 (printed page 3), states a near-uniformity gap for finite families of excluded ordinary subhypergraphs absent from pair blow-ups. The theorem also includes the fractional-cover gap. Its containment notion is not induced containment.

The new induced-incidence obstruction argument and its criticality extraction use the complete self-contained proofs saved in this workspace, not that external theorem. Recent preprints mentioned by the discovery delegate were orientation only and are not dependencies or independently verified claims here.

Fresh review of the two original proofs used exact frozen hashes recorded in `review/fresh_critic.md`; copies are retained under `evidence/critic_input_*`. Some review files were temporarily staged under `SCRATCH_OUTPUT` after approval timeouts, then copied into the authorized canonical workspace. No historical source was edited.
