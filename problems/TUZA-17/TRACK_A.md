# Track A — critical-core mechanisms and boundary follow-up

The codegree rescue fails even after adding high connectivity and the known one/two-triangle packing-extension property. A precise critical packing-conflict lemma distinguishes these examples from actual minimal counterexamples. Later auxiliary work refuted a supported-link slack rule and supplied graph-specific link lemmas used in the scoped AC budget-six theorem. None of this resolves unrestricted Tuza or proves that a suitable apex/decomposition occurs in every minimal counterexample.

This scout inherited the coordinator context. Follow-up passes are the same agent, not independent contexts. Separate-source verification by this scout is distinguished from the mission's fresh internal critic. Independent final verification remains NOT_RUN; no Lean proof was attempted.

## Initial proposals and their disposition

The complete initial record is notes/A_INITIAL.md.

1. **Minimum triangle codegree rescues prescribed colour deletion.** Immediately challenged with the authorized I_q join B[t] seed. Exact clone-colouring analysis refutes the rule for every fixed codegree threshold.
2. **Small-separator gluing.** A valid edge-adhesion transfer was reconstructed, then found already in TUZA-11 (and the two-vertex case in Krivelevich1995). A common-triangle transfer was independently proved, implying4-connectivity of a minimal counterexample; the coordinator found that conclusion in Freitas2014. These are attributed reconstructions, not new global progress.
3. **Stronger relaxed-condition obstruction.** Rather than raise a failed threshold, prove that the colour-deletion obstruction survives arbitrarily high connectivity and every prescribed one/two-triangle extension. This succeeded by an explicit matching-completion construction, while identifying exactly which true critical identities fail.
4. **Critical apex nonsaturation.** Derive a mandatory old/new packing conflict from actual deletion resilience and an ordinary graph matching blocker. This succeeded as a necessary structural implication, with no cover-saving operation or availability theorem.

## Exact strengthened obstruction

Choose connected triangle-free B0 with chi(B0)>r>=2, let B=B0 Cartesian-product K2, and G=I_q join B[t], where t>=2q+8. For m_r(B0), the minimum number of monochromatic B0 edges in an r-colouring, the minimum monochromatic rim cost is exactly

    2t^2 m_r(B0).

This includes arbitrary mixed colours among twins: choosing a random representative from each class proves the t^2 lower bound, and a uniform lift attains it. The two layers give the factor2, with a colour derangement removing monochromatic identity edges.

All actual triangles have one apex and one rim edge. Rim triangle codegree is q; spoke codegree is t deg_B(v). Cyclic matchings along the blown-up identity edges give

    nu(G)=q|B|t/2.

Every prescribed packing of at most two triangles extends to that optimum. The complete proof constructs edge-disjoint rim perfect matchings apex by apex, adds fresh opposite-layer companions to prescribed within-layer edges, reserves future prescribed edges, and completes balanced identity pairs with a direct Hall argument. Thus this is an unbounded theorem, not extrapolation from finite checks.

The graph has one shared-edge triangle component and vertex connectivity at least q when |B|t>=q. However

    tau(G)<=q(|B|-1)t=2nu(G)-qt,
    nu(G-e)=nu(G)-1 for EVERY spoke e.

It therefore fails the actual violation premise and one/two-edge deletion resilience. Every triangle-deletion residual has packing nu(G)-1 and slack at least qt-2, so it also fails the required residual tightness when qt>2. These failures are explicit; the family is never represented as a true critical graph.

For r=4, use B0=M(M(C5)), with23vertices and chromatic number5, q=4,t=93. The resulting G has4282vertices, minimum triangle codegree4, connectivity at least4, and the one/two-triangle extension property, but

    monochromatic rim cost>=17298>17112=2nu(G).

It has nu(G)=8556 and an explicit cover of size16740. The large graph's5,708,340 actual triangles are classified symbolically, not claimed to have been enumerated. Full proofs and the Mycielski construction are in notes/A_RESULTS.md. Originality is UNESTABLISHED; the stronger combined limitation is a mission result, not a claimed literature first.

