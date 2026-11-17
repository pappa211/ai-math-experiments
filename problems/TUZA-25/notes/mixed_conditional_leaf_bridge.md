> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Finite interface contract for the critical-triangle leaf branch

Frozen conditional theorem, 2026-11-16. The finite interface below is VERIFIED_FINITE: the residual worker's enumeration was independently regenerated and re-solved by the mixed worker. The ordinary confinement/implication proof is pending fresh-critic review. No novelty claim or unrestricted rigidity claim is made.

Let C consist of the ten fresh-edge defect-one support types from the archived all-size classification (central K4 with one to three star leaves, each K4/K5, up to permutation; or two K5s sharing an edge), together with W5 and K5-minus-an-edge. The ten count is 2+3+4+1. Their support has at most thirteen vertices. Their classification is scoped to the archived fresh-edge family, not all resilient defect-one graphs.

The finite interface predicate is:

> For every R in C and every missing pair e of support vertices, if J=R+e has defect two, every triangle of J lies in a K4, and e is packing-critical, then no actual J triangle has all three edges packing-critical.

All actual triangles and every relevant edge-deletion packing optimum must be checked. Finite timeouts remain UNKNOWN; no partial search certifies this predicate. Isomorphism representatives of the twelve stated models are sufficient because the predicate is invariant under relabeling, but every nonedge of each representative must be considered or excluded by a proved symmetry.

## Completed finite verification

The twelve explicit models have 210 nonedges in total. All 210 were reconstructed and solved to exact nu,tau by two implementations. Four insertions have defect two, all in the double-K4 common-edge model. All four are K4-completed; independently solving every edge deletion shows their only critical edge is the inserted edge. No whole triangle is critical. The other 206 insertions have different defect. No timeout/UNKNOWN occurred.

Author receipt: `evidence/residual_edge_exchange.json`, with model definitions in `evidence/residual_edge_exchange_seeds.json`. Independent receipt: `evidence/mixed_named_interface_verification.json`; independent reproduction: `scripts/mixed_verify_named_interface.py`. The independent script regenerates the twelve graphs and every nonedge rather than using the author's acceptance predicate, then compares exact outcomes after solving them.

Thus the displayed finite predicate is certified on its entire stated universe. The ordinary theorem below is conditional only on its mathematical hypotheses and the recorded finite verification; larger-model availability remains open.

## Why arbitrary background creates no missing cases

Suppose a full graph R has one of these supports but arbitrary nontriangular background, and J=R+e has every triangle in a K4. A new triangle is completed to a K4 containing e. The surviving K4-e diamond has every edge triangular in R, so all its vertices and all its old edges lie in R's literal support. Thus e's endpoints are support vertices and every new page uses only support edges. No background-only vertex or edge contributes a new triangle under the stated K4-completion hypothesis. Therefore the triangle families and all triangle-packing/covering values are exactly those of the finite support insertion R_support+e. Extra background imposes no hidden triangle cases.

## Conditional structural implication

Use the certified finite predicate above. Let J have connected triangle support, every triangle in K4, defect two, a wholly packing-critical triangle A, and the proper-CS premises of the critical-edge addendum. For each e in E(A), that addendum gives R_e=J-e with connected nonempty triangle support, resilient and defect one. If even one R_e has support in C, background confinement places J inside the certified finite interface and contradicts the wholly critical triangle. Hence every R_e must lie outside C.

This converts the zero-gain K4-on-triangle / gain-one K5-on-triangle leaf obstruction into a strictly smaller resilient defect-one support outside the already classified models. If a campaign assumes or proves broad rigidity into frozen F and uses a legitimate strong size induction on the remaining F classification, this is a candidate descent step. It does not itself prove broad rigidity, guarantee a clique decomposition, or complete that induction.

The K5-on-K4 zero-gain branch uses a separate matching deletion. The note `mixed_k4_separator_zero_gain.md` derives a smaller defect-one residual directly from zero gain (no triangle-extension premise), and `mixed_matching_deletion_resilience_frozen.md` proves its resilience under the K4-completion/proper-CS premises. Its reconstruction requires the separately stated wider-class minimality and boundary arguments; it is not an automatic consequence of the finite single-edge interface.
