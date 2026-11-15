# Route C frozen proof and gate assessment

Frozen: 2026-11-03T23:21:57.073173+00:00. This note was independently developed after C_INITIAL.md, before other scouts' arguments were received. Requested Astra/Ultra is not a serving-model attestation.

## Outcome and exact status

**DEPRIORITIZE Route C as a positive amplifier; REDIRECT allocation.** A universal claim that dense copy gluing keeps packing asymptotically additive is false. A precise non-blow-up construction has a finite counterexample to its unconditional packing-transfer component. More generally, the entire class of globally labelled edge-partition gluings has exact cover and fractional-packing transfer, and necessarily loses the original integral gap in the dense limit. This is a proved limitation, not progress toward an unrestricted positive amplifier, and no originality claim is made.

An existence assertion restricted only to hypothetical Tuza counterexamples has not been logically refuted by a finite example: it might be vacuous. The proved incompatibility says that such an input cannot admit the stipulated dense, packing-preserving gluing. It exposes the construction obligation rather than supplying a Tuza counterexample or proof.

## 1. Published inputs, with exact uniform quantifiers

All graphs here are finite, simple, and undirected, and all triangle families are the complete actual graph-triangle families. Write nu for integral edge-disjoint packing, tau for integral edge covering, and nu*=tau* for the fractional LP optimum.

**K (KNOWN_INPUT).** Krivelevich, *On a conjecture of Tuza about packing and covering of triangles*, Discrete Mathematics 142 (1995), 281–286; original journal scan on the author's site, Theorem 8, printed p.284, proof pp.284–285: every such graph satisfies tau(G)<=2tau*(G)=2nu*(G). Theorem 7 on p.284 separately gives nu*(G)<=2nu(G); its domain is also graph triangles and its proof explicitly excludes Fano. Only Theorem 8 is needed below. Visual inspection confirms non-strict inequalities despite bad PDF OCR.

**Y (KNOWN_INPUT).** Yuster, *Integer and fractional packing of families of graphs*, author manuscript (10 pages), Theorem 1.2, printed p.2, and first paragraph of its proof, p.4: for every fixed family F and every epsilon>0, there is N(F,epsilon) such that every n-vertex graph with n>N has nu*_F(G)-nu_F(G)<epsilon n^2. Take F={K3}. The manuscript excludes isolated vertices by convention; deleting isolates extends the assertion to arbitrary graphs: if the non-isolated order is large use its bound, otherwise its fractional optimum is bounded by a fixed constant and is absorbed for large total n. Theorem 1.1 restates Haxell–Rödl, but the numbering is Yuster's, not authenticated original Haxell–Rödl numbering. No explicit numerical N is asserted.

Equivalently, define e(n)=max_X (nu*(X)-nu(X))/n^2 over all n-vertex graphs (put e(0)=0). The maximum exists, is nonnegative, and e(n)->0. For **every** n-vertex X, nu(X)>=nu*(X)-e(n)n^2. Thus K and Y yield: for every epsilon>0 there is N such that every X of order n>=N satisfies tau(X)<=2nu(X)+epsilon n^2. The choice of N is uniform over X, including a constructed sequence.

**Context, not extra premises.** Baron–Kahn, arXiv:1408.4870v1, posted 21 August 2014, manuscript dated May 2014, printed p.2, explicitly states the asymptotic inequality and attributes the combination to Krivelevich and Haxell–Rödl. Its Theorem 1.3 has quantifiers “for each alpha>0 there exists beta>0 and arbitrarily large graphs”; beta is not uniform in alpha. No finite certified Baron–Kahn instance was used. Puleo arXiv:1308.2211v3 (13 April 2015), introduction p.2, was checked as a cross-reference only; its downloaded PDF has a later generated footer. The exact bytes match the pinned public dependency hash.

Primary URLs, access timestamps, hashes, and edition boundaries are in C_SOURCE_LEDGER.json and C_PRIMARY_DEPENDENCIES.md.

## 2. Elementary diagnostics

### Disjoint unions

For r disjoint copies, tau(rG)=r tau(G), nu(rG)=r nu(G), and |V(rG)|=r|V(G)|. Consequently delta(rG)/|V(rG)|^2=delta(G)/(r|V(G)|^2)->0. No positive quadratic violation is obtained.

### Equal independent-set blow-up

Let G[t] replace every vertex by t independent clones and every base edge by the complete bipartite graph between its clone sets. Its actual triangles are exactly three clones over a base triangle.

