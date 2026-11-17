> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# The remaining triangular unicyclic interface has ten ordinary shapes

Frozen ordinary classification/reduction candidate, 2026-11-16. This is a proved finite structural domain, not a survival census. All apex-neighbor choices and outside attachments remain to be handled at their exact scopes.

## Available hypotheses

Let L be a closed link component in a minimum CS failure and F=L-w connected unicyclic with unique cycle abc, no perfect matching, and at least one attached tree. The general triangle-vertex-transversal collapse, using S={w,a} and the ordinary WKE matching M plus an exposed leaf's w-edge, forces

    nu_match(F)<=3.

Every original F leaf has exactly two L neighbors, its F parent and w. Two leaves at the same parent would therefore be two nondirect length-two threads between that parent and w, forbidden by the accepted ordinary parallel-thread theorem. Thus every F vertex has at most ONE original leaf neighbor.

Under these hypotheses F has exactly one of twelve shapes in the table below. Two shapes are then excluded by the sharper |S|+|Z| collapse, leaving ten. This classification is independent of the optional GE leaf-count order bound.

## 1. Rooted attachment parameters

For each cycle vertex i in {a,b,c}, let T_i consist of that vertex and its attached tree, rooted at i. Put

    p_i=nu_match(T_i-i),
    b_i=nu_match(T_i)-p_i in {0,1}.

Write p=sum p_i and h=b_a+b_b+b_c. A matching either uses no cycle edge, gaining h above p, or uses one cycle edge, gaining1 plus the possible root benefit of the third root. It cannot use two cycle edges. Therefore

    nu_match(F)=p+g(h),
    g(0)=1, g(1)=2, g(2)=2, g(3)=3.             (1)

The inequalities and equalities are attained by independently choosing the appropriate root-exposing or root-using matchings in the attached trees. Thus (1) is exact.

If p_i=0, T_i-i is edgeless; all its vertices are leaves at root i. The no-double-leaf condition allows only no attachment (b_i=0) or one leaf (b_i=1).

If p_i=1, T_i-i has one nontrivial component, a star, and at most one isolated vertex (a direct root leaf). Attaching the root to the star center permits at most one other leaf there; attaching it to a star leaf permits at most one other original leaf at the star center. Thus the nontrivial rooted attachment is a single path of length2 or3, optionally together with one direct leaf at the root. These four types have:

| attachment at root | new vertices | b_i |
|---|---:|---:|
|path2|2|0|
|path3|3|1|
|leaf plus path2|3|1|
|leaf plus path3|4|1|

No other p_i=1 attachment satisfies the leaf restriction.

## 2. The p_i=2, b_i=0 possibilities

Equation(1) and nu(F)<=3 allow total p=2 only when h=0. If both positive p_i equal1, both are the path2 type. Otherwise one rooted tree T has

    nu_match(T)=nu_match(T-root)=2.

A tree with matching number two has a vertex cover of size two, by the elementary forest matching-cover equality. Let its two cover vertices be A,B. Their distance is at most two, since a longer path would contain an edge with neither endpoint in the cover. Every vertex off their connecting path is a leaf adjacent to A or B: a further internal edge would be uncovered, and an additional A-B connection would create a cycle.

If A,B are adjacent, the tree is a double star. Because every leaf other than possibly the designated root must satisfy the original no-double-leaf condition, there are at most three leaves in total. The condition nu(T-root)=2 requires at least five vertices. Thus the only allowed root placement is one of two leaves at one center of the five-vertex double star, giving the attachment "one edge to a branch with one leaf and one path2".

If A,B have distance two, the tree is a subdivided double star. If one cover endpoint has no extra leaf, the same five-vertex double-star rooted shape just described results. If both have leaves, there are at most three in total. With five vertices the tree is P5, and deleting the root preserves matching number two exactly when the root is an endpoint or the middle vertex. These give a path4 or two paths2. With six vertices, one center has two leaves and the other has one; the root must be one of the doubled leaves, giving "one edge to a branch with one leaf and one path3". No larger tree is possible under the leaf restriction.

Thus these are exactly the four p_i=2,b_i=0 attachment types. A p_i>=3 is impossible by (1).

## 3. Complete twelve-shape table

Cycle vertices may be permuted, all new paths have disjoint interiors, and a listed leaf is a new one-edge path. Every attachment not listed is empty.

| ID | attachments to abc | order | matching | deficiency |
|---|---|---:|---:|---:|
|1|one leaf at a and one at b|5|2|1|
|2|one path2 at a|5|2|1|
|3|one path2 at a; one leaf at b and at c|7|3|1|
|4|one path3 at a; one leaf at b|7|3|1|
|5|one leaf and one path2 at a; one leaf at b|7|3|1|
|6|one leaf and one path3 at a|7|3|1|
|7|one leaf and one path3 at a; one leaf at b|8|3|2|
|8|one path2 at a and one at b|7|3|1|
|9|one path4 at a|7|3|1|
|10|two paths2 at a|7|3|1|
|11|edge a-x, plus a leaf at x and one path2 from x|7|3|1|
|12|edge a-x, plus a leaf at x and one path3 from x|8|3|2|

For completeness, the parameter accounting is short. At p=0 the only nonperfect nonbare possibility is h=2, giving ID1. At p=1 the four one-tree types in Section1, combined with root-only or single-leaf choices at the other roots, give IDs2-7 after discarding perfect graphs and matching number above three. At p=2,h=0, two path2 roots give ID8 and the four p_i=2 trees give IDs9-12. These exhaust all parameter possibilities in (1). The displayed matching and deficiency values follow from (1) and the vertex counts, not a numerical optimizer.

## 4. The two deficiency-two shapes are excluded immediately

For ID7, name the direct leaf at a as l, the path as a-x-y-z, and the leaf at b as m. The maximum matching

    M={al,bm,xy}

exposes the cycle vertex c and the original leaf z. The edge wz exists. Set P=M union {wz}, of size four; the ordinary pseudoforest complement lemma gives a WKE cover Q of size at most four. Take S={w,c}. Deleting S leaves a forest; only w is matched by P into the outside, so |S|+|Z|=2+1=3. The general collapse contradicts |P|=4.

For ID12, name its extra edges ax,xy,xz,zt,tu, with y the short leaf and u the long-path leaf. The maximum matching

    M={bc,xy,zt}

exposes the cycle vertex a and original leaf u. The same construction P=M union {wu}, S={w,a}, has size four against |S|+|Z|=3 and gives the same contradiction.

Hence IDs7 and12 cannot occur. The actual remaining domain consists of IDs1-6 and8-11: TEN shapes, all of deficiency one. Every possible apex neighborhood must contain their original leaves, but may include any other vertices; no further apex-neighbor pruning is silently assumed.

## Scope of any subsequent finite completion

A proof based on this domain must still enumerate or argue every allowed w-neighborhood for each of the ten shapes, construct only actual graph edges/triangles, and supply a CS-compatible strict tuple, residual-clique contradiction, cover substitution or fully audited packing augmentation. Merely finding WKE tuples is insufficient. The present note launches no computation and asserts no passing count for those remaining choices.

Dependencies: ordinary matching-cover equality for forests; ordinary unicyclic matching-complement/exposable-leaf lemmas; accepted parallel-thread exclusion; and the new general triangle-vertex-transversal cover collapse. No Gallai-Edmonds, finite census, or external source theorem is used in this classification.
