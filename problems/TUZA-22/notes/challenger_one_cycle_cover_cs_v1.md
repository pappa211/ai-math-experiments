> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Combined CS for every graph admitting a triangle cover with at most one cycle

Status: PROOF_USING_FINITE_CERTIFICATES, frozen for fresh adversarial review. The ordinary reductions and all-attachment certificate rules are separately proved. Three exact finite interfaces have independent complete-domain and literal-certificate validation. No unrestricted Tuza/CS or all-size formal verification is claimed.

## Theorem and notation

Let G be any finite simple graph admitting an actual triangle-edge cover C whose selected graph has TOTAL cycle rank at most one. The cover may be disconnected and need not be minimum. Then

    tau(G)<=2nu(G),

with equality if and only if every nonempty shared-edge-connected component of the ENTIRE actual triangle family has literal K4 or K5 edge support, the property B(G).

Triangle-free background edges and vertex sharing between distinct triangle components are permitted. All actual crossing triangles count. The triangle-free case gives equality0=0 and vacuous B. The reverse implication B=>tau=2nu is the elementary block additivity with K4 values(1,2) and K5 values(2,4), and requires no cover assumption.

The class consists of graphs admitting SOME such cover; no minimum-cover shape is assumed. It includes arbitrary forest covers and a single arbitrary selected cycle with attached or separate selected trees. It is not the class of all pseudoforest covers with arbitrarily many cycle components.

## 1. Heredity and the ordinary inequality

The existence-of-cover class is hereditary under edge deletion: restrict C to surviving edges. Every surviving triangle is still met, and selected cycle rank cannot increase. Vertex deletion is a special case. This is why class-local minimality is legitimate; no assertion about minimum covers being hereditary is used.

The inequality already has an ordinary proof. If C is a forest, use the accepted forest-cover CS theorem. Otherwise remove any selected cycle edge e and put H=G-e. The restricted cover is a forest, so H satisfies CS. If tau(H)<2nu(H), integrality gives

    tau(G)<=tau(H)+1<=2nu(H)<=2nu(G).

If tau(H)=2nu(H), then B(H). If e creates no triangle, the triangle family is unchanged. If e creates a triangle abx, its two old spokes cannot lie in the same old clique component, since that clique would already contain ab. Maximum old clique packings avoid the at-most-one spoke in each affected block, so the new triangle appends. Thus nu(G)>=nu(H)+1 while tau(G)<=2nu(H)+1, giving strictness. This proves the inequality at all orders.

Suppose the equality classification fails and choose such a graph G with the fewest edges, discarding isolates. It is tight, tau(G)=2nu(G), and every proper edge subgraph belongs to the same hereditary class and satisfies CS. The authenticated class-local M0 consequences apply: every actual edge has triangle codegree at least two, every nonempty closed link component has minimum degree at least two and at least five vertices, and a genuine balanced packing/cover deletion yields a B residual. These are the declared ordinary minimality inputs; no unrestricted CS is assumed.

## 2. Any selected cover becomes a Hamiltonian cycle

A forest cover would already imply CS, so C has exactly one selected cycle.

If C has a leaf v with sole selected neighbor w, every link edge at v avoiding w belongs to C: its actual triangle through v has neither spoke selected. The accepted ordinary cyclic-component deletion theorem says every component of a closed link after deleting a vertex is cyclic. Since C has only one cycle in total, the whole link at v is connected and its deletion of w is connected unicyclic. The accepted ORDINARY full apex-unicyclic exclusion contradicts this. The earlier374-record proof of that local exclusion is preserved but is not a dependency: its ordinary v2 uses paid-triangle collapse and two explicit small-shape arguments.

No vertex can have selected degree zero. For such a vertex x, its full link lies in C and has minimum degree at least two. A subgraph of a selected rank-one graph with minimum degree at least two must be exactly its unique cycle: any tree component or attachment would have a leaf. A three/four-cycle violates link robustness, and a longer cycle is an apex-forest link after deleting any rim vertex, already ordinarily excluded.

