# Route A frozen result: a limitation of vertex-colour repair

Frozen at 2026-11-03 23:22 UTC for first-gate criticism. Independent initial proposal: `notes/A_INITIAL.md`. No Route B or C argument was read before this freeze. All new assertions below concern finite simple graphs and their full actual triangle families.

## Decision and exact candidate

**REFUTED_CANDIDATE:** A4. Strip graph edges in no triangle, take a maximum four-cut, let F be its monochromatic edges, and let H=G-F. H has the explicit triangle-edge-3-colouring induced by four vertex colours in F_2^2. A4 asserted that some such maximum cut admits an actual G-packing P and actual H-cover C_H with

    |F| + |C_H| <= 2|P|.

If true, F union C_H would prove unrestricted Tuza in one operation. This is a prescribed repair mechanism, not the unrestricted F-existence condition equivalent to Tuza. The conjectural step was payment; colouring, triangle classification, and cover lifting were valid. The refutation below permits arbitrary global repacking and the best possible residual cover, and therefore defeats every certified residual-slack version using this same lift.

**PROVED_ORDINARY:** For every fixed integer r>=2 there are arbitrarily large graphs G, each an elementary Tuza graph and with every edge lying in a triangle, such that for EVERY vertex partition into at most r classes, deletion of all monochromatic edges costs more than 2nu(G). In fact the cost divided by 2nu(G) is unbounded along the constructed family. This refutes fixed-vertex-palette deletion paid edge by edge, not the broader triangle-edge-3-colourable residual architecture.

## Complete proof of the limitation theorem

### 1. A self-contained triangle-free high-chromatic base

For a graph B on vertices v_0,...,v_(n-1), its Mycielski graph M(B) has original vertices v_i, clones u_i, and one vertex w. Its edges are all original B-edges, v_i u_j and v_j u_i for every original edge v_i v_j, and all w u_i. There are no clone-clone edges and no w-original edges.

If B is triangle-free, so is M(B). A triangle through w would require a clone-clone edge. A triangle containing two clones is likewise impossible. A triangle with one clone u_i and originals v_j,v_k would imply all three base edges ij,ik,jk. A triangle with only originals is a B-triangle. This classifies every possible triangle.

For any B with chromatic number k>=2, chi(M(B))=k+1. For the upper bound use a proper k-colouring of B on both corresponding originals and clones and give w a fresh colour. For the lower bound, suppose M(B) had a proper k-colouring, calling w's colour k. Every clone avoids k. In the colouring of B, replace each original vertex of colour k by its clone's colour. Adjacent originals cannot both have colour k; if exactly one is recoloured, its clone is adjacent to the unchanged other original, so their new colours differ. Thus B would be (k-1)-colourable, a contradiction.

Start with K2 and apply this construction r-1 times. The resulting B_r is triangle-free, has chromatic number r+1, has no isolated vertex, and has b=3*2^(r-1)-1 vertices. This uses a complete elementary proof of the named construction, not an uninspected external theorem. For r=4, the first Mycielski graph is C5; equivalently choose B=M(M(C5)), of order b=23 and size 71. The size follows twice from e(M(B))=3e(B)+|V(B)|: 5 -> 20 -> 71.

### 2. Twin blow-up and the random-transversal cut inequality

Fix such a base B with b vertices and chi(B)>r. For any positive integer t, let R=B[t] replace each base vertex by an independent set of t labelled twins and each base edge by the complete bipartite graph between the corresponding twin classes.

Given ANY assignment of at most r colours to V(R), let m_same be its number of monochromatic R-edges. Independently choose one uniformly random twin from each base class. Their assigned colours induce an r-colouring of V(B). Since chi(B)>r, every outcome has at least one monochromatic base edge. A particular base edge ij is monochromatic in this random colouring with probability exactly the number of monochromatic edges between twin classes i,j divided by t^2. Summing these probabilities proves

    m_same / t^2 >= 1,
    hence m_same >= t^2.

