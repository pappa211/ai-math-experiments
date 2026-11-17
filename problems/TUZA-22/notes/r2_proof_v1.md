> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# R2: arbitrary two-edge equality restoration — frozen proof v1

Author role: TUZA-22 restoration agent. Frozen 2026-11-15 UTC for fresh AI reconstruction. Status at freeze: ORDINARY_PROOF_CANDIDATE, pending independent review. This is not a Lean proof or a claim of historical priority.

## Exact statement

Let H be any finite simple graph satisfying B: every nonempty shared-edge-connected component of its **entire actual triangle family** has literal K4 or K5 edge support. Triangle-free background edges and shared vertices of different components are allowed. Let F be a set of at most two distinct nonedges of H, and G=H+F. If tau(G)=2nu(G), then B(G).

In fact, if F has size two and creates a triangle while equality holds, its two edges are disjoint, their four endpoints induce a new K4, every old edge of that K4 is triangle-free in H, and every new triangle is in that K4. Thus the old triangle components survive, and exactly one disjoint-edge-support K4 component is added. This conclusion allows arbitrary other incidence and arbitrary graph order.

## Elementary block facts used

Packing and cover numbers add over actual triangle components. K4 has (nu,tau)=(1,2); K5 has (2,4). Every edge of either clique belongs to some minimum triangle cover, and a maximum packing can avoid any one prescribed edge. These are elementary and are also the pinned public manuscript `papers/tuza-five-degenerate/main.md`, Lemma 2. The stronger known K5 two-edge avoidance is **not needed** for the R2 proof below.

An old edge is **supported** if it belongs to a triangle of H; otherwise call it a background edge. Put m=nu(H); then tau(H)=2m. Every minimum H-cover contains no background edge, since deleting such a useless member would make a smaller H-cover.

## Lemma 1: the whole one-nonedge page footprint

Fix a nonedge uv of H. Its ordinary pages are the triangles uvx in H+uv, namely x with ux,vx both in E(H). In any one old clique component K, the union of all page spokes ux,vx contains **at most one edge**.

Proof. K cannot contain both u and v, since uv is absent. Hence if it contains two distinct page spokes, these have the form ux,uy (or symmetrically vx,vy), with distinct x,y. Because K is a clique, xy is present. The actual triangle vxy exists in H and shares xy with K's triangle family, so it belongs to the same component. Literal clique support then forces v into K, and forces uv to exist, contradiction. This proves the assertion for all pages together, with no bound on their number. QED.

Call a page uvx **bare** if both ux and vx are background edges of H. Choose in each affected old component a minimum cover containing its unique page-spoke edge. Their union is a minimum H-cover that meets every non-bare uv-page. In particular, if no bare page exists, this cover already covers H+uv.

Also, a maximum H-packing can avoid the supported footprint of any one ordinary page, using one-edge avoidance in each old block. Bare page spokes are automatically avoided by every H-packing.

## Lemma 2: preliminary consequences of tight two-edge restoration

If G has no new triangle, B(G)=B(H). If |F|<=1 and G has a new triangle, standard insertion gives nu(G)>=m+1 and tau(G)<=2m+1, so equality is impossible.

Now let F={e,f} and assume there is a new triangle. Every new triangle uses either one new edge (then Lemma 1 gives an avoidable old footprint) or both new edges (then it has only one old edge, also avoidable). Therefore nu(G)>=m+1. Since an H minimum cover together with e,f covers G, tau(G)<=2m+2. Tightness forces

    nu(G)=m+1, tau(G)=2m+2.                         (1)

Each of e,f has a bare ordinary page relative to H. For if f has no bare page, Lemma 1 provides a minimum H-cover covering all ordinary f-pages. Add e: this covers every other new triangle, including any triangle using both new edges, yielding tau(G)<=2m+1, contradiction. Interchange e and f.

Moreover, **every ordinary e-page intersects every bare f-page in an edge**, and conversely. Otherwise append those two edge-disjoint pages to a maximum H-packing chosen to avoid the ordinary page's supported footprint. The bare page contributes no supported footprint. This gives m+2 packed triangles, contradicting (1). No count or reduction of outside attachments is assumed here.

## Case A: the new edges meet

Write e=ab and f=ac, with a,b,c distinct. An ordinary e-page is abx where x is outside {a,b,c}, because ac is absent from H; similarly an ordinary f-page is acy with y outside that set. Such two pages share an edge if and only if x=y, their common edge then being ax.

Choose a bare e-page and a bare f-page. By Lemma 2 their apices coincide, say x. Applying the same lemma to these fixed bare pages and every opposite ordinary page shows that **all** ordinary e- and f-pages have apex x.

The edge bc is absent from H: if present, bcx would be an old triangle, contrary to bx and cx being background spokes of the two bare pages. Consequently there is no triangle using both e and f. Thus the entire new triangle family is exactly {abx,acx}, covered by the single edge ax. Adding ax to a minimum H-cover gives tau(G)<=2m+1, contradiction.

Hence equality with new triangles is impossible when e,f are adjacent.

## Case B: the new edges are disjoint

Write e=ab and f=cd, with all four vertices distinct. An ordinary e-page abx and ordinary f-page cdy can share an edge only if x is in {c,d} and y is in {a,b}; their common edge is xy. This follows directly by intersecting their vertex sets; neither new edge can be common to the two triangles.

Fix one bare page of each type, which exist by Lemma 2. They intersect, so their apices have this prescribed form. Every ordinary e-page must intersect the fixed bare f-page and therefore has apex c or d. Every ordinary f-page similarly has apex a or b. There is no triangle using both disjoint new edges. Thus **every new triangle lies on {a,b,c,d}**.

The two chosen bare pages force at least three of the four old cross edges ac,ad,bc,bd to exist. If exactly three exist, G on these four vertices is K4 minus one cross edge; its two triangles have a common cross edge. That one edge covers every new triangle, giving tau(G)<=2m+1, contradiction.

It remains that all four cross edges exist, so the four vertices induce K4. If any cross edge s is supported in H, choose a minimum H-cover containing s and add its opposite edge t in this K4. Since {s,t} meets every K4 triangle, and every new triangle is in that K4, this again gives a G-cover of size at most2m+1, contradiction.

Therefore all four cross edges are background edges in H. The new K4 has edge support disjoint from all old triangle support. We already proved that no other new triangle exists. Consequently its four triangles form a new K4 component, and every old K4/K5 triangle component is unchanged. Thus B(G). QED.

## Dependency and scope ledger

- Inputs: elementary actual-clique parameters, one-edge packing avoidance, every clique edge in a minimum cover, and additivity over actual triangle components.
- No CS induction, minimal-counterexample hypothesis, sparsity/degree bound, ordinary-block characterization, finite census, bounded graph order, solver verdict, or unproved restoration statement is used.
- The entire-footprint Lemma 1 is the symbolic mechanism that handles arbitrarily many pages and arbitrary outside attachments.
- This proves R2 only. A two-edge blocker for a minimum CS failure is still required for the advertised R2 + H-D-CS-min route to CS. The proof does not imply that blocker or unrestricted Tuza.
- Pending independent review and prior-art check. Exact source dependency: pinned public commit 4b72b6d5b4f71fcefa3f0314483bf58ce809d7b4, `papers/tuza-five-degenerate/main.md` §§1–2.
