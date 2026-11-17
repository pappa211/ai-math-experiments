> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Simultaneous-cover collapse after deleting a small triangle transversal in a link

Status: ORDINARY_PROOF_USING_DECLARED_CLASS_LOCAL_INPUTS. This generalizes the accepted one-vertex simultaneous-cover argument in near_bipartite_wke_cover_collapse_v1.md. It is a necessary restriction on minimum-CS links, not WKE availability for all links.

## 1. Exact general statement

Let L be a closed link component at hub h in a minimum combined-CS failure, globally or within an edge-subgraph-hereditary class. Let S subset V(L), write s=|S|, and suppose F=L-S is triangle-free. Let P be a matching of L and Q a vertex cover of L-P satisfying |Q|<=|P|. Put r=|P| and

    Z={z in V(F): az belongs to P for some a in S}.

Then necessarily

    r <= s+|Z|.

In particular |Z|<=s, so no such WKE tuple has size greater than2s. The sharper bound keeps track of whether P uses edges between S and F; edges of P inside S create no Z vertex.

## 2. Balanced residual and all supported F edges

Delete every h-spoke into L and the rim matching P, obtaining K. The r hub triangles on P use only deleted edges and are edge-disjoint. The edge set P together with the h-spokes to Q covers every lost actual triangle: a triangle lost on a removed rim edge meets P; a lost hub-spoke triangle has its other two vertices in this same closed link component and meets P or hQ. Standard minimum-CS balanced accounting therefore gives a contradiction immediately, or yields

    B(K), nu(K)=nu(G)-r, tau(G)=2nu(G).

Here B means literal K4/K5 supports for all shared-edge triangle components, with triangle-free background allowed.

Take e=xy in E(F) minus P. The authenticated codegree-two condition supplies a triangle xyt distinct from hxy. Its apex t cannot be in F, because F is triangle-free. If t belongs to S, the page survives unless one of tx,ty belongs to the matching P. Such a deletion implies that x or y lies in Z. If t is outside L and is not h, both page spokes survive: all endpoints of P lie in L and neither spoke is a deleted hub edge. An apex in a different h-link component is excluded by closedness. Consequently every edge of F-P is triangle-supported in K except possibly edges incident with Z.

Every literal residual block contains at most two vertices of F, because three would form a triangle in F. It therefore contains at most one actual F edge. Choose a minimum cover of each residual K4/K5 block containing its supported F edge, if there is one. A minimum cover through any prescribed single edge exists in both clique types. The union D is a minimum K-cover containing ALL supported edges of F-P simultaneously. Shared vertices between blocks do not affect this edge-support argument.

## 3. Complete lost-triangle cover

Every edge of (L-P)-D either touches S or is an unsupported F edge touching Z. Hence S union Z is a vertex cover of that graph. Add P and the h-spokes to S union Z to D. Every G triangle is met: triangles surviving in K meet D; an outside page on a deleted P edge meets P; and a lost hub triangle meets its P rim, its supported D rim, or one of the selected h-spokes. Thus

    tau(G) <= 2nu(K)+r+s+|Z|.

If r>s+|Z|, this is strictly below2nu(K)+2r=2nu(G), a contradiction. This proves the statement. No assertion that every WKE tuple is a maximum matching is needed, and L need not be K4-free.

## 4. Ordinary two-apex perfect-forest consequence

Suppose |S|=2 and F is a nonempty perfectly matchable forest with matching number r>=3. Then F must be a single even path.

Indeed let M be its perfect matching. If F has c>=2 nonempty components, then F has2r-c edges and F-M has r-c<=r-2 edges, so it admits a vertex cover of size at most r-2. If F has one component, F-M has r-1 edges. Unless these edges form a matching, two adjacent edges can be covered by their common endpoint and all others separately, again giving a cover of size at most r-2. If F-M is a matching, every vertex has at most its one M edge and one other forest edge; connectedness makes F a path, whose order is even.

In either excluded case take P=M and Q=S union a vertex cover of F-M of size at most r-2. Every edge of L-P either lies in F-M or touches S, so Q covers L-P and |Q|<=r. This is a WKE tuple with Z empty. Sections1--3 force r<=2, contradicting r>=3.

The single-even-path case is a limitation of this argument, not a claimed realizable minimum-CS link. Empty F and the matching-size-at-most-two boundary are also not resolved here.

## 5. Application scope for a pure selected cycle

If a graph has a selected cycle C covering every actual triangle, and v is on C with selected neighbors a,b, then every edge of L_G(v)-{a,b} belongs to C. For a closed component L, use S=V(L) intersect {a,b}; F=L-S is therefore a disjoint union of paths and isolates. This implication uses the actual triangle vab and the fact that v has no other selected cover edge.

The theorem is applicable with that S, or with both selected neighbors when they lie in L. In the two-neighbor case, if F is perfectly matchable and has matching size at least3, the preceding consequence reduces it to a single even path. The nonperfect and single-path cases remain open within this route. No assertion is made that a pure cycle cover is minimum or that its size can always be reduced; challenger_spanning_cycle_mincover_boundary_v1.md explicitly refutes that shortcut.

Dependencies: authenticated class-local codegree and balanced-residual CS accounting; elementary K4/K5 cover-through-one-edge facts; the displayed forest edge counts. Conceptual source: restoration's accepted near_bipartite_wke_cover_collapse_v1.md. No finite computation, Gallai--Edmonds, Kotzig, or unproved two-apex WKE theorem.
