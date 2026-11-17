> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent reconstruction of R2 — review v1

Reviewer role: TUZA-22 source-audit / independent verifier agent. This first reconstruction was written before communicating a correctness conclusion to the producer. Source read: `notes/r2_proof_v1.md` (frozen proof v1, exact hash recorded below). No census, root search output, CS induction, or producer discussion was used to establish this conclusion.

**Verdict: ACCEPT as an ordinary mathematical proof of the stated all-size R2.** No unresolved mathematical objection was found. This is internal AI review, not a Lean proof, independent kernel check, or priority assessment. The blocker implication toward CS remains conditional.

## Exact theorem reviewed

H is a finite simple graph. Every nonempty edge-sharing-connected component of its full actual triangle family has edge support exactly that of K4 or K5. F is a set of at most two distinct nonedges of H, and G=H+F. If tau(G)=2nu(G), then the same triangle-component property holds in G. Triangle-free background edges, components sharing vertices, arbitrarily many pages, and arbitrary outside attachments are permitted.

## Independent reconstruction

Write m=nu(H). The clique components have additive packing and covering optima, so tau(H)=2m. Every edge lying in a clique component can be required to belong to a minimum H-cover: require it only in its own component and take independent minimum covers elsewhere. Every prescribed single edge of a component can be avoided by a maximum packing there. Background edges affect neither choice.

For completeness, the clique facts require no external theorem. K4 needs two cover edges (two opposite edges suffice), and any two triangles meet in an edge, so its parameters are (1,2). Any edge belongs to an opposite-pair cover and is avoided by a triangle. In K5 each edge covers only three of the ten triangles, so at least four edges are required; a triangle on three vertices plus the edge on the other two covers all ten. Any prescribed edge can be included in such a cover. A three-triangle packing would use nine edges, leaving one edge: the endpoints of that leftover edge would have odd used degree three, impossible because a packing contributes even degree at each vertex. Thus nu(K5)=2. For prescribed avoided edge 01, triangles 023 and 124 give a maximum avoiding packing. Relabeling supplies every edge.

Fix one nonedge uv and all old two-edge paths u-x-v. Within any old clique component, their total edge footprint has size at most one. Indeed, both u and v cannot be in that clique because uv is absent. If two path spokes belong to the clique, they therefore share the same endpoint, say ux and uy, with x!=y. The clique contains xy, while H contains vx and vy. Triangle vxy then joins the clique's triangle component through xy, forcing v into its literal support and hence forcing uv. This contradiction controls all paths simultaneously; no numerical bound on the number of outside vertices is needed.

Call an ordinary page for uv bare if both path edges lie outside old triangle support. Choose one minimum cover edge in each component that meets the uv-page footprint. The preceding property lets one minimum H-cover hit **every non-bare uv-page at once**. No consistency problem can arise between distinct old components because their edge supports are disjoint.

If any new triangle is present, its old-edge footprint can be avoided by a maximum H-packing. With one new edge, its two old spokes cannot lie in the same clique component; with two new edges, there is just one old edge. Appending the triangle gives nu(G)>=m+1. For |F|<=1, tau(G)<=2m+1 then excludes equality. For F={e,f}, equality together with tau(G)<=2m+2 forces nu(G)=m+1 and tau(G)=2m+2.

Each added edge must have a bare ordinary page. Otherwise the simultaneous minimum cover for all its non-bare ordinary pages, plus the other new edge, would cover all triangles of G using at most2m+1 edges. This includes triangles using both new edges.

Every ordinary e-page must intersect every bare f-page in an edge. If not, choose a maximum H-packing avoiding the ordinary e-page footprint. All old spokes of the bare f-page lie outside triangle support and thus are automatically avoided. Both new triangles could then be appended, contradicting nu(G)=m+1. Exchange e and f for the symmetric assertion.

For adjacent e=ab, f=ac, ordinary pages have respective apices x,y outside {a,b,c}. They share an edge exactly when x=y. Fixing the two bare pages forces them to have one common apex x; intersecting each fixed bare page with every opposite ordinary page forces **all** ordinary pages to use that same x. If bc existed, bcx would be an old triangle and the bare spokes bx,cx would be supported, contradiction. Thus there is no two-new-edge triangle abc. All new triangles are abx and acx, both hit by ax. This contradicts the forced cover number2m+2.

For disjoint e=ab, f=cd, ordinary pages abx and cdy share an edge exactly when x is c or d and y is a or b. Fixed bare pages therefore force every ordinary page into the four endpoint vertices. No triangle can contain both disjoint new edges. The fixed bare pages together require at least three of ac,ad,bc,bd. If exactly three occur, the two new triangles share one old cross edge, again giving a cover of size2m+1. If all four occur, the endpoint graph is K4. If any old cross edge s is supported, take a minimum H-cover containing s and add the cross edge opposite s in this K4. This opposite pair meets every new triangle and again saves one cover edge. Hence all four old cross edges are background. The new triangles form one K4 component whose edge support is disjoint from every old component, and there are no further new triangles. Therefore B(G).

## Adversarial checks

- **A new edge initially creates no triangle:** handled. A genuinely tight augmented graph with any new triangle forces a bare ordinary page for each of its two new edges; a triangle using both alone would be covered by one new edge.
- **Two-edge triangles:** possible only in the adjacent case; the bare-page consequence forces the remaining old edge to be absent. They are also already covered in the minimum-cover contradiction used to obtain bare pages.
- **Background edges shared across pages:** expressly allowed; the adjacent conclusion uses a shared background spoke. No background edge is incorrectly treated as a packing resource of H.
- **Large footprint versus one page:** the cover construction uses the proved entire-family footprint lemma. The packing construction only needs one ordinary page. These distinct demands are met separately.
- **Vertex-sharing old components:** every optimization is combined over disjoint edge supports, so vertex sharing is harmless. If a purported crossing old triangle existed, the literal definition would already merge components and invalidate B(H); no such triangle is silently omitted.
- **Attachments through new K4 endpoints:** endpoint intersections alone do not merge triangle components. All new triangles were proved to lie inside the endpoint K4, and its old cross edges were proved to be background in H. This establishes edge-support separation rather than assuming it.
- **Empty/triangle-free H:** m=0 is permitted throughout; the tight augmented nonempty graph is precisely the new isolated-in-triangle-support K4 case. F empty or creating no triangle retains B vacuously or unchanged.
- **Cover versus maximum packing quantifiers:** the proof explicitly chooses appropriate minimum covers and maximum packings. It never requires one universal optimizer to satisfy incompatible simultaneous conditions.
- **No hidden minimality:** proper-subgraph CS, cover-criticality, packing resilience, degree bounds and bounded graph order are unused.

## Scope and global obligation

R2 is an all-size restoration bridge, stronger than a finite interface test. It removes the named restoration obligation from the conditional chain “R2 plus H-D-CS-min implies CS.” It does not prove that a minimum CS failure has a two-edge packing blocker. Nor does it prove R1, H-D-CS-broad/min, original H-D, or unrestricted Tuza. No theorem transfer between their hypotheses is asserted.

No change to the proof is required for correctness. Optional exposition improvement: include the elementary K5 degree-parity argument and explicit one-edge-avoiding packing, so the short proof can be entirely self-contained without its historical citation.

Reviewed frozen source SHA-256: `c636a53ea94cfcb35382b52c5637321a788e90d4185141ee71036fd89ebcdd13`.
First reconstruction completed UTC: 2026-11-15T21:48:50.939635+00:00.
