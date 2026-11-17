> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Four-branch links containing K4 admit an ordinary CS exclusion

Status: ordinary all-size proof candidate, frozen for fresh review. This treats the K4-containing part of the four-branch target; K4-free triangle-bearing four-branch links remain separate.

## Statement and shape

A closed link component L of a minimum combined-CS failure cannot both contain a K4 and have at most four branch vertices (vertices of link degree at least three).

Write the K4 vertices a,b,c,d and call them the core. They are all four branch vertices. By the accepted returning-thread and parallel-thread exclusions, every other vertex lies on an even-length nondirect path between a distinct core pair, with at most one such path per pair. The direct core edge already exists. No other paths, vertices or edges occur in this connected link. Let E be the simple graph of these nondirect path pairs, t=|E|, and write a path length as2r_e. Its2r_e-1 internal vertices have link degree two. A length-two path will be called a short ear.

The hub of the link is h. All reductions below delete every h-spoke to L and a matching P. A vertex cover Q of L-P with |Q|<=|P| gives the usual balanced residual K: B(K), nu(K)=nu(G)-|P|. Outside pages on deleted rim edges are covered by P, and closedness accounts for all removed hub spokes.

We will use two immediate facts.

1. If P contains exactly ONE core edge, K contains a core K4 with exactly that edge missing. Its two triangles share an edge, so B(K) would force the missing core edge back into their literal clique support. This is impossible. Thus any such balanced tuple already excludes the configuration.
2. If P contains NO core edge, the core lies in one residual K4/K5 block A. An unassigned short ear whose two legs survive K is impossible: its triangle shares a core edge with A, forcing its degree-two tip into the same clique and requiring adjacency to all four core vertices.

## 1. Two-vertex WKE lifting, used only for an immediate residual diamond

If a nondirect path edge uv is replaced by u-x-y-v, a tuple P,Q lifts with both sizes increasing by one. If uv belongs to P, replace it by ux,yv and add x to Q. Otherwise an endpoint, say u, belongs to Q; add xy to P and y to Q. Every nonmatching new edge is covered. Existing core-edge memberships in P and existing core vertices in Q are unchanged, because only nondirect path edges are subdivided.

Consequently a short-ear tuple with exactly one selected core edge stays such a tuple after arbitrary even path extensions. This lifting is used for that residual-diamond contradiction only; no general CS subdivision lift is asserted.

## 2. Cases t=0,2,3

If t=0, L=K4 is excluded by closed-link robustness.

For t=2 or3, first shorten all nondirect paths to short ears. The ear graph E on four core vertices has a vertex v of degree at most one. We construct P of size3 containing exactly one core edge, and Q consisting of the other three core vertices.

If v has one incident ear with tip x, select vx in P. Choose a different ear and select one of its legs uy with u!=v; complete P by the core edge between the other two core vertices. If v has no incident ear, choose two distinct ears and assign their tips to two distinct core endpoints; select those two legs, and select the core edge joining v to the remaining core vertex. Two distinct simple edges always permit these distinct endpoint choices.

In both cases P is a three-edge matching. Q covers L-P: every core edge meets Q, and the only possible ear leg at the omitted core vertex v is selected in P. All other legs meet Q. Thus the balanced tuple has exactly one core edge. Lift it along every longer path as in Section1 and apply the residual-diamond contradiction.

## 3. Case t=1

Suppose the sole nondirect path joins a,b and has length2r.

If r=1, with tip x, use P={ab,cd} and Q={a,b}. The surviving induced link is K2,3 with parts {a,b} and {c,d,x}, so every residual block contains at most two link vertices. The three triangles

    hac, hbd, abx

are pairwise edge-disjoint; their entire old footprint consists of ac,bd,ax,bx. A residual block contains at most one of these edges. They augment the balanced two-triangle reduction, contradiction.

If r>=2, write the path a=x0,x1,...,x_(2r)=b. Use P={ab,cd} together with the r-1 internal edges x1x2,x3x4,...,x_(2r-3)x_(2r-2). Let Q={a,b} together with x2,x4,...,x_(2r-2). Then |P|=|Q|=r+1 and Q covers L-P. The surviving induced link is triangle-free, so each residual block contains at most two link vertices.

The selected internal edge f=x1x2 has an extra page with apex outside the whole hub neighborhood, since both endpoints have degree two in L and lie in no L triangle. The matching

    {a x1,x2 x3,...,x_(2r-2)x_(2r-1)} union {bc}

has size r+1 and avoids f. Its hub triangles together with that external page have at most a two-edge star footprint per block. This contradicts balanced equality.

## 4. Assignment tuples for t>=4

Assign four distinct path pairs of E to four distinct incident core vertices. On an assigned path of length2r_e, use its alternating matching of size r_e that matches the assigned endpoint and leaves the other endpoint unmatched. On every unassigned path, use a maximum matching of its odd-order interior path, of size r_e-1. Their union P has no core edge and size

    s=4+sum_e(r_e-1).

Take all four core vertices in Q. On each nondirect path, add at most r_e-1 internal cover vertices for the edges left outside P. This can be seen directly from the alternating pattern, or by the lift in Section1 beginning with the short-ear tuple. Thus |Q|<=s and Q covers L-P.

For t>=4 such an assignment exists: a simple four-vertex graph with at least four edges contains a spanning unicyclic subgraph; orient its cycle and direct any pendant edge toward its leaf, assigning each edge to its endpoint so every vertex receives one edge. For t=4 the entire E is either a four-cycle or a triangle with one pendant edge.