More precisely the same argument proves min monochromatic edges in B[t] equals t^2 times the corresponding minimum in B, because the reverse inequality follows by colouring every twin like its base vertex. We use only the lower bound t^2; no exact maximum-cut calculation is required.

### 3. The cone has only apex triangles

Let G_t be obtained from R by adding one apex z adjacent to every rim vertex. R is triangle-free: any rim triangle would project to three distinct pairwise adjacent base vertices. Consequently EVERY actual G_t-triangle is exactly zuv for an R-edge uv. These are all present, and there are no other triangles.

Each packed triangle consumes two distinct apex spokes. Edge-disjoint packed triangles therefore correspond exactly to matchings in R, giving

    nu(G_t) = matching_number(R) <= floor(bt/2).

Every edge of G_t belongs to a triangle. A rim edge uv lies in zuv. Every spoke zv lies in zvu for some rim neighbor u, since B has no isolates. Thus the initial removal of edges in no triangles does nothing.

Now take ANY vertex partition of G_t into at most r classes and let F be ALL monochromatic graph edges. Restricting that partition to R gives

    |F| >= t^2.

If t>b, then

    |F| >= t^2 > bt >= 2nu(G_t).

For every residual H=G_t-F, every actual H-cover C_H, and every G_t-packing P,

    |F|+|C_H| >= |F| > 2nu(G_t) >= 2|P|.

This is the required contradiction to the prescribed payment. It holds for all partitions, hence in particular every maximum cut and any tie rule. No residual saving, no compatibility choice, and no global repacking can overcome a deletion cost already exceeding the entire possible packing budget. Since the denominator is positive and 2nu(G_t)<=bt, the ratio |F|/(2nu(G_t)) is at least t/b and is unbounded.

### 4. These graphs satisfy Tuza independently

For a cone over ANY triangle-free rim R, the preceding correspondence gives nu(G)=matching_number(R). Also tau(G)=vertex_cover_number(R). A vertex cover S of R gives the spoke cover {zv:v in S}. Conversely, take any G triangle edge-cover C. For each selected rim edge uv choose one of its endpoints and replace uv by the corresponding spoke; retain all selected spokes. This replacement preserves covering, because uv occurs in exactly one triangle, zuv. The resulting spokes have cardinality at most |C| and their rim endpoints cover R. This proves the exact identity.

Alternatively, without optimizing either quantity, choose any maximal matching M of R. Its endpoints S form a vertex cover of R. The apex triangles on M and spokes on S are an actual pair (P,C) with |C|=2|P|. Therefore every G_t is an ordinary Tuza graph. The construction is a counterexample only to A4, not to Tuza.

### 5. Concrete certificate

Take r=4, B=M(M(C5)), and t=24. Then G has 553 vertices, 41,448 edges, and 40,896 actual triangles. Every four-partition has at least 576 monochromatic edges, while 2nu(G)<=552. The exact standard-library script `checks/a_fourcut_obstruction.py` constructs the labelled base and graph, reconstructs triangles by actual neighborhood intersection, checks all triangles use the apex, and writes full graph edges, full triangles, and explicit witnesses to `notes/A_FOURCUT_WITNESS.json`.

The checked witnesses contain 192 edge-disjoint triangles and a 384-edge triangle cover. These are certificates, NOT claimed optima. The refutation needs only the proved upper bound 2nu<=552 and lower bound |F|>=576, and neither relies on solver optimality. Runtime was 0.136 seconds, Python 3.13.7 on the local Mac, no solver and no external package. Reproduction:

    umask 077
    python3 checks/a_fourcut_obstruction.py

Evidence: graph and explicit witnesses FINITE_CHECKED; the unbounded bounds and theorem PROVED_ORDINARY. Independent final verification NOT_RUN; internal fresh criticism pending at freeze.

## Mandatory controls and applicability

