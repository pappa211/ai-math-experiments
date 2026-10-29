# Triangle Restoration and Packing–Covering Stability in Tuza’s Conjecture

**Canonical mathematical paper for TUZA-01–03.** This paper integrates the complete selected mathematical proofs; the three experiment archives remain the historical research record.

**[Read the full paper](main.md) · [Inspect the PDF](main.pdf) · [LaTeX source](main.tex) · [BibTeX bibliography](references.bib)**

The paper proves the one-triangle criterion, OCT-four and the fixed-$c<5/2$ density consequence; selected two-triangle restoration theorems; closed-boundary equality deletion, packing loss and stability; the qualified four-spoke consequence; and exact parameterized compression. Its [proof coverage map](PROOF_COVERAGE.md) identifies the original sources and formal status.

**Unrestricted two-triangle restoration, OCT-five, and the fixed-$c<3$ density extension remain unproved.** The endpoint $c=5/2$, a uniform density threshold there, unrestricted stable slack-one remainders, and general iterative descent are not established.

Selected deductions have conditional Lean verification with explicit published Aharoni and HNS inputs and, where applicable, classical bipartite König. The inherited HNS interface includes the graphical conversion used in TUZA-01; it has not been independently discharged in Lean. Flat restoration, the three star cores, mixed/shared-apex bowties, qualified four-spoke descent, compression and the density argument have audited ordinary proofs without full Lean formalization. A standard-axiom report does not discharge theorem parameters.

[Editorial review and checks](EDITORIAL_REVIEW.md) record the completed internal reviews. [Checksums](CHECKSUMS.sha256) identify the delivered source and rendering files.

The bibliography distinguishes published inputs from this project’s deductions. Neither external specialist peer review nor established historical originality is claimed.

The single compiled PDF in this directory is an authorized scholarly-paper exception to the text-only historical research archives. The original archive policy and files remain unchanged.

## Build and inspect

Requirements: Python 3, Tectonic **0.17.0**, and Pandoc **3.13**. The supplied PDF was compiled with these versions. A first Tectonic run downloads its public TeX support files; no Lean or Mathlib installation is needed to build this paper.

From this directory:

~~~sh
python3 build.py
~~~

This writes `build/main.pdf`, `build/main.md`, the TeX log, compiled numbering and bibliography. To use explicit executables or a different output directory:

~~~sh
python3 build.py --tectonic /path/to/tectonic --pandoc /path/to/pandoc --output-dir /path/to/output
~~~

`main.tex` and `references.bib` are canonical. The Markdown is derived by [render_markdown.py](render_markdown.py) using the compiled theorem/equation references and BibTeX bibliography; it is not a separate abbreviated manuscript. Keep the checked-in PDF and Markdown synchronized with the sources after an edit. Build intermediates and dependency caches are excluded.

## Archives and evidence

- [TUZA-01](../../problems/TUZA-01/README.md): original LaTeX manuscript, one-triangle and OCT Lean sources, complete density adaptation and reproduction scope.
- [TUZA-02](../../problems/TUZA-02/README.md): essential-edge, flat and star-core proofs, counterexamples and exact certificates.
- [TUZA-03](../../problems/TUZA-03/README.md): earlier consolidated manuscript, theorem inventory, mathematical audit, Lean package and publication provenance.
- [Lean verification boundary](../../problems/TUZA-03/LEAN_VERIFICATION.md) and [reproduction instructions](../../problems/TUZA-03/reproduction/README.md).

[Source provenance](SOURCE_PROVENANCE.json) pins the public archive snapshot and records source hashes and the narrowly changed navigation files. The frozen publication manifest under TUZA-03 remains a record of its original package, including its original landing-page hashes and preparation-stage wording. The root `FILES.sha256` is refreshed only for the two editorially updated landing pages; the historical inventory remains available at the pinned baseline. No mathematical source, Lean file, verification result or computational certificate in an archive is rewritten.

The prior publication checks reported in the paper are archived checks, not new computations conducted for this editorial mission. The publication checks concern proof completeness, statement fidelity, bibliography, compilation, rendering, source preservation and privacy.

Newly authored material retains the repository’s [Apache-2.0 license](../../LICENSE); published mathematical attribution and [third-party notices](../../THIRD_PARTY_NOTICES.md) remain applicable.
