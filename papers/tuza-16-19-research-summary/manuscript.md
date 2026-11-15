# TUZA-16–19: Global Proof Routes, Structural Reductions, and Obstructions

**AI Math Experiments, 15 November 2026**

## Abstract

TUZA-16–19 produced neither a proof nor a counterexample to unrestricted Tuza. This report organizes their ordinary arguments, finite certificates, formal finite results, and failed mechanisms into a reproducible research guide. The principal positive result is a cover theorem for a specified maximum triangle packing whose triangles share one vertex, with the cover confined to the original packing support and its original private $K_4$ completions. A four-branch weak König–Egerváry theorem gives a defect-preserving reduction to a subgraph of the heavy-edge five-core. Classical incidence amplification yields quantitative equivalences with highly normalized graphs, while an odd-cover obstruction shows that a stronger parity target fails even on that normalized class. Precise counterexamples separate these results from the missing global compatibility step. Finite Lean certificates verify a six-vertex witness and a 5,375-case kernel; they do not formalize the common-vertex theorem, the all-size core reduction, or unrestricted Tuza.

This is AI-developed mathematical research with internal AI review and tool verification. The owner supplied objectives, budgets, coordination, and authorization. No human mathematical authorship, external peer review, independently attested serving-model identity, or historical priority is claimed.

## 1. The problem and the inherited baseline

A triangle packing is a collection of triangles that do not share graph edges. They may share vertices. A triangle edge cover is a set of graph edges meeting every triangle. Write $\nu(G)$ for the largest packing and $\tau(G)$ for the smallest cover. Each packed triangle needs a distinct cover edge, so $\nu(G)\le\tau(G)$. Taking all three edges of a maximal packing gives $\tau(G)\le3\nu(G)$. Tuza's conjecture asks whether the stronger inequality

$$\tau(G)\le2\nu(G)$$

holds for every finite simple graph. The complete graphs $K_4$ and $K_5$ attain equality. A failure of a proposed algorithm, a fractional relaxation, or a restricted family of covers is not a counterexample to this conjecture.

The project seeks an unrestricted proof through AI mathematical development and computational or formal verification. This publication consolidates completed investigations. It starts no further campaign. Its current position is that a global packing-support exchange argument is a proposed priority, with the stronger odd-cover gate H-O2 a secondary candidate; neither is a supported complete proof route.

The inherited TUZA-15 theorem remains a separate result: if every nonempty subgraph of $G$ has average degree strictly below seven, equality holds precisely when every nonempty component of the full actual triangle family, connected by shared graph edges, has literal $K_4$ or $K_5$ edge support. Background triangle-free edges and vertex sharing are permitted. **Puleo previously proved the inequality** in this sparsity class [@puleo2015]. The project's equality classification has ordinary computer-assisted proof and internal AI verification, not a new full Lean formalization. TUZA-16–19 neither supersede that classification nor extend it to all graphs. See the [earlier report](../tuza-11-15-research-summary/main.md) and [TUZA-15 proof archive](../../problems/TUZA-15/README.md).

## 2. Definitions and evidence conventions

All graphs below are finite and simple; every triangle family is the full family of actual graph triangles. Deleting an edge retains its endpoints. A minimum cover has globally least size among the stated allowed covers; a support minimum restricts allowed edges and can be much larger than an unrestricted minimum.

| Symbol or term | Meaning |
|---|---|
| $\nu,\tau$ | Maximum edge-disjoint triangle packing and minimum triangle edge cover. |
| $\nu^*$ | Fractional triangle packing: nonnegative triangle weights with total weight at most one on each edge. |
| $\delta(G)$ | Defect $\tau(G)-2\nu(G)$. A positive value would violate Tuza. |
| $\pi(G)$ | Minimum odd triangle cover: every triangle meets it in one or three edges. |
| TF | Every specified triangle is wholly contained in some minimum ordinary cover; that cover may depend on the triangle. |
| WKE | A graph $L$ has a matching $M$ and a vertex cover $Q$ of $L-M$ with $|Q|\le|M|$. |
| Link at $v$ | The induced graph $G[N(v)]$. A non-WKE-component condition applies to every connected component. |
| $H_3$ | The spanning graph of edges lying in at least three actual triangles of $G$. |
| Five-core | The unique maximal vertex-induced subgraph of $H_3$ with minimum degree at least five; its vertex set is $K$. |
| Packing support $B$ | The union of the edges of a specified packing $P$. |
| Private page | A triangle outside $P$ meeting $B$ in exactly one edge, belonging to its owner in $P$. |
| Private $K_4$ completion | An actual $K_4$ containing an owner whose other three faces are private pages for that owner. |
| $A(P)$ | $B$ together with edges of all those original private completions. |
| Type-one owner | A packed triangle with exactly one edge supporting private pages; multi-page means at least two such pages. |

