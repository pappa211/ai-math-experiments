# Stronger rainbow vertex-cover gate: structural reduction and bounded endpoint

Status: **all-size gate unresolved; ordinary necessary conditions, an all-size maximum-degree-two result, and a complete solver-only rainbow-number-two kernel.** No claim of a general proof, counterexample, or novelty. Requested model controls Astra / Ultra; actual serving identity and effort are not independently exposed. Original research cutoff remains 2026-11-15 09:23:58Z. This lane stops without expanding to rainbow number three.

## Gate and exact implication

Let F be finite, simple and triangle-free, properly edge-colored, with every color class of size at most two. Write k=nu_r(F) for its maximum rainbow matching size and tau_v(F) for its ordinary minimum vertex-cover size. The stronger gate is

    tau_v(F) <= 2 nu_r(F).                                   (V)

Since a vertex cover is a mixed vertex-and-color cover, (V) implies the earlier mixed-resource gate. Through the exact two-heavy/one-light actual-triangle representation, that mixed gate would prove Tuza on graphs admitting the specified exact-one-light edge partition. Neither availability of that partition nor unrestricted Tuza follows from the present partial work.

The old controls do not refute (V). A bichromatic C4 has tau_v=2 and nu_r=1, hence equality. The published Biggs--Smith resource construction is bipartite, has tau_v=51 and nu_r=43, and satisfies (V) with slack. Its two-resource resilience blocks only the unconditional two-resource blocker induction. The excluded properly three-colored K4 has tau_v=3 and nu_r=1 and shows why a triangle-free hypothesis matters.

For every bipartite F, (V) is elementary: Konig gives tau_v=mu, and retaining one edge of each color in an ordinary maximum matching gives nu_r>=mu/2. No topological theorem is required for that subcase.

## Minimal-counterexample structure

Assume a counterexample exists and take one with as few edges as possible, removing isolated vertices. Let k=nu_r(F). All proper edge-deleted subgraphs satisfy (V); vertex deletion and deletion of a color class are particular edge deletions.

**Exact cover criticality.** For any edge e,

    tau_v(F)-1 <= tau_v(F-e) <= 2nu_r(F-e) <= 2k.

Since F violates (V), every inequality forces

    tau_v(F)=2k+1,  tau_v(F-e)=2k,  nu_r(F-e)=k.              (1)

Thus the uncolored graph is edge-critical for vertex cover, equivalently alpha-critical, and deleting any one graph edge preserves its rainbow matching number. This is ordinary vertex-cover criticality, not the earlier triangle-cover TF property.

**Two ordinary vertices may be avoided simultaneously.** If S is a set of at most two vertices and nu_r(F-S)<=k-1, then minimality and reinstating S as a cover would give

    tau_v(F) <= tau_v(F-S)+|S| <= 2k,

contradicting (1). Hence

    nu_r(F-S)=k  for every |S|<=2.                           (2)

The quantified resources here are ordinary vertices. No corresponding universal deletion assertion for mixtures of vertices and colors is inferred.

**Every color occurs exactly twice.** If e=uv had a unique color, a rainbow matching of F-{u,v} could be extended by e. Thus its size would be at most k-1, contradicting (2). Therefore all colors have two disjoint edges and |E(F)| is even.

**A color pair has a common residual optimum.** Let e=uv and f=xy be the two edges of a color. By (2), a rainbow k-matching avoiding u,v exists. It must contain f, since otherwise e could be appended. Removing f gives a rainbow (k-1)-matching avoiding all four endpoints. Conversely any rainbow matching avoiding the four endpoints can be extended by e. Therefore

    nu_r(F-{u,v,x,y})=k-1.                                 (3)

The same residual matching extends either by e or by f. This proves compatibility for one color pair, but does not coordinate choices between several color pairs.

**Minimum degree at least two.** First, an isolated K2 component e cannot occur. Let f be its color mate and put F'=F-{e,f}. Any rainbow matching in F' extends by the isolated edge e, so nu_r(F')<=k-1. Restoring two edges raises vertex-cover number by at most two, giving tau_v(F')>=2k-1, contrary to minimality. Next suppose a leaf u has neighbor v and v has another neighbor w. Alpha-criticality of vw supplies an independent set of F-vw of size alpha(F)+1 containing v and w. Replacing v by leaf u gives an equally large independent set in F, a contradiction. Thus any leaf would belong to an isolated K2 component, already excluded. Hence delta(F)>=2.

