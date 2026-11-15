# Boundary realizability: symbolic restrictions after the ear freeze

Prepared during the owner-steered boundary investigation. These statements distinguish an arithmetic budget window from an actual eligible graph realization. No AC counterexample or first-boundary realization is asserted here.

## 1. A general lower bound on the old packing size

Let (H,X) be any eligible AC instance, L=H[X], h=nu(H), and a=nu(G)-h. Fix ANY maximum H triangle packing P. Let F be the subgraph of L consisting of link edges unused by P. Every F matching gives apex triangles edge-disjoint from P, hence

    matching(F)<=a.

Every H triangle has at most one L edge: two would put its three vertices in X and contradict induced triangle-freeness. Thus P uses at most h L edges. Define

    rho_a(L)=max {|E(F)| : F is an edge-subgraph of L with matching(F)<=a}.

Then |E(L)|-h<=|E(F)|<=rho_a(L), giving the exact necessary bound

    h>=|E(L)|-rho_a(L).

This uses only actual edge-disjointness and contains no unknown-optimum assumption beyond the mathematical definition of a. It is a pruning theorem, not an existence certificate.

In particular a=0 forces EVERY L edge to appear in every maximum H packing, so h>=|E(L)|. Equivalently every L edge is packing-essential in H. For a=1, F is a triangle-free graph of matching number at most1, hence a star (or empty), giving rho_1(L)=Delta(L) for nonempty L. To see the star claim, a pairwise intersecting graph-edge family is either a star or the three edges of a triangle; the latter is excluded.

## 2. Tight H has more packing gain than the initial AC-0 proof needed

If D(H)=0, published-input equality exhaustion gives edge-disjoint K4 blocks covering all H triangles. Each block has at most one L edge, so choose a face avoiding that edge. These h faces avoid ALL L edges simultaneously, including link edges outside the blocks. Appending a maximum L matching proves

    a>=matching(L)=m,  b=D+2a>=2m.

This is an equality-scope deduction only. It does not classify any non-tight H.

## 3. Saturated budget with zero gain forces a perfect link matching

Suppose m=b and a=0. For any maximum matching M of L, the saturated-matching equality squeeze gives J=H-M with k=nu(G)-m equality K4 blocks. Since a=0, h=nu(G)=k+m.

Every H triangle absent from J contains exactly one M edge; an H packing has at most m such pages and at most k block faces. Therefore any maximum H packing P consists of exactly m M-pages, one for each matching edge, and exactly one face from every block.

Assume an unmatched X vertex x has a link neighbor y. By maximality of M, y is matched. The link edge f=xy must belong to an H triangle, since otherwise its apex page would append to P and force a>=1. A triangle containing f cannot contain an M edge, because that would give two L edges in one H triangle. Thus f lies in a J equality block B.

B contains exactly the two X vertices x,y. The x vertex is unmatched, so no selected M-page has x as an endpoint. Only the selected M-page whose matching edge is incident with y can share a B edge; any shared edge must meet that page's X endpoints. That page shares at most one B edge (two would make it a B face despite its missing M edge). Its possible B edge is incident with y and is therefore adjacent to f.

A K4 has a face avoiding any two adjacent edges: take the face opposite their common endpoint. Replace P's B face by a face avoiding f and this possible page footprint. It remains disjoint from every other page and every other block face. The resulting h-packing avoids f, so the apex page zxy appends, contradicting a=0.

Hence every unmatched X vertex is isolated in L. In particular L's nonisolated vertices have a perfect matching. This is a PROVED_USING_PUBLISHED_INPUT restriction, not a statement that every saturated-budget instance has zero gain.

## 4. A C5 link cannot have budget two

For L=C5, m=2 and the general matching bound gives b>=2. If b=2, the possibilities are (D,a)=(2,0) or (0,1). The first is impossible by Section3 because C5 has an unmatched nonisolated vertex in every maximum matching. The second is impossible by Section2 because tight H would require a>=m=2. Thus

    L=C5 implies b>=3

for every eligible AC instance, with arbitrary outside incidence.

If L is two disjoint C5s and J=H-M is tight for a maximum matching M, the exact link-component separation theorem in B_FROZEN_ADDENDUM_2 applies. Each of the two component instances has budget at least3 by the preceding result, and the budgets add (background K4 groups contribute zero). Therefore b>=6 in this tight-deletion branch. In particular a putative eligible b=5, m=4, L=2C5 realization must have the slack-one residual branch for EVERY maximum matching M; the tight branch is arithmetically impossible, not merely settled for AC.

This does not prove that the slack-one branch is realizable, and it does not replace the coordinator/critic's separate proof settling AC at b<=5.

## 5. Explicit connected link at the next arithmetic window

A literal triangle-free connected graph with m=5 and vc=7 is the circulant L on Z/11 with edges of differences +/-1 and +/-3. Its22 edges are

    01,03,08,0-10,12,14,19,23,25,2-10,34,36,45,47,56,58,67,69,78,7-10,89,9-10.

Triangle-freeness follows because a sum of three signed increments1 or3 is odd and has absolute value at most9, so cannot be0 modulo11. The five cycle edges01,23,45,67,89 form a matching; no matching has more than floor(11/2)=5 edges. The independent set {0,2,4,6} has size4. A five-element independent set would have five cyclic gaps each at least2, summing11; the gaps must be2,2,2,2,3, but a gap3 is a forbidden edge. Hence alpha=4 and vc=11-4=7.