A4 quantifies over all finite simple graphs, so every actual graph control is applicable. The following easy survivals do not supply positive evidence against the proved family above. `notes/A_CONTROL_CERTIFICATES.json` retains actual four-colour assignments and elementary payment bounds for the listed finite controls. It reads the coordinator's independently reconstructed `evidence/controls.json`.

| Control | Applicability and result |
|---|---|
| Empty, triangle, book7, K4 | APPLICABLE; proper four-colouring gives F empty and the ordinary covers/packings pay. General books have the same proof. |
| K5 | APPLICABLE; a maximum four-cut deletes one edge. K5-e has a three-edge cover (extend the endpoints of the missing edge to a 2+3 bipartition and delete present within-part edges); K5 has a two-packing, so cost 1+3=4. |
| VB27 | APPLICABLE; stored feasible four-colouring has two monochromatic edges, so EVERY maximum four-cut has |F|<=2. Restricting the supplied 18-cover gives total <=20<=26. This does not use false VB. |
| Clebsch cone | APPLICABLE; stored feasible four-colouring has three monochromatic edges, so EVERY maximum four-cut has |F|<=3. Restricting the supplied 11-cover gives total <=14<=16. |
| Four-port original and residual | APPLICABLE; stored proper four-colourings give F empty; supplied covers have sizes 5 and 4, packing size 4. |
| K10, K11 | APPLICABLE; balanced maximum four-cuts have part sizes (3,3,2,2) and (3,3,3,2). Merge the classes into sides 5+5 and 6+5 respectively. Cover by all original edges within the two sides costs 20 and 25, contains F, and leaves a bipartite graph. The coordinator's exact packings have sizes 13 and 17. Thus these particular maximum cuts pay. This is different from the five-vertex deletion negative control. |
| Cartesian K4 square K5 | APPLICABLE; colour vertex (i,j) by i+j mod 4, i=0..3,j=0..4. Every K4 column is proper; each K5 row has exactly one repeated colour, so F has four edges. Any four-cut needs at least one deletion per K5 row, proving maximality. H's five K4 blocks have 2-covers and four K5-e row blocks have 3-covers, giving |F|+|C_H|=4+10+12=26=2nu. Full triangles are exactly these row/column triangles by the common checker. |
| Arbitrary K4/K5 triangle-block families | APPLICABLE; disjoint unions of individually paying blocks pass. Arbitrary vertex sharing was NOT_RUN as a universal A4 claim. The exact equality theorem for the original graph does not itself pay this prescribed four-cut lift. |
| Abstract Fano plane | NOT_APPLICABLE: not an actual graph triangle system. |
| Certified finite Baron-Kahn instance | NOT_AVAILABLE in the common battery. |
| New G_t cone family, t>=24 | APPLICABLE; REFUTED by the ordinary proof above; t=24 additionally FINITE_CHECKED. |

## What is and is not new

The mission supplies an exact unbounded obstruction to a particular nonlocal repair, not a new positive Tuza theorem. The mathematical ingredients (Mycielski construction, random-transversal averaging, cone matching/vertex-cover identities) are elementary and familiar. No originality claim for their combination has been established. The result is stronger than failure of a prescribed residual packing: it permits all residual covers and all global packings and defeats every bounded vertex palette.

Crucial boundary: triangle-edge-3-colourability is MUCH broader than four-vertex-colourability. The triangle-free high-chromatic rim R itself is triangle-edge-3-colourable vacuously. Deleting suitable apex spokes gives a cheap triangle-free residual on these cones. Our theorem does not exclude that repair, arbitrary triangle-edge colourings, larger nonlocal operations, or residual-slack-funded operations whose charged deletion set differs from a fixed-vertex-palette defect set.