**Degree and matching bounds.** Fix v and choose a rainbow k-matching avoiding it. Since F is triangle-free, at most one endpoint of each matching edge is a neighbor of v. Therefore at most k incident edges at v meet used matching endpoints. Proper coloring permits at most k further incident edges to have a used color. Any remaining incident edge could be appended, so Delta(F)<=2k. An ordinary matching has at most two edges of every color, hence mu(F)<=2k.

These conclusions are necessary conditions, not a min-max theorem. They preserve the actual global obstruction: alpha-criticality plus compatible simultaneous color-pair choices.

## Ordinary positive theorem for maximum degree two

The gate (V) holds for every F in the stated class with Delta(F)<=2.

If not, choose an edge-minimal counterexample within this hereditary subclass. The preceding reductions force every component of F to be a cycle. Alpha-criticality excludes even cycles, because deleting an edge from an even cycle does not lower its vertex-cover number. Triangle-freeness excludes C3. Thus F is a disjoint union of odd cycles of length at least five, and every color occurs twice.

Let J be the conflict graph whose vertices are the edges of F, adjacent when they share an endpoint or have the same color. A rainbow matching in F is exactly an independent set of J. Its line-graph edges form a disjoint union of the same odd cycles, and its color-conflict edges form a perfect matching disjoint from those cycle edges. Consequently J is cubic. It has no K4 component: removing the color perfect matching from such a component would give a C4 component of the line graph, whereas all those cycles are odd and at least five.

Brooks' theorem therefore gives a proper three-coloring of J, so nu_r(F)=alpha(J)>=|E(F)|/3. If n=|V(F)|=|E(F)|, each odd cycle of order s>=5 has vertex-cover number (s+1)/2<=3s/5. Hence

    tau_v(F)<=3n/5 < 2n/3 <= 2nu_r(F),

a contradiction. This closes the maximum-degree-two branch of a minimal counterexample. It does not eliminate degree-two vertices inside a graph with branching vertices.

The imported theorem is R. L. Brooks, *On Colouring the Nodes of a Network*, Proc. Cambridge Philos. Soc.37 (1941),194--197, DOI10.1017/S030500410002168X. Its original statement is reproduced in Appendix A, first page, of https://www.tu-ilmenau.de/fileadmin/Bereiche/MN/komgra/BackMatterSMM.pdf and was read for this use. Only the finite maximum-degree-three/no-K4-component case is invoked. The saved PDF and its hash are in the manifest; no originality claim is made for the coloring argument.

## Exact small matching endpoint

For nu_r=0 the graph is empty. For nu_r=1, if all ordinary edges intersect, triangle-freeness makes them a star. Otherwise choose disjoint ab,cd; these have the same color. Every other edge has a different color and must meet both, hence is a cross edge. Triangle-freeness forces these cross edges to be a matching of at most two edges. Thus the whole graph is a subgraph of a C4 on those four vertices and has a two-vertex cover. This proves (V) ordinarily for nu_r<=1.

Suppose there is a counterexample with nu_r=2 and choose an edge-minimal one. The reductions give tau_v=5, delta>=2, Delta<=4, mu<=4, and exactly two edges per color. The earlier Tutte--Berge kernel argument applies verbatim: for S subset V(F), if q counts odd components of F-S and q1 counts singleton components, then 2q1<=4|S|. Nonsingleton odd components have size at least three, giving 3(q-|S|)<=n. Tutte--Berge then gives n<=3mu<=12. Triangle-free graphs on at most seven vertices have vertex-cover number at most four, so n>=8.

Write |E|=2c. Degree bounds give ceil(n/2)<=c<=n. The possibility n=8,c=4 forces a triangle-free 2-regular graph, hence C8 or two C4s, with vertex-cover number four; it is excluded. Thus the complete list is the same 28 domains:

    n=8: c=5..8; n=9: c=5..9; n=10: c=5..10;
    n=11: c=6..11; n=12: c=6..12.

