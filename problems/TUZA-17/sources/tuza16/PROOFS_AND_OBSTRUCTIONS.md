# TUZA-16 proofs and obstructions

All graphs are finite simple graphs, with every actual triangle included. Packings share no graph edge, but may share vertices. Covers use actual edges. Let nu,tau be the two integral optima, nu*=tau* the finite fractional LP optimum, and delta=tau−2nu. The author-frozen complete notes are [A](notes/A_RESULTS.md), [B](notes/B_RESULTS.md), [C](notes/C_FROZEN_PROOF.md) with [C domain addendum](notes/C_ADDENDUM.md). Their original bytes remain available for review. The proofs below collect the controlling results; the notes retain more test detail and historical comparisons.

## 1. Fixed vertex-palette deletion cannot be a universal paid repair

**Theorem A.** For every fixed integer r>=2 there are arbitrarily large graphs G, all satisfying Tuza and with every edge in a triangle, such that every partition into at most r vertex classes has more than2nu(G) within-class edges. The ratio of that number to2nu(G) is unbounded. In particular a maximum-four-cut repair charged for deleting all its monochromatic edges cannot universally satisfy |F|+|C_H|<=2|P|, even with arbitrary residual covers C_H and global packings P.

**Proof.** For a graph B with originals v_i, form M(B) by adding independent clones u_i adjacent to the original neighbors of v_i, and a new vertex w adjacent to all clones only. If B is triangle-free, M(B) is triangle-free: triangles through w would need a clone-clone edge; those with one clone project to a B-triangle; other possibilities are absent or old. If chi(B)=k>=2, M(B) is (k+1)-colourable by copying the original colours to clones and giving w a new colour. A k-colouring would let us recolour each original of w's colour by its clone's colour, producing a (k−1)-colouring of B: adjacent originals cannot both be recoloured, and the clone is adjacent to the unchanged neighbor. Contradiction. Starting from K2 and iterating r−1 times gives triangle-free B of chromatic number r+1 and order b=3*2^(r−1)−1, without isolates.

Replace each B-vertex by t independent twins, each B-edge by all t² corresponding edges; call this rim R. For any r-colouring of the twins, choose one twin uniformly and independently per base vertex. Its colours on B must leave at least one monochromatic base edge. The expected count is exactly m_same(R)/t², so m_same(R)>=t². This works when colours vary within a twin cluster.

Add an apex z adjacent to all bt rim vertices. The rim has no triangle, so the actual triangle family is exactly {zuv:uv∈E(R)}. Packings correspond to matchings of R and use two distinct apex spokes each, hence2nu(G)<=bt. Every graph edge lies in one of these triangles. For any r-partition of G the deletion set F contains at leastt² rim edges. Taking t>b gives |F|>=t²>bt>=2nu(G). Thus |F|+|C_H|>2|P| for every possible residual cover and original packing; no residual saving can pay even F. The ratio is at leastt/b.

These graphs satisfy Tuza: a maximal rim matching M has endpoints forming a rim vertex cover, so its cone packing and those spokes give a cover of size2|M|<=2nu(G). More exactly nu(G)=matching_number(R), tau(G)=vertex_cover_number(R), since any selected rim-cover edge can be replaced by one incident spoke without increasing the size. Therefore the obstruction concerns the operation, not Tuza. QED.

For r4, B=M(M(C5)) has23 vertices and71 edges. At t24 the cone has553 vertices,41448 edges and40896 triangles. Every repair costs at least576, while2nu<=552. [Exact witness](../../../TUZA-16/notes/A_FOURCUT_WITNESS.json) includes all edges/triangles and a192-packing/384-cover. These two explicit witnesses are not claimed optimal. Evidence: **PROVED_ORDINARY**, with finite reconstruction. The conclusion does not concern arbitrary triangle-edge3-colourings, which are more general than bounded vertex-colourings.

## 2. Exact independent-twin compression and its limitation

