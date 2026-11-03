# Track B — favorable minimum-cover selection

Status: ordinary proof discovery; E and S remain UNPROVED. This track is materially about varying globally minimum covers. Requested delegated configuration: GPT-6 Astra / Ultra; tool-level requested configuration is not serving-model attestation. Canonical AGENTS, migration handoff/report, TARGETS_AND_CLOCK, and the TUZA-13 report/structural notes were read. No source workspace is modified.

## Frozen targets and selection

For a finite simple graph G, C is a globally minimum actual-edge triangle cover, A(C)=T_1(C) union T_2(C), and k(C) is the maximum number of pairwise graph-edge-disjoint members of A(C). Put K(G)=max_C k(C), over all globally minimum covers. E asserts tau(G)<=2K(G).

Select C first to maximize k(C), then, if useful, minimize the number of all-red triangles. This lexicographic selection exists because G is finite. Neither maximizing k nor minimizing all-red triangles, by itself, supplies an exchange that preserves cover cardinality.

## B1. Full maximum-packing compatibility is false

Literal rejected auxiliary statement: `For every G, max_C k(C)=nu(G)`, with C ranging over all globally minimum covers.

K7 refutes it. Every minimum cover is the union of a K3 and K4 on a 3+4 vertex partition, so there are 35 minimum covers, each of size nine. The twelve remaining edges form K3,4. Every eligible triangle uses exactly two of these twelve blue edges, hence k(C)<=6. Six are attainable, while nu(K7)=7. Therefore favorable minimum-cover selection cannot aim to preserve a full maximum packing. This is a failure of the auxiliary statement, not of E: its required threshold is five.

The still stronger statement concerning an arbitrary prescribed packing already fails in a central triangle with at least two private pages on each edge: the three central edges form its unique minimum cover, and the prescribed singleton central triangle is all-red for it. The full eligible packing can have three triangles, so this too does not challenge E.

## B2. Minimum-edge existential failures have odd, one-unit deficiency

**Frozen statement.** Suppose E fails, and choose a failing graph G with the fewest graph edges. Then

    tau(G)=2K(G)+1.

**Proof.** Write c=tau(G). Choose an edge e in any minimum cover. The standard cover deletion identity gives tau(G-e)=c-1: deletion of e from that cover is an upper bound; adjoining e to any cover of G-e gives the reverse inequality. Since G-e has fewer edges, E holds there. Choose a globally minimum cover D of G-e and an eligible packing P with |P|>=ceil((c-1)/2). Then C'=D union {e} covers G, has exactly c edges, and is globally minimum. Every triangle of P avoids e and retains its exact red count, so it stays eligible for C'. Thus K(G)>=ceil((c-1)/2). Failure gives 2K(G)<c. For even c these inequalities contradict each other; for odd c they imply c=2K(G)+1. QED.

This does **not** imply that every edge is tau-critical, that every minimum cover has k(C)=K(G), or that one fixed favorable cover satisfies every avoidance condition below.

## B3. Prescribed-red-set extension, with exact quantifiers

**Frozen statement.** Under B2, write c=2r+1, r=K(G). Let S be a nonempty edge set contained in at least one globally minimum cover of G. There are a globally minimum cover C_S containing S and an eligible packing P_S for C_S that avoids every edge of S and has

    |P_S| >= ceil((c-|S|)/2).

In particular, if 1<=|S|<=2, one can choose |P_S|=r and k(C_S)=r.

**Proof.** Fix any minimum cover containing S. Deleting S lowers tau exactly by |S|, by the same extension argument as B2. E holds on G-S because it has fewer edges. Choose its good minimum cover D and packing P_S. C_S=D union S covers G and has exactly c edges; its cardinality is exact because no edge of S exists in G-S. Hence C_S is globally minimum. Old triangles avoid S and keep their red counts. For |S|<=2, the lower bound is r, while every eligible packing in any minimum cover of the failing G has size at most K(G)=r. QED.

The quantifier is `for every S there exist C_S and P_S`. It is not `there exists one C for every S there exists P`. This prevents importing the stronger red-pair-avoidance conclusion for a smallest failing pair of S into an E proof.

## B4. Valid one-edge exchange and all-red migration

**Frozen statement.** Let C be any globally minimum triangle cover, e=uv in C, and let W_C(e) be the vertices w for which uvw has exactly the red edge e. Then W_C(e) is nonempty. A one-for-one exchange C'=(C minus {e}) union {b}, with b blue, is a cover if and only if W_C(e)={w} and b is one of uw,vw.

