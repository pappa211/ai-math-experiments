> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Cone matching equality and strong cyclic-link robustness do not characterize the link

Frozen ordinary counterexample, 2026-11-16. This refutes only the proposed matching/robustness shortcut. It does not refute the accepted minimum-CS TF-residual WKE theorem or any global tightness condition.

## Literal graph

Let U={u1,u2,u3}, V={d,v1,v2,v3}. Form L from a K4 on {d,a,b,c} and the complete bipartite graph K_{3,4} with parts U,V, sharing exactly the vertex d. There are NO other edges. Thus L has10 vertices and18 edges. Let A=h+L be its cone.

The matching

    P={da,bc,u1v1,u2v2,u3v3}

is perfect in L, so its ordinary matching number is5. The residual R=L−P is triangle-free: the K4 becomes the four-cycle d-b-a-c-d, and the bipartite piece remains bipartite, with the pieces still sharing only d. The set

    Q={d,a,u1,u2,u3}

covers R and has size5=|P|. Thus (P,Q) is a genuine WKE tuple with triangle-free residual.

## Cone packing and cover numbers

Every rim triangle of L lies in the K4, so at most one rim triangle can be used in an edge-disjoint triangle packing of A. A packing with no rim triangle is a matching of L lifted to the hub, and has size at most5; P realizes5.

Deleting any K4 triangle T from L leaves no perfect matching. If T=abc, the three vertices a,b,c can only be matched to d. If T contains d, the other two T vertices can only be matched to the fourth K4 vertex. Thus matching(L−E(T))<=4. Any packing containing one rim triangle therefore has at most1+4=5 members. Consequently

    nu_triangle(A)=nu_matching(L)=5.

In particular every maximum matching of L meets EVERY rim triangle. This is the exact matching obstruction suggested by the proposed shortcut, and it holds here.

The cone splits into the literal K5 on {h,d,a,b,c} and the cone over K_{3,4}, with only their edge hd in common. Four edges cover the K5, for example {hd,ha,da,bc}; the three spokes {hu1,hu2,hu3} cover every triangle in the bipartite cone. Hence tau(A)<=7.

In fact tau(A)=7. The K5 requires at least4 cover edges. The bipartite cone requires at least3, witnessed by the three edge-disjoint triangles h ui vi. A total cover of size6 would therefore have to consist of a minimum four-edge K5 cover and a minimum three-edge bipartite-cone cover overlapping at hd. But a three-edge cover of the bipartite cone cannot contain hd: the three displayed triangles avoid hd and already require three other edges. Thus size6 is impossible. The two subfamilies contain all actual triangles, so the argument proves the exact value.

## Strong link robustness also holds

All degrees in L are at least3; d has degree6, each ui degree4, and every other vertex degree3. Thus its cycle rank is

    mu(L)=18−10+1=9 >= Delta(L)+1=7.

Deleting d gives two connected components, K3 and K3,3; both are cyclic, and the latter is multicyclic. Deleting any other vertex leaves L connected. If the deleted vertex is in {a,b,c}, the entire K3,4 remains. If it is a ui, the remaining K2,4 is multicyclic; if it is a vi, the remaining K3,3 is multicyclic. Thus EVERY component of every L−x is cyclic, and NO L−x is a pseudoforest.

The example therefore satisfies closed-link minimum degree, cyclic vertex-deletion, the strengthened no-apex-pseudoforest condition, a TF-residual WKE tuple, cone/matching equality, and universal intersection of maximum matchings with rim triangles. Nevertheless L is neither K3 nor K4 nor triangle-free.

## Exact reason it is harmless for minimum CS

The cone has tau7<2nu10. Its literal K5 on {h,d,a,b,c} has outside triangle boundary confined to the single edge hd, so the accepted safe-clique reduction also excludes it from a minimum CS failure. The shortcut omitted the global tight-cover condition and this boundary geometry. The full TF-residual WKE theorem retains those hypotheses; this example does not challenge it.

All values and properties above have ordinary explicit proofs. No finite run, solver, graph atlas, external matching theorem or representation-availability premise is used.