**Theorem B1.** Let independent nonempty X have exact common neighborhood S. Put B=E(G[S]), q=|B|, R=(G−X)−B. If B has a proper edge colouring c:B→X, then

    nu(G)=q+nu(R),   tau(G)=q+tau(R),   delta(R)=delta(G)+q.

**Proof.** The q triangles c(uv)uv are pairwise edge-disjoint: each colour class is a matching, and distinct colours have different apex spokes. All their edges are outside R. Every actual triangle destroyed by the operation contains B: a triangle meeting X has one X-vertex and two S-vertices, while a triangle avoiding X is destroyed only through a deleted B-edge. Thus an arbitrary packing has at mostq destroyed triangles and at mostnu(R) retained ones. Conversely append the q constructed triangles to any residual packing. This proves the packing identity, including arbitrary outside attachments and crossing triangles.

An arbitrary G-cover contains a cover of R among its residual edges and needs at leastq additional edges for the q disjoint constructed triangles outside R. Conversely B together with a minimum R-cover covers the complete triangle family. This proves the cover identity. The deficit equation is algebra; |V|+|E| strictly decreases since X is nonempty. QED.

The proof permits prescribed residual triangles and forbidden residual edges, because the appended packing uses none of those edges. It does not preserve arbitrary forced residual-edge occupancy. In the diamond {01,02,12,03,13}, X={2},B={01} leaves residual edges03,13 with no triangle; the original packing can occupy03 through013, but the residual cannot. No full boundary-response equivalence is claimed.

A half-saturated version needs only p properly coloured rim edges with2p>=q. It gives nu(G)>=nu(R)+p and tau(G)<=tau(R)+q, hence delta(R)>=delta(G). More generally for any independent X, put B_X=union_x E(G[N(x)]), and let rho_X be the maximum number of edge-disjoint triangles each meeting X. If |B_X|<=2rho_X, removing X and B_X preserves a positive deficit. This is an explicit instance of Puleo's known reducing-set template, not a new global existence theorem.

**Theorem B2.** If a graph of order n>=1 has a=alpha(G) and ell=min_v e(G[N(v)])>a(n−1), then every nonempty independent X fails |B_X|<=2rho_X.

**Proof.** |B_X|>=ell. Each packed triangle meeting X uses exactly one x∈X and two spokes there, so

    2rho_X <=2 sum_x floor(d(x)/2)<=|X|(n−1)<=a(n−1)<ell.

In particular K_n−M for a nonempty matching M and n>=9 has alpha2 and

    ell>=binom(n−2,2)−floor(n/2)+1>2(n−1).

The inequality starts at18>16 for n9 and its difference increases thereafter. QED.

Evidence: **PROVED_ORDINARY**; six small exact controls and all independent sets of K10−e are certified in [B evidence](../../../TUZA-16/checks/b_compression_results.json). This defeats an unconditional availability rule, not a rule restricted to uninstantiated minimal Tuza counterexamples. Such a global existence theorem remains unproved and unsupported.

## 3. Fractionalization obstructs dense copy amplification

Published inputs are precisely Krivelevich Theorem8, tau(G)<=2nu*(G), and Yuster Theorem1.2 for the fixed graph K3. The latter is uniform: there is a nonnegative function e(N)→0 such that every N-vertex graph X satisfies

    nu(X)>=nu*(X)−e(N)N².

One may define e(N) as the maximum normalized integral/fractional packing gap over the finite set of all N-vertex graphs. Yuster's no-isolates convention causes no issue: delete isolates; if the remaining order is bounded its fractional optimum is bounded, otherwise apply the uniform theorem to it. Exact editions and access are in [dependencies](PRIOR_ART_AND_DEPENDENCIES.md). These are **KNOWN_INPUT**, not new formal verification.