**Exact cover identity:** tau(G[t])=t^2 tau(G). A lifted minimum cover gives <=. Conversely choose one clone independently and uniformly for each base vertex. Every such transversal induces G, so every cover C of the blow-up meets it in at least tau(G) edges. Every edge of C is selected with probability 1/t^2. Taking expectations gives |C|>=t^2tau(G).

**Exact fractional identity:** nu*(G[t])=t^2nu*(G). Lift a fractional cover unchanged to each clone edge for the upper bound. For the lower bound, if a base triangle has packing weight y, give each of its t^3 lifted triangles weight y/t. Each clone edge then receives precisely the base load, and the total weight is t^2nu*(G).

Y therefore implies nu(G[t])/t^2->nu*(G), for fixed G. Hence delta(G[t])/|V(G[t])|^2 tends to (tau(G)-2nu*(G))/|V(G)|^2<=0. No equality between integral packing and t^2nu(G) was assumed.

## 3. General fractional-copy obstruction (PROVED_USING_PUBLISHED_INPUT)

**Theorem C1.** Let X have N vertices. Let (H_i,w_i) be finitely many subgraphs of X, each isomorphic to a fixed graph G, with nonnegative real weights such that every edge of X belongs to copies of total weight at most one. Put M=sum_i w_i. Then

    tau(X) >= M tau(G),
    nu*(X) >= M nu*(G),
    nu(X) >= M nu*(G) - e(N) N^2.

**Proof.** If C is any triangle cover of X, its intersection with E(H_i) covers all triangles of H_i, so |C∩E(H_i)|>=tau(G). Multiply by w_i, sum, and interchange sums over edges. Edge loads at most one give M tau(G)<=|C|. Independently choose a maximum fractional triangle packing within each H_i, multiply it by w_i, and add the weights of identical actual triangles. Every graph edge has resulting load at most sum_{i:e∈H_i}w_i<=1. Thus it is feasible on the full triangle family of X and has mass Mnu*(G). Apply Y for the last inequality. This uses a packing LOWER bound, not a claimed upper bound. QED.

**Consequence.** For a fixed G with g=nu*(G)-nu(G)>0, no sequence with N->infinity and M>=cN^2 (fixed c>0) can satisfy nu(X)<=Mnu(G)+o(M). Indeed the displayed lower bound yields

    nu(X)-Mnu(G) >= Mg-e(N)N^2 >= M(g-e(N)/c).

For a hypothetical violation delta(G)>0, K forces g>=delta(G)/2>0. Thus the hoped-for packing upper bound is incompatible with dense copy mass. The theorem includes arbitrary vertex identification, weighted overlapping copies, and unrestricted closure triangles, as long as the stated edge-load hypothesis is satisfied. It does not rule out constructions that lack that interface.

For edge-disjoint copies (weights one), any maximum packing contains at most rnu(G) planted triangles; therefore it contains at least r(nu*(G)-nu(G))-e(N)N^2 nonplanted triangles. The latter assertion is about the nonplanted triangles inside that same maximum packing, hence they are edge-disjoint.

The coefficient nu*(G) is sharp in general: the equal blow-ups above have a fractional copy system of mass t^2 (weight t^{2-|V(G)|} on each transversal copy), and integral packing/t^2 tends to nu*(G).

## 4. Exact globally labelled gluing (PROVED_USING_PUBLISHED_INPUT)

**Definition.** A labelled edge gluing of r copies of G is a graph X, an edge partition E(X)=disjoint union E(H_i), and a graph homomorphism pi:V(X)->V(G), such that pi restricted to each H_i is an isomorphism H_i->G. Extra isolated vertices of X are harmless. The copies can share vertices in any pattern compatible with pi. No assertion says copies are triangle components.

**Theorem C2.** Every such gluing satisfies exactly

    tau(X)=r tau(G),       nu*(X)=r nu*(G).

Consequently, for N=|V(X)| and a=nu*(X)-nu(X),

    delta(X)=r[tau(G)-2nu*(G)]+2a,
    0<=a<=e(N)N^2.

**Proof.** C1 gives both lower bounds. Pull back a minimum integral cover C of G: select every edge xy of X with pi(x)pi(y)∈C. Since each copy contributes one edge over each base edge and the copies partition E(X), the selected set has r|C| edges. Any **actual** triangle xyz of X maps to a triangle in G: adjacent vertices have distinct images because G is simple, and all three projected edges exist. Thus its image meets C, so the pullback meets xyz, including every crossing triangle. This proves the cover upper bound. The same argument pulls back a fractional cover, giving cost rnu*(G) and satisfying every actual triangle inequality. LP duality and C1 prove fractional equality. The deficit identity is algebra; Y bounds a. QED.