Thus every vertex has positive selected degree and C has no leaves. A rank-one graph with those properties is one spanning cycle: every other nontrivial selected component would be a tree with a leaf. Therefore C is a HAMILTONIAN CYCLE of G. This argument applies to any selected cover with the stated rank, not just an optimum cover.

## 3. K5-freeness and the two-apex path-forest link

The graph G is K5-free. Suppose a literal K5 lies on a proper five-vertex subset. The restriction of a spanning cycle to that proper subset is a forest with at most four edges, yet it must cover every K5 triangle. A triangle-free graph on five vertices has at most six edges: maximum degree at most two gives at most five edges; degree four gives a four-edge star; degree three gives its three independent neighbors and at most three further edges. At six edges the latter case is exactly K2,3. Hence a K5 triangle cover of at most four edges has exactly four and is the complement K3 disjoint K2, not a forest. Contradiction. If G has exactly five vertices and contains K5, then G=K5 and is already B. Smaller orders are also excluded by the authenticated closed-link robustness. Consequently every actual link in G is K4-free.

Fix a vertex h and its two selected cycle neighbors a,b. Every edge of the link avoiding a,b belongs to C. Any closed component containing at most one of a,b is an apex-forest link (or a forest), excluded by the accepted ordinary apex-forest theorem and minimum link degree. Thus the WHOLE link L at h is connected and contains both a,b. Its induced remainder

    F=L-{a,b}

is a union of paths and isolates.

The independently reviewed ordinary two-apex theorem excludes nu_match(F)>=4. Its matching-three sharpening excludes all nonperfect cases and reduces the perfect case to exactly F=P6 with ab absent. The independently validated fixed P6 interface excludes all2018 eligible choices among4096 ordered apex neighborhoods. Thus nu_match(F)<=2. The exact finite dependency is retained here; the preceding two ordinary theorems are not silently strengthened.

There is at most one F isolate. Two would each have exactly the two L-neighbors a,b and would give two nondirect parallel length-two paths with degree-two internal vertices, prohibited by the ordinary parallel-thread theorem.

If F has no nontrivial path, it is empty or one isolate and L has at most three vertices, contrary to robustness. Otherwise the COMPLETE list of nontrivial components is

    P2, P3, P4, P5, P2+P2, P2+P3, P3+P3,

with zero or one isolate. A matching-one path has order2 or3, a matching-two path order4 or5, and at most two nontrivial components fit the matching budget. This proves the fourteen-shape domain at all orders. It has67360 raw ordered apex-neighborhood/optional-ab states, at most nine link vertices. The only filters are actual minimum degree>=2, connectivity and K4-freeness, leaving8220 states. No symmetry quotient or other presumed equality property is imposed.

## 4. The independent isolate subdomain and a global two-link rule

One local configuration in this domain is genuinely non-WKE: F=P5, with nonadjacent apices both adjacent to the path endpoints and their immediate neighbors, but not the middle vertex. Its exact ordinary non-WKE proof is preserved. It cannot be resolved by pretending that every two-apex-forest link admits a WKE tuple.

Instead, first exclude a SEPARATE local subdomain: F is one of the seven nontrivial path forests above plus exactly one isolate, and ab is absent. All26944 raw ordered choices and2422 eligible states were independently regenerated and certified using ONLY ordinary local rules. None of those records uses a global two-link rule or the final fourteen-shape theorem. This establishes the local one-isolate/no-apex-edge exclusion with an explicit finite premise.

Now suppose v is an internal vertex of an F path in L_h and deg_F(v)=deg_L_h(v)=2. Write its two F-neighbors as u,w. The edges uv,vw belong to the selected Hamiltonian cycle, so u,w are precisely v's two selected neighbors; uw is absent because F is an actual path forest. The full common-neighbor identity gives

    N_(L_v)(h)=N_G(v) intersect N_G(h)={u,w}.

Thus h is an isolate in the FULL neighboring link remainder L_v-{u,w}, with nonadjacent apices u,w. Section3 applies to this neighboring vertex as well, placing its entire link in the independently excluded isolate subdomain (or the already impossible three-vertex boundary). This contradiction proves the global rule:

    An internal F-path vertex cannot have full-link degree two.