An **ordinary proof** supplies an all-size argument. A **proof using published input** identifies the external theorem and interface. A **finite certificate** establishes a finite assertion through exact checking. A **formal finite kernel** is a Lean theorem about its literal domain. A solver-only UNSAT result is weaker than a checked proof trace. Historical evidence reused, fresh replay, refuted candidates, open claims, and UNKNOWN outcomes have separate labels in the [machine-readable ledger](../../verification/tuza-16-19/CLAIMS.json). The [full source ledgers](../../verification/tuza-16-19/CLAIM_EVIDENCE.md) account for every frozen final-ledger entry.

A minimum Tuza violation, a minimum counterexample to a stronger assertion, and a normalized graph are different objects. Normalization below need not preserve minimality or packing resilience. Likewise, a statement about one specified maximum packing differs from existence over all maximum packings.

## 3. Original-packing covers

### 3.1 Common-vertex theorem and local stability

**Theorem (TUZA-18).** Let $P$ be a specified maximum triangle packing in $G$. If all its triangles contain one vertex $v$, there is a triangle cover $C\subseteq A(P)$ with $|C|\le2|P|$. The vertex $v$ need not be universal.

The allowed set is computed from the **original** $P$. The proof does not obtain a convenient replacement packing and quietly use its different support. In fact the same conclusion holds if $P$ merely has no augmentation replacing $j$ members by $j+1$ triangles for $j=0,1,2$. The alternative local statement is: either one such augmentation exists, or the confined cover exists. An augmentation can destroy the common-vertex hypothesis, so this is not an unrestricted iterative algorithm.

Here is the proof mechanism. The edges opposite $v$ in $P$ form a matching $M$, with $k=|P|$. Let $U=V(M)$ and $W=N(v)\setminus U$. Every triangle avoiding $v$ contains exactly one base in $M$, since otherwise it could be appended to $P$. Call bases supporting such pages active and write their set as $S$. The unmatched set $W$ is independent.

Take pages on two active bases. If they are edge-disjoint, replacing the two packed triangles frees their spokes. Any unused edge between the two matched pairs would then give a third triangle through $v$, a forbidden two-to-three augmentation. Consequently an interpair edge matrix is empty, a directed two-edge star with a unique page tip, or a rigid three/four-edge block. In the directed relation each pair has outdegree at most one: two different heads would force its nonempty tip set into disjoint pairs.

If an active pair has an unmatched neighbor $w$, a one-to-two exchange forces $w$ to be its sole page tip and forces both pair endpoints adjacent to $w$. This gives an **original** private $K_4$ completion, so the extra spoke $vw$ is allowed. Such pairs are marked sinks. Let $r$ count these sinks and $W_0$ their distinct unmatched tips; $|W_0|\le r$.

On the active endpoints, with the bases omitted, construct an independent set $I$ of size $|S|+r$. Start at sink or cycle components and restore directed leaves in reverse order. If a leaf's parent center is selected, replace that center by both leaf endpoints; otherwise add one endpoint. Each restoration increases the cardinality by one and preserves independence. Marked sinks supply the extra $r$ units. Then

$$C=S\cup\{vx:x\in U\setminus I\}\cup\{vw:w\in W_0\},$$

and

$$|C|=|S|+2k-|I|+|W_0|=2k-r+|W_0|\le2k.$$

Old triangles meet their selected bases. Apex triangles on two matched vertices are hit by a base or a selected spoke; those on an unmatched tip meet its allowed spoke or an inactive endpoint's spoke. There are no apex triangles on two unmatched vertices. This exhausts the actual triangle family.

The [full theorem](../../problems/TUZA-18/notes/criticality_star_pk_theorem.md), [local corollary](../../problems/TUZA-18/notes/criticality_star_local_dichotomy.md), and [separate reconstruction](../../problems/TUZA-18-replay/RECONSTRUCTION.md) contain the complete matrix and terminal cases. The 41,984 exhaustive fixed-star cases and ten targeted runs corroborate these arguments. They do not prove the all-size result by enumeration. The November 15 replay concerns this theorem and corollary; it is **not** a separately established connected-chain replay.

### 3.2 Two further confined-cover classes

The [apex/block theorem](../../problems/TUZA-18/notes/coordinator_pk_block_extension.md) allows a graph $H$ whose nonempty triangle components have literal $K_3,K_4,K_5$ support, including vertex sharing and triangle-free background edges. Add one vertex with arbitrary neighborhood. For **every original maximum packing** $P$ of the resulting graph, a cover of size at most $2|P|$ lies in $A(P)$. The proof normalizes the apex matching without introducing new spokes, then covers old blocks using edges certified to lie in the original allowed set. The underlying one-apex inequality is inherited project work; the confinement and original-packing quantifier are the additional interface here. Iterated apex addition is not covered.