**Proof.** Minimality gives a private triangle for each e. Distinct private triangles on e have disjoint pairs of blue edges, so one blue edge can hit all of them exactly when the private triangle is unique and b lies in its blue pair. Triangles with another red edge keep it, so hitting the private triangle is sufficient. The exchange removes one red edge and adds one distinct blue edge, hence |C'|=|C| and C' is globally minimum. QED.

For an eligible packing P, the only way this exchange makes an old member of P ineligible is that P contains a two-red triangle Q whose sole blue edge is b and which avoids e. It becomes all-red. Cover preservation already excludes a newly all-blue old triangle. Since P is edge-disjoint, at most one old member is lost.

Consequently, if e lies in an all-red triangle T disjoint from P, then T becomes eligible after the exchange. If no such Q exists, P union {T} is an eligible packing for C' and increases packing size; if P is maximum for C, then k(C')>=k(C)+1. If Q exists, replacing Q by T preserves packing cardinality, and the all-red obstruction has moved from T to Q. One cannot discard this migration term.

**First unresolved step in this route.** No argument has been obtained that forces an augmenting sequence of these equal-cardinality exchanges, or proves that a closed migration cycle contradicts global minimum-cover optimality. Moreover a minimum cover can have every red edge in at least two private triangles (including a unique minimum cover), in which case this one-edge exchange mechanism has no legal first move. Larger exchanges are necessary.

## B5. Why star-only cover optimality is insufficient

A local fact is valid: for a vertex v, keep all cover choices outside its star fixed. Let H_v be the graph on N_G(v) whose edges xy are blue edges of G. The red incident edges vx correspond exactly to a vertex cover of H_v. Global minimum optimality implies that this incident selection is a minimum vertex cover of H_v; replacing it by a smaller such cover would preserve every triangle and reduce C.

The tempting relaxation `a cover optimal under every single-star replacement satisfies |C|<=2k(C)` is false. In K5, color a 5-cycle red and its complementary 5-cycle blue. C has size five and covers every triangle, with no all-red triangles, so k(C)=nu(K5)=2. At every vertex H_v is a path on four vertices, whose minimum vertex-cover size is two, exactly the two red incident edges. Thus the cover is optimal under all star replacements, but 5>2*2. It is not globally minimum: tau(K5)=4. A nonstar exchange removes two disjoint red edges and adds one blue edge. This obstruction is symbolic and does not rest on a finite search.

## B6. A scoped positive theorem: triangle-free cones

**Frozen statement.** If G is the cone over a triangle-free graph H, then S holds for every globally minimum triangle cover of G.

**Proof.** Every actual triangle is axy for one base edge xy of H, where a is the cone apex. Such triangles are edge-disjoint precisely when their base edges are a matching in H, so nu(G)=nu(H). A base edge belongs to only its own apex triangle. Therefore a globally minimum cover cannot contain that base edge together with either of its incident spokes: the base edge would be redundant. In particular no triangle is all-red, and A(C) is the full triangle family for every minimum cover C.

The triangle cover number of G equals the vertex-cover number of H. A vertex cover of H gives a spoke cover of G. Conversely, from any triangle cover of G, take the base vertices whose spokes are selected and, for each selected base edge, add either endpoint. The resulting vertex set covers H and has cardinality at most the number of selected graph edges. Thus tau(G)=tau_vertex(H). Endpoints of a maximal matching form a vertex cover, so tau_vertex(H)<=2nu(H)=2k(C). QED.

This explains why triangle-free cone controls, including the Clebsch cone, cannot refute S. It does not remove the need for two-red triangles: their matchings may be essential even though all-red triangles are absent.

## Current status

B2–B4 and B6 are ordinary proved reductions or scoped statements; independent review and final statuses appear below. B1 and B5 are explicit failures of stronger auxiliary routes. No assertion proves E or S in general. The exact global blue-replacement characterization is being developed independently by the coordinator and should be used for larger exchanges rather than silently extending B4.

## B7. Two packed T2 blockers for a unique private witness

**Frozen statement (18:21 UTC), PROVED_ORDINARY.** Choose a globally minimum cover C maximizing k(C) over all globally minimum covers, and let P be any maximum eligible packing for C. If an all-red triangle T is graph-edge-disjoint from P and e is an edge of T with exactly one private triangle Q, then each of the two blue edges of Q lies in a member of P with exactly two red edges. The two packed triangles so obtained are distinct.