The rule is valid in the Hamiltonian-cycle-cover minimum-failure context, not for arbitrary isolated literal graphs. All unknown outside vertices and codegree-forced pages are included in the FULL neighboring link. It excludes the non-WKE P5 boundary through its middle vertex without fabricating a local WKE certificate.

## 5. Ordinary meanings of every final certificate

For the WKE-based rules, the record supplies an actual L matching P and a vertex cover Q of R=L-P, with |Q|<=|P|=r. Delete all hub spokes into the CLOSED link and all P bases. The r hub triangles on P are edge-disjoint and use only deleted edges. Every lost non-hub triangle meets P, including pages with arbitrary outside apices; every other lost hub triangle has a rim in P or meets Q. Hence P union hQ is a complete loss cover. Proper-subgraph CS yields strictness or a literal B residual K with nu(K)=nu(G)-r.

The final ten certificate types have these exact meanings:

1. ORDINARY_BRANCH_AT_MOST_3 checks the actual degree count and invokes the accepted ordinary all-size three-branch closed-link exclusion.
2. ORDINARY_APEX_UNICYCLIC supplies w, reconstructs all edges of L-w, and checks that this remainder is connected with equal vertex/edge counts. The accepted ordinary full apex-unicyclic theorem applies.
3. GLOBAL_CYCLE_COVER_INTERNAL_VERTEX supplies the internal F vertex and verifies the full degree-two condition from Section4. Its dependency is the separately independently validated isolate theorem and ordinary full-link identity.
4. ORDINARY_PARALLEL_DEGREE_TWO_TWINS supplies two distinct actual degree-two vertices with the same two neighbors. Their two nondirect length-two paths have degree-two internal vertices, so the accepted ordinary parallel-thread theorem applies with all outside attachments retained.
5. STRICT has |Q|<|P| and gives an immediate strict total cover.
6. S_COLLAPSE supplies S with L-S triangle-free and exact outside-S P mates Z, and verifies r>|S|+|Z|. Every surviving edge of L-S off Z is supported in K; each old block contains at most one such edge, so they can all enter minimum old covers simultaneously. The remaining hub rims are covered by S union Z, giving strictness.
7. PAID_TRIANGLE_COLLAPSE supplies ALL actual triangles of L-S and verifies r>|S|+|Z|+t, where t is their count. The ordinary paid theorem prescribes every supported residual edge in old clique covers at cost at most one per intact triangle, and covers unsupported edges using one opposite vertex per broken triangle. It imposes no disjointness hypothesis on those triangles.
8. B_INCOMPATIBLE supplies an actual shared-edge-connected R triangle component whose support is not a complete K_t,3<=t<=5. All its triangles would lie in one old block, whose L intersection is a clique and contributes all its triangles, a contradiction.
9. TF_RESIDUAL_EQUAL_MATCHING checks R is triangle-free and supplies an R matching of size at least r. The independently reviewed ordinary equal-residual-matching theorem excludes this. Its proof audits the whole cone and outside pages; no bipartiteness is inferred merely from triangle-freeness.
10. RIM supplies an actual L triangle T meeting P and an actual matching M in L-E(T), |M|>=r. Its hub triangles plus T are edge-disjoint. For EVERY residual clique C of sizes2..5, the ENTIRE surviving footprint (M union E(T)) intersect E(C) has at most two edges, incident if two. Every old block's L intersection is such a clique, so maximum old packings avoid the whole footprint simultaneously. Appending at least r+1 triangles contradicts nu(K)=nu(G)-r. Intersections of size0/1 contribute no rim edge.

The first four rules are independent ordinary/global theorem applications and do not pretend to supply WKE. All finite tests reconstruct actual graph edges, triangles and cliques. Arbitrarily large outside attachments are covered by the stated ordinary semantics, not enumerated.

## 6. Complete finite validation and contradiction

The final producer certified all8220 eligible states with zero UNKNOWN:

