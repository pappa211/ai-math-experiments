> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Two edge-disjoint triangles restored to B — frozen proof v1

TUZA-22 restoration role, 2026-11-15 UTC. Status at freeze: ORDINARY_PROOF_CANDIDATE pending fresh independent reconstruction. This file is intentionally a full proof candidate, not an admitted global result or a historical-priority assertion.

## Statement R(2 triangles)

Let H be a finite simple graph satisfying B. Let T and U be actual three-edge triangles whose six edges are distinct nonedges of H. They may share one vertex or have disjoint vertex sets. Put G=H+E(T)+E(U). Then

    tau(G)<=2nu(G), and equality implies B(G).

The reverse B=>equality is universal. This theorem therefore proves CS on this restoration class, with arbitrary old clique components, background edges, and outside incidence. It does not prove CS for arbitrary graphs.

We use the reviewed R1 theorem, the all-page one-nonedge footprint lemma from R2, and the elementary K4/K5 packing/cover facts. All triangle families below are actual; no crossing triangle is discarded.

## 1. Exact one-triangle packing interface

Let T=abc be restored to B(H), where a,b,c are independent in H. Let N_T be the family of triangles newly created by this restoration. It consists of T and ordinary pages abx,acx,bcx with apex x outside {a,b,c} and both old spokes present.

Represent pages by a bipartite incidence graph: left vertices are the three bases ab,ac,bc, right vertices are their outside apices, and a base is joined to an apex precisely when its page exists. Each apex has degree1 or3, because adjacency to two terminal vertices makes one page, and adjacency to all three makes all three pages. Two pages are edge-disjoint precisely when their bases differ and their apices differ. Thus their packing number is the matching number of this bipartite graph. Put q_T=max(1,matching number), to include the central triangle T.

**Exact additivity:** nu(H+T)=m+q_T, where m=nu(H).

The upper bound partitions any packing into old triangles (at most m) and new triangles (at most q_T). For the lower bound, take a maximum new packing. If it uses T, it is the singleton T, whose old footprint is empty. Otherwise it consists of pages using distinct bases and apices. Any old clique component contains at most one of a,b,c. Each terminal is incident with only two bases of T, so the full footprint in that block is a star of at most two edges, even for a three-page packing. K4 star avoidance and K5 two-edge avoidance permit appending all these pages to a maximum H-packing. This proves exact additivity, with no bound on the number of available apices.

Two useful classifications follow.

**When q_T=1:** N_T is either a book (all triangles have one common base, including T), or exactly a K4 on abc and one full apex x. Indeed, if pages occur on two bases, all must have a common apex; closure makes its third page too, and any extra apex would give a two-matching.

**When q_T<=2:** N_T has a triangle cover of size at most2 unless it is exactly the seven-triangle K5-e family on abc and two full apices x,y. To see this, count full apices (degree3 in the incidence graph). There are at most two. With two full apices, any additional apex would permit a matching of size3, so there are no other pages. With one full apex, singleton apices can occur on at most one base, since two different bases plus the full apex would give a three-matching. That base and the opposite spoke of the full apex cover N_T. With no full apex, pages occur on at most two bases, which cover N_T; if there are no pages, use one base to cover T.

For the exceptional K5-e family, three bases cover; no two edges cover its seven triangles (two base edges meet at most five, and a spoke meets only two). Every old spoke belongs to a three-edge cover: for spoke ax use {bc,ax,ay}, and relabel. This is a statement about the complete new family and remains valid if old triangles also exist elsewhere.

Finally, if q_T=1 and tau(H+T)<=2m+1, there is a minimum H-cover which, together with **one** extra edge, covers H+T. For a book add its base. For a K4, if all three old spokes were background, the new K4 would be a separate triangle component and tau(H+T)=2m+2. Therefore some spoke is supported; choose an H minimum cover containing that spoke and add its opposite K4 edge.

## 2. Unconditional inequality and the only tight branches

