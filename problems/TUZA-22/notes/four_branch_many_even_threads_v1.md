> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# K4-free four-branch links with at least four even threads are excluded

Status: ordinary all-size proof candidate, frozen for fresh review. This removes a large remaining parity family without invoking the historical finite WKE table.

## Setting and theorem

Let L be a closed link component of a minimum combined-CS failure. Assume it has exactly four branch vertices B={a,b,c,d}, contains a triangle, and contains no K4. The accepted thread exclusions say that each branch pair has at most one nondirect path, and a direct edge may coexist with it only for an even-length path. There are no returning paths.

Let E be the simple graph on B whose edges represent even nondirect paths, and let O be the set of odd nondirect paths. Let D be the graph of actual direct branch edges. Every path interior has link degree two. The theorem is:

    |E|>=4 is impossible.

An actual triangle of L is either a triangle in D or the direct edge of a short (length-two) even path together with its two legs.

## 1. Assignment tuples and strictness from odd paths

A simple four-vertex graph with at least four edges is connected and has a spanning unicyclic subgraph. Assign its four edges to distinct incident vertices by orienting its cycle and assigning a pendant edge toward its leaf. On each assigned even path of length2r use the alternating r-matching saturating the assigned branch endpoint. On every unassigned even path, use an (r-1)-matching of its odd-order interior path. On every odd nondirect path of length2r+1, use the r-matching of its even-order interior path.

Their union P is a matching. Take all four branches in Q, and add internal covering vertices on each path. An even path needs at most r-1 such vertices; an odd path needs at most r-1 as well, because both endpoint edges are already covered by the branches and the remaining gaps between matched interior pairs are disjoint. Thus

    |P|=4+sum_even(r-1)+sum_odd r,
    |Q|<=4+sum_even(r-1)+sum_odd(r-1).

Q covers all of L-P, including every direct branch edge. If O is nonempty, this is a strict tuple and contradicts minimum CS immediately.

Hence assume O is empty. The assignment tuple is balanced and gives residual B(K) after deleting the hub spokes and P. As L is K4-free, every block contains at most three L vertices; any matching contributes at most one old edge per block.

## 2. A long path on an assignment cycle is impossible

Suppose an even path of length at least four belongs to a cycle in E. Choose a spanning unicyclic assignment subgraph whose cycle contains that path. This is possible here whenever the edge lies on a cycle: extend that cycle to all four vertices if necessary by one pendant edge.

The selected path matching has a matched edge f between two internal vertices. Reverse the cyclic assignments and the corresponding alternating path matchings. Leave any other selected or unassigned path matchings unchanged. This produces an equal-size matching avoiding f.

Both endpoints of f lie in no L triangle. Codegree gives a page on f other than its hub page, with apex outside the entire hub neighborhood. A block containing either page endpoint has at most two L vertices. The alternative matching contributes at most one old edge per block; a disjoint matching edge and page spoke would require three L vertices there. Thus the whole footprint is a star of at most two edges, and the matching-plus-page augmentation contradicts balanced equality.

For |E|>=5 every edge of E lies on a cycle, so every even path is short. For |E|=4, E is either C4 or a triangle with one pendant edge; all cycle paths must be short, while the pendant path may remain long.

## 3. At least five even paths

All even paths are now short, and O is empty. Since L contains a triangle, some pair f=ab lies in D intersect E. Indeed E has at least five of the six possible pairs; if D were disjoint from E, D would have at most one edge and L would contain no triangle.

Let x be the short tip on f. Choose a spanning unicyclic assignment containing f, and form P,Q as in Section1. The triangle T=abx has a selected leg in P. After deleting E(T), the remaining at least four ear pairs still have a spanning unicyclic subgraph on all four branches: E-f has at least four edges and no isolated vertex. Assign its four distinct tips to the four branches, obtaining a matching Z of size4 that avoids T. Here every path is short, so |P|=4.

The four hub triangles on Z together with T have a two-edge-star footprint per residual block. T contributes at most one surviving edge because a leg was deleted; Z contributes at most one, and a disjoint pair would require four L vertices in a block. This gives an augmentation, contradiction.

## 4. Exactly four even paths: the C4 case

Write E as ab,bc,cd,da, with tips x,y,z,t respectively. All paths are short. Take

    P={ax,by,cz,dt}, Q={a,b,c,d}.

The surviving legs are bx,cy,dz,at; each tip has only one surviving link neighbor. Reverse the cyclic assignment to obtain P' consisting of those four surviving legs.

Any outside page on a selected leg permits an augmentation with the four hub triangles on P'. The matching contributes at most one old edge per block. A page spoke disjoint from one of the alternate legs would require either a tip-to-nonendpoint edge, which is absent in L, or the selected leg of that same ear, which was deleted from K. Thus the entire footprint is at most a two-edge star. The outside apex lies outside the full hub neighborhood because the selected leg has a degree-two tip.

If any E pair lacks its direct D edge, codegree forces precisely such an outside page on its selected leg: there is no other possible link apex. Hence all four cycle edges belong to D. If D has one diagonal, it is a diamond surviving in K; B(K) would require its missing diagonal, impossible. Two diagonals would give the excluded K4. Thus D is exactly the same C4.

The outside-page argument now shows that every removed leg has only its hub page and its ear triangle. The SIX edges

    ha,hc,bx,by,dz,dt

cover all triangles lost by the reduction: the alternating hub spokes cover the core hub triangles; each ear's other two hub/rim triangles meet its displayed tip leg. There are no other outside pages on P. Therefore tau(G)<=tau(K)+6<2nu(K)+8=2nu(G), contradiction.

## 5. Exactly four even paths: triangle plus pendant path

Write the cycle pairs as ab,bc,ca, with short tips x,y,z, and let the pendant path join a,d. Use the assignment around the three-cycle and toward d on the pendant path. Q contains all four branches and the required internal path cover vertices.

Rotate only the three cycle assignments, leaving the pendant matching fixed. As in Section4, any outside page on one of the three selected short legs has a two-edge-star footprint with that alternate matching. The pendant matching lies in P, so it contributes no old footprint. If one of ab,bc,ca were absent from D, codegree would force such an outside page. Hence D contains triangle abc.

The branch d is incident with only the one even path and its direct D edges, because O is empty and these are all four even paths. Its link degree is at least three, so it has at least two direct neighbors in {a,b,c}. Three would give K4; exactly two make D a diamond. P contains no direct edge, so this diamond survives in K and contradicts B(K).

This completes the theorem. ∎

## Remaining scope and dependencies

Together with the accepted K4-containing and subcubic four-branch exclusions, the remaining triangle-bearing four-branch interface has no K4, has some branch degree at least four, and has at most THREE even nondirect paths. Direct/odd path choices and short-versus-long doubled ears remain explicit. This is a restricted unresolved family, not a proof of all-four-branch CS exclusion.

The proof uses the accepted ordinary thread exclusions and authenticated class-local minimality/codegree/robustness and clique facts. No finite enumeration, external matching theorem, or unchecked WKE-to-CS transfer is a premise.