The earlier inverse encoder already represents a proper two-edge-per-color triangle-free simple graph, degrees two through four, no rainbow triple, and a pinned rainbow pair. Its color-order symmetries are unchanged. For this stronger gate, **all mixed-cover constraints are disabled** and replaced by the requirement that every four-element set of ordinary vertices misses an edge. This is strictly the new vertex-cover target; the earlier mixed-cover outcomes are not reused as its proof.

All 28 domains returned native CaDiCaL UNSAT in 2.84 seconds total. The full counts, return codes and CNF hashes are in `evidence/fresh_rainbow_vertex_gate/kernel_receipt.json`. This is a complete encoded finite check with solver trust, not a checked DRAT or Lean theorem. A counterexample with nu_r<=2 is excluded at that verification level; no inference for arbitrary k is made.

Two SAT semantic controls were reconstructed literally: dropping triangle-freeness gives nu_r=2,tau_v=5, while keeping it and lowering the target to tau_v=4 gives nu_r=2,tau_v=4. Both have proper color classes of size two. They are retained in `controls.json`.

## Two specific attempts to preserve the K4 obstruction

The first fixed graph replaces two opposite edges of K4 by paths of length three. It is triangle-free, has eight vertices and ten edges, and tau_v=5. All 113 proper pairings of its ten edges into five two-edge colors were checked against its 26 ordinary three-matchings. Every pairing has a rainbow three-matching, so this specific triangle-removal construction cannot give the target obstruction.

The second fixed graph replaces opposite K4 edges by paths of lengths two and three, then adds an isolated K2. It has nine vertices, ten edges and tau_v=5. This tests whether a tight core can force a singleton-colored edge into all maximum rainbow matchings, allowing an isolated color mate to increase cover number without increasing the rainbow optimum. All 120 proper pairings have a rainbow three-matching among its 33 ordinary three-matchings. This precise construction also fails.

These were two specified closure mechanisms, not an atlas. For each pairing the retained data give an explicit rainbow triple, so their negative outcomes do not depend on solver UNSAT. The checker also recomputes the fixed vertex-cover numbers by vertex subsets. No further gadget variants or larger-order census were pursued.

## Remaining weakest step and stopped route

The unresolved theorem is still (V) for a triangle-free alpha-critical graph with branching vertices and paired colors, subject to (1)--(3). Every individual color pair admits a common residual optimum, and every two vertices can be avoided by some maximum rainbow matching. We have not proved that those separately chosen matchings can be coordinated to yield an independent set of size n-2k, equivalently a vertex cover of size 2k, or a rainbow augmentation.

One tempting stronger mechanism would require a rainbow matching whose endpoints themselves form a vertex cover. A bichromatic C4 already refutes that mechanism: every maximum rainbow matching has one edge, and its opposite same-colored edge lies outside its endpoint set. Thus the desired vertex cover cannot in general be restricted to the endpoints of one maximum rainbow matching.

A generic two-vertex deletion blocker is also unavailable: the published Biggs--Smith resource example survives even mixed two-resource deletions, while satisfying (V). The missing argument must use alpha-criticality as well. The cited minimum-color-degree rainbow theorems do not supply the required vertex-cover dual, and the natural colorful-matching LP integrality-gap results do not identify their dual with tau_v. No unproved topological strengthening such as eta(M(F))>=tau_v(F)/2 is imported.

Decision: preserve the exact reductions and stop this lane. There is no general solution candidate justified by the present results. The evidence does not warrant a nu_r=3 census.

## Reproduction and verification status

    source LOCAL_ENVIRONMENT
    python checks/fresh_rainbow_vertex_kernel.py
    python checks/fresh_rainbow_vertex_controls.py

All computation was local Darwin / Python3.12.12. Native CaDiCaL2.1.2 is used only for the 28-domain discriminator and semantic controls. The fixed pairing certificates are ordinary standard-library enumeration. No Lean, environment installation, remote execution or publication occurred. Exact source, checker and evidence hashes are in `evidence/fresh_rainbow_vertex_gate/manifest.json`. The reduction and degree-two theorem are ordinary mathematical arguments awaiting separate fresh AI review; the kernel outcome remains explicitly solver-only.
