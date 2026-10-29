# TUZA-02 — essential-edge and flat-remainder restoration

This preserves a curated research record from TUZA-02 and its selected ordinary proofs. The consolidated mathematics and final formal verification are in [TUZA-03](../TUZA-03/README.md). Existing TUZA-01 is unchanged.

Fresh verification accepts restoration from a tripartite remainder with a packing-essential edge, restoration from a flat remainder without a tripartiteness assumption, and the specified three K4-star supporting cases. Exact equality is a pre-TUZA-02 follow-up, credited in the consolidated manuscript. Historical originality is not established.

- [Original research report excerpt](provenance/ORIGINAL_REPORT_EXCERPT.md)
- [Essential-edge proof](research/proof/ESSENTIAL_EDGE_RESTORATION.md)
- [Flat-remainder proof](research/literature/FLAT_REMAINDER_DEDUCTION.md)
- [Structural reduction](research/proof/STRUCTURAL_REDUCTION.md)
- [Star-core supporting theorem](research/proof/K4_STAR_DEFECTS.md)
- [Family-definition counterexample](research/adversarial/FULL_FAMILY_DEFINITION_COUNTEREXAMPLE.md)
- [Independent named-certificate checker](experiments/independent_certificates.py)

The checker uses direct subset enumeration, regenerates full graph-triangle families, and verifies the star parameters, surviving packings after every single-edge deletion, and individual-versus-full-family example. Run `python3 experiments/independent_certificates.py` from this directory. It does not rerun the original broad searches or prove an unbounded theorem.

The unrestricted two-triangle restoration conjecture and OCT-five remain **UNPROVED**. Archived candidate wording is historical; use TUZA-03 for the current verification boundary. The repository's Apache-2.0 license and published-source attribution are retained.
