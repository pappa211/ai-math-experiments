> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Actual endpoint-link matching operations

TUZA-26 ordinary operation, frozen 2026-11-16. Fixing an ACTUAL residual packing makes ordinary graph matchings into valid triangle replacements. Every physical rim edge occupied outside the replacement is removed from the usable link. No auxiliary cover matching is interpreted as a packing.

## Interface and partition of the fixed packing

Let e=uv, K=Q-e, and x,y be distinct common neighbors of u,v. Put

    P_x={ux,vx}, P_y={uy,vy}, L=K-P_x-P_y.

Assume nu(Q)=nu(K)=k and nu(L)=k-1. Fix an actual maximum packing M of L. Partition it as M_u, the triangles containing u; M_v, those containing v; and M_0, those containing neither. No L triangle contains both u and v because uv is absent, so this is a disjoint partition. Write m_u=|M_u| and m_v=|M_v|.

A triangle containing u is represented by its opposite rim edge ab. Edge-disjoint triangles through u correspond EXACTLY to a matching of these rim edges: their u-spokes are disjoint exactly when their rim endpoints are distinct. The rim edges used by M_u form a matching exposing x,y, since all four marked endpoint spokes were deleted in L.

## One-endpoint operation, including the uv-page payment

Retain M_0 and M_v. Define H_u on N_Q(u) minus {v}, with edge ab precisely when ab is an actual Q edge and is not used by a retained triangle. The u-spokes of any such link triangle are automatically unused by the retained packing, since no retained triangle contains u. Thus ANY matching N in H_u gives an actual replacement for M_u, with all third edges accounted for.

If H_u-y has a matching of size at least m_u+1, replace M_u by its link triangles and append the actual page uvy. The matching avoids y; the link excludes v; uv and vy were absent from M; therefore the appended page is disjoint from the replacement and the retained packing. The final size is at least

    (k-1)-m_u+(m_u+1)+1=k+1.

This contradicts nu(Q)=k. The same argument applies to H_u-x and symmetrically at v. Hence any surviving interface satisfies

    nu_matching(H_u-x)=nu_matching(H_u-y)=m_u,
    nu_matching(H_v-x)=nu_matching(H_v-y)=m_v.

These equalities have an exact alternating-path consequence. Relative to the actual matching M_u, every augmenting path in H_u must have exposed endpoints x and y: otherwise it avoids one of those exposed vertices and augments the corresponding vertex-deleted graph. An exposed vertex cannot be internal to an augmenting path. In particular nu_matching(H_u) is either m_u or m_u+1. This is a statement about a literal endpoint fan, not a cover-disagreement graph.

## Two-endpoint operation and physical rim conflicts

Now retain only M_0, replacing BOTH endpoint families. Define H_u^0 and H_v^0 in the same way, deleting only rim edges occupied by M_0 and excluding the opposite endpoint from each link.

If matchings N_u in H_u^0 and N_v in H_v^0 are edge-disjoint as sets of PHYSICAL rim edges and satisfy

    |N_u|+|N_v| >= m_u+m_v+2,

their triangles together with M_0 form an actual (k+1)-packing of K. The only possible cross-family conflict is a common rim edge: a u-spoke cannot be a v-spoke, and neither can be a rim edge of the other family because both links exclude the opposite endpoint.

Let X=N_Q(u) intersect N_Q(v), the full book apex set. The common rim-edge set is exactly

    E(H_u^0) intersect E(H_v^0) = E(Q[X]) minus E(M_0).

Thus all possible conflicts are actual graph edges between common neighbors. This identifies the physical obstruction rather than hiding it in a matching label. The sufficient condition includes two separate gains of one, but also any other gain distribution whose total is at least two.

## Stronger decoupling at codegree two

Suppose X={x,y}. No rim edge of M_v can occur in the u-link: such an edge would have both endpoints in X, while M_v cannot use either x or y because vx,vy are absent from L. The same holds with u,v reversed. Therefore

    H_u^0=H_u, H_v^0=H_v,