The [private-tip theorem](../../problems/TUZA-18/notes/criticality_private_tip_pk.md) assumes every packed triangle is $a_i b_i x_i$, where $x_i$ lies in no other packed triangle, the base $a_i b_i$ has a private page, and neither spoke has a private page. Private page apices can occur anywhere. Then a cover of size at most $2|P|$ lies in $B$ itself. Select every base. Every remaining triangle is a cross $a x_i x_j$ between tips. A four-for-three exchange forces any mixed base to have exactly the closing-triangle configuration, and mixed indices are independent in the cross graph. Selecting one suitable spoke per owner therefore covers all crosses. The hypotheses are not known to be available for arbitrary maximum packings.

## 4. Hall compatibility: obstruction and plateau repair

For a support-contained cover, let $a_i$ count packed triangles containing $i$ selected edges. Since every packed triangle must be hit,

$$|C|-2|P|=a_3-a_1.$$

If $r$ selected edges lie outside $B$, the correct identity is $a_3-a_1+r$. This is accounting, not proof that a cover or exchange exists. Also, after deleting a triangle packing, uncovered-edge degrees have the same parity as the original degrees; they are not universally even.

Heavy owners have three selected edges and light owners one. A support cover can be partitioned into common-center groups each costing at most twice the number of its owners exactly when heavy owners can be matched injectively to intersecting light owners. This is a Hall condition on an auxiliary bipartite graph. It does not automatically follow from the theorem in Section 3.

**Connected-chain obstruction (TUZA-18).** For every integer $N\ge2$, there is a graph on $5N+2$ vertices with $16N+1$ edges and $16N$ triangles, all in one shared-edge triangle component, with a specified maximum packing of size $4N$. A specified minimum support cover has size $8N$ and Hall deficiency one. Every Hall-compatible minimum support cover differs from it in at least $2\lceil N/2\rceil$ edges of symmetric difference; this distance is attained.

The construction glues seven-vertex blocks along outside-support edges. Every actual triangle retains unique block ownership, so packing and support-cover minima factor. Heavy and light counts balance within each block. A saturating matching must cross every prefix cut equally in both directions; adjacent unchanged blocks offer only one direction. Changed blocks must include the first and meet every path edge, requiring at least $\lceil N/2\rceil$ changes. See the [complete construction](../../problems/TUZA-18/notes/late_star_connected_pivot_obstruction.md).

**Plateau continuation (TUZA-19).** The same family has an optimal sequence of $\lceil N/2\rceil$ one-edge replacements, at unchanged cover size, with deficiency one until the final pivot and zero afterward. Odd-block pivots give the sequence. The [continuation proof and control](../../problems/TUZA-19/review/chain_plateau_control.md) pair with the obstruction. At $N=3$, the fresh check reconstructs 729 minimum support states, 560 compatible states, and minimum symmetric difference four. The single-block unrestricted cover number is five although its support minimum is eight. These witnesses refute bounded **strict** descent of this Hall potential, not Tuza, plateau moves, arbitrary reconfiguration, or every choice of maximum packing.

## 5. From four-branch links to a heavy-edge core

**Theorem (TUZA-19).** Every finite simple graph with at most four vertices of degree at least three is WKE. There is no order or maximum-degree bound.

The [ordinary proof](../../problems/TUZA-19/notes/root_four_branch_wke.md) uses induction. Isolates disappear; for a leaf $x$ adjacent to $v$, remove $x,v$ and extend a witness by adding $xv$ to the matching and $v$ to the residual cover. Cycles have explicit witnesses. Replacing an edge by a path with two additional internal vertices preserves WKE: if the edge was matched, replace it by the two end edges and add one internal cover vertex; otherwise match the middle edge and cover the uncovered end. Both matching and cover sizes increase by one.

Suppress degree-two paths between branch vertices. A path returning to one branch is reducible using a cycle witness containing that branch. Two nondirect parallel paths, or a direct edge paired with an odd nondirect path, have explicit witnesses covering both endpoints and can be removed. The remaining state of each branch pair is one of: absent, direct, even path of length two, odd path of length three, or direct plus even. Fresh internal vertices belong to just one path.

For one through four labeled branches, this gives $1+5+125+15625=15756$ raw vectors. Requiring actual branch degree at least three leaves $0,0,10,5365$ cases. All **5,375** have literal matching/cover certificates. The finite Lean bundle reconstructs the edge sets, degrees, witnesses, and each segment's complete domain in 128 separately compiled modules. Separate list-domain and schedule proofs, together with checked source correspondence, establish the finite coverage. There is no accepted monolithic aggregate theorem and no formal all-size reduction.

**Core consequence.** Let $K$ be the vertex set of the five-core of $H_3$. WKE reductions yield **some** subgraph $R\subseteq G[K]$ with

$$\delta(G)\le\delta(R).$$