The inspected old one-triangle restoration theorem has H=G-E(T) triangle-edge-3-colourable. It uses strict residual slack when available; otherwise HNS equality implies actual K4 triangle components, whose faces are chosen compatibly. It does not preserve an arbitrary prescribed residual packing. The inspected two-triangle essential-edge restoration adds exact tau(H)=2nu(H)-1 and a packing-essential residual edge. Neither result proves A4, and neither is being reproposed as a new result.

## A concrete possible revision, without a continuation claim

A hub-aware revision must retain the high-chromatic triangle-free rim and reason about actual apex boundary states. For ANY G and vertex z, put H=G-z and L=H[N_G(z)]. The following exact identities are proved directly:

    tau(G) = min_{C triangle-cover of H} ( |C| + vc(L-C) ),
    nu(G) = max_{M matching of L} ( |M| + nu(H-M) ).

Here C consists of actual H-edges, L-C deletes those in L, and H-M deletes the rim edges of M. For covers, split a G-cover into rim edges C and spokes; C must cover H and the remaining spokes correspond exactly to a vertex cover of L-C. Conversely such a pair covers every triangle. For packings, split a G-packing into triangles through z and those in H. The former correspond to a matching M of L; the latter are exactly constrained to avoid M. Conversely every such compatible pair is a packing. These are exact state descriptions, not a new augmentation theorem and not progress by themselves.

A sharply scoped possible future lemma is: **if H is triangle-edge-3-colourable and L is triangle-free, then some minimum triangle cover C of H satisfies |C|+vc(L-C)<=2nu(G).** This would give an unbounded apex extension with the actual chosen cover quantified explicitly. It is stronger than merely saying G satisfies Tuza because it restricts C to minimum residual covers. This mission has NOT established it or its originality. A counterexample where every minimum H-cover has excessive boundary cost would kill this exact candidate. Even a proof would leave the separate global structural theorem that every hypothetical minimal Tuza counterexample admits such a reduction (or a different paid operation); no evidence for that structural theorem is supplied. Thus the correct first-gate recommendation is REDIRECT/DEPRIORITIZE the failed vertex-palette route, retaining only the useful limitation theorem. It is not CONTINUE based on finite survival.

## Dependencies, source editions, and integrity

Positive bridge inputs were only used to define the initial architecture; the negative theorem uses no Aharoni, HNS, LP, solver, asymptotic theorem, or new formalization. Primary mathematical input here is entirely proved above. The pinned repository source is d4029fbafc3dffc250b50ed237ad81c3206cd1a0, public tree 575200c778bf84e07bf46801d8c420d3f40b210b. Read baseline snapshots: `sources/public/RESEARCH_STATUS_2026-11-03.md`, `ORDINARY_PROOF_INDEX.md`, `STATUS_AND_PROVENANCE.md`, and the summary manuscript selectively.

Additional inspected source snapshots and before/after hashes are in `notes/A_SOURCE_INTEGRITY.json`: TUZA-01 `manuscript/TuzaTriangleDeletion.tex`; TUZA-02 `research/proof/ESSENTIAL_EDGE_RESTORATION.md`; TUZA-03 `CONSOLIDATED_MANUSCRIPT.md`, `literature/SOURCE_AUDIT.md`, and `research/proof/PARAMETERIZED_RESTORATION_COMPRESSION.md`. All snapshots were made from pinned Git objects before reading their contents; historical worktree hashes were also taken. Git inspections used GIT_OPTIONAL_LOCKS=0. Protection is read-only operating convention plus hash-based detection, not OS-enforced immutability.

An exploratory primary-literature search returned Puleo's 2014 k-dependence paper and 2017 maximal-edge-colourable-subgraph paper, warning that common-apex join results are prior art. Their abstracts were seen, but their full proofs were not accessed and no theorem from them is invoked. No new external source was required for the frozen result. Historical Aharoni/HNS inputs remain attributed to the baseline and are not newly reverified here.

No Lean claim is made. All work stayed on the Mac in the new workspace; no installs, remote computation, human contact, publication, or source mutation was performed. There is no running Route A computation.