**Theorem C1.** Suppose X contains subgraphs H_i isomorphic to fixed G, with nonnegative weights w_i, such that every edge lies in copies of total weight at most1. Write M=sum_i w_i. Then

    tau(X)>=M tau(G),
    nu*(X)>=M nu*(G),
    nu(X)>=M nu*(G)−e(N)N².

**Proof.** A triangle cover of X restricts to a cover of each H_i. Sum the inequalities |C∩E(H_i)|>=tau(G) with weightsw_i; the total counted load of any selected edge is at most1. For fractional packing, put an optimal fractional triangle packing of G into each H_i, scale by w_i and add, combining repeated triangles. Every actual edge's load remains at most1, so the resulting fractional packing has massMnu*(G). Apply Yuster. All copied triangles are actual X-triangles and additional closure triangles cannot invalidate a packing lower bound. QED.

If g=nu*(G)−nu(G)>0 and M>=cN² for fixedc>0, then

    nu(X)−Mnu(G)>=M[g−e(N)/c].

Thus no such dense sequence can have nu(X)<=Mnu(G)+o(M). A hypothetical delta(G)>0 forces g>=delta(G)/2 by Krivelevich. This blocks the contemplated packing upper bound. It does not finitely refute a conditional construction statement only for hypothetical counterexamples; such a statement could be vacuous. Evidence: **PROVED_USING_PUBLISHED_INPUT**.

**Theorem C2.** Suppose E(X) is partitioned into r copies H_i of G and a graph homomorphism pi:X→G restricts to an isomorphism on every copy. Then

    tau(X)=r tau(G),    nu*(X)=r nu*(G).

**Proof.** C1 supplies lower bounds. Pull back a minimum cover of G through pi. Every base edge has exactlyr preimages in the partition, giving costrtau(G). Every actual X-triangle maps to a G-triangle: its three adjacent vertices have distinct images because G has no loops. The pullback therefore meets all triangles, including closure triangles. Pull back an optimal fractional cover in the same way; it has costrnu*(G) and is feasible for every actual triangle. Finite LP duality and C1 give equality. QED. These exact identities are **PROVED_ORDINARY** using finite LP duality; the next asymptotic consequence uses the published input.

Writing a_X=nu*(X)−nu(X),

    delta(X)=r[tau(G)−2nu*(G)]+2a_X,
    0<=a_X<=e(N)N².

Hence delta(X)/N²<=2e(N), so no positive quadratic limit can survive. This covers all growth regimes; when r=o(N²) the copied edge set is already subquadratic. Changing k edges on the same vertex set changes each optimum by at mostk and delta by at most3k; o(N²) edge edits cannot rescue positive normalized deficit.

For disjoint unions rG, both optima multiply byr but order multiplies byr, so normalized delta decays as1/r. For ordinary equal blow-ups G[t], exact tau=t²tau(G) follows by choosing one uniformly random twin per base vertex: any cover meets every transversal G-copy in at leasttau(G) edges, and each selected edge appears with probability1/t². Fractional packing is exactlyt²nu*(G), by uniform lift y_T/t to each of the t³ lifted triangles and pullback of a fractional cover. Thus nu(G[t])/t²→nu*(G), not generally nu(G). Normalized formulas presume a nonempty vertex set; the null graph is separately trivial, and a hypothetical positive-deficit graph has at least three vertices.

## 4. Affine partial-slope constructions and a finite transfer refutation

Fix distinct labels lambda_v in a finite field F_q for the h vertices of G, with q>=h. Choose S⊆F_q. Vertices of A are(v,x), x∈F_q; edges are pairs over uv∈E(G) for which (y−x)/(lambda_v−lambda_u)∈S. For each a∈S,b∈F_q the points(v,a lambda_v+b) form a G-copy. Two distinct lines share at most one vertex, and each actual edge determines its unique line; these r=q|S| copies partition E(A). Projection to v satisfies C2.

Every actual triangle lies over a base triangle and has all three pairwise slopes inS with

    a_uv(lambda_v−lambda_u)+a_vw(lambda_w−lambda_v)
      +a_wu(lambda_u−lambda_w)=0.