At a current vertex $v$ incident with at most four heavy edges, its link has at most four branches because link degree equals triangle codegree of the corresponding spoke. A WKE witness $M,Q$ gives the packing $\{vxy:xy\in M\}$ and the cover increment $M\cup\{vq:q\in Q\}$, costing at most twice the packing increment. Delete all spokes at $v$ and the matching edges. Residual packings and covers lift, so defect cannot decrease. Codegrees cannot increase under deletion. Every eventual survivor has at least five incident edges already heavy in the original graph and hence lies in $K$.

Thus empty $K$ proves Tuza. A sufficient property imposed on $G[K]$ must survive arbitrary edge deletions before it can be applied to $R$. Replacing $R$ by the full induced graph is unjustified. The [scope addendum](../../problems/TUZA-19/notes/four_branch_wke_scope_addendum.md) records this distinction. Puleo's WKE framework and Tsujimura's inspected subdivision/branch antecedents [@puleo2015; @tsujimura2026v2] are credited in the [literature comparison](LITERATURE_RECHECK.md).

## 6. Global equivalences and an odd-cover obstruction

### 6.1 Quantitative normalization

Fix $1/2<a<1$ and, for $n\ge2$, use natural logarithms to define

$$f_a(n)=n\exp(-(\log n)^a),\qquad E_a(n)=n^2\exp(-(\log n)^a).$$

**Theorem (TUZA-19, using classical incidence amplification).** Unrestricted Tuza is equivalent to its restriction to graphs simultaneously having at least $f_a(n)$ universal vertices, at least $f_a(n)$ triangles on every edge, TF, and no WKE component in any vertex link. Integer counts are compared to these real thresholds. Unrestricted Tuza is also equivalent to the existence of uniform constants $C,n_0$ such that every $n$-vertex graph with $n\ge n_0$ satisfies

$$\tau(G)\le2\nu(G)+C E_a(n).$$

Every fixed power-saving error $C n^{2-\epsilon}$, $0<\epsilon<2$, likewise implies exact Tuza. This does not include an unspecified $o(n^2)$ error, the endpoint $a=1/2$, a positive linear universal fraction, or an $n/(\log n)^c$ threshold.

To see the accounting, fix a hypothetical minimal violating seed $S$ first, with $r=|V(S)|$. Classical Behrend–Erdős–Frankl–Rödl incidence systems give an unbounded sequence of role-labeled, edge-disjoint copies with every triangle copy-local. If there are $b$ copies and $h$ nonisolated vertices, then

$$N/r\le h\le N,\quad b\ge N^2e^{-C_S\sqrt{\log N}},\quad\delta(H)=b\delta(S).$$

This classical construction is an attributed input [@behrend1946; @erdosFranklRodl1986], not a project priority claim. Chen–Diao–Hu–Tang give earlier defect-normalization equivalences using disjoint clique copies [@chenDiaoHuTang2016]; the simultaneous conditions and rate here require the additional stated argument. The role parts are independent. Partition each into batches $I_i$ of size $1\le g_i\le q$, with $k\le h/q+r$. Add a universal $K_q$, denoted $A$, and a private clique of size $s_i=q+g_i+6$ for each batch, joined to $A\cup I_i$. Put $L_i=2(q+g_i+3)$ and

$$t_i=\binom{L_i}{2}-\binom{g_i}{2}-L_i^2/4,\qquad d_A=\binom q2.$$

Mantel's theorem and balanced cuts give exact local cover costs. Since local pieces overlap only on $E(A)$,

$$\tau(W)=\tau(H)+\sum_i(t_i-d_A)+d_A.$$

The same balanced cuts can contain any specified local triangle, proving TF; old and mixed triangles use inherited TF and selected spokes. Explicit residual-cover lower bounds against **arbitrary** link matchings prove every link component non-WKE. These are separate interface checks, not consequences of cover counting alone.

Packing upper bounds count old triangles, assigned local triangles, and mixed triangles using two of the $qh$ old spokes. They imply

$$\delta(W)\ge b\delta(S)-k(2q^2+4q+4)-qh+d_A.$$

The final order is $q+2h+k(q+6)$, at most $4N$ eventually for $q=o(N)$. Choose $q=\lceil f_a(4N)\rceil$. The loss is $O_S(Nq)=o(b)$, so positive defect survives along sufficiently large members of the sequence. The order estimate and eventual monotonicity of $f_a$ give the required integer thresholds. For the error equivalence, $E_a(N)/b\to0$ directly contradicts a uniform eventual estimate on the amplified seed.

The [batch proof](../../problems/TUZA-19/notes/root_batched_universal_tf_nonwke.md), [rate corollary](../../problems/TUZA-19/notes/root_subexponential_normalization_corollary.md), and [quantitative incidence argument](../../problems/TUZA-19/notes/global_routes_quantitative_amplification.md) supply all constants and link cases. The seed remains fixed before the parameter grows. Two-edge packing resilience and minimality are not preserved; taking a minimal subgraph may destroy universality. This transports a hypothetical violation and does not prove the normalized class.

### 6.2 Odd covers fail on the normalized class

