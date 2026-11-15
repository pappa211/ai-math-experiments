# Rainbow matching versus mixed vertex/color cover: primary-literature and structural screen

Status: unresolved by this bounded screen. No primary theorem proving the exact proposed inequality, and no counterexample satisfying all its hypotheses, was located. This is not a claim of novelty or a claim that the literature has no such result. No finite search was duplicated: the independent ν_r=2 SAT work belongs to fresh_critic.

Original mission clock remains start 2026-11-15T01:53:58Z, research cutoff09:23:58Z, hard deadline09:53:58Z. All source retention and text/page inspection occurred locally on Darwin. Ordinary AI source/structural review only; no Lean, solver, or graph enumeration.

## Exact proposed gate

Let F be a finite simple triangle-free graph with a proper edge coloring c:E(F)→C, every color class having size at most two. A rainbow matching is a vertex-disjoint set of edges with distinct colors; write ν_r(F) for its maximum size. A mixed cover is a pair (X,D), X⊆V(F), D⊆C, such that every edge either meets X or has its color in D. Its cost is |X|+|D| and its minimum is τ_mix(F).

The unproved target is

    τ_mix(F) ≤ 2ν_r(F).

Equivalently, form the linear 3-uniform hypergraph with vertices V(F) disjoint union C and triples {u,v,c(uv)}. Its matching and vertex-cover numbers are precisely ν_r and τ_mix. The color part meets each triple once and every color vertex has degree at most two. This is a (2,1)-partite representation, not automatically a 3-partite representation. Simplicity and proper coloring ensure linearity.

Two exact cover formulas useful for distinguishing the dual from a matching bound are

    τ_mix(F)=min_(D⊆C) [|D|+τ_v(F with all D-colored edges deleted)]
             =min_(X⊆V(F)) [|X|+number of colors present in F−X],

where τ_v denotes ordinary graph vertex-cover number. No fractional relaxation is being substituted for either side.

## What is already immediate

If F is bipartite, the desired statement follows elementarily under the size-two-color hypothesis. Take a maximum ordinary matching of size μ(F). It contains at least ceil(μ(F)/2) different colors, so selecting one edge of each color gives ν_r≥μ(F)/2. König's theorem gives τ_mix≤τ_v(F)=μ(F)≤2ν_r. No 3-partite Ryser machinery is necessary for this special case. Ryser's 3-partite theorem also covers bipartite F without the size-two restriction.

The properly 3-edge-colored K4 is a genuine counterexample after dropping triangle-freeness: each opposite pair has one color, ν_r=1 and τ_mix=3. Two vertices leave the edge on the other two vertices uncovered; a vertex and one color cover at most four of the six edges; two colors cover four edges. All three colors form a cover. This control belongs outside the target hypothesis.

Minimum-degree rainbow bounds cannot by themselves replace the desired duality. For instance, arbitrarily many disjoint cycles keep the minimum degree fixed while their mixed-cover requirement grows. The exact mixed-cover formula must be related to the rainbow matching number, not just to local degree.

## Primary results inspected and their limits