**Proof.** For either blue edge b of Q, B4 gives a globally minimum C'=(C minus {e}) union {b}. Triangle T becomes two-red. If no packed T2 has sole blue edge b, B4 shows all of P stays eligible; P union {T} then contradicts the choice of C maximizing k. Thus such a packed T2 exists for each b. A triangle containing both blue edges of Q would equal Q itself, which has one red edge, so the two T2 blockers are distinct. QED.

This is a necessary condition for a favorable-cover obstruction, not a proof that the obstruction is impossible. In particular, the inference that no such T can exist remains unproved.

## B8. A literal all-red migration cycle at lexicographically favorable covers

**Frozen auxiliary candidate to be falsified (18:21 UTC).** `Among minimum covers maximizing k and then minimizing the number of all-red triangles, legal single-edge swaps that break an all-red triangle must make strict progress in the all-red count.`

Proposed exact obstruction: take a K4 on vertices {0,1,2,3}; think of 3 as its apex and {0,1,2} as its base triangle. For each star edge 3i, i=0,1,2, add two fresh degree-two vertices adjacent exactly to 3 and i. There are ten vertices. The six pages have distinct fresh vertices.

Every minimum cover must contain all three star edges 30,31,32. Indeed, if q star edges are omitted, covering their page triangles requires at least 2q distinct page edges; covering the remaining page pairs requires at least 3-q further edges; and the base triangle requires a distinct base edge. Thus any cover omitting q star edges costs at least 4+q. The minimum covers are exactly

    {30,31,32,01}, {30,31,32,02}, {30,31,32,12}.

Each has size four and exactly one all-red triangle. Each has k=4: take the base triangle and one page triangle per star edge; these are graph-edge-disjoint. The upper bound is k<=|C|=4. Thus all three covers are favorable for both proposed potentials. Their only one-edge swaps rotate the selected red edge around the base triangle, whose unique private triangle is that base triangle. Each swap breaks one all-red K4 face and creates another. The three cover states form a cycle with constant k and constant all-red count.

Independent exhaustive checks in checks/track_b_small.py and evidence/track_b_small.json confirm the literal construction, all three optimum covers, k=4, and exactly one all-red triangle for each. This is REFUTED_EXACT as an auxiliary claim. Scope limitation: its all-red triangle intersects every maximum eligible packing, so it does **not** refute a progress assertion that additionally assumes an all-red triangle disjoint from the packing. B7 remains the relevant obstruction in that sharper setting.

## B9. Last bounded bridge candidate: deleting a unique private triangle

**Originally frozen candidate before any targeted test; subsequently REFUTED_EXACT below.** Let C be a globally minimum triangle cover of G, let e in C have exactly one actual private triangle Q, and let G-E(Q) denote deletion of all three graph edges of Q. Then

    tau(G-E(Q)) >= tau(G)-2.

The elementary bounds without this claim are tau(G)-3 <= tau(G-E(Q)) <= tau(G)-1. The upper bound follows because C minus {e} covers the remaining graph. The candidate would exclude the maximum possible loss three around a unique private witness.

Even if true, this does not automatically prove a packing induction. The inherited cover C minus {e} need not be minimum when the loss is two, and a favorable minimum cover selected in the smaller graph need not lift to an optimum cover of G with all old packed triangles still eligible. These are separate gaps.

Authorized test scope: only all minimum covers and unique witnesses in the fixed existing Track A controls; no mutation census or new broad search. If it survives, attempt an ordinary symbolic proof; survival alone is not proof.

### B9 exact refutation and failed proof step

**Final status: REFUTED_EXACT_AUXILIARY.** The initial bounded test examined all 264 minimum covers in eight fixed controls, including 129 unique-witness instances and five distinct residual graphs. Every instance had deletion loss one. The complete initial results are preserved in `evidence/track_b_unique_deletion.json`; they do not establish B9. The eight-control list omitted the separate auxiliary cover-drop control.

The already known TUZA-13 nine-vertex cover-drop graph supplies a new coloring and cross-cover refutation of B9. Its literal edges are

    01,02,03,04,07,08,12,13,14,15,23,25,26,28,36,37,38,45,47,56,68.

Its complete actual triangle family is

    012,013,014,023,028,037,038,047,123,125,145,236,238,256,268,368.

Use the three sets

    D={03,04,12,15,25,28,36},
    F={13,07,02,14,38,26},
    C=F union {12}={02,07,12,13,14,26,38}.

