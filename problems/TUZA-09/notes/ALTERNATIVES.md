> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# Independent alternatives and exact limitations

Status: ordinary arguments and source audit; no claim of a new theorem of historical novelty. No Lean run. This note concerns finite simple graphs. A triangle family can be smaller than the full family of graph triangles; that distinction matters below.

## 1. Initial independent ideas, before source selection

1. Replace the triangle incidence LP by the clique polytope of the triangle conflict graph, then use perfect-graph integrality.
2. Delete or charge the odd-cycle obstructions to this integrality, retaining a packing budget under deletion.
3. Import the exchange structure of a colored triangle family into a half-integral cover residual.
4. Strengthen the packing LP with graph-realizable clique/odd-hole constraints rather than assume that a bounded generic hierarchy is exact.

The first idea collided exactly with existing work. The second loses its budget under even elementary graph attachments. The third gives a correct reduction but does not cover all residual triangles. The fourth is a framework, not an established bound or a justified next campaign.

## 2. Perfect conflict graphs: independently reconstructed, already known

Let L have one vertex per triangle of G, adjacent when triangles share an edge. Then alpha(L)=nu(G). Every clique of L is either a common-edge family or contained in the triangles of a K4: compare abc and abd, then any member avoiding ab must be acd or bcd, and a member containing an outside vertex cannot meet that third triangle. The two types require respectively one or two actual graph edges to cover them. If L is perfect, its clique-cover number equals alpha(L), proving tau(G)<=2nu(G). For K4-free G, the same proof gives tau=nu.

This is **PROVED_ORDINARY / PRIOR ART**, exactly the mechanism of Lakshmanan–Bujtas–Tuza, Theorem 18; it is not a TUZA-09 discovery. See the audit. Perfectness is not universal: the cone over C5 has conflict graph C5.

## 3. Packing loss need not pay for deleting an imperfect core

**REFUTED proposal.** If a family F of graph triangles is removed so that the remaining triangle conflict graph is perfect, the minimum number of graph edges meeting F need not be at most twice the decrease of the triangle packing number.

**Exact witness.** Indices below are modulo 5. Take a hub h, rim vertices r_0,...,r_4, and leaf vertices s_0,...,s_4. Edges are

- h r_i and r_i r_(i+1), for each i;
- h s_i and r_i s_i, for each i.

There are precisely ten triangles: W_i={h,r_i,r_(i+1)} and P_i={h,r_i,s_i}. To verify completeness, each s_i has exactly two neighbors h,r_i, and after removing these leaf vertices the graph is the cone over a chordless C5. The five P_i are pairwise edge-disjoint. Every triangle contains at least one of the five spokes h r_i; hence any packing has at most five triangles. Thus nu(G)=5. The five spokes form a cover, so tau(G)=5 as well. These packing and cover certificates also prove nu*(G)=tau*(G)=5 without an LP solver.

Take F={W_0,...,W_4}. The surviving family is {P_0,...,P_4}, whose conflict graph is edgeless and thus perfect, and whose packing number is still five. But F requires three edges: every graph edge meets at most two W_i, so two edges cannot meet all five, while spokes h r_0,h r_2,h r_4 do. Therefore the proposed cost is 3 and the packing decrease is 0.

This does not refute any existence theorem choosing a more sophisticated decomposition. It shows that deletion of an imperfect triangle core does not itself release packing budget. Any future decomposition argument needs an additional, independently proved accounting invariant; the old scalar nu loss cannot simply be assumed.

## 4. The closure needed for the recent colored exchange is real

**REFUTED transfer.** Wang's private-red-edge exchange does not hold for an arbitrary subfamily of exactly-one-red triangles.

Take V={u,v,x,y,z}, E={uv,ux,vx,uy,vy,xy,uz,vz}, red edges {uv,xy}, and blue all other edges. Let F={uvx,uvy,uvz} and P={uvx}. This is a maximum packing of F because every member uses uv. Deleting the blue edges ux,vx leaves uvy and uvz. The unused opposite edge xy is red, but uv lies in two surviving members, so it is not private. The full colored family also contains uxy and vxy; replacing uvx by uxy and uvz would augment the packing there. These excluded triangles are exactly why the proof cannot be transferred to F. No optimal-LP claim is made for this witness.