1. Timothy D. LeSaulnier, Christopher Stocker, Paul S. Wenger and Douglas B. West, [*Rainbow Matching in Edge-Colored Graphs*](https://dwest.web.illinois.edu/pubs/rainmat.pdf), author PDF dated26January2010, Theorem1.2(b). It guarantees a rainbow matching of size at least ceil(δ_c/2) for triangle-free edge-colored graphs, where δ_c is minimum color degree. It does not state the mixed vertex/color cover inequality. The theorem and proof were inspected.

2. Guanghui Wang, [*Rainbow matchings in properly edge colored graphs*](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v18i1p162/pdf/), Electronic Journal of Combinatorics18(2011),P162. Its triangle-free result gives a rainbow matching of size at least floor(2δ/3). The inspected statement is a degree bound, not a mixed-cover duality; no implication to the target is claimed.

3. Penny Haxell, Lothar Narins and Tibor Szabó, [*Extremal Hypergraphs for Ryser's Conjecture*](https://page.mi.fu-berlin.de/szabo/PDF/ryser.pdf), author version18March2018. Theorem2.2 and Section3, especially Proposition3.2, give a primary reconstruction of Aharoni's 3-partite theorem and identify the exact use of bipartiteness. The matching-complex bound is η(M(J))≥μ(J)/2; König then replaces μ(J) by τ_v(J) for a bipartite link. This replacement is not valid for all triangle-free links: C5 has τ_v=3 and μ=2. The paper's later CP-decomposition characterization is explicitly restricted to bipartite graphs. Its conclusions do not establish the proposed gate.

The original Aharoni theorem is *Ryser's conjecture for tripartite 3-graphs*, Combinatorica21(2001),1–4, DOI10.1007/s004930170001. The full original article was not independently read in this screen; the retained primary Haxell–Narins–Szabó proof was used for the precise boundary above.

Searches also returned work on full rainbow matchings from large color classes, globally bounded colorings under high minimum degree, rainbow matching covers, approximation and kernels, and generalized Tuza inequalities. No matching lower bound from those search results was promoted to the mixed-cover claim. Uninspected leads do not count as supporting evidence.

## A precise conditional topological route, not a proved lemma

The natural missing inequality in the Ryser-style route is a cover-sensitive connectivity estimate for each color-induced subgraph F[S]. A sufficient stronger input would be

    η(M(J)) ≥ τ_v(J)/2       for every triangle-free graph J,

together with the general deficiency form of topological Hall for the color partition of a matching complex. Neither the displayed estimate nor its truth was established or found in the primary sources inspected here. It must not be imported as a known theorem.

Why such an estimate would be relevant: the cover formula gives

    τ_v(F[S]) ≥ τ_mix(F)−|C\S|.

The standard rainbow deficiency mechanism would compare the connectivity of some M(F[S]) to ν_r(F)−|C\S|. Combining these two bounds would give τ_mix≤2ν_r. This describes a specific missing bridge; it is not evidence that the bridge holds. The displayed stronger estimate would not even need the size-two-color condition, emphasizing that it may be substantially harder than the assigned lemma. Without triangle-freeness it fails for K4: its matching complex is three disjoint intervals, so η=1 while τ_v(K4)/2=3/2.

A purely graph-theoretic stronger candidate τ_v(F)≤2ν_r(F) under the target hypotheses would also suffice. This screen did not prove it, refute it, or find it stated. The mixed-cover lemma should not be replaced by that stronger assertion without evidence.

## Exact actual-graph consequence independently reconstructed

Suppose an actual finite simple graph G has an edge set R such that every edge of R lies in at most two actual triangles and every actual triangle of G contains exactly one edge of R. Call the other graph edges black. Form F with one vertex for each black edge of G. Each actual triangle produces an F-edge between its two black edges, colored by its red edge.

Two graph edges determine at most one actual triangle, so F is simple. Two distinct actual triangles cannot share two graph edges, so each color class is a matching. Its size is at most two by the red codegree hypothesis.

F is automatically triangle-free. A triangle of F would give three black graph edges pairwise lying together in actual triangles, hence pairwise adjacent as graph edges. Three distinct pairwise adjacent graph edges either form a graph triangle or share a common center. In the first case they form an all-black actual triangle, contrary to the exactly-one-red hypothesis. In the second case their three other endpoints are pairwise joined by the three red completing edges, producing an all-red actual triangle, again a contradiction.

Actual triangle packings of G are therefore exactly rainbow matchings of F: disjointness in the black resources is graph matching, and disjointness in the red resources is color distinctness. Actual triangle covers are exactly mixed covers after ignoring graph edges in no triangle. Consequently

    ν(G)=ν_r(F),      τ(G)=τ_mix(F).

Thus a positive answer to the proposed lemma proves Tuza for this precisely stated actual-graph class. It does not show that such a set R exists in an arbitrary graph or a minimal Tuza violation. That global availability remains a separate unproved gate.

## Evidence and decision

Primary PDFs, text extractions, and the two decisive Ryser-proof page renders are retained in `sources/rainbow_mixed_cover/`. Exact URLs/hashes and access timestamps are in `evidence/rainbow_mixed_cover/source_receipts.json`. Targeted queries and reviewed scopes are recorded separately.

Decision: no literature-based closure or admissible counterexample was obtained. Preserve the elementary bipartite case, the exact actual-graph reduction, and the explicit topological gap. Return the unrestricted triangle-free mixed-cover question to the structural/finite lane without claiming it is known true, known false, novel, or resolved by existing rainbow degree bounds.