## Critical apex nonsaturation

For an ACTUAL edge-minimal Tuza counterexample G and every nonisolated vertex v, let H=G-v and L=G[N(v)]. Then

    nu(G)<=nu(H)+mu(L)-1.

For every maximum ordinary L matching M,

    nu(H-M)<=nu(H)-1,

where M denotes deleted EDGES. Thus every maximum link matching meets every maximum old triangle packing.

The proof uses known critical preservation under deletion of one/two graph edges. Every ordinary graph with an edge has a one/two-VERTEX matching blocker; deleting the corresponding one/two spokes bounds the remaining triangle packing by nu(H)+mu(L)-1. The blocker has a complete elementary proof reconstructed from Schrijver's attributed exposition, so the final statement is PROVED_ORDINARY. An earlier Tutte–Berge proof is retained as an alternative, not hidden or relabelled. See notes/A_CRITICAL_NONSATURATION.md and notes/A_ELEMENTARY_MATCHING_BLOCKER.md.

This condition excludes the saturated blow-ups above, but K4 and K5 also satisfy strict nonsaturation without violating Tuza. No theorem forces a contradictory saturated apex in a critical graph. The graph-specific link/matching dictionary is substantive, while the final global existence step remains absent.

## Supported-link slack auxiliary assertion — refuted

At the coordinator's request, notes/A_SLS_PROPOSAL.md froze the stronger intermediate assertion that some minimum H cover C satisfies vc(L_old-C)<=D(H), where L_old comprises link edges belonging to old triangles. Such a theorem would imply AC by separately paying for unsupported link edges from the apex gain.

The six-vertex wheel H=W5, with its five rim vertices as X, refutes this exact assertion. An explicit rainbow edge colouring is supplied. Every link edge supports an old triangle, but

    nu(H)=2, tau(H)=3, D(H)=1, lambda_old=2.

There are exactly ten minimum H covers, each containing at most one rim edge. Every H edge is packing-stable. Hence SLS already fails in stable slack-one examples. Adding a second apex gives nu(G)=4,tau(G)=5, and a minimum H cover has compatibility cost5<=8; AC is NOT refuted. The example shows that supported interactions can need apex gain, and that D cannot be assigned to them in isolation. Full proof and exact all-cover certificate are in notes/A_SLS_RESULT.md and evidence/a_sls_w5.json. No patched SLS conjecture was introduced.

## Owner-directed boundary follow-up

The full evolving record is notes/BOUNDARY_A.md; notes/BOUNDARY6_FROZEN_LINK_LEMMA.md freezes the decisive later proof for criticism. Raw link parameters and a full eligible H,X realization are explicitly distinguished.

Two exact ordinary link lemmas were proved:

- Triangle-free mu=4,vc=6 means precisely two C5 components plusisolates.
- Triangle-free mu=5,vc=7 has the complete essential-vertex/factor-critical classification in the note, has at most one edge in the intersection of all maximum matchings, and always has a cover-critical edge that belongs to some maximum matching.

The last assertion includes a new self-contained eleven-vertex argument: with alpha=4, classify outside vertices by their neighbourhood in a maximum independent4-set. Triangle-freeness confines their edges to three complementary pairs of2-subset classes. A parity/counting argument either creates an independent5-set or exhibits an edge whose deletion creates one. No graph census is used.

Together with the coordinator's independently checked tight-frontier intersection lemma and the declared Aharoni/HNS equality inputs, these lemmas prove AC for b=2nu(G)-tau(H)<=6. This restricted theorem was accepted by the fresh internal critic in notes/CRITIC_BUDGET_SIX.md; this remains internal AI review, not separately commissioned final verification. This is not a claim that eligible raw parameter instances at the earlier boundaries cannot exist. No full low-budget boundary embedding was constructed by this scout. The next numerical obstruction window and its realizability obligations are recorded in the boundary note; finite survival is never an ADVANCE verdict by itself.

## Actual computation and verification