There are arbitrarily large graphs with all the normalization properties above but

$$\tau(W)<2\nu(W)<\pi(W).$$

The fixed seed $S$ is justified by a finite probabilistic existence proof using $K_5$ incidence blocks. It has $\tau(S)=2\nu(S)$ but bipartization number $\beta(S)>2\nu(S)$. It is not a generated huge literal graph. Role amplification preserves the relevant cut cost. In the decorated graph a universal vertex forces an odd cover to be a cut complement. With the local cover contribution denoted $B_0$, the exact identities are

$$\tau(W)=B_0+b\tau(S),\qquad \pi(W)=B_0+b\beta(S).$$

For the second identity, every coloring pays at least $b\beta(S)$ on old copies plus nonnegative batch penalties. The role-consistent lift of an optimal seed coloring makes every batch monochromatic and kills those penalties. This consistency is necessary to attain equality.

The added cost and packing increment are $O_S(Nq)=o(b)$. Ordinary Tuza is certified separately: each full even-sized batch contains a $K_{q,q,q,q}$ with an explicit $2q^2$-triangle decomposition avoiding old and shared apex-clique edges. These packings combine with the old packing and give strict slack. Consequently

$$\frac{\tau(W)}{2\nu(W)}\longrightarrow1\text{ from below},\qquad
\frac{\pi(W)}{\nu(W)}\longrightarrow\frac{\beta(S)}{\nu(S)}>2.$$

No exact value of $\nu(W)$, monotone convergence, or seed-independent numerical excess is asserted. The [construction](../../problems/TUZA-19/notes/root_batched_odd_cover_obstruction.md), [exact identity](../../problems/TUZA-19/notes/root_batched_odd_cover_exact_identity.md), and [limit proof](../../problems/TUZA-19/notes/root_batched_odd_asymptotic_slack.md) are included. The $K_{2,2,2,2}$ base has a fresh literal check. Two-edge resilience remains unestablished, so this does **not** refute H-O2, which also requires edge cover-criticality and two-edge packing resilience.

## 7. Earlier reductions and their exact boundaries

### 7.1 TUZA-16: deletion, twins, and copy transfer

The prescribed fixed-vertex-color deletion repair fails in an unbounded cone family. Choose a triangle-free base $F$ of chromatic number exceeding a fixed palette size and order $b$. In the cone over its $t$-blowup, every palette partition has at least $t^2$ monochromatic rim edges, while every triangle uses two of the $bt$ spokes, giving $2\nu\le bt$. For $t>b$, deletion alone exceeds the packing budget even if the residual cover were free. The twofold Mycielski base from $C_5$, with $b=23,t=24$, gives **553 vertices and $576>552$**. Exact packing and cover witnesses certify a graph satisfying Tuza. The mechanism, not all triangle-edge-three-colorable repairs, is refuted.

**Saturated independent-twin identity.** Let independent vertices $X$ have common neighborhood $S$, and suppose $G[S]$ has a proper edge coloring into $X$. If $q=|E(G[S])|$ and $R$ results by deleting $X$ and those rim edges, then

$$\nu(G)=q+\nu(R),\qquad\tau(G)=q+\tau(R).$$

The color of each rim edge selects a disjoint triangle through its twin; arbitrary attachments outside $X$ are allowed. Restricting or lifting covers and packings gives the equalities. A universal availability theorem is absent. The payment fits established reducing-set methodology.

**Labeled-copy transfer.** If $X$ maps homomorphically to $G$ and its edges partition into $r$ label-respecting copies of $G$, then $\tau(X)=r\tau(G)$ and $\nu^*(X)=r\nu^*(G)$. Restriction supplies lower bounds; pullback covers and fractional LP duality supply upper bounds, including crossing triangles. Uniform dense fractional-to-integral approximation yields the stated dense-limit obstruction under these hypotheses. Krivelevich and Haxell–Rödl/Yuster are credited inputs [@krivelevich1995; @haxellRodl2001; @yuster2005]; arbitrary gluing is outside the theorem.

The GF4 partial-slope control has twelve planted $K_4$ copies, $\tau=\nu^*=24$, and an explicit twenty-packing. Its integral optimum remains **20 or 21**. The 66 K10/K11 certificates cover all 33 nonempty deletion classes supported on at most five vertices for each order; they refute payment solely from twice the residual packing loss, not every local reduction. Complete [proofs and controls](../../problems/TUZA-16/PROOFS_AND_OBSTRUCTIONS.md) retain the exact interfaces.

### 7.2 TUZA-17: apex compatibility

Write $G=H+z$ with $N(z)=X$ and induced link $L=H[X]$. For arbitrary $H,X$, the exact state identities are

$$\tau(G)=\min_C\bigl(|C|+\operatorname{vc}(L-C)\bigr),\qquad
\nu(G)=\max_M\bigl(|M|+\nu(H-M)\bigr),$$

