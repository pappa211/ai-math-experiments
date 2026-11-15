# Route B — frozen theorem, limitation, and gate recommendation

Freeze: recorded by filesystem write time; source edition and exact access times are in B_SOURCE_LEDGER.md. This note follows the independent B_INITIAL.md and does not incorporate another scout's mathematical argument. All graphs below are finite and simple; all triangles are actual graph triangles, all packings edge-disjoint, all covers actual-edge sets. General S/E are not assumed.

**Recommendation: DEPRIORITIZE the current global compression candidate.** A scoped exact transfer lemma is proved, but its reduction mechanism is an instance of existing reducing-set machinery. The missing universal existence theorem has no new support. A substantive unbounded limitation explains why enlarging identical-neighbor sets merely to arbitrary independent sets does not fix the dense regime. No unrestricted Tuza result or novelty claim follows.

## B1. Exact saturated-twin compression — PROVED_ORDINARY

Let X be a nonempty independent subset of V(G), with N_G(x)=S for every x in X. Set L=G[S], B=E(L), q=|B|, and R=(G-X)-B. Suppose an explicit proper edge coloring c:B -> X exists. Empty B is allowed. Then

    nu(G)=q+nu(R),
    tau(G)=q+tau(R),
    delta(R)=delta(G)+q.

Thus delta(G)>0 implies delta(R)>0. The integer measure |V|+|E| strictly decreases. There are no restrictions on edges or vertices outside X other than the displayed exact-neighborhood hypothesis: S may have arbitrary outside neighbors, arbitrary triangles, and arbitrary internal edges.

Proof. For every uv in B select the actual triangle c(uv)uv. Distinct bases are distinct edges. Within each color class the bases form a matching, so their two spokes are distinct. Different colors use different apex vertices, so their spokes are also distinct. Independence of X ensures that no spoke is a base. These q triangles form a packing Q entirely on edges outside E(R).

Every actual triangle absent from R contains an edge in B. Indeed, a triangle meeting X has exactly one X vertex and two S vertices, so its third edge is in B. A triangle avoiding X is absent precisely if it uses B. This includes every crossing triangle with two S vertices and an arbitrary outside vertex, and triangles entirely in S. There is no planted-triangle restriction.

A packing P in G splits into triangles of R and absent triangles. At most q absent triangles occur, because each contains a B edge and their B edges are disjoint. Hence |P|<=nu(R)+q. Conversely Q can be appended to every packing of R. This proves the packing identity.

For any cover C of G, C intersect E(R) covers every R triangle. Since Q consists of q edge-disjoint triangles wholly outside E(R), at least q edges of C lie outside E(R). Therefore |C|>=tau(R)+q. Conversely B together with any minimum cover of R covers every G triangle by the complete classification above. This proves the cover identity and the deficit equation. No optimum-preservation choice, fractional relaxation, S/E assumption, or equality classification appears. QED.

Unbounded scope is literal: S and the outside graph can have arbitrary order and degree. One can certify the hypothesis using a supplied coloring; no external coloring theorem is needed. Greedy coloring of any nonempty rim with maximum degree d uses at most 2d-1 colors, since a rim edge conflicts with at most 2d-2 others. Thus |X|>=2d-1 is an elementary sufficient bound, not the sharp threshold.

## B2. Boundary states and why no state is silently discarded

The proof treats the entire original G at once. All outside triangles are either retained or are met by B. The q-triangle packing uses no residual edge, so it is compatible with every residual packing, not merely one chosen optimum. Every original packing can be normalized to Q union (P intersect T(R)); the normalization weakly increases size and frees all residual edges previously used by removed triangles.

For covers, arbitrary prescribed or forbidden membership on edges of E(R) is respected: the same lower and upper proof gives the offset q, with infinity for infeasible states. For packings, forbidden residual edges and prescribed residual triangles are respected by normalization. These include the resource constraints needed for the global scalar transfer.

Exact forced residual-edge occupancy is NOT preserved, and no universal boundary-response equality is claimed. For the diamond with edges {01,02,12,03,13}, take X={2}, S={0,1}, B={01}. R has just edges 03,13. G has a packing using edge 03 (triangle 013), whereas R has no triangle and hence no packing using 03. This explicit failed state is retained. The transfer works because it may free an occupied residual edge; it does not promise to keep every occupied boundary bit. In particular, this is not the TUZA-11 kernel advertised as an interchangeable forced-state gadget.