- checks/a_constructive_checks.py produced116 exact maximum-packing completions on three finite strengthened-family controls and checked59,049 mixed-clone colour-count vectors. Runtime about0.08s; peak RSS about17.6MB.
- checks/a_verify.py separately reconstructed ALL14,640 actual triangles across the three controls and checked all116 packing certificates, plus the23-vertex seed and large-example arithmetic. Runtime about0.51s; peak RSS about24.1MB. The verifier has a different source but the same AI author.
- checks/a_sls_w5.py independently enumerated all actual triangles, all minimum H covers, exact H/G packings and covers, residual vertex covers, and ten edge-deletion packing certificates for the six-vertex SLS witness. A20s CPU/alarm bound and30s/256MiB sampled-RSS watchdog were applied; completion was normal in about0.21s wall time.

The first two scripts applied60s CPU/alarm limits. Darwin rejected their attempted1536MiB RLIMIT_AS; the producer records NOT_AVAILABLE. Observed memory is reported separately, and no OS-enforced memory cap is falsely claimed. These were lightweight computations; no solver was installed and no heavy concurrent search was launched by this scout. Exact versions, timings and evidence are in evidence/a_*.json. All owned computations finished normally; no scout job remains running.

## Global relevance and decision

The strengthened family rigorously excludes colour repair based only on the listed relaxed conditions. Actual deletion resilience does supply a meaningful further interaction constraint, but the nonsaturation lemma does not provide a repair. The small-separator route has a known conclusion and unsupported global availability. The boundary link lemmas support the precise scoped AC theorem, not an unrestricted solution or an iterative apex architecture.

A full global route would still need a graph-specific theorem forcing an eligible apex/decomposition or a counterexample-preserving operation in every actual minimal Tuza counterexample. No such availability theorem is supported here. Stating that every critical graph has the desired operation would merely name the missing problem. The exact next scoped AC question may be justified by the final boundary reduction, but a longer unrestricted campaign is not justified by finite tests, high-connectivity examples, or these necessary conditions alone. Historical originality remains unestablished; separately commissioned final verification is NOT_RUN.

### Subsequent boundary-seven discriminator

The frozen two-link probe and complete ordinary arguments are in notes/BOUNDARY7_PROBE.md. Triangle-free links with matching6 and cover9 are exactly3C5 plusisolates, or a13-vertex factor-critical triangle-free component with independence4 plusisolates. Their maximum-matching intersection is empty. A general criterion proves AC in the first-frontier regime whenever some maximum matching deletes enough link edges to leave a vertex cover within budget.

The explicit circulant C13 with steps plus/minus1,plus/minus5 passes that criterion at b=7: the six-set {0,1,3,4,7,10} induces just the two edges01,34, and these extend to a displayed maximum matching. A self-contained cyclic-gap proof verifies independence4 and cover9. The3C5 branch also passes. The exact two-link subset probe took about0.067s and stopped normally under45s CPU/alarm and50s/384MiB sampled-RSS watchdog bounds. Evidence is evidence/a_boundary_link_probe.json; no broad graph census or full H boundary search was performed.

Catalogue completeness for the13-vertex class is a separate declared external input authenticated by the coordinator and accepted within the scope of notes/CRITIC_CATALOGUE_SCOPE.md; it was not recomputed by this scout. Together with that completeness input, the ordinary classification and explicit C13 result settle the budget7,cover9 branch. The first remaining conditional numerical branch is b=7,m=6,lambda=vc(L)=8. Full eligible raw-boundary realizability remains UNKNOWN. No further budget ladder is assumed or silently promoted.

## Track A final handoff

All Track A proof development and computations are stopped. The coordinator retains the active mission for report compilation, source-integrity checks and private checkpoint. The exact all-budget<=6 theorem and the separately catalogue-backed budget7,cover9 branch have passed fresh internal AI criticism at their declared scopes. Literal AC remains unresolved, and no full eligible H,X instance at the remaining boundary was supplied by this scout. Independent_final_verification remains NOT_RUN. Hashes of the final Track A files are recorded in evidence/a_final_manifest.json.