For fixed G with s(G)=2nu*(G)-tau(G)>=0, the normalized deficit obeys

    delta(X)/N^2 <= -[r/N^2]s(G)+2e(N).

Thus this entire class cannot preserve a positive quadratic integral deficit. If r=o(N^2), its edge count r|E(G)| is already subquadratic. If r>=cN^2 and s(G)>0, its normalized deficit is bounded above by a strictly negative constant asymptotically.

**Optional sharp additive refinement.** For every graph containing a triangle, s(G)>=1. A complete short proof adapting Krivelevich's induction is in Section 7. Thus dense labelled gluings of any fixed triangle-containing base eventually have a strict linear-in-r cover saving. This is a proof-method corollary, not a claimed new literature result.

**Robustness.** Altering k edges changes each of tau and nu by at most k: delete a chosen cover edge only when the edge itself is removed; or add it to cover all new triangles; and any packing can lose at most one triangle per removed edge. Hence delta changes by at most 3k. Subquadratic edge edits of a sequence cannot turn the C2 conclusion into a positive quadratic deficit. This robustness statement allows added edges with entirely new triangle types.

## 5. Precise non-blow-up affine construction (PROVED_ORDINARY transfer; Y for limit)

Let G have h vertices. Take a finite field F_q with q>=h and assign distinct field labels lambda_v to the vertices of G. Choose any slope set S⊆F_q. The graph A(G,q,S) has vertices (v,x), v∈V(G), x∈F_q. It has an edge between (u,x),(v,y) exactly when uv∈E(G) and (y-x)/(lambda_v-lambda_u)∈S. There are no edges within a fiber.

For every a∈S,b∈F_q, the vertices (v,a lambda_v+b) induce a labelled G-copy. Distinct copies share at most one vertex, since two field points of distinct first coordinate determine their unique line. Each graph edge has a unique slope a and intercept b, so these r=q|S| copies partition the edges. The projection pi(v,x)=v satisfies C2. Thus

    |V(A)|=hq, |E(A)|=q|S||E(G)|,
    tau(A)=q|S|tau(G), nu*(A)=q|S|nu*(G).

**All actual triangles.** They consist exactly of three vertices over a base triangle uvw whose three pairwise slopes a_uv,a_vw,a_wu all belong to S and satisfy

    a_uv(lambda_v-lambda_u)+a_vw(lambda_w-lambda_v)
      +a_wu(lambda_u-lambda_w)=0.

These conditions are necessary by telescoping and sufficient by the edge definition. A triangle is planted precisely when all three slopes agree. If two agree, the linear relation forces the third to agree. Consequently every nonplanted triangle uses three distinct slopes and three distinct copies. This classifies the full actual family; none is omitted.

When |S|=1 or 2 there are no nonplanted triangles, so nu(A)=rnu(G), but r/N^2=|S|/(h^2q)->0. When S=F_q, A is the ordinary blow-up. Intermediate S are in general proper sparse subgraphs of the blow-up, and can have closure triangles. If |S|/q is bounded below by a positive constant then

    nu(A)/(q|S|)->nu*(G),
    delta(A)/(q|S|)->tau(G)-2nu*(G).

Hence partial-slope designs do not evade fractionalization by avoiding complete fiber pairs.

## 6. Exact finite witnesses and applicable controls

The standard-library construction and certificate are checks/c_affine_diagnostic.py and evidence/c_affine_diagnostic.json. The independent-code verifier checks/c_affine_verify.py reconstructs triangles via adjacency intersections and uses an explicit GF(4) multiplication table rather than importing construction code; its receipt is evidence/c_affine_verified.json. Both were authored in this scout context; independently authored critic verification remains pending.

Take G=K4, field F2[x]/(x^2+x+1), labels 0,1,x,x+1. The field encoding is 0,1,2,3.

| Slopes S | Copies r | N | Edges | All triangles | Planted | Nonplanted | Certified packing |
|---|---:|---:|---:|---:|---:|---:|---:|
| {0} | 4 | 16 | 24 | 16 | 16 | 0 | 4 |
| {0,1} | 8 | 16 | 48 | 32 | 32 | 0 | 8 |
| {0,1,2} | 12 | 16 | 72 | 96 | 48 | 48 | 20 |
| F4 | 16 | 16 | 96 | 256 | 64 | 192 | 32 exact |