The two restored triangles themselves append to every H-packing, so nu(G)>=m+2. Their six edges give tau(G)<=2m+6.

If nu(G)>=m+3, this already proves Tuza. If nu(G)=m+2, exact additivity and appending the other restored triangle show q_T=q_U=1. By R1 each intermediate satisfies CS. If one intermediate is tight, it is B, and R1 applied to the second triangle proves CS for G. Otherwise each intermediate has tau<=2m+1; adding the three edges of the other triangle gives tau(G)<=2m+4=2nu(G).

Thus inequality always holds. Under equality the only possibilities are:

    lower branch: nu(G)=m+2, tau(G)=2m+4;
    upper branch: nu(G)=m+3, tau(G)=2m+6.

Higher packing number makes the six-edge cover strict. We next classify the lower branch and exclude the upper branch.

## 3. Lower branch: disjoint vertex sets

If one intermediate is tight, R1 has already proved B(G). Assume both are strict. Their new families are books or K4s by q=1. Because T and U have disjoint vertex sets, a triangle cannot contain edges from both restored triangles: two edges of a triangle share a vertex. Thus the full new family is N_T union N_U.

Choose a minimum H-cover extending to H+T with one extra edge, as in §1. Independently cover N_U with at most two edges. This covers G with at most2m+3 edges, contradiction. Hence only the already classified B case occurs.

## 4. Lower branch: one shared vertex

Write T=abc and U=ade, with b,c,d,e distinct. In H all six triangle edges are absent. Let J consist of old cross edges between {b,c} and {d,e}. The five-vertex core K=G[{a,b,c,d,e}] has all six restored edges, plus precisely J.

Every new triangle is either an ordinary page from N_T or N_U, or a mixed triangle avw for vw in J. Every page whose apex is outside the five-vertex core will be called an outside page.

### The core/page compatibility fact

Every old clique contains at most one vertex of {b,c}, at most one of {d,e}, and cannot contain a together with any of b,c,d,e. Thus it contains at most one edge of J. If a two-triangle core packing avoids the base of an outside page, append that page to it. The entire old footprint in each block consists of at most one J edge and at most one page spoke; if both occur, they share a terminal endpoint. A nonincident choice would force one of the absent pairs ab,ac,ad,ae,bc,de. The footprint is therefore a star of at most two edges. Hence these three triangles append to a maximum H-packing, impossible in the lower branch.

This is a symbolic arbitrary-attachment assertion; the finite core only determines which bases are avoidable.

Up to independent swaps b<->c, d<->e and interchange of the two triangles, J has six types.

### J empty

There are no mixed triangles. If neither intermediate is tight, the one-extra-edge extension plus a two-edge cover of the other new family gives at most2m+3, as in §3. The case of a tight intermediate is already B by R1.

### J={bd}

There is one mixed triangle abd. If both N_T,N_U are books, use their two bases plus bd, at most three new cover edges. If one family is K4, say abc x, and the other a book, use the two-edge K4 cover {ab,cx} plus the other book's base; ab hits the mixed triangle. Relabel for the symmetric case.

If both families are K4s, write them abc x and ade y. Their apices are outside the core: a has no H-edge to b,c,d,e. The three actual triangles

    acx, dey, abd

are edge-disjoint even if x=y. Their old footprint is {ax,cx,dy,ey,bd}. An old block can contain two distinct core terminals only in the pair {b,d}; its only possible two-edge footprint is {bd,dy}, a star. All other block footprints have size at most one. They therefore append to an H maximum packing, giving m+3 and contradicting this branch.

### J={bd,be} (two adjacent cross edges)

The intermediate H+U contains page bde. Since q_U=1, all its pages must be on base de: a K4-type family with apex b would also require ab in H, which is absent. Hence N_U is a book on de. The mixed triangles abd,abe share ab.

If N_T is a book with base f, {f,de,ab} covers every new triangle. If N_T is K4 abc x, {ab,cx,de} does. Either way three new cover edges suffice. The other star orientation is symmetric.