**Positive scope check.** If m:E(G)->{0,1,2} is a two-fold multicover, select the doubled edges D and consider H=G-D. Color its zero-multiplicity edges red and its unit edges blue. Every triangle of H has either two or three blue edges. Its two-blue triangles are exactly the full family of exactly-one-red triangles of H, so Wang's closure hypothesis holds for that family. The three-blue triangles are additional constraints. Applying a theorem to the two-blue family alone does not round the whole multicover. The K5 witness in [MULTICOVER.md](MULTICOVER.md) exposes this additional obstruction even when the two-blue parity constraints are consistent.

## 5. The published charging systems have explicit barriers

Yi's four inequalities, replacing the colored-family constant by c, normalize to

    t <= 3-a
    t <= 3/2+(5/2)a+2b
    t <= 3-d
    t <= 3+c*d-b.

Direct substitution with D=11+4c gives a feasible common equality point

    a=d=3/D, b=3(1+c)/D, t=(30+12c)/D.

For c=2 this is (a,b,d,t)=(3,9,3,54)/19. Thus even proving the sharp colored-family conjecture leaves this fixed system at 54/19, not 2. This is the barrier already stated by Yi, independently checked algebraically here; it is not a new obstruction theorem about actual graphs.

Wang similarly gives, in his closing remark, a feasible point saturating his four inequalities at 165/59. Reweighting those same inequalities therefore cannot reach 2. His additional closure exchange changes the system rather than evading this limitation by arithmetic.

## 6. The interpolation target is not an easy falsification target

Since nu*>=nu, Tuza implies tau<=nu+nu*. Therefore a counterexample to the latter would also disprove Tuza. No such graph has been found here. Conversely, the interpolation inequality alone would not imply Tuza.

For a purely numerical nonimplication check, (nu,nu*,tau)=(100,150,260) satisfies the inequalities nu<=nu*<=tau, nu*<=2nu, tau<=2nu*-sqrt(nu*/6), and tau<=165nu/59. It violates tau<=nu+nu*. This is an abstract scalar tuple, **not a graph witness**. It only proves that the listed scalar bounds do not algebraically imply the interpolation target.

## 7. Decision contribution

These alternatives do not support GO for a general factor-two campaign. The perfect-conflict result is already established, the naive deletion budget fails, the colored exchange needs closure and leaves three-blue constraints, and the published scalar charging systems have proven internal ceilings. A materially different future target would need to control the graph realization of a strengthened incidence/rainbow polytope, including the actual zero-edge identities, rather than merely retune these constants. That is currently an OPEN framework with no justified larger campaign mandate.


## 8. Reproducibility of the bounded arithmetic/witness check

Executed locally with the pre-existing native Python 3.12, standard library only, no files created by the check and no solver. Exhaustive domain: all triangle vertex triples in the one specified 11-vertex graph, all subsets of its ten triangles for packing, and candidate covers of the five-member wheel family through size three. No random graph search is represented.

```python
from itertools import combinations
from fractions import Fraction as Q
E = {tuple(sorted(e)) for i in range(5) for e in
     [(0,i+1),(i+1,(i+1)%5+1),(0,i+6),(i+1,i+6)]}
T = [frozenset(combinations(v,2)) for v in combinations(range(11),3)
     if set(combinations(v,2)) <= E]
F = [t for t in T if all(max(e)<=5 for e in t)]
nu = max(len(P) for k in range(len(T)+1) for P in combinations(T,k)
         if len(set().union(*P)) == 3*k)
tauf = next(k for k in range(4) if any(
    all(t.intersection(C) for t in F) for C in combinations(E,k)))
assert (len(E),len(T),len(F),nu,tauf) == (20,10,5,5,3)
for coefficient in [Q(2), Q(11,4)]:
    D=11+4*coefficient
    a=d=3/D; b=3*(1+coefficient)/D; t=(30+12*coefficient)/D
    assert [3-a,Q(3,2)+Q(5,2)*a+2*b,3-d,3+coefficient*d-b] == [t]*4
a=c=Q(12,59); b=m=Q(39,59); d=h=Q(0); t=Q(165,59)
assert [3-a,Q(3,2)+Q(5,2)*a+Q(3,2)*b-c+Q(3,8)*h,
        3-c-d,3-b+Q(9,4)*c+Q(3,2)*d-Q(1,4)*h] == [t]*4
assert a+m<=1 and d<=c<=b<=m and h<=c
```

Observed: all assertions passed; Yi equality values were 54/19 and 63/22; Wang value was 165/59. These checks validate the stated finite calculations, not a universal graph theorem. The ordinary witness proof above is the certificate and does not depend on the enumeration.