where $C$ ranges over **all** triangle covers of $H$ and $M$ over link matchings. Restricting the first minimum to minimum $H$-covers is an additional assertion.

AC asks whether such a minimum cover attains budget $2\nu(G)$ when $H$ has an edge coloring with three colors making every triangle rainbow and $L$ is induced triangle-free. Put

$$h=\nu(H),\quad p=\nu(G),\quad a=p-h,\quad D=2h-\tau(H),\quad b=D+2a,$$

$$m=\operatorname{matching}(L),\qquad
\lambda=\min_{C\text{ minimum }H\text{-cover}}\operatorname{vc}(L-C).$$

Here $b$ is the compatibility budget, not a graph order, and $\lambda$ is not necessarily $\operatorname{vc}(L)$. **AC holds for every eligible instance with $b\le6$.** The proof uses $m\le b$, a saturation theorem at $m=b$, tight-remainder equality interfaces, and complete low-matching link arguments. For matching number three, a triangle-free link has a cover of size at most four. The matching-five/cover-seven boundary uses a cover-critical edge in a maximum matching and a tight-frontier contradiction. The eleven-vertex part has an ordinary independent-set proof, not a census substitution. Aharoni/HNS enter only at the justified rainbow-colorable tight remainders.

The first remaining necessary window is $b=7,m=6,\lambda=\operatorname{vc}(L)=8$. Eliminating the cover-nine alternative uses **declared McKay Ramsey-catalogue completeness**; that completeness was not recomputed, and is unnecessary for $b\le6$. The retained graph6 check verifies one record and displayed link witnesses. No eligible full $H,X$ realizing the remaining window is known here.

Private triangle and $K_4$ ears have explicit minimum-cover-safe reductions with adjusted markings. Their availability is unproved. Critical apex nonsaturation holds for an actual edge-minimal Tuza violation, whereas the thickened-cone deletion obstruction merely satisfies specified relaxed conditions and fails true criticality. The separator route credits Freitas [@freitas2014]. See [full proofs](../../problems/TUZA-17/PROOFS_AND_OBSTRUCTIONS.md) and [dependencies](../../problems/TUZA-17/PRIOR_ART_AND_DEPENDENCIES.md). Historical `independent_final_verification: NOT_RUN` remains unchanged; this publication's review and replay have their own scope.

## 8. Local relaxations and additional positive classes

For every fixed star budget $k$, TUZA-19 supplies a common first-marginal vector belonging to the exact packing polytope on every triangle family meeting at most $k$ specified vertices and on every clique of the original graph, without recovering the global packing number. For sufficiently large $r=3\cdot2^j-1$, let $CP_r=K_{2,\ldots,2}$ and $m=2r(r-1)$. Then

$$\nu=(m-4)/3,\quad\tau=(r-1)^2,\quad\rho=m/3=\nu+4/3.$$

Classical complete multipartite packing work is relevant [@billingtonLindner1996]; its uninspected full exception theorem is not imported. Three literal $CP_5$ leave types seed an all-size doubling argument; symmetric mixtures and complete-tripartite packings supply the local memberships. TF, two-edge resilience, and non-WKE link components survive the specified amplification, and the additive gap exceeds every fixed power-saving allowance along a sequence. Amplified full links need not be connected. The [unified proof and scope correction](../../problems/TUZA-19/notes/global_routes_bounded_stars_all_cliques.md) do not provide consistent joint distributions or higher moments, and do not refute named moment hierarchies or factor-two cover inequalities.

A useful **editorial identity**, obtained simply by expanding the right side, is

$$\tau-2\nu=2(\nu^*-\nu)-(2\nu^*-\tau).$$

Thus a fractional-packing gap can be compensated by cover savings. The amplified gap blocks a sufficiently small uniform rounding-gap estimate; it does not exclude every fractional method or every approximate proof.

Three additional all-size results have full ordinary proofs:

* **Square $K_4$ cells.** Every actual triangle must have unique cell ownership; each cell has a boundary four-cycle and two diagonals private to that cell and never boundary edges. Boundary multiplicity is arbitrary. An auxiliary matching model gives $\mu=c+\nu$; endpoint consistency excludes odd cycles with fewer than four resource terminals. A maximal Tutte–Berge barrier and randomized free-terminal selection give an actual cover of size at most $2\nu$. No general decomposition or odd-cover bound follows. [Full proof](../../problems/TUZA-19/notes/global_routes_square_cells_matching.md).
* **Ordinary line graphs.** For every finite **simple** root $H$, $\pi(L(H))\le2\nu(L(H))$. Balanced edge colorings and explicit local clique packings pay the cover; Shiraishi and Guruswami are relevant cut-method antecedents [@shiraishi1998; @guruswami1999]. In the odd Eulerian case, a root triangle supplies an extra packing triangle; if the root is triangle-free, independent star-clique odd covers remove the parity defect. No multigraph extension or global reduction is claimed. [Full proof](../../problems/TUZA-19/notes/root_line_graph_parity.md).
* **Integral private-page bound.** For a maximum packing of size $n_P$, let $m_P$ count multi-page type-one owners and $p_P$ count disjoint exceptional $K_5$ owner pairs. An explicit support cover has size $3n_P-2m_P+2p_P$. The corrected double-attachment classification and a four-for-three exchange prove coverage. The sufficient threshold $m_P-p_P\ge n_P/2$ is not generally available. [Full proof](../../problems/TUZA-19/notes/root_multi_private_integral_cover.md).