### J={bd,ce} (two disjoint cross edges)

The core packing {abd,ace} avoids both bc and de. By the core/page compatibility fact, there are no outside pages on bc or de. There are no internal pages on these bases either, since no vertex of the opposite pair joins both endpoints.

Consequently q_T=q_U=1 implies N_T is a book on a spoke f in {ab,ac}, and N_U a book on a spoke g in {ad,ae}; a K4 family would include the prohibited opposite-base page. These two chosen bases hit at least one of the mixed triangles abd,ace, and one additional edge hits the other if needed. Again three cover edges suffice.

### J={bd,be,cd} (three cross edges)

The core is K5-ce. Every restored base is avoidable by a two-triangle core packing; explicit witnesses are:

| Avoided bases | Two-triangle packing |
|---|---|
| ab | acd, bde |
| ac,ad | abe, bcd |
| bc,de | abe, acd |
| ae | abc, bde |

The core/page compatibility fact excludes every outside page. Thus all new triangles are in the core, which has a three-edge cover, for example {ab,de,cd}. This contradicts lower-branch equality.

### J={bd,be,cd,ce} (all four cross edges)

The core is K5. Every edge is avoidable by a maximum two-packing, so again no outside page is possible. All new triangles therefore lie in this K5. If any J edge is supported in H, choose a minimum H-cover containing it and a minimum core cover containing it; at most three additional edges cover the core, contradiction.

Thus every J edge is background in H. All ten core edges are now disjoint from old triangle support, and every new triangle is in the core. A new K5 triangle component has been added; all old components remain. Therefore B(G).

This completes the lower branch. The only nontrivial tight component creation when the triangles meet is the new K5; cases obtained via tight intermediates are already covered by R1.

## 5. Upper branch: forced bare pages and two full bare apices

Assume nu(G)=m+3,tau(G)=2m+6.

Every restored edge f has a **bare ordinary page relative to H**, meaning both of its old spokes are background in H. Otherwise the R2 all-page footprint lemma gives a minimum H-cover covering all ordinary f-pages. Add the other five restored edges: every other new triangle has another restored edge, including mixed triangles. This would give a cover of size2m+5, contradiction.

Also q_T,q_U<=2. If one were at least3, exact additivity would give an intermediate packing of size m+3, and appending the other restored triangle would give m+4 in G.

For each restored triangle there is a **full bare apex**: an apex with all three old spokes background. Indeed, choose one bare page on each of its three bases. If their apices are all distinct, they give a three-page packing, contrary to q<=2. Two therefore have the same apex; their four spokes together include all three terminal-to-apex edges, all background, and the third bare page follows by closure.

## 6. Upper branch: disjoint vertex sets

There are no mixed triangles. If either N_T or N_U has a cover of size at most2, cover the other with its three bases and add a minimum H-cover, contradicting tau=2m+6. Thus by §1 both new families are exactly K5-e families, each with two full apices and no other pages.

Every spoke in either family is background. If a spoke were supported, choose an H minimum cover containing it and a three-edge cover of its new family containing it (the explicit covers in §1 do this). Only two additional edges are needed for that family, and three for the other, again giving2m+5.

Here is an explicit four-page packing despite possible cross-incidence of the apices. Write the triples A and B for V(T),V(U). Let x1,x2 be the full A-apices and y1,y2 the full B-apices. Label A={a0,a1,a2} so that whenever yj belongs to A, it is aj; assign arbitrary distinct remaining labels otherwise. Label B={b0,b1,b2} so that whenever xi belongs to B, it is bi. These labelings exist because each apex pair is distinct. Take

    a0 a1 x1,  a0 a2 x2,  b0 b2 y1,  b0 b1 y2.

