# Route architectures and final scope

The independent starts are [A_INITIAL](../../../TUZA-16/notes/A_INITIAL.md), [B_INITIAL](../../../TUZA-16/notes/B_INITIAL.md), [C_INITIAL](../../../TUZA-16/notes/C_INITIAL.md). [GATE_1.md](../../../TUZA-16/GATE_1.md) records the early decision before consolidation. This file is the final comparison; it does not overwrite the original discovery chronology.

## A — paid nonlocal colour repair

A4 is a single global maximum-four-cut operation after discarding triangle-free edges. Delete all within-part edges F, certify the residual rainbow triangle-edge colouring by F2² differences, and lift an actual cover as F union C_H. No new triangles arise. An actual G-packing P pays if |F|+|C_H|<=2|P|. This would immediately prove Tuza for every graph; the only missing assertion was universal payment, not existence of a maximum cut. All residual covers and global repackings are allowed.

The exact assertion is refuted by an unbounded cone family. For every fixed number r of vertex colours, high-chromatic triangle-free rims can force at least t² deleted edges while all packings have budget at most bt. For r4, b23,t24 gives a553-vertex witness. Every edge belongs to a triangle, so preliminary stripping does not evade it. These graphs satisfy Tuza; the conclusion is not about hypothetical minimal counterexamples and does not exclude general triangle-edge3-colour repairs. The graph-specific feature is that every actual triangle consumes two apex spokes. Full proof: [A_RESULTS](../../../TUZA-16/notes/A_RESULTS.md).

Final status: **REFUTED_CANDIDATE** for A4; broader A **DEPRIORITIZE**. Positive new compatibility ingredient: none. New mission content: exact universal limitation of the fixed vertex-palette implementation. No new paid operation replaces it in this run.

## B — counterexample-preserving compression

Operation: independent twins X have common neighborhood S; let q=|E(G[S])| and require a proper edge colouring of that rim into X. Delete X and all rim edges to obtain R. The q coloured apex triangles use no residual edge; every destroyed actual triangle uses a rim edge. These two certificates prove exact nu(G)=q+nu(R), tau(G)=q+tau(R). Thus delta(R)=delta(G)+q and |V|+|E| strictly falls. Arbitrary outside attachments are included. Prescribed residual triangles/forbidden residual resources are compatible, while exact forced occupied-edge states are not preserved; the diamond distinguishes them.

If every hypothetical minimal Tuza counterexample had such a move (or a separately proved safe compression), descent would contradict minimality or reach a known terminal class. That existence theorem is unproved. A weaker half-saturation certificate is an instance of Puleo's reducing-set method. Allowing any independent X but deleting its entire rim union still fails the payment test on all K_n minus a nonempty matching, n>=9. The finite ordinary witnesses do not satisfy the premise “minimal Tuza counterexample.” Full proof: [B_RESULTS](../../../TUZA-16/notes/B_RESULTS.md).

Final status: **DEPRIORITIZE**. Exact unbounded-scope scalar transfer is proved, but the architecture has no new global mechanism or plausible existence theorem. Generic Fano-compatible criticality cannot produce the actual independent-twin/edge-colouring structure. No equality/S/E minimality is imported.

## C — amplification against the asymptotic theorem

Operation target: put many edge-disjoint copies of fixed G into N vertices with r=Omega(N²), then keep all actual packings below rnu(G)+o(r). Covers cost at least rtau(G). A positive base delta would yield positive normalized deficit, contradicting the uniform asymptotic theorem. The missing step was the integral packing upper bound for every packing, with the full closure family included.

The stronger limitation handles weighted copies with edge loads<=1: their fractional packings add, so nu(X)>=Mnu*(G)-e(N)N², where e(N)->0 uniformly. Hence dense small-overhead integral replication is impossible when nu*(G)>nu(G), which every hypothetical violation would force. If a global homomorphism to G respects an edge partition into r copies, exact tau(X)=rtau(G) and nu*(X)=rnu*(G) hold. Dense such graphs lose the integral gap; subquadratic edge edits on the same vertex set cannot rescue a positive normalized deficit. Equal blow-ups and non-complete affine partial-slope constructions both fit this theorem.

The precise GF4 partial-slope graph has12 planted K4 copies but a20-packing, refuting unconditional integral replication. Its exact packing optimum is uncomputed (20<=nu<=21); tau=nu*=24. Conditional existence only on hypothetical counterexamples is not called finitely refuted. Full proof and primary quantifiers: [C_FROZEN_PROOF](../../../TUZA-16/notes/C_FROZEN_PROOF.md), with [domain addendum](../../../TUZA-16/notes/C_ADDENDUM.md).

Final status: **DEPRIORITIZE** positive C; exact no-go component **PROVED_USING_PUBLISHED_INPUT**, exact tau/nu* identities **PROVED_ORDINARY** using finite LP duality. No positive construction outside the excluded interfaces was found. The graph-specific deep input is uniform approximation for fixed graph packings, not an arbitrary hypergraph theorem.

## Remaining bridge and next decision

There is no selected winning route. The clearest unresolved single GLOBAL theorem in the reduction direction would assert that every hypothetical minimal counterexample admits a specifically defined counterexample-preserving move. This run supplies no credible such move set, so that statement is not advertised as easier than Tuza.

A separate, smaller discriminator for the broader A architecture is precise: for G=H+z, let L=H[N(z)]. If H is triangle-edge3-colourable and L triangle-free, does some MINIMUM triangle cover C of H satisfy |C|+vc(L-C)<=2nu(G)? Exact apex state identities are proved in A_RESULTS. A proof would be an unbounded scoped extension only, leaving universal structural applicability entirely open. A counterexample with every minimum residual cover too costly would kill this chosen-cover version. Its concrete matching/vertex-cover boundary interface makes it more constrained than unrestricted Tuza; no evidence here shows its global closure is easier.

Recommendation **REDIRECT**. Do not launch a longer unrestricted proof campaign on A4, twin/all-rim compression, or dense copied-obstruction amplification. If new work is separately authorized, first conduct a bounded proof-or-counterexample test of that exact apex minimum-cover compatibility lemma, including old four-port/Clebsch states and dense controls, and require an explicit global closure proposal before any longer campaign. This proposed discriminator is not started by the closeout.
