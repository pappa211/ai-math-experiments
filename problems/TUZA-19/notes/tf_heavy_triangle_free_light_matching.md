# TF and a triangle-free heavy graph: the exact light-matching availability gap

Status: **OPEN**. This lane did not prove that every triangle has exactly one light edge, did not prove the weaker exact-one selected-light representation, and found no counterexample under the joint hypotheses. It gives an exact matching formulation, a minimum-cover completion formula, local exchange certificates, and one bounded nine-vertex inverse-design run ending UNKNOWN_TIMEOUT. No larger domain or second search was run.

Scope: finite simple actual graphs, not arbitrary triple systems. A graph is TF if every actual triangle is contained in some minimum triangle edge cover. An edge is heavy when its triangle codegree is at least three; H3 is the graph of heavy edges. The target hypothesis is TF plus triangle-free H3. Original mission start 2026-11-15T01:53:58Z, research cutoff 09:23:58Z, hard deadline 09:53:58Z. All work local Darwin. Ordinary AI mathematics; no human or formal verification. Requested Astra/Ultra, actual serving metadata not exposed.

## 1. The weaker availability target sufficient for the resource representation

First discard graph edges in no triangle. In a TF graph every remaining edge has codegree at least two. Indeed, put its triangle T wholly in a minimum cover C. If the edge had no other page, removing it would leave a cover because T still has two selected edges, contradicting minimality.

Define D with one vertex for each actual triangle and one edge for each graph edge of codegree exactly two, joining its two pages. D is simple: distinct actual triangles cannot share two graph edges. Its degree at T is exactly the number of light edges of T. Under triangle-free H3, every T has at least one light edge, so 1<=degree_D(T)<=3.

There exists a set R of codegree-two graph edges meeting every actual triangle **exactly once** if and only if D has a perfect matching. A selected D edge is precisely a selected light graph edge covering its two pages; exact-one coverage of all D vertices is the perfect-matching condition.

This is weaker than saying every actual triangle physically has exactly one light edge. A triangle may have additional light edges outside R. The weaker condition already suffices: make a resource graph F with vertices the non-R graph edges and one edge for each triangle, joining its two non-R edges and colored by its unique R edge. This F is simple, properly edge-colored, and each color occurs twice. Triangle packings are rainbow matchings; triangle covers are choices of resource vertices and colors meeting all F edges.

F is triangle-free. Three pairwise incident graph edges either form an actual triangle or are three spokes at one vertex. The former would give a triangle containing no R edge. In the latter case, the three closing R edges form an actual triangle containing three R edges. Both contradict exact-one. This argument does not require all non-R edges to be heavy.

Thus the direct availability question is:

    TF and triangle-free H3 ==> D has a perfect matching ?

It remains unproved. Even if resolved positively, the separate all-size mixed-cover/rainbow-matching inequality for F would still be needed for the proposed Tuza route.

## 2. Exact cover optimization through D

Let A be any selected set of heavy graph edges. Let U(A) be the set of triangle vertices not hit by A. The minimum number of additional light edges needed to cover U(A) is

    ell(A)=|U(A)|−mu(D[U(A)]).

Here a light edge may have its other endpoint outside U(A). For the upper bound, choose a maximum matching inside U. Cover every unmatched U vertex with any incident D edge, which exists because D has no isolated vertices. No two unmatched vertices are adjacent, and hence these additional chosen edges are distinct. The total is |U|−mu.

For the reverse bound, take an inclusion-minimal family L of light edges covering U. Every selected edge has a private endpoint in U. Therefore every nontrivial component of the selected-edge graph is a star, and a star center outside U has all leaves in U. A star with center in U saves exactly one edge relative to its number of U vertices; a star with center outside U saves none. Choosing one edge from each star with center in U gives a matching in D[U]. Consequently |L|>=|U|−mu(D[U]). Isolated U vertices do not arise in the selected covering family.

It follows exactly that

    tau(G)=min_{A subset E(H3)} [ |A|+|U(A)|−mu(D[U(A)]) ].

No fractional relaxation or independence approximation is involved. Edges in no triangle are never needed in a minimum cover. This formula was derived independently in discussion with root.

## 3. What a full minimum-cover light wedge really forces

Let T=abc have light edges ab and ac, with unique other pages P=abd and Q=ace. Let C be a minimum cover containing all of T. The other edges ad,bd,ae,ce are all outside C: otherwise ab or ac would be removable. If d=e, replacing ab and ac by ad saves one edge; this is the known K4 exclusion. Hence d and e are distinct. Edges be and cd are absent, since they would give an extra page on ab or ac. The edges among {b,c,d,e} in the link of a therefore form the path d-b-c-e, optionally closed by de.

The two immediate flips ab->ad (or bd) and ac->ae (or ce) are independently valid zero-cost cover changes. For distinct d,e, no single graph edge belongs to both P and Q, so these private pages alone give no two-for-one replacement. This is the precise point where the short local K4 argument stops.

The matching formulation sharpens that obstruction. Write A=C intersect E(H3), U=U(A), and L=C minus A. If bc is heavy, T is outside U, while P and Q are private U endpoints of the two selected D edges TP,TQ. In the star decomposition from Section 2, these edges belong to a star centered at the already heavy-covered T. Choosing one edge from each other U-centered star gives a maximum matching of D[U] exposing both P and Q. An augmenting path would reduce the light completion by one and contradict minimality. The missing global step is a reason that triangle-free H3 forces such a path (or another improving change of A).

