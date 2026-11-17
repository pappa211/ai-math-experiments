> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent critic: one-edge separators and the residual core

**PASS for the supplied conditional transfer and decomposition proofs.** Reviewed `notes/residual_edge_separator_core.md`, SHA-256 `bcd4a1d9560d9e5132b37b5afa766f149fbd2eeb227c51cf3f87817756ea3c0c`. The exact proper-subgraph-CS premise is essential. The result isolates a class of cores and supplies a removable *triangle-support* region when a separator exists; it is not a universal availability or restoration-safe replacement theorem.

## Exact one-edge transfer

For edge-subgraphs A,B sharing precisely vertices u,v and edge f=uv, every triangle of their union lies wholly on one side. No triangle can cross the exclusive vertex sets because its cross edge would belong to neither side. Set p_A=nu(A),q_A=nu(A-f), and similarly for B. After deleting f the triangle families use disjoint graph edges, so nu(H-f)=q_A+q_B. Combining one full-side packing with the other side's f-avoiding packing gives the two lower bounds q_A+p_B and p_A+q_B.

Resilience of H at f therefore forces p_A=q_A and p_B=q_B. Consequently nu(H)=p_A+p_B. For another edge e of A, a maximum B packing avoiding f can be appended to an A-e maximum packing, while partitioning any H-e packing by sides gives the reverse bound. Hence nu(H-e)=nu(A-e)+p_B; resilience of H forces resilience of A. The same argument applies to B. This proves side resilience rather than assuming it descends.

A cover of H restricts to covers on both sides, and the only doubly counted edge can be f. Therefore its size is at least tau(A)+tau(B)-1. A union of minimum side covers has size at most tau(A)+tau(B). The lower value is possible exactly when both restrictions are minimum covers and contain f. Conversely any such pair attains that value. Integrality leaves precisely the asserted epsilon formula, and delta(H)=delta(A)+delta(B)+epsilon follows algebraically.

## Separators of the actual support

Deleting triangle-free background edges leaves all actual triangles, all packing/cover parameters, and supported-edge resilience unchanged. Let S denote that support. Every triangle is contained in an ordinary block; a path of shared-edge triangles cannot move between blocks. Since all S edges are triangular and the triangle family is shared-edge connected, S is connected and has no cut vertex.

If a two-vertex separator {u,v} lacked uv, a partition of the components of S-{u,v} would split the triangle family into nonempty sides sharing no edge. This contradicts triangle connectivity, so uv is present. Include uv in both sides. Every other side edge remains triangular on its own side: a triangle containing an exclusive vertex cannot use an exclusive vertex from another component. Triangle connectivity also forces uv to occur in triangles on each side and ensures every side triangle can reach a triangle through uv without leaving its side. Thus both sides have nonempty shared-edge-connected support and satisfy exactly the one-edge transfer hypotheses.

This reasoning is on the actual triangle support. It does not imply that the full graph, including background edges, has the same vertex separator.

## Defect-one induction and descent

Proper-edge-subgraph CS gives nonnegative defects for both proper sides. Their integer defects satisfy

    1 = delta(A) + delta(B) + epsilon.

If both defects vanish, epsilon=1. Each side is tight, so proper-subgraph CS makes it B. Because each side has one connected nonempty triangle component and every edge is supported, each is one literal K4 or K5. The shared vertices/edge are exactly the prescribed interface, so this is a genuine fresh edge-gluing of two cliques.

Otherwise one side has defect one, the other defect zero, and epsilon=0. The tight side is a literal K4 or K5. Every edge of such a clique belongs to some minimum cover. Hence f is minimum-cover-ineligible on the defect-one side. Removing the tight side's private vertices from S leaves exactly that defect-one side. It remains connected, single-edge resilient, and inherits the proper-subgraph-CS premise, since any proper edge-subgraph of it is also proper in the preceding S. The reverse operation adds wholly fresh clique vertices along one old edge and preserves defect one through the exact transfer.

Each removal strictly decreases supported edges and vertices, so iteration terminates. Reaching the two-tight-sides case gives an entirely fresh edge-gluing construction on reversal. Otherwise the terminal support has no two-vertex separator and already has no cut vertex. It has at least four vertices: nonempty triangle support excludes smaller orders except K3, and K3 is not one-edge packing-resilient. It is therefore three-vertex-connected under the usual definition. No bound on the number or size of these terminal cores follows.

For an actual minimum-edge CS triangle residual, the required proper-subgraph-CS premise holds because every graph used has fewer edges than the original minimum failure. The archived fresh-edge restoration theorem excludes the all-fresh-edge outcome at its exact scope. This implication does not assume CS for an arbitrary graph outside that smaller-graph premise.

## Named cores and inherited properties

Every supported edge of W5 and K5-e is minimum-cover-eligible, as independently checked in `critic_wheel.md`. Neither can be the starting point of a nonempty sequence of the neutral attachments above, since the first interface would need to be ineligible. Thus if either occurs as terminal core, the original support is exactly that core; the strict-restoration results exclude the corresponding actual residuals.

The triangle-extension property passes to each retained side. Given a maximum whole packing containing a prescribed triangle on that side, exact packing additivity forces its restrictions to be maximum on both sides. The retained restriction still contains the prescribed triangle. Iteration therefore preserves this property. No analogous argument here transfers the no-two-edge-B-deletion condition, and the frozen note correctly avoids asserting one.

The resulting necessary core profile is three-vertex connectivity, connected actual triangle support, defect one, one-edge resilience, triangle extensibility when present initially, and the inherited proper-subgraph-CS premise. It remains a conditional profile, not a classification or an availability theorem for degree-three vertices or any particular replacement.

## Background and historical boundaries

A peeled clique is an actual region of the *supported graph*. Background edges may connect its private vertices to the retained support or to other peeled pieces; after later restoration some may become triangular. The decomposition therefore does not authorize discarding those edges or replacing the full restoration boundary by just uv. That compatibility problem remains separate and is explicitly retained in the frozen note.

I directly inspected section 5 of `sources/root_sep_public/0_PROOFS_AND_OBSTRUCTIONS.md` (SHA-256 `dee0a68245caa047a5f14cc3d1ba743320ef4d0e9f82c7bb0d379782ad3573fd`, selected public HEAD `4b72b6d5b4f71fcefa3f0314483bf58ce809d7b4`). The prior SEP theorem allows edge-subgraphs sharing exactly one edge, potentially more vertices, provided every actual triangle belongs to a side and the shared edge is triangular on each. It assumes Tuza for each side and its edge-deleted graph, plus B for each tight side. It concludes strictness of the union and excludes edge-articulation nodes in the edge/triangle incidence graph of a minimum combined obstruction. Its proof separately handles both sides losing packing after deleting the interface, and the case where an interface-avoiding maximum exists on one side.

The current note studies a different output at a narrower interface: a resilient *defect-one residual* with a two-vertex support separator. It obtains exact packing/cover identities, side resilience, a tight-clique versus neutral-attachment case split, and descent to a three-connected core. The prior strictness conclusion alone is consistent with defect one and does not state this exact core decomposition. Nevertheless the local separator accounting and clique-cover saving are established prior machinery, so they must not be presented as newly discovered SEP. The source publication annotation records a later VERIFIED_AS_FROZEN audit; that audit was not freshly replayed here. This is a precise scope comparison, not a claim that no other archived or published theorem contains the current refinement.

This is an ordinary independent in-session reconstruction, not Lean verification, external peer review, or a solution of unrestricted Tuza/CS. The main unresolved issue is controlling the surviving core or replacing it while preserving all actual background/boundary responses.