and their intersection contains at most the single edge xy.

This yields explicit operations and exact surviving alternatives:

* If xy is absent, or its edge is occupied by M_0, simultaneous endpoint augmentations are automatically compatible. Consequently at most one endpoint link can have an augmenting path.
* If xy is present and unused by M_0, the direct link edge xy augments either endpoint matching because x,y are exposed. If either endpoint also has an augmenting x-to-y path avoiding xy, augment there along that path and use the direct xy edge at the other endpoint. Their physical rim edges are disjoint, giving the forbidden gain of two. Thus every augmenting matching at either endpoint must use xy; equivalently deleting xy destroys all its augmenting paths.

No triangle-packing inference comes from a matching of COVER EDGES. These are actual link matchings built after the complete outside packing has been fixed and its occupied rim edges removed.

## Sharp fixed-outside obstruction from the preserved connected control

Use the certified star555 control: central K4 on 0123, K5 leaves01456, 02789, 03(10)(11)(12), and e=45. Take compatible hubs x=0,y=1. In L, vertices4,5 have only background edges46,56. Its triangle family partitions into the central K4, the two latter K5 leaves, and triangle016. Therefore nu(L)<=1+2+2+1=6, attained for example by

    016, 023, 078, 279, 0(10)(11), 3(10)(12).

Every maximum L packing MUST contain016, since each family has the stated independent upper bound. Hence M_u=M_v is empty for every maximum M, and M_0 occupies all rim edges01,06,16. Each endpoint's neighbor set, excluding the opposite endpoint, is {0,1,6}. Both usable endpoint links are therefore EMPTY for EVERY maximum residual packing.

Nevertheless the earlier prescribed certificate proves K is supported, triangle-connected, single-edge resilient with nu(K)=7,tau(K)=12, while Q has nu7,tau13 and all local page-pair cover/packing equations hold. The pair0,1 is compatible because nu(L)=6. Thus fixed-outside link augmentation is not guaranteed by those local hypotheses, even after allowing every maximum residual packing. An operation must change triangles in M_0 or invoke the actual core's global no-blocker/all-triangle/three-connectivity constraints. This control fails those global constraints as already documented; it is not a counterexample to the desired minimum-Q theorem.

There is also a smaller codegree-two illustration. Let Q=K5-pq on vertices{u,p,q,a,b}, delete e=up, and choose hubs a,b. Then K is K4 on{u,q,a,b} with trianglepab attached on ab. It has nu2,tau2; Q has nu2,tau3. The common residual L is triangleqab plus background uq, so nu(L)=1. Its only maximum packing occupies all possible endpoint-link rim edges, and both usable links are empty. Here K is fragile and the required full-page minimum-cover hypotheses fail. It isolates that codegree-two compatibility alone does not make the local matching operations available.

## Remaining concrete bridge

The operations are valid whenever the displayed matching certificates exist. Universal availability is OPEN. In the codegree-two case the only simultaneous-link rim collision is xy, but both links can still be blocked by triangles in M_0. The next bridge must either exchange a specific occupied outside triangle while preserving the residual packing size, or use a global hypothesis to rule out the compulsory outside obstruction. Merely restating the absence of an alternating path is not a new reduction.

Dependencies: accepted no-blocker profile -> compatible pair and actual (k-1)-packing M -> one- and two-endpoint link operations above (PROVED_ORDINARY, independent review requested) -> a forced applicable matching/outer-packing repair (OPEN) -> elimination of the remaining core (OPEN) -> Tuza.

Relied sources: notes/matching26_marked_strip_augmentation_v2.md for compatibility; scripts/matching26_book_controls.py and evidence/matching26_book_controls.json for the already certified star555 values and resilience. The additional common-residual partition and witness above are ordinary checks, not a new census. No numerical computation was run for this note.
