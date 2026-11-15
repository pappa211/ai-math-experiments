# Frozen audit targets

Frozen before judging the proof.

For every finite simple graph G, T(G) is the set of all actual triangles, including crossing triangles. p=nu(G) is the maximum number of pairwise edge-disjoint triangles (vertices may be shared). tau(G) is the minimum cardinality of an actual-edge set meeting all triangles. B(G) means every nonempty shared-edge-connected component of T(G) has literal K4 or K5 edge support. Triangle-free background edges and vertex sharing between different components are permitted, subject to counting every actual triangle. mad(G) is the maximum average degree of a nonempty subgraph; use 0 for the empty graph.

T0: For every finite simple G with mad(G)<7, tau(G)<=2nu(G), and tau(G)=2nu(G) if and only if B(G). Empty and triangle-free graphs satisfy this statement. Strictness of mad<7 is part of the target.

The inequality is an attributed published input (Puleo); the equality classification is the audited addition. The five-degenerate and mad<7 classes are incomparable. T0 includes maximum degree at most six, not all six-degenerate graphs, maximum degree seven, or mad<=7. If two-red appears, q(G,C) denotes eligible packing and is distinct from unrestricted p. No S/E assumption is admitted into T0 without explicitly changing its status.

Supporting claims will be inventoried from the actual proof, with their hypotheses, in the target addendum and status matrix.

## Supporting targets and complete input scopes

- **M0 (combined minimality, old).** In any subgraph-closed class, an edge-minimum failure of P, with isolated vertices discarded, has connected nonempty triangle support, no triangle-free edges, tau=2p, nu(G-e)=p and tau(G-e)=2p-1 for every actual edge e. The residual G-e is not assumed to satisfy B unless equality in its own inequality is established.
- **M1 (compatibility, old).** If B(K), and P is a family of actual edge-disjoint triangles in G, a maximum K-packing can avoid its entire footprint in every residual block provided that footprint is contained in a star in each K4 and has at most2 edges in each K5.
- **M2 (balanced accounting, old).** K is a proper subgraph of a minimum combined obstruction G in the same hereditary class; r packed actual triangles use no triangle-support edge of K; X meets ALL G-triangles absent from K; |X|<=2r. Then equality holds throughout, |X|=2r, B(K), and nu(G)=nu(K)+r. A strict cover bound is impossible.
- **M3 (degree-five package, old).** A minimum combined obstruction in any hereditary class has codegree>=2, all link components of order>=5, degree5 links K5 or K5-e, no degree5 neighbor of degree<=6, and any two nonadjacent degree5 vertices have at most3 common neighbors (if exactly3, both links are K5). No five-degeneracy is assumed in the local package.
- **R6 (new interface).** A closed six-vertex component K6-{12,34} of a hub link, with otherwise unrestricted incidence, and residual K formed by deleting the six spokes plus E({1,2,3,4,5}) and56. If B(K), then D(G)>=2; if no external page on those nine rim edges, D(G)>=3. In a minimum combined obstruction the initial5/10 reduction supplies B(K), so this link component is excluded.
- **TWIN (new interface).** Two mutually closed seven-vertex hub neighborhoods, with uv, all u/v spokes to a,b,c,d,w, abcd=K4, wc,wd present, wa,wb optional; delete the eleven hub edges and cycle ab,bc,cd,da. If B(K), D(G)>=2. The5/10 reduction excludes this configuration in a minimum combined obstruction.
- **THIN (new interface).** d(v)=6, exact link K6 minus a perfect matching, adjacent d(u)=7; W common neighbors ordered cyclically, q unique neighbor of v outside N[u], p1,p2 those of u outside N[v]. With X and K exactly as source Section3, B(K) implies D(G)>=2. The4/8 tuple supplies B(K) in a minimum combined obstruction. Bare complement-containing-matching thinness is insufficient without the six-link classification.
- **DOM (new strict reductions).** d(v)=6, N[v] subset N[u], exact link K6 and d(u)<=8, or exact link K6-e and d(u)<=7. For X=E(W) union {uv} union uZ and K=(G-X)-{u,v}, residual Tuza alone forces strictness for G. No general dominated-link assertion is included.
- **BIP (new symbolic target).** A minimum combined obstruction in any hereditary class has no bipartite connected component of any hub link, of any order, with no restriction on outside attachments.
- **THREE-SUN (new symbolic target).** A minimum combined obstruction cannot have a closed link component consisting exactly of central abc and independent ears on ab,bc,ca; other hub components and arbitrary outside incidence are allowed.
- **SIX (new finite/symbolic target).** Every connected six-vertex H of minimum degree>=2 whose complement has maximum degree>=2 has a valid nonsymbolic matching/cover plus obstruction-or-gain certificate, or is one of the three bipartite exceptions or three-sun. Together with robustness/codegree and R6, this implies degree6 links K6,K6-e,K6-3M in a minimum combined obstruction. Eligibility does not impose a bound on the ambient graph order.
- **LOW/HIGH (new consequences).** All degree<=6 vertices in a minimum combined obstruction are independent, and each degree>=7 vertex has at least4 degree>=7 neighbors. Uses M3,SIX,TWIN and B2's actual strict reductions.
- **DONOR7 (new).** In a minimum combined obstruction no degree7 vertex subsumes a degree5 vertex. Subsumes means closed-neighborhood containment N[v] subset N[u]. All W-Z incidences, the Z-edge/no-edge alternatives and outside pages are permitted.
- **DONOR8 (new).** The same exclusion for a degree8 subsumer, with all three auxiliary Z vertices, all Z-internal edges, repeated external apices and apices in Z allowed. Exact case proof: source/notes/SCOUT_B_DEGREE8.md.
- **CHARGE (new closure using old rules).** In a minimum combined obstruction satisfying the preceding structural conclusions, each vertex has final charge>=7 under the2/3,1/6,1/4 rules in source Section16. Transfers conserve total charge. This proves absence of such an obstruction in mad<7.

## Separately inventoried supporting results and optional corollaries

- **C25:** Combined P for mad<25/4, using SIX and LOW/HIGH with quarter-charge discharging. This weaker result is audited separately from T0.
- **C6:** Combined P for maximum degree<=6, since mad<=6<7.
- **LB:** Every finite locally bipartite graph with a nonempty triangle family has tau<=2nu-1, without a sparsity hypothesis. The nonempty-triangle hypothesis is necessary; the class is hereditary and BIP proves combined P before strictness follows from exclusion of K4/K5 blocks. The inequality has published antecedents; strictness priority remains separate.
- **SEP (optional, independent of T0).** G=G1 union G2, E(G1) intersect E(G2)={e}, every actual G-triangle lies in a piece, e triangle-bearing in both, each Gi and Gi-e satisfies Tuza, and every tight Gi satisfies B. Then tau(G)<=2nu(G)-1. No unproved crossing-triangle assumption is omitted.
- **HIGH10 (optional, independent of T0).** In a minimum combined obstruction, if degree k>=10 vertex v subsumes a degree<=6 vertex w, v has at most k-6 low (degree<=6) neighbors. Uses already established LOW/HIGH,SIX,M3 and the residual-diamond lift of source Section14. T0 does not use this lemma or Puleo7.4.

The old five-degenerate main theorem remains a historical formal input at its own exact hypothesis. This audit reuses its local ordinary arguments; it does not infer T0 from five-degeneracy. S/E, Parker/Liu, Gupta's1144-certificate catalogue and Kandasamy's degree-ten catalogue are outside T0's dependency closure. No unrestricted Tuza/equality statement or mad<=7 boundary result is a frozen target.