If T has three light edges, it is a three-edge star centered inside U. Choosing any one of those edges for the corresponding maximum matching leaves its other two private pages exposed. The same missing augmenting-path issue remains. This case must not be silently excluded.

A minimum cover's selected-light star has no edge between two outside-U vertices. The star argument also rules out an edge of D joining two private exposed pages: it would be an augmenting path of length one. These are exact consequences of optimality, not a solution of the global availability question.

## 4. Endpoint consequences and narrow resolved cases

In every TF graph the light edges of any K4 form a matching. To check the decisive adjacent-light case, take a minimum cover containing face abc, where ab and ac are light. Their other K4 pages abd and acd are private, forcing ad,bd,cd unselected. Replace ab,ac by ad and retain bc. All removed-edge pages remain covered and the cover shrinks. Under triangle-free H3 this means every K4 has exactly two opposite light diagonals and four heavy boundary edges: zero or one light edge would leave an all-heavy face. Therefore each face of such a K4 has D degree one, and its light diagonal pairs it with exactly its other page. Its four faces give two isolated K2 components of D. The K4 faces already admit the exact-one selection; unresolved components are elsewhere.

D itself is triangle-free in a TF graph. A three-cycle of triangle pages with distinct shared graph edges is three faces of a K4. The shared light edges include adjacent K4 edges, contradicting the preceding exclusion.

There is also an actual-endpoint parity condition. For any connected component W of D, sum the graph-edge incidence vectors of its triangles over F2. Every light edge occurs zero or twice, so the surviving edge set B_W lies in H3. It is an even-degree graph because each triangle has zero boundary. Moreover |B_W| has parity |W|. Thus an odd component W of D forces an odd cycle in H3, of length at least five under the target hypothesis. In particular, bipartite H3 rules out odd D components. This does **not** imply a perfect matching in D: even subcubic components can still have a Tutte obstruction.

One easy class cannot be TF at all: suppose every actual triangle has exactly one heavy edge. Selecting all h heavy edges is a cover. If a cover omits q heavy edges, their at least 3q pages are distinct between omitted heavy edges, since every triangle has only one heavy edge. Selected light edges cover at most two such pages each. Thus its size is at least h−q+ceil(3q/2)>h when q>0. The all-heavy cover is uniquely minimum and contains no full triangle. This excludes the pure degree-two D model, including independent odd-wheel cones, but not mixtures with D degrees one or three.

## 5. The existing nine-vertex witness identifies the failed matching exchange

The known TF-alone witness is frozen in `notes/fresh_tf_light_wedge_counterexample.md`, SHA256 `ac39e3812be0a30857b3a1b9d33dcdc2637311f85feb4e50e78d16cf7470aef1`. It has tau=8 and a full cover of 012:

    C={01,02,12,15,27,34,46,68}.

Here A={12,27,46,68}, and

    U={013,024,034,135,156,345}.

D[U] has edges

    013--034 (03), 013--135 (13), 024--034 (04),
    034--345 (34), 135--156 (15), 135--345 (35).

The two triangle vertices {034,135} form a vertex cover of D[U]; the two-edge matching {034--345,135--156} proves mu=2. It exposes precisely the private pages 013 and 024 of the light wedge. Both exposed vertices lie on the same side of this bipartite D[U], and there is no augmenting path. The completion value is |A|+|U|−mu=4+6−2=8.

This is a concrete failed local exchange, not a counterexample under the strengthened hypothesis. The original graph has all-heavy triangles 126,246,267,268. Their presence prevents this control from resolving the target gate. Removing or repairing them while preserving TF has not been justified.

## 6. One targeted discriminator, ending unknown

To test the strengthened gate directly, one inverse-design problem was run on nine vertices. It kept 012,013,024 and forced 01 and 02 to have exactly those two pages, required a full-cover witness for every actual triangle at a common candidate optimum, and forbade every triangle whose three edges each have at least three pages. Smaller-cover separation was used exactly as in the preceding successful TF-alone discovery.

The adapted checker is `checks/tf_h3_light_wedge_inverse.py`; it preserves the original checker unchanged and explicitly identifies its provenance. A heavy flag is forced by every triple of pages of an edge; forbidding three flags on an actual triangle exactly excludes all-heavy triangles. Extra optional true flags cannot admit an invalid graph, and assigning the actual heavy predicate satisfies the encoding. The maximum candidate cover size 16 is valid on nine vertices by the complement of any 4-by-5 cut. Codegree-one exclusions are justified by Section 1.

The single run stopped after 180.052783375 seconds, with 782 solver/separation records, status **UNKNOWN_TIMEOUT**, and no certified candidate. This is neither UNSAT nor evidence that the theorem holds. No larger order, longer budget, or second search was attempted. The retained result is `evidence/tf_h3_light_wedge/inverse_n9.json`. There is no formal certificate and no new actual graph counterexample.

## Decision

Freeze the availability problem as OPEN. The strongest output is the exact D-perfect-matching equivalence for selecting red edges, the heavy-set/light-completion optimization, and the exposed-private-page obstruction to the proposed local exchange. The endpoint parity and K4 reductions narrow the geometry but do not supply the missing augmenting path or a change of heavy selection that improves a minimum cover. No claim that TF forces a K4, an all-heavy triangle, or physical one-light-edge triangles is made.