| type | count |
|---|---:|
|ORDINARY_BRANCH_AT_MOST_3|1878|
|ORDINARY_APEX_UNICYCLIC|1448|
|GLOBAL_CYCLE_COVER_INTERNAL_VERTEX|2333|
|ORDINARY_PARALLEL_DEGREE_TWO_TWINS|1014|
|S_COLLAPSE|238|
|STRICT|198|
|RIM|159|
|PAID_TRIANGLE_COLLAPSE|742|
|TF_RESIDUAL_EQUAL_MATCHING|123|
|B_INCOMPATIBLE|87|

The independently authored coordinator validator regenerated the path partitions, all67360 ordered choices and exact8220-key eligible domain;57954 were rejected for degree/connectivity and1186 for K4-freeness. It imported no producer code. It checked every literal matching, cover, actual triangle count, residual component, full RIM clique footprint, residual matching, theorem hash, parallel-twin witness and global internal-vertex premise. Eight damaged controls were rejected, including an apex falsely used as an internal F vertex, duplicated parallel internal vertex, false unicyclic remainder, omitted paid triangle, non-residual matching, false rim triangle, omitted domain record and wrong apex-edge bit.

Its status is INDEPENDENTLY_VALIDATED_COMPLETE_FINITE_INTERFACE,8220 records,0UNKNOWN. Producer monitoring was1.077020s and102.625MiB; independent validation1.436906s and159.96875MiB, both below60s/2200MiB. The earlier fixed-P62018 interface and isolate2422 interface have separate independent validators and damaged controls.

Every possible actual L in Section3 is therefore excluded by one of the ten valid rules. This contradicts the smallest non-B equality failure. The theorem follows. Together with the already proved inequality and elementary B reverse implication, this is combined CS throughout the stated hereditary cover class.

## 7. Noncircular dependency graph and honest boundaries

The logical order is:

- ordinary forest-cover CS, class-local minimality, apex-forest/apex-unicyclic and local certificate rules;
- ordinary two-apex large-matching and matching-three reductions;
- independently validated P6 interface, yielding matching number at most two;
- ordinary Hamiltonian-cover/K5-free/fourteen-shape domain derivation;
- independently validated one-isolate subdomain, using only local ordinary rules;
- ordinary two-link identity plus that isolate theorem, yielding the global internal-vertex rule;
- independently validated COMPLETE fourteen-shape interface, now allowed to use that global rule.

Neither the P6 nor isolate interface uses the final global rule or assumes the theorem being proved. Proper-subgraph CS in a hypothetical smallest class counterexample is legitimate hereditary minimality, not circular use of the final class result.

Original-domain v1 stopped at a known non-WKE W5 omitted from its vocabulary; v2 stopped at the genuine P5 non-WKE boundary; v3 stopped at an already ordinary parallel-thread witness. Those immutable UNKNOWN records remain UNKNOWN at their original vocabularies. The same domain was revisited only after a precise accepted theorem rule or the new independently grounded two-link mechanism was added. No graph-order expansion or survival-to-theorem inference occurred.

The result does not prove that every graph admits a cover of cycle rank at most one. It does not resolve arbitrary pseudoforest covers, unrestricted Tuza, unrestricted CS, or original H-D. It supplies the new necessary condition that every triangle cover of an unrestricted minimum-CS failure has selected cycle rank at least two. The independent ANY tree/K3-cover theorem remains a different all-size cover class; no containment between those two classes is silently claimed.

## 8. Frozen direct sources and finite artifacts