An explicit proper three-vertex-colouring is

    [0,1,0,1,0,1,2,1,2,0,2].

This verifies an admissible LINK shape. It does not construct H, establish the proposed budget b=6, or supply an AC counterexample.

At b=6, a=3 would force D=0 and hence a>=m=5, impossible. Thus a<=2. Here Delta(L)=4 and |E(L)|=22. A triangle-free edge-subgraph with matching at most2 is either bipartite, in which case Konig gives a2-vertex cover and at most8 edges, or nonbipartite, in which case it is C5 plus isolates: any odd cycle has length at most5, and any additional edge touching or outside that C5 extends a2-matching to3. The value8 is attained by the union of the stars of two nonadjacent vertices. Therefore rho_0=0,rho_1=4,rho_2=8 and Section1 gives

    a=0: h>=22, D=6;
    a=1: h>=18, D=4;
    a=2: h>=14, D=2, tau(H)>=26.

Thus even the smallest numerical realization of this connected link at b=6 requires at least14 old edge-disjoint triangles. Small random H probes cannot be advertised as a meaningful test of this boundary.

For comparison, at b=6 the link C5 disjoint union C7 has12 edges and rho_2=5, so the a=2,D=2 case needs h>=7. The link2C5 disjoint union K2 has11 edges and rho_2=5, so it needs h>=6. These are only necessary lower bounds; outside attachments, full triangle colouring and the exact apex packing optimum remain to be supplied.

## 6. Status and source scope

The packing-size bound and explicit circulant facts are PROVED_ORDINARY. Sections2–4 use Aharoni/HNS equality structure only in the justified tight graphs and are PROVED_USING_PUBLISHED_INPUT. Konig is the standard finite bipartite matching theorem. No floating optimization verdict is used.

A targeted primary-literature search also inspected the abstract of Haxell–Narins, *A Stability Theorem for Matchings in Tripartite3-Graphs*, arXiv1701.06451, CPC27(2018),774–793, DOI10.1017/S0963548318000147. Its advertised stability hypothesis is REGULAR tripartite hypergraphs near the n/2 matching bound, not arbitrary tau=2nu-1 triangle hypergraphs. The proof was not inspected and this paper is not an input to any argument here. No general slack-one core theorem or priority claim is inferred from that abstract.

Full AC remains unresolved. No first-uncovered-boundary H realization is proved by this scout. Independent_final_verification: NOT_RUN.


## 7. Complete-edge K4 partitions cannot realize a raw-link deficit

Suppose every H edge belongs to exactly one of k supplied actual K4 blocks; additional closure triangles are allowed. In each K4, a rainbow triangle-edge three-colouring has exactly two edges of each colour: adjacent edges receive distinct colours, so each colour is an opposite pair. Therefore every global colour class contains exactly2k edges and covers EVERY actual H triangle, including closure triangles. Conversely every triangle cover uses at least two edges in each block, whose edge sets are disjoint. Thus tau(H)=2k.

Since L=H[X] is induced triangle-free, each block contains at most one L edge. Pick one face per block avoiding that edge. These k triangles avoid all L edges simultaneously, and a maximum L matching adds m apex triangles. Thus nu(G)>=k+m and b=2nu(G)-tau(H)>=2m>=vc(L). This is PROVED_ORDINARY, using the supplied colouring but no deep equality theorem. It applies only to the displayed complete-edge partition scope. Adding arbitrary extra edges invalidates its cover-count premise.

## 8. Final boundary status after collaborative criticism

The mission's later elementary link classification and critical-edge argument prove AC for ALL b<=6. The general frontier certificate also settles3C5 at b=7. A declared additional finite-classification input — completeness of McKay's R(3,5) catalogue at13 vertices — together with a local exact check of its unique graph settles the other vc9 link shape at b=7. This scout did not re-audit catalogue completeness; the coordinator and critic's source/verification receipts control that separate dependency. The b<=6 theorem is independent of this catalogue input.

The first remaining CONDITIONAL numerical AC-failure stratum in the final report is therefore

    b=7, m=6, vc(L)=lambda(H,L)=8.

No full eligible H,X realizing that stratum has been constructed here. Neither the earlier raw b5/b6 realizability questions nor this new raw stratum are resolved merely by proving AC at lower budgets. The ordinary footprint bounds, C5 budget restriction, and complete-edge K4-partition barrier above remain useful constraints, not nonexistence proofs for arbitrary attachments.

The coordinator's exact broken-K2-join cycle probes have actual eligible link lengths5,7,9 and budgets5,7,9 respectively, with lambda=1 throughout. They are positive controls for genuine old/apex interaction, not hard-boundary realizations. The precise link-only limitation L=q Petersen, q>=2, in B_FRONTIER_MATCHING_CERTIFICATE.md shows that the maximum-matching deletion certificate is not universally available; it does not realize the corresponding surrounding H budget.

No further search was launched by this scout after the coordinator's closeout request. Full AC and boundary realizability remain UNKNOWN. All scout computations are complete; independent_final_verification remains NOT_RUN.