Under the forced B(K), every unassigned short ear is impossible by Fact2 above. Every residual block contains at most one surviving nondirect edge: the core block contains none, assigned short ears have only one surviving leg, long path interiors have no triangles, and two distinct path tips have no edge between them. This fact remains true for any alternative matching consisting only of nondirect path edges.

### Unassigned long paths

If an unassigned path is long, its odd-order interior path has a nonempty maximum matching. Any selected internal edge f can be avoided by another maximum interior matching: deleting one edge splits an odd-order path into one even-order and one odd-order path, whose matching numbers sum to the original value. Change only this interior matching, retaining size s.

Codegree supplies an external page on f. Its apex is outside the whole link, and any block containing a page endpoint has at most two link vertices because that endpoint lies in no link triangle. The alternative matching contributes at most one old edge per block by the preceding residual structure. A disjoint matching edge and page spoke would require three link vertices in such a block, impossible. The complete footprint is a two-edge star and gives an augmentation.

For t>=5, choose any spanning unicyclic assignment on four path pairs. There is an unassigned path. If it is short B(K) is impossible; if long the preceding argument applies. This excludes all t>=5.

### Assigned long paths on a cycle

For t=4, all paths are assigned. If a long path belongs to the unique cycle of E, reverse the cyclic assignments. On those paths use the opposite alternating matchings, and leave any pendant path unchanged. This preserves matching size s and avoids a selected internal edge f of the chosen long path. The same safe-page argument applies. Thus, when t=4, every cycle path is short. Only the pendant path in the triangle-plus-pendant shape may remain long.

## 5. The last t=4 shapes

After relabeling, three short ears have tips x on ab, y on bc, and z on either ca or cd. The fourth path joins a,d. It has length2r; if z is on cd, E is a four-cycle and r=1 by the preceding subsection. If z is on ca, E is a triangle plus pendant path and r may be arbitrary.

Write the a-d path as a=t0,t1,...,t_(2r)=d. Use

    P={ax,by,cz} union {t1t2,t3t4,...,t_(2r-1)d},
    Q={a,b,c,d} union {t2,t4,...,t_(2r-2)}.

Then |P|=|Q|=s=r+3. The residual core lies in a single block A, either K4 or K5.

### If A is K4: replace its one packed triangle

The following actual triangles form a packing of size r+5:

- abx and bcy;
- hcz;
- the r hub triangles on R={a t1,t2t3,...,t_(2r-2)t_(2r-1)};
- hbd and acd.

They are pairwise edge-disjoint by direct inspection. All six core edges occur among them, and the only surviving footprints outside A are bx,cy and the r edges of R. Each residual block other than A contains at most one of these edges. The tips x,y have only b,c respectively as surviving link neighbors; an internal a-d path vertex has only its displayed R neighbor among the selected footprint, and the other path/core adjacencies needed to put two distinct footprint edges in one clique are absent. No such edge belongs to A.

Remove the one A-triangle from a maximum K-packing and choose all other block packings to avoid these single edges. Append the r+5 displayed triangles. This gives

    nu(K)-1+(r+5)=nu(K)+s+1,

contradiction.

### If A is K5: rule out outside short-leg pages and save a cover edge

No selected short leg ax,by,cz can have an outside page. In the triangle-plus-pendant case, rotate the assignments around the three short ears and keep the pendant matching fixed. In the four-cycle case, reverse all four short-ear assignments. Either operation gives a size-s matching avoiding a specified selected short leg.

Its surviving footprint consists only of alternate short-ear legs. Each such tip has only one surviving core neighbor in K. A page spoke disjoint from one of those legs would require an absent tip-to-core edge (in the same ear it would require the selected deleted leg). Thus the matching plus an outside page has at most a two-edge star footprint per residual block and would augment K. The extra apex of such a page is outside the entire hub neighborhood, because the tip has only its two core endpoints as link neighbors. Hence all removed short-leg pages are only their hub triangles and ear triangles.

Use the following replacement cover for every lost triangle:

    X={ab,bc,ca,cd,hx,hy,hz}
      union P_path
      union {hd,h t2,h t4,...,h t_(2r-2),h t1},

where P_path is the r-edge pendant/path part of P. This set has size2r+8=2s+2. The core edges cover the three short-ear rim triangles; their tip spokes cover all short-ear hub triangles. The spoke hd covers hub triangles on core edges involving d. Selected path bases cover their outside pages and hub triangles; the even-indexed path spokes and h t1 cover all remaining path hub triangles. There are no other pages on the removed short legs. This audits all lost triangles.

The K5 block A contains core vertices a,b,c,d and a fifth vertex q. It has a minimum cover consisting of triangle abc together with dq. Thus some minimum K-cover overlaps X in all three edges ab,bc,ca. Consequently

    tau(G)<=2nu(K)+(2s+2)-3<2(nu(K)+s)=2nu(G),

contradiction.

This completes every case and proves the theorem. ∎

## Scope and dependencies

The proof uses the accepted ordinary parallel-thread exclusion to obtain the literal four-branch K4-plus-even-path shape, and authenticated class-local minimality/codegree/robustness and clique facts. All parity, packing and cover arguments are supplied here. The finite TUZA-19 WKE domain is not a premise. The remaining four-branch target is K4-free and triangle-bearing; triangle-free four-branch links can separately use their authenticated WKE availability together with the accepted triangle-free WKE CS mechanism.