For the proper partial-slope S={0,1,2} example, nu(G)=1 but an explicit 20-packing exceeds rnu(G)=12. C2 gives tau=24 and nu*=24. Every vertex has degree nine. A packing leaves an odd positive degree at each of the 16 vertices, so it leaves at least eight edges; hence nu<=floor((72-8)/3)=21. The exact integral optimum was **NOT_COMPUTED**; 20<=nu<=21 suffices. It is not a Tuza violation: delta lies between -18 and -16. This is the decisive finite refutation of unconditional exact integral-packing replication for a genuinely non-blow-up member of the proposed family.

For full S=F4, the 32-packing covers all 96 edges, giving nu=32. The 32-edge pullback of the matching {01,23} covers all triangles, and the cover lower bound is 16tau(K4)=32, giving tau=32. The certificate also exhausts all 256 transversals as K4s. Its 32-packing is built by a small exact decomposition of K4[2] and a cyclic Latin-square lift of order two.

The empty graph, single triangle, books, K4/K5, hub, Cartesian K4 square K5 and archived witnesses all fall within the graph hypotheses of C1/C2 as base graphs; the general proof handles them without a census. Only the displayed finite K4-based instances were numerically reconstructed by this scout. K4/K5 are sharp original Tuza controls, not hypothetical counterexamples. No assertion about private witnesses or optimal-cover vertex balance is made. Abstract Fano is **NOT_APPLICABLE** as a graph base: the graph-specific ingredient in this route is Y, which has no analogous uniform theorem for arbitrary 3-uniform hypergraphs. A finite Baron–Kahn instance is **NOT_AVAILABLE** to this scout, and none was substituted with a clique blow-up. Parent-coordinated battery checks remain separate evidence.

## 7. Optional refinement: tau(G)<=2nu*(G)-1 when G contains a triangle

**Status: PROVED_ORDINARY using finite LP duality; proof adapts Krivelevich Theorem 8. Originality UNESTABLISHED.** Induct on |E(G)|. Edges in no triangle can be deleted without changing either optimum, so suppose every edge is in a triangle. Choose an optimal fractional cover x and its dual optimal packing.

If all x_e>0, complementary slackness saturates each packing edge constraint, giving |E(G)|=3nu*(G). A nonempty graph has a cut of size strictly greater than half its edges: uniform random cuts have expectation |E|/2 and the empty cut has strictly smaller size with positive probability, so some cut is larger. Integer-valuedness gives a triangle cover of size at most (|E|-1)/2. Since |E|>=3, 2nu*-tau >= 2|E|/3-(|E|-1)/2=|E|/6+1/2>=1.

Otherwise some triangle-support edge e0 has x_e0=0. A triangle through it has another edge e with x_e>=1/2. Let H=G-e. Restricting x gives nu*(H)=tau*(H)<=nu*(G)-x_e. If H still has a triangle, induction and tau(G)<=tau(H)+1 yield tau(G)<=2nu*(H)<=2nu*(G)-1. If H is triangle-free, tau(G)=1 and nu*(G)>=1, proving the claim. QED. A single triangle attains the additive constant one.

This refinement is not required to exclude positive quadratic amplification; the original published K inequality already suffices. The stronger statement should not be attributed as the literal wording of Krivelevich's theorem.

## 8. Remaining obligation and next-campaign assessment

A successful amplifier must escape these exact interfaces: it must force additional covering requirements beyond the pullback of a base cover, while controlling *every* resulting packing by a genuinely integral argument. Positive quadratic preservation cannot come from merely keeping copied components' packings isolated, using fractional edge-capacity certificates, suppressing o(N^2) closure edges, or choosing a dense partial-slope set.

No precise consistency gadget outside this class has been constructed here with a substantial packing upper bound. Naming “consistency” or “tensoring” is not a remaining theorem worth a long campaign on its own. Accordingly this scout does **not** recommend a longer positive Route C campaign at present. A short independent verification of C1/C2 and the 16-vertex witness is the concrete next task; it validates a limitation, not general Tuza. Any later positive C proposal should first specify full actual triangles and a cover lower bound that exceeds the copied-cover baseline, then identify the nonfractional packing argument. That requirement is a screening criterion, not a proposed solution.

No new Lean proof was attempted; LEAN_PROVED: NOT_RUN. Independent final verification: NOT_RUN. This note is ordinary reasoning with named deep published inputs and exact finite checks.
