> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Ordinary completion of the at-most-four-branch closed-link exclusion

Frozen 2026-11-16 for fresh pre-cutoff review. No finite WKE table or certificate interface is a premise of this replacement proof. The earlier finite/declared-input proof remains preserved separately.

## The remaining two-disjoint-doubles case with no extra even single

Let the doubled pairs be ab and cd, each consisting of a direct edge and an even nondirect path of lengths2t_1,2t_2. All four other branch pairs are present as either direct edges or odd nondirect paths of lengths2s_j+1. Let q be the number of those odd nondirect paths. All interiors have degree two in the closed link.

On each even path choose an alternating t_i-matching saturating one branch endpoint and leaving the other free. On every odd nondirect path match its internal vertices, using s_j edges. Denote the union P0. Choose Q containing all four branches, t_i-1 interior cover vertices on each even path and s_j-1 on each odd path. The residual interior gaps are disjoint edges; branch endpoints cover all path-end gaps. Thus

    |Q|=|P0|+2-q.

If q=4 this is already strict. If q<=3, some single branch pair f is direct. Orient the two even-path matchings to leave precisely the two endpoints of f free, and add f to P0. The resulting P is a matching and Q still covers L-P, with

    |Q|=|P|+1-q.

For q>=2 this is strict and gives a CS contradiction. For q=0 the four branches span an actual K4, handled by the separately proved ORDINARY K4-bearing four-branch theorem.

For q=1 let e be the unique odd nondirect single pair and choose f to be its opposite single pair. This is direct. The tuple is balanced. The four direct branch edges surviving in R=L-P form K4 minus the opposite pairs e,f, hence a C4. Every other R piece is a pendant edge or a disjoint edge, so R is triangle-free. More strongly R has an explicit matching of size |P|: use the complementary alternating matching of each even path, covering its formerly free f endpoint and all its interiors, and the full endpoint-to-endpoint alternating matching of the odd e path. The latter has s_e+1 edges and covers both e endpoints and all its interiors. The four branch vertices are covered exactly once, and the matchings together have size t_1+t_2+s_e+1=|P|. The ordinary triangle-free residual equal-matching exclusion now contradicts the balanced tuple. This handles every q and every allowed thread length.

## Complete ordinary assembly, including triangle-free links

For at most three branch vertices use the accepted ordinary three-branch exclusion. Suppose there are exactly four. Returning-thread and parallel-thread exclusions give the ordinary suppressed-core description: at most one nondirect thread per pair, and a double must be direct plus even. A K4-bearing link is handled by notes/four_branch_k4_link_exclusion_v1.md.

Consider a K4-free link with at least four even nondirect paths. If it contains a triangle, notes/four_branch_many_even_threads_v1.md applies at its exact ordinary scope. If it is TRIANGLE-FREE, use only that note's Section1 endpoint-assignment construction, which does not require a triangle: four even pairs have a spanning unicyclic assignment on all four branch vertices; all other paths are matched internally. It supplies P,Q with |Q|<=|P|. Strictness is immediate if the inequality is strict; in the balanced case S=empty in the ordinary paid-triangle cover-collapse theorem gives |P|<=0, impossible. Thus the triangle-free branch is excluded without the historical5375-state WKE theorem, Kotzig, or any finite certificate.

It remains to consider at most three even nondirect paths, irrespective of triangle presence. The full ordinary apex-pseudoforest theorem forces each branch triple to have at least four core edges counted with multiplicity. The explicit proof in notes/four_branch_after_pseudoforest_boundary_v1.md therefore gives complete underlying K4 and doubled pairs of exactly one of the shapes2K2,K3,P4. For three doubles all other singles are direct or odd. The ordinary triangle-double and path-double proofs exclude K3 and P4, using Q=P+1-q, a residual diamond at q1 and the ordinary K4-bearing theorem at q0.

For two disjoint doubles there is either no extra even single, treated above, or exactly one extra even single, treated in notes/four_branch_two_doubles_extra_even_ordinary_v1.md. The latter constructs a near-perfect P and a bipartite R; bipartite matching-cover equality gives a WKE tuple and the ordinary TF-residual theorem excludes it. This standard matching theorem is explicit; no finite input is used.

These cases exhaust all closed links with at most four branch vertices. Consequently every nonempty closed link in a minimum-CS failure has AT LEAST FIVE branch vertices, by an ordinary all-size proof.

## Dependencies and noncircularity

Current ordinary inputs: three_branch_cs_link_exclusion_v1.md; parallel_thread_link_exclusion_v1.md; four_branch_k4_link_exclusion_v1.md; four_branch_many_even_threads_v1.md (Section1 also for triangle-free links); apex_pseudoforest_full_exclusion_v1.md; four_branch_after_pseudoforest_boundary_v1.md; four_branch_triangle_doubles_ordinary_exclusion_v1.md; four_branch_path_doubles_ordinary_exclusion_v1.md; four_branch_two_doubles_extra_even_ordinary_v1.md; coordinator_TF_residual_equal_matching_exclusion_v1.md; wke_residual_triangle_count_collapse_v1.md.

The apex-pseudoforest assembly uses ordinary boundary, full-C4 and bouquet proofs, not the former four-branch finite theorem. The local WKE residual and paid-cover arguments use actual B residuals and complete footprints, not a four-branch assumption. Thus the chain is noncircular. The old363-record interface and historical5375 WKE table remain retained evidence for the predecessor, but are not premises of this replacement. No unrestricted-CS conclusion, external human review or Lean proof is asserted.