Within a family, bases and apices differ, so pages are edge-disjoint. Across families, a shared edge is possible only if xi=bi is an actual B terminal and yj=aj an actual A terminal. The A page then uses that cross edge only when j=i; the B page uses it only when i!=j. These conditions are incompatible. Shared outside apices alone share no edge because A and B are disjoint. Thus all four pages are edge-disjoint. Their spokes are background, so they append to every H maximum packing, giving m+4, contradiction.

## 7. Upper branch: a shared vertex

Again write T=abc, U=ade and use cross graph J.

### J empty

There are no mixed triangles. As in §6, both new families would have to be exact K5-e families and all their old spokes background. All four full apices are outside the five-vertex core, because a has no H-edge to b,c,d,e.

Let x1,x2 be A-apices and y1,y2 the U-apices, and order the latter so y2!=x1 (possible because y1!=y2). Then

    abx1, bcx2, dey1, ady2

are four edge-disjoint pages. The only possible old-edge collision across the two families would be ax1=ay2, which was excluded; the pages on bc and de contain no a-spoke. All spokes are background, so this again gives m+4, contradiction.

### J nonempty

Let x be a full bare apex for T and y one for U. Both are outside the core. They are distinct: if x=y and bd is any cross edge after relabeling, the old triangle bdx would contain background spokes bx,dx, impossible.

Fix a cross edge bd in J. There can be no outside U-page aez with z!=y, and no outside U-page dez with z!=y. Otherwise respectively the following four triangles are edge-disjoint:

    aez, dey, bcx, abd;
    dez, aey, bcx, abd.

This remains true if z=x; z is outside the core and differs from y. The pages at x,y are bare. The only potentially supported old edges are bd and the two spokes of the page at z. Their whole footprint in one old component is a star of at most two edges: bd can coexist with dz only as the adjacent pair {bd,dz}; a spoke from a cannot share its block since ab,ad are absent, and a spoke from e cannot share its block since de is absent. Other block footprints have at most one page spoke because its base is absent. Thus all four triangles append to a maximum H-packing, contradiction.

Therefore, for this cross edge bd, any outside U-page other than its three bare pages at y must lie on base ad. Applying the same argument to every cross edge yields:

- If all J edges have the same endpoint d in {d,e}, all extra outside U-pages lie on ad. There are no internal U-pages with apex b or c, because such a page could only have base de and would require both cross edges from that apex to d,e. Therefore N_U is covered by {ad,ey}.
- If J meets both d and e, an outside extra page would have to lie on both distinct bases ad and ae, impossible. Thus only the three bare outside pages at y remain. Every internal U-page has base de (a has no H-edge to b,c). Hence {de,ay} covers N_U, including those internal pages.

In both cases N_U has a two-edge cover. A minimum H-cover, all three edges of T, and that two-edge cover cover all of G: every new triangle either contains a T edge or belongs to N_U. This has size at most2m+5, contradiction.

The upper tight branch is impossible. Combined with the lower-branch classification and §2 inequality, this proves the stated CS restoration theorem. QED.

## Scope, dependencies, and remaining global obligation

- The proof is all-size and accounts for arbitrary attachments through explicit complete footprint bounds and page-family structure. No fixed-core census is used to infer an unbounded conclusion.
- The six-type core split in the lower branch is exhaustive for a2-by-2 bipartite cross graph; its extension to arbitrary H is justified by the core/page compatibility fact, not by sampled graph order.
- Inputs: R1; the R2 one-nonedge all-page footprint lemma; elementary clique parameters, covers through a prescribed edge, K4 star avoidance and K5 two-edge avoidance.
- A minimum CS failure cannot have B after deleting the supports of **two members of any maximum packing**, because this theorem would restore it to CS. Along with R1, every such one- or two-triangle residual is strict. This is an additional obstruction restriction, not a proof that every minimum CS failure has such a residual.
- For k=2 this immediately excludes a minimum CS failure: deleting a maximum two-packing leaves a triangle-free B graph. More generally, arbitrary many restored triangles remain outside the theorem's scope.
- Independent review required before promotion from proof candidate. No Lean certificate or novelty claim is supplied by this file.
