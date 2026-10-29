> Curated source from TUZA-03/proof/CLOSED_BOUNDARY_DESCENT_STABILITY.md. Original SHA-256: `2214c28ae17b3e87cbe8f0119b7793bda0d6765c94539eb9d2e99876010045ff`. Historical research record; current acceptance and formal status are given in TUZA-03. Editorial changes remove private execution context and unavailable local links.

# Closed-boundary stability criterion and a stable four-spoke descent


## General criterion

Let H be a finite simple graph with 3-partite triangle hypergraph, nu(H)=h. Let U and P be disjoint independent graph-vertex sets. Put W=U union P. Assume that, for every p in P and x outside W with px in E(H), p and x have at most one common neighbor in U. In particular the condition holds if every outside vertex sees at most one U vertex.

Let A be any subset of E_H(U,P), put K=H−A, and suppose

    nu(K)=h−d,    tau(K)=2nu(K)−1.

Let L_A be the full family of H-triangles using an A-edge, INCLUDING triangles that might also use a subsequently deleted edge g.

If

    nu(L_A)>=d+2,

then K is packing-edge-stable.

Proof. Suppose g were essential in K. Put J=K−g. Cover deletion and Aharoni give

    nu(J)=h−d−1,    tau(J)=2(h−d−1).

Use equality extraction/exhaustion to obtain its h−d−1 isolated K4 face families. The closed-boundary face-choice argument below gives one face from every block compatible simultaneously with every L_A triangle. Appending a maximum L_A-packing would yield

    nu(H)>=(h−d−1)+(d+2)=h+1,

contradiction. QED.

## Why the faces avoid ALL L_A triangles

The argument is unchanged when some L_A triangles use g.

Every L_A triangle has one U vertex, one P vertex, and one outside vertex, since H[W] is bipartite. Any J-K4 meets W in at most two vertices.

If it meets W in at most one vertex, choose a face avoiding W. Such a face has all edges outside W, whereas every edge of an L_A triangle meets W.

Otherwise write the block {u,p,x,y}, where u belongs to U, p to P, and x,y are outside W. Its edge up is retained in J and therefore is not in A. Choose face pxy.

The edge xy cannot occur in L_A. If px occurred in an L_A triangle, that triangle would be pxt with t in U and pt in A. But both p and x are already adjacent to u, so local boundary uniqueness at px forces t=u, contrary to up being retained. The same holds for py.

Thus every chosen face avoids every L_A edge, independently of whether g occurs elsewhere in that triangle. Equality blocks have disjoint edge supports, so these choices are simultaneous.

## Convenient row-count version

The L_A families belonging to different terminals u in U have disjoint edge supports. A shared outside spoke px would require p and x to have two common U-neighbors, forbidden by the local boundary condition.

Hence if at least d+2 terminal rows contain an A-edge lying in an H-triangle, selecting one such triangle from each row already proves nu(L_A)>=d+2. The criterion then proves stability of K without a free-page classification or an integrality theorem.

## Application to an actually expensive exact two-apex restoration

Assume H is a reduced stable rainbow slack-one remainder with nu(H)=h, and restore T=abc. Suppose the individual new family is exactly the two-apex bipyramid on p,q, with pq absent, and

    nu(H+T)=h+1, tau(H+T)=tau(H)+3.

Outside the already settled cores, at least five of the six old spokes are active, by proof/EXPENSIVE_FAMILY_DEFECT_FOOTPRINT.md. Here active means lying in an old triangle; a spoke outside the defective component is triangle-free.

Choose two compatible new pages on distinct bases and distinct apices. Their four-spoke footprint A is a path of length four, with one terminal as its middle row (two deleted spokes) and one deleted spoke in each other row. The closed-boundary equality-deletion lemma in rigidity/CLOSED_BIPARTITE_BOUNDARY_EQUALITY_DELETION.md gives

    nu(H−A)=h−1, tau(H−A)=2h−3.

If all six spokes are active, every such A has three nonempty deleted rows. The general criterion with d=1 therefore makes EVERY such descendant stable.

If exactly five spokes are active, choose the unique deficient terminal as the middle row. For example, if ap is inactive, choose pages abp and acq, with

    A={ap,bp,aq,cq}.

The middle row a contains active aq, while b and c each contribute an active deleted spoke. Thus all three rows are nonempty and the same criterion proves stability.

Consequently there always exists a four-spoke descendant K with

    nu(K)=h−1, tau(K)=2h−3,

which is itself packing-edge-stable. It need not retain the original expensive restoration family; four of that family's spokes have been removed.

## Precise remaining gap

This settles existence of a stable one-step descent, not an iteration. In a two-family instance an intact second family may survive and the separate general footprint lemma controls its cost. In a single-family instance the original new family is no longer intact after deleting A. No new expensive family has been constructed over K, and no claim that the operation can be repeated to reach a settled core follows.

The unrestricted two-triangle theorem remains open in this work.

## Version and scope note

The earlier sufficient global-boundary hypothesis is preserved in CLOSED_BOUNDARY_DESCENT_STABILITY.global-boundary-version.md. The critic checked that both the equality-face argument and the support-disjointness argument require uniqueness only at actual P-to-outside edges. This weaker condition must still be verified in each application; it is not automatically valid for two boundaries taken together.