The graph-specific step is the actual triangle/edge-color correspondence on X join S and the fact that every triangle destroyed by removing X uses a real rim edge. Generic deletion-critical identities do not provide this structure. The helper inequality would also be valid for an abstract hypergraph supplied with the corresponding packing/transversal certificate, but it supplies no such certificate for Fano and no global Fano-excluding contradiction.

## B3. Half-saturation and arbitrary independent sets — known-method deduction

Under the B1 hypotheses, it suffices for counterexample preservation that a subset F of B have a proper edge coloring into X and 2|F|>=|B|. Write p=|F|. The apical triangles give nu(G)>=nu(R)+p; B gives tau(G)<=tau(R)+q. Therefore

    delta(R)>=delta(G)+2p-q>=delta(G).

The exact offset identities of B1 are not asserted here. If L is explicitly colored with at most 2|X| colors, take the |X| largest color classes to obtain such F.

More generally, let X be any nonempty independent set, without identical neighborhoods. Put

    B_X = union over x in X of E(G[N(x)]),
    R_X = (G-X)-B_X.

Let rho_X be the largest packing all of whose triangles contain a vertex of X. Each such triangle contains exactly one X vertex. If |B_X|<=2rho_X, the same two transfer inequalities prove delta(R_X)>=delta(G). Every removed triangle is met by B_X, and the selected apical packing uses only deleted spokes and bases. This is a precisely defined extension of the operation, not a new general existence theorem.

## B4. Dense obstruction to this entire enlarged operation — PROVED_ORDINARY

For an n-vertex graph let a=alpha(G) and ell=min_v e(G[N(v)]). If

    ell > a(n-1),

then no nonempty independent X satisfies |B_X|<=2rho_X.

Proof. Since X is nonempty, |B_X|>=ell. The triangles of an apical packing at a fixed x use a matching of its neighborhood, hence number at most floor(d(x)/2). Since X is independent, these categories partition the apical packing. Thus

    2rho_X <= 2 sum_{x in X} floor(d(x)/2)
            <= |X|(n-1) <= a(n-1) < ell <= |B_X|.

Repeated base edges can only lower rho_X. QED.

A concrete unbounded family is G=K_n-M, where M is any nonempty matching and n>=9. Then a=2. If t=|M|, a vertex incident with M has degree n-2 and its link has binom(n-2,2)-(t-1) edges; an unmatched vertex has a larger link. Consequently

    ell >= binom(n-2,2)-floor(n/2)+1 > 2(n-1)  (n>=9).

The last inequality holds at n=9 (18>16), and its left-minus-right difference strictly increases thereafter (check consecutive parity cases, or note its increase is at least n-5). Thus every such graph defeats the all-rims-deleted payment rule for every independent set, not just for false twins. K10-e is explicitly certified in checks/b_compression_results.json: its only nonempty independent sets are ten singletons and the endpoints of the missing edge.

This refutes an UNCONDITIONAL assertion that this rule is always available on dense graphs. It does not refute a statement restricted to hypothetical minimal Tuza counterexamples, because these witnesses have not been asserted to meet that premise. It also does not rule out operations retaining some rim edges, using outside packing exchanges, changing vertices by quotients, or using independently certified residual slack.

## B5. Exact primary-source and older-project comparison

Puleo, arXiv:1308.2211v3 (13 April 2015), Definition 2.1 and Lemma 2.2, gives reducible sets with a local triangle packing, a local cover of size at most twice that packing, and deletion of every packing edge outside the removed vertices. In B3 use V0=X, local cover B_X, and the apical packing. All hypotheses match directly. Therefore B3 is an instance of that established template; B1 supplies a particularly elementary exact equality case. Source PDF and hashes are retained. No new architecture credit is assigned to this accounting.

Puleo, arXiv:1510.07017v4 (6 March 2017), Theorem 1.9, proves Tuza for I_k join H when H is triangle-free; the partial edge-coloring dictionary is explicitly stated before that theorem. B1 differs in allowing arbitrary rim triangles and arbitrary outside attachments, but imposes a strong saturation hypothesis. It is an elementary scoped deduction, not a replacement for that stronger theorem on unsaturated triangle-free joins. The relevant statements, not the whole papers' proofs, were inspected in both primary PDF and HTML renderings on 2026-11-03. Internal PDF/HTML generated date footers differ from arXiv edition metadata; version identifiers and downloaded SHA-256 control the citation.