Ordinary sources and scoped reductions:
- forest_triangle_cover_cs_v1.md:c4c50c12294a609d00ea49fee692c3328f489826173d07defc2e08e040f63893;
- one_cycle_cover_tuza_v1.md:e17c80362c3916da953f3dd5041dd5b4b4c228a244e38c564265ac25ac97a77f;
- apex_unicyclic_full_exclusion_ordinary_v2.md:3adee37d0c9badaeec2b57088b694816bd811eef727dbcf2d5d9f4576c4e43c4;
- one_cycle_cover_structural_restrictions_v2.md:7babfa30ce8a867763d4e28db8a5a1a0a3042dde7774629d8e5570169c1c5a20;
- link_excess_and_one_cycle_leaf_v1.md:46d361c2beabf6459cf97be797f65dfa90df419959173c844af24552c11b393b;
- apex_forest_perfect_link_exclusion_v2.md:e82d2ea2eaeb42b3a91b67ddc4a52a30ce83e01f8e065a208f341d1cbf3052a6;
- apex_forest_nonperfect_branch_v2.md:c587035bea6883c1a5f80d0fc261be3e02144c84dae1678a50a6dc82d67fec47;
- challenger_two_apex_forest_large_matching_exclusion_v1.md:336006afd3adfa51e842bff9e30544f29a59735b15ac7752763737d3515654e1;
- challenger_two_apex_forest_matching_three_reduction_v1.md:bfff33a3b97a8e7340ed94500ea8bec7903898a0b6214122918091556fc6a630;
- challenger_two_apex_forest_matching_two_bound_v1.md:f93c47f54ab0f74974a67e09d346127751bb3a8e19c05a52b311dcde51126456;
- challenger_cycle_cover_residual_domain_v1.md:4f7f701df00dcaca4efb5a8bcce71c042f1644774483f7ab4f67728ae62add94;
- challenger_cycle_cover_isolate_exclusion_v1.md:e6e3b6faffc1f8deb9039956fe143898ec3abcedba8f57be44f6e65293562807;
- challenger_cycle_cover_two_link_isolate_bridge_v2.md:2e6b54f77b69729f4aa6b3ef6cce4043e432bd7df11f3decc7c1d45717e90db5;
- parallel_thread_link_exclusion_v1.md:6eec22bff2400c5a3c07a43d41649a7b8e0d6e08f31d23c8e6e020c6f82718c4;
- three_branch_cs_link_exclusion_v1.md:dd530b892b10279fda98b195522f1027376deadfbce7a769ae2aec28d62bafa4;
- wke_residual_triangle_count_collapse_v1.md:8143c49ad20f0dc7ef5d9d585be5d759b346be2ff1cf9b31ffab3e6f1cc57865;
- coordinator_TF_residual_equal_matching_exclusion_v1.md:1c40a0c8be58ca926e7f35175448dc80c0d891c22128a6596af9a379775d88b6.

The two finite prerequisite assemblies list all their producer, monitor and independent validator hashes. Their independent results are evidence/coordinator_p6_interface_validation.json:9b3747018fef9a0282afd106af3e209e043149d0b1e1544f06346119f3e52c9f and evidence/coordinator_cycle_cover_isolate_validation.json:9f00087d22ec766e5f183fc2ea7bd38cdb8a4adb90905a0ced2408309cadff18.

Final finite files:
- scripts/challenger_cycle_cover_residual_interface_v4.py:d58a5c98140d0bb4ca458524c1faa9a07667f135e79e578ebd506e8321d8037b;
- evidence/challenger_cycle_cover_residual_interface_v4.json:197fff4f24b17b4fc80336927765b415f3e4f3e20c453b6f3e94f0e87c2615ce;
- operations/challenger_cycle_cover_residual_interface_v4.json:409ce4c1cc054cbe874d17b18446afb0e305e0bb5c3dc6c931ed69a70bc76942;
- scripts/coordinator_cycle_cover_complete_validator.py:0445a5be7adde5052c191feb8491750dcb759dd458b475e8b3dde1db40ffab18;
- evidence/coordinator_cycle_cover_complete_validation.json:891f13b407594489202e0f80efa6eaa43ca3505af3950b0e55cbce6a1b30ef0a;
- operations/coordinator_cycle_cover_complete_validation.json:588611d2e12bd6a8e440dcf0971dc9fb9e2bdf2591fbf5074b6b1c7a2f5b0b7b.

The ordinary local inputs retain their recorded fresh reconstruction reviews and pinned historical scope. No GE, Kotzig, old5375/four-branch363 finite bridge, or superseded374 apex-unicyclic interface is imported into this chain. The2018,2422 and8220 new finite interfaces remain explicit mathematical premises. External human review and an all-size Lean proof have not been supplied.