## 9. Barrier and witness map

The table states failed propositions at their actual interfaces. The [full finite-witness catalogue](../../verification/tuza-16-19/WITNESSES.md) links the retained checkers and historical/fresh evidence.

| Failed proposition | Witness and conclusion | What remains outside the refutation |
|---|---|---|
| Fixed-palette deletion pays globally | TUZA-16 cone, 553 vertices, $576>552$; fresh literal verification. | Other repair interfaces and Tuza. |
| Every small-support deletion pays by packing loss | 66 K10/K11 residual-packing certificates, fresh replay. | Other deletion classes or added structural information. |
| Integral copy counts always replicate | GF4: twelve planted $K_4$ copies, packing at least twenty. | Conditional counterexample-only amplifiers; optimum 20/21 unresolved. |
| Minimum old covers always realize the exact apex optimum | Seven-vertex example, true $\tau=3$ but restricted extension costs four. | The weaker AC budget and full state formula. |
| Private tip/base roles always separate | Six-vertex witness for every maximum packing; finite Lean coverage. | Common-vertex theorem or unrestricted PK. |
| Bounded strict Hall descent suffices | Connected chain; unbounded distance, with optimal plateau repair. | Plateau reconfiguration, changing the packing, general exchange. |
| Defect-preserving directed compression is always available | Two glued $K_4$s, rook graph, then its cone with $(\nu,\tau)=(16,24)$. | Positive-defect-only or broader terminal-class proposals. |
| TF forbids adjacent light edges | Nine vertices, 22 edges, 18 triangles, $(\nu,\tau)=(6,8)$. | Joint resilience/heavy-triangle-free hypotheses. |
| TF plus resilience forces codegree three or integral fractional normalization | 72 vertices, $(\nu,\tau,\pi)=(49,86,86)$, half-cover mass 85. | Tuza and H-O2. |
| Optimized private-page simplifications suffice | Distinct 32-vertex controls: 75-edge concentration and 76-edge pair-overcover graphs. | Unequal allocations, third literals, general covers. |
| Local packing marginals synchronize | $CP_r$ gap $4/3$, with stated amplification. | Joint moments, cover savings, factor-two inequalities. |
| Normalization permits an odd-cover proof automatically | Finite-existence family with $\tau<2\nu<\pi$. | H-O2; resilience is unestablished. |
| The stated exact local diamond matching signature exists | Alternating-path exchange contradicts its saturated internal/terminal signature. | Weighted or global matching reductions. |

Other material failed gates, including identification, covering maps, barycentric transfer, odd-cover two-lifts, Delta-Y boundaries and insulated spokes, remain in the full ledgers with complete retained proofs. Historical large searches are not silently converted to fresh checks. Timeouts and cutoff outcomes remain UNKNOWN.

### The CKSU edition-specific correction

The independently checked $K_5$ witness concerns **the printed arXiv:2001.00257v2 Proposition 13 and inspected Section 3 procedure** [@cksu2021v2]. All 15 maximum packings give 60 failing classification instances. The omitted exceptional pair consists of two owners whose private bases are disjoint and whose private tips are the opposite pair's endpoints. The [source audit](../../problems/TUZA-19/review/cksu_prop13_independent_audit.md) and [scoped repair](../../problems/TUZA-19/notes/root_cksu_order3_repair.md) retain this exact case.

This does not disprove the existential main theorem. The repaired order-three construction restores the known fractional target without an integral upgrade. Lemma 18 has a singleton premise not satisfied by this witness. The later-use audit covers only the uses actually inspected; it does not certify every later section or appendix. The distinct proceedings record [@cksu2020proceedings] is compared in the literature recheck, without assuming its body is identical. No author contact was made.

## 10. Verification, archive map, and reproducibility

The publication separates four activities. Ordinary AI reconstruction checks arguments and quantified interfaces. Exact Python replay checks literal finite data. Lean checks its stated finite formal domains. Source/integrity checks authenticate bytes and provenance, without proving mathematics.

The fresh default suite has 23 serial standard-library targets. It includes TUZA-16's 66 residual certificates and cone/GF4 controls; TUZA-17 finite critics and the single Ramsey record; TUZA-18 common-vertex and selected role/chain/compression/cover controls; TUZA-19 chain continuation, WKE kernel, CP5, $K_{2,2,2,2}$, nine-/72-vertex and private-pair controls, and CKSU $K_5$. It reruns existing independent implementations, not newly independent implementations. It neither recomputes Ramsey-catalogue completeness nor generates the large probabilistic odd-cover family.