TUZA-15's target called TWIN concerns mutually adjacent closed hub neighborhoods with a specified seven-vertex shape, a 5/10 reduction, residual literal K4/K5 support, and strict restoration. B1 instead concerns independent twins, uses no tight-residual classification, and admits arbitrary outside graphs. These are different local hypotheses. Nevertheless TUZA-15 M2 and the earlier reducing-set method already contain the underlying compatible-packing/cover accounting. The exact B1 formulas are a fresh derivation this mission; historical originality is UNESTABLISHED and they do not justify ADVANCE by themselves.

TUZA-11's nested-apex note explicitly credits the uniform independent-apex dictionary to Puleo and records a failed saturation charging rule for nonuniform lists. B1 does not repair that failure: it demands enough colors to cover every rim edge. TUZA-11's forced-spine book state and TUZA-12's four-port obstruction likewise forbid promoting B1 to arbitrary forced-state equivalence.

## B6. Tests and their scope

The standard-library checker checks six small actual graphs with exact exhaustive recurrences and retains every edge, all triangles, an optimum packing and cover, and an optimality-method statement. Saturated triangle rim with a crossing outside vertex and a retained outside triangle has exact offset (3,3), so the test includes both kinds of outside interactions. K4 with one apex violates the saturation hypothesis and has offset (1,2), not (3,3). Two apices over a triangle illustrate B3 with offset (2,3). The diamond exhibits the failed forced-occupancy state. No floating solver, broad census, or tool installation was used.

Mandatory battery application to B1, using the coordinator's independently reconstructed full graphs:

| Control | B1 applicability / result |
|---|---|
| Empty graph | No nonempty X; terminal case |
| Triangle | Applies with any singleton apex; q=1 and exact offset (1,1) |
| Books | Applies to all page tips; q=1 and exact offset (1,1) |
| K4, K5, K10, K11 | NOT_APPLICABLE: all equal-open-neighborhood classes are singletons, rim maximum degree exceeds one |
| VB27 | NOT_APPLICABLE: size-two twin classes have rim degree eight; apex rim degree eight |
| Clebsch cone | NOT_APPLICABLE: singleton class rim degree at least five |
| K4 square K5 | NOT_APPLICABLE: singleton rim has a K3 and K4, degree at least three |
| Shared-vertex K4/K5 blocks | NOT_APPLICABLE in the supplied control: singleton rims include clique components of degree at least two |
| Four-port G | NOT_APPLICABLE |
| Four-port H | Applies at vertex 3: its link is the two-edge matching {07,26}; q=2. This does not restore the deleted diagonals |
| Abstract Fano | NOT_APPLICABLE as an actual graph; demonstrates that generic criticality cannot supply the module |
| Certified Baron–Kahn finite instance | NOT_AVAILABLE in the coordinator control inventory |

Necessary obstruction used in this table: a proper coloring into |X| colors requires Delta(L)<=|X|. Checking maximal equal-open-neighborhood classes suffices; any smaller class has fewer colors and the same rim. No outside-hypothesis graph is counted as a refutation.

## B7. Bridge to unrestricted Tuza and decision

A hypothetical complete proof would choose a minimum counterexample under |V|+|E|, prove it contains a configuration satisfying B3 or another explicit compression, apply the counterexample-preserving map, and contradict minimality. Terminal graphs need an independently established Tuza theorem. The unproved universal existence assertion is the whole remaining bridge; minimality does not prove it. Dense obstruction B4 makes it implausible that the current local mechanism alone has a useful global closure theorem.

There is no credible, sharply constrained next GLOBAL theorem from this scout that is demonstrably easier than Tuza. Merely asking every counterexample to have a reducible set would restate the missing problem, and calling B1 an unbounded lemma would overstate progress. If the coordinator selects another route, retain B1 as a correct optional simplification and B4 as an early rejection test. Any future compression campaign must specify a materially different operation that survives the dense low-independence obstruction, while tracking all actual crossing triangles and global packing changes. The immediate kill criterion for a proposed all-rim deletion rule is B4, before computation.

Evidence labels: B1/B2/B4 PROVED_ORDINARY; B3 KNOWN_INPUT mechanism with a self-contained derivation; small tests FINITE_CHECKED; global applicability SPECULATIVE/UNPROVED; independent final audit NOT_RUN; Lean NOT_RUN. No S/E, equality classification, or unrestricted result is established here.