The original D is a globally minimum cover of size seven. F covers every triangle except Q=125 and is disjoint from E(Q). Consequently C is a seven-edge cover and is also globally minimum. Edge 12 has exactly the private triangle 125 for C: its other actual triangles 012 and 123 also contain red edges 02 and 13, respectively. But Q is all-red for the other optimum D.

Deleting E(Q)={12,15,25} leaves the four-edge cover

    D minus E(Q)={03,04,28,36}.

The four graph-edge-disjoint residual triangles

    013,028,047,236

give the matching lower bound. Thus the residual cover and packing numbers are both four, and the loss is exactly 7-4=3. The inherited six-edge cover C minus {12}=F is two edges larger than the residual optimum.

The recolored optimum C has eligible packing six, witnessed by

    013,028,047,145,256,368.

The central half-cover threshold is only four, so this is not a failure of S or E. It is a failure of a deletion/induction bridge.

`checks/track_b_unique_deletion_refutation.py` regenerates all actual triangles without importing the source engine, rejects all 54,264 six-edge full covers, rejects all 816 three-edge residual covers, and checks both explicit optima and the uniqueness statement. It independently computes the eligible maximum six and residual maximum four. The complete literal certificate is `evidence/track_b_unique_deletion_refutation.json`.

A useful exact reformulation explains the failure. For any actual triangle Q, equality tau(G-E(Q))=tau(G)-3 is equivalent to E(Q) being contained in some minimum cover: one direction restricts that minimum cover, and the other adjoins all three deleted edges to a residual optimum. Hence B9 was exactly the claim that a triangle uniquely private for one optimum is never all-red for another. The two optima C and D above directly contradict it. This reuses a known graph for a new, explicitly different auxiliary statement; it is not presented as a newly discovered central counterexample.

## Cross-review of Track A

A1 and A2 were independently checked symbolically. Distinct private witnesses with a common blue edge force the red edges to share an endpoint. Completing their opposite endpoints by a blue edge would create an all-blue triangle, so the same red pair cannot support a T2. For unique actual private witnesses, replacing the two red edges by their shared blue edge therefore covers every triangle and saves one edge, contradicting minimum cardinality. Their pairwise edge-disjointness follows. Uniqueness only in a selected witness subfamily is insufficient.

The first A3 refutation has a short decomposition proof. Its graph consists of an edge-disjoint K4 on {0,5,7,8}, a K5 on {1,2,3,4,7}, and exactly three triangles outside those blocks: 246,468,478. Cover costs from the two blocks are at least two and four, and 468 uses only extra edges, so tau is at least seven; the displayed seven-cover achieves it. Every packing has at most one K4 face and two K5 faces. A packing containing the unique private witness 468 can contain neither 246 (shared edge 46) nor 478 (shared edge 48), hence has size at most four. The eligible packing {057,134,237,246,478} has size five. Thus safe prepacking of all unique witnesses fails even though their mutual disjointness is valid.

For A4, the cone construction correctly translates a private triangle into a base edge from its six-vertex independent side to one of fifteen pair vertices. Each selected red spoke has exactly two private witnesses, and every private packing consumes a distinct one of the six blue spokes, so its size is at most six. The claimed alpha=6 certificate on the base is the exact additional premise needed for tau=15; Track B reviewed that reduction but did not claim a second independent enumeration of those independent sets. The structural critic is providing that finite verification. B6 separately explains why the full eligible family of this triangle-free cone still satisfies S.

## Final Track B status and scope

The surviving ordinary results are B2–B4, B6, and B7. B1, B5, B8, and B9 refute precisely stated auxiliary routes. Independent structural review accepted B4–B6, with the B4 maximum-packing qualification corrected above; the coordinator independently derived the existential reduction and reviewed B7. B9 is sent for separate literal verification.

The first general proof gap remains: the exact optimal-cover exchange constraints do not supply an augmenting sequence or a global counting bound. Local swaps may migrate all-red obstructions, their simple potentials can cycle, and a unique private witness does not allow the proposed three-edge deletion induction. The fixed-cover pair-avoidance reductions must not be substituted for the existential statement's `for every S there exists C_S` quantifier.

No further candidate pursuit is part of this track after B9. All tests were targeted at frozen auxiliary statements, Mac-local, and below one second of measured computation individually. No source workspace was edited, no census was replayed, and no publication or remote computation occurred. S, E, and unrestricted Tuza remain unproved here.