The relation is necessary by telescoping and sufficient by the edge definition. If two slopes agree the third agrees; otherwise all three are distinct. Thus planted triangles have one line and closure triangles have three distinct lines. When |S|<=2 there are no closure triangles but r/(hq)²→0 asq grows. When |S|/q is bounded below, Yuster andC2 give nu(A)/(q|S|)→nu*(G). Taking all slopes gives ordinary blow-up; intermediate dense slope sets do not evade the transfer.

For G=K4, q4 and S={0,1,x}, the exact graph has16 vertices,72 edges,96 triangles (48planted,48closure) and12 edge-disjoint K4 copies. An explicit20-packing exceeds the replicated integral size12. C2 gives tau=nu*=24. Odd degree9 at all16 vertices forces any packing to leave at least8 edges, hence nu<=21. The exact optimum is **UNKNOWN**, specifically20<=nu<=21; this is enough to refute unconditional integral replication. With all four slopes, explicit certificates give nu=tau32. See [certificate](../../../TUZA-16/evidence/c_affine_diagnostic.json) and independently authored critic receipt when finalized. These are ordinary Tuza graphs.

## 5. Optional strict mixed fractional bound

**Lemma.** If G contains a triangle, tau(G)<=2nu*(G)−1.

**Proof.** Induct on|E|; delete edges in no triangle, which change neither optimum. Choose an optimal fractional cover x and dual packing. If all x_e>0, complementary slackness gives|E|=3nu*. A nonempty graph has a cut strictly larger than half its edges: random cuts have expectation|E|/2 and the empty cut has smaller size with positive probability. Its complement is a triangle cover of size at most(|E|−1)/2. Therefore2nu*−tau>=|E|/6+1/2>=1.

Otherwise a triangle-support edge has x=0, and a triangle through it has some other edge e with x_e>=1/2. PutH=G−e. Restrictingx givesnu*(H)<=nu*(G)−x_e. IfH has a triangle, induction yieldstau(G)<=tau(H)+1<=2nu*(H)<=2nu*(G)−1. IfH is triangle-free, tau(G)=1 andnu*(G)>=1. QED.

This self-contained finite-LP argument adapts Krivelevich's proof. It is **PROVED_ORDINARY** with that attribution; it is not the literal wording of his theorem, and originality is unestablished. It gives negative constant normalized deficit for dense labelled gluings of a fixed triangle-containing base, but does not compare tau to integral2nu(G) and does not solve Tuza.

## 6. Carry-forward controls and exact scope

[CONTROL_PROOFS.md](notes/CONTROL_PROOFS.md) gives complete ordinary proofs for VB27, K10/K11 baseline bounds and witness thresholds, literal blocks/Cartesian product, Clebsch, four-port and Fano controls. All graph/triangle lists and witnesses are retained in [controls](../../../TUZA-16/evidence/controls.json) and [K10/K11](../../../TUZA-16/evidence/k10_k11.json). The latter control rules out only nonempty F of support<=5 for n10,11. Other n remain REPORTED_NOT_REPLAYED; no implication to minimal Tuza counterexamples is inferred.

The VB proof has no dependence on finding the right optimal cover: every optimum uses18 apex spokes, every maximum packing has13 apex triangles, so18>52/3 for every pair of distributions. The39-optimal-pattern count is finite evidence, supplemental to the ordinary proof. Clebsch refutes the private-only packing bridge; four-port refutes neutral restoration; neither is a Tuza counterexample. Abstract Fano is not a graph counterexample or a permissible input to the graph-packing asymptotic theorem.

No equality classification, S/E, literal-clique restoration, or historical Lean theorem is strengthened by these results. No theorem assumes a move exists merely because its potential decreases. Independent final verification remains NOT_RUN; fresh adversarial review here is internal AI criticism.