The formal replay compiles the accepted TUZA-18 six-vertex RoleWitness and TUZA-19 128 finite WKE modules plus separate Core, Domain, Coverage, and rejection lemmas. Literal declaration types and transitive axioms are inventoried. The WKE certificate theorems use kernel `decide` and report no axioms; the general domain lemmas use only recorded standard axioms. RoleWitness uses pinned Mathlib and standard axioms. Expected-failure corrupted controls must fail because their assertions are false, not because imports are absent. There is no `native_decide`, admitted accepted theorem, custom unproved axiom, all-size formalization, or monolithic aggregate claim.

Builds use Lean 4.33.1, compiler `819816b2e0a3bf405af45ae5c7af2491d8f5bee6`, and, where needed, Mathlib `0df444a360eaa60ab8c11dca51a86af692955474` with the retained other pins. Installed compiled dependencies are reused. One compiler process and thread run at a time, normally with a 240-second deadline and sampled 2,200 MiB process-tree RSS ceiling. Lean's `-M` setting alone is not a hard RSS cap. Historical failed aggregate attempts remain failures and are not rerun. This is not a cold dependency rebuild or an independent kernel implementation.

The rainbow-number-two kernels remain **solver-only** UNSAT: no proof traces were newly obtained or checked. Larger rainbow and availability gates remain open. Historical censuses, earlier TUZA-01–15 Lean campaigns, and source proofs outside the selected dependency interfaces are not newly replayed.

From a fresh clone, use Python 3.10 or later:

```sh
python3 tools/check_tuza_16_19.py --output ../tuza-finite-output
```

The output directory must be new and outside the checkout. `--only star,chain` selects those groups; all group names and optional formal prerequisites are in the [reproduction guide](../../REPRODUCTION.md#tuza-16-19). Historical scripts are retained as evidence. The supported driver copies public inputs, records path/provenance-hash/clock adaptations, and writes new receipts outside the source tree. A historical receipt audit is never called a new compilation.

| Archive | Reader entry | Scope |
|---|---|---|
| TUZA-16 | [README](../../problems/TUZA-16/README.md) | Global route triage, exact identities, deletion/copy obstructions. |
| TUZA-17 | [README](../../problems/TUZA-17/README.md) | Critical core, scoped AC, remaining conditional boundary. |
| TUZA-18 | [README](../../problems/TUZA-18/README.md) | Confined covers, chain obstruction, finite role witness. |
| Common-vertex replay | [Reconstruction](../../problems/TUZA-18-replay/RECONSTRUCTION.md) | Authenticated separate replay; no separate Git commit. |
| TUZA-19 | [README](../../problems/TUZA-19/README.md) | Normalization, WKE/core, odd/local-marginal obstructions, plateau repair. |

The [source manifest](../../problems/TUZA-16-19-SOURCE_MANIFEST.json) records original hashes, public destinations, transformations and exclusions. Frozen historical status text is contextualized rather than promoted. Full proofs and essential finite inputs are public; operational transcripts, personal handoffs, compiled objects, caches and downloaded articles are excluded. A [dependency and attribution guide](../../verification/tuza-16-19/DEPENDENCIES.md), [correction log](../../verification/tuza-16-19/CORRECTIONS.md), and [publication evidence](../../verification/tuza-16-19/README.md) give the actual acceptance results.

This manuscript generates the Markdown, LaTeX and PDF through one [build script](README.md), using Pandoc 3.13 and Tectonic 0.17.0 with existing cached assets. The report is built outside the checkout and every page inspected before acceptance. Frozen sources are accessed read-only with before/after integrity detection; no OS-enforced immutability is claimed. All work in this publication mission runs locally on the Mac. Historical host provenance remains attached to the relevant earlier evidence.

## 11. Outlook and attribution

The strongest results narrow interfaces rather than close the unrestricted argument. Local covers for common-vertex packings need a global compatibility theorem; a nonempty heavy-edge core still needs a sufficient structural condition; an equivalent normalized class still needs a proof on that class. The chain teaches that equal-cost plateau moves can matter, while the marginal examples leave cover-saving compensation available. These observations motivate a proposed global packing-support exchange priority, not a theorem of availability or termination. H-O2 remains a secondary open candidate.

The primary-source comparison distinguishes inherited theorems, adaptations and project-specific deductions. Puleo, Aharoni/HNS, Freitas, classical incidence constructions, fractional approximation, complete multipartite packings and line-graph cut methods receive source-specific credit. Inaccessible nonessential comparisons remain unresolved priority questions, not evidence of novelty. No “first” claim is made. The [edition and access record](LITERATURE_RECHECK.md) controls the scope of every literature statement.

## References
