> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# The two matching-number-two triangular unicyclic remainders

Frozen ordinary proof candidate, 2026-11-16. This is a direct symbolic case argument with no finite certificate file or enumeration premise. It closes the two shapes left by the new paid-triangle collapse.

Let L be a closed link component in a minimum CS failure, F=L-w connected unicyclic with triangular unique cycle, no perfect matching, and at least one attached tree. Suppose nu_match(F)<=2. The accepted parallel-thread theorem excludes two original F leaves at one parent. Then F is one of the following two shapes:

    I: triangle abc with leaves x at a and y at b;
    II: triangle abc with path a-x-y.

For completeness, the ordinary attachment formula r=sum p_i+g(h), g(0),g(1),g(2),g(3)=1,2,2,3, gives this directly. If sum p_i=0, each root has at most one leaf; nonperfect and nonbare forces exactly two leaf roots. If sum p_i=1, r<=2 forces h=0; the sole rooted attachment with p_i=1,b_i=0 and no doubled original leaves is a path of length two. Larger sum p_i is impossible. This is the matching-two specialization of the separately reviewed rooted-tree classification, not a count-based inference.

Use the ordinary at-most-three-branch exclusion when L has at most three vertices of degree at least three. Otherwise the cases below give literal WKE tuples and the ordinary triangle-free deletion-set collapse. All named edges of P exist by their displayed case hypotheses.

## Shape I: abc, ax, by

Minimum degree two forces wx,wy. The optional w-neighbors are precisely a,b,c.

If wc is absent, the only possible branch vertices are a,b,w. The ordinary three-branch theorem excludes L.

Suppose wc is present but w misses at least one of a,b. Interchanging a with b and x with y if necessary, assume wb is absent. Use

    P={ac,by,wx}, Q={a,c,y}, S={a}.

The Q vertices cover every remaining F edge ab,bc,ax and the remaining apex edges wy,wc and optional wa. Every L triangle contains a: the only possible triangles are abc, wac and wax. Hence L-S is triangle-free. The outside mate of a in P is c, so |S|+|Z|=2<|P|=3. The ordinary collapse contradicts equality.

Finally suppose wa,wb,wc all exist. Use

    P={ac,by,wx}, Q={a,b,w}.

The residual L-P contains the triangles abw and bcw sharing bw, while ac is absent. Both triangles would lie in the same literal residual clique block, which would force ac to exist in the residual. This is impossible. This exhausts all three optional apex-neighbor choices without a finite-state premise.

## Shape II: abc, ax, xy

Minimum degree two forces wy. The optional w-neighbors are precisely a,b,c,x, with at least one present because the closed link has minimum degree two at w.

If w sees at most one of b,c,x, the only possible branch vertices are a,w and that one vertex. Again the ordinary three-branch theorem applies.

Otherwise w sees at least two of b,c,x. By interchanging b,c, assume wc exists. Use throughout

    P={ab,wc,xy}.

If wx exists, take

    Q={a,b,w}, S={w,c}.

After deleting P, the F edges are ac,bc,ax, all covered by a,b; every surviving apex edge is covered by w. The set S is matched internally by wc, so Z is empty. Deleting w,c leaves the path/tree with edges ab,ax,xy, hence is triangle-free. Therefore |P|=3>|S|+|Z|=2.

If wx is absent, both wb and wc must exist. Take

    Q={a,b,y}, S={a,b}.

The remaining F edges ac,bc,ax are covered by a,b; the apex edges wy,wb and optional wa are also covered. The set S is matched internally by ab. Deleting a,b leaves the path x-y-w-c, which is triangle-free. Again the ordinary collapse gives3>2.

These cases exhaust all permitted apex neighborhoods, including optional wa in every branch. The collapse theorem and the residual-diamond argument already control arbitrary outside attachments; no actual crossing triangle is omitted.

## Conclusion and dependencies

Both shapes are excluded. Together with `wke_residual_triangle_count_collapse_v1.md`, this eliminates the entire nonperfect triangular-cycle remainder by an ORDINARY proof. Direct other inputs are:

- `three_branch_cs_link_exclusion_v1.md`, SHA dd530b892b10279fda98b195522f1027376deadfbce7a769ae2aec28d62bafa4;
- `coordinator_triangle_deletion_set_WKE_collapse_v1.md`, SHA 7c5e3ef8b7027f1d19e2de67a2edafe337c48fcb7883cf84539df27ff08a4f6c;
- `parallel_thread_link_exclusion_v1.md`, SHA 6eec22bff2400c5a3c07a43d41649a7b8e0d6e08f31d23c8e6e020c6f82718c4;
- the ordinary rooted-attachment formula and p_i=1 classification in `triangular_unicyclic_small_remainder_classification_v1.md`, SHA c9b339a1ea4eb34e549a8a2786bad43685533afc85a8f7ec34fc3209e9871d53.

The old374-record finite completion remains independently validated and preserved at its own evidence level. It is not used as a premise here. Reading its first two shapes supplied a discovery aid; all cases, tuples and cover/triangle checks needed for this new proof are written explicitly above.
