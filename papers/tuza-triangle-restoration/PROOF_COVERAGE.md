# Complete-proof coverage

The canonical manuscript contains the full selected proofs. This index records their source and verification boundary; it does not substitute for a proof.

| Canonical location | Result | Formal status | Preserved proof content and source |
|---|---|---|---|
| [2.1](main.md#thm-main) | One-triangle criterion | Conditional Lean | Complete HNS extraction, graphical conversion, compatible packing and cover argument. [Archived source](../../problems/TUZA-01/manuscript/TuzaTriangleDeletion.tex) |
| [4.3](main.md#cor-oct) | OCT-four | Conditional Lean | Complete coloring and all small-transversal cases. [Archived source](../../problems/TUZA-01/manuscript/TuzaTriangleDeletion.tex) |
| [6.1](main.md#thm-exact) | Exact-equality two-triangle restoration | Conditional Lean | Disjoint and bowtie mixed-family cover cases. [Archived source](../../problems/TUZA-03/CONSOLIDATED_MANUSCRIPT.md) |
| [7.2](main.md#thm-essential) | Essential-edge restoration and family saving | Conditional Lean | Free page, Hall classification, apex-edge forcing and compatible packing. [Archived source](../../problems/TUZA-03/CONSOLIDATED_MANUSCRIPT.md) |
| [8.1](main.md#prop-component) | Unique defective component | Audited ordinary proof | Additivity, nonnegative integer slacks and equality exhaustion. [Archived source](../../problems/TUZA-02/research/proof/STRUCTURAL_REDUCTION.md) |
| [9.1](main.md#thm-flat) | Flat-remainder restoration | Audited ordinary proof | HKT flat input, five-wheel augmentation, book and equality cases. [Archived source](../../problems/TUZA-03/CONSOLIDATED_MANUSCRIPT.md) |
| [10.1](main.md#thm-star) | Three nonflat star cores | Audited ordinary proof | Fresh-leaf construction, parameters, two-edge avoidance and all terminal-intersection cases. [Archived source](../../problems/TUZA-02/research/proof/K4_STAR_DEFECTS.md) |
| [11.1](main.md#thm-boundary) | Closed-boundary deletion and packing loss | Conditional Lean | Compatible equality faces, row integrality via König, essentiality and floor bound. [Archived source](../../problems/TUZA-03/CONSOLIDATED_MANUSCRIPT.md) |
| [11.2](main.md#thm-stability) | Companion stability | Conditional Lean | Full lost family, equality extraction and packing contradiction. [Archived source](../../problems/TUZA-03/CONSOLIDATED_MANUSCRIPT.md) |
| [11.3](main.md#cor-descent) | Qualified four-spoke consequence | Audited ordinary proof | Complete accepted corollary with explicit five-active-spoke premise; no iteration. [Archived source](../../problems/TUZA-03/MATHEMATICAL_AUDIT.md) |
| [12.2](main.md#thm-bowtie) | Exact mixed/shared-apex bowties | Audited ordinary proof | All witness lists, cross-apex matching, numbered C9 lemma and open-wedge cases. [Archived source](../../problems/TUZA-03/CONSOLIDATED_MANUSCRIPT.md) |
| [13.1](main.md#thm-compression) | Exact simultaneous compression | Audited ordinary proof | All four optima, seven-representative argument, old-triangle preservation and bound. [Archived source](../../problems/TUZA-03/CONSOLIDATED_MANUSCRIPT.md) |
| [Section 14](main.md#sec-density) | Fixed-c<5/2 density consequence | Audited ordinary proof | Complete three-regime adaptation, constants, witness counts and threshold dependence. [Archived source](../../problems/TUZA-01/manuscript/TuzaTriangleDeletion.tex) |

The conditional Lean rows retain explicit external inputs: Aharoni, graphical HNS, and where applicable classical bipartite König. HNS includes an inherited graphical conversion not independently discharged in Lean. The nine-cycle lemma uses the published Strong Perfect Graph Theorem; the flat proof uses the nonplanar flat-graph theorem of Haxell–Kostochka–Thomassé. No new formalization was undertaken for this integration.

Unrestricted two-triangle restoration, OCT-five, fixed-c<3 density, the c=5/2 endpoint and general iterative descent remain outside the proved scope. The original archives, including unsuccessful approaches and reproduction evidence, remain intact apart from the explicitly updated TUZA-02/03 landing pages.
