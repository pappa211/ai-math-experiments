# A simultaneous private-page rotation and its exact type3 ledger

Status: ordinary proof draft frozen for independent challenge. No global cover theorem is claimed. This is a concrete equal-cardinality packing operation with a complete description of where private K4 states can be gained or lost. It uses actual graph edges throughout.

## Setup and valid rotation

Let P be a maximum triangle packing in a finite simple graph G, with support B. Choose r>=1 TYPE1 members

    T_i=x a_i b_i, i=1,...,r,

having the same canonical centre x and private base a_i b_i. Suppose each has a private page Q_i=z a_i b_i with the SAME apex z. Put S={a_i,b_i:1<=i<=r}. Because the T_i share x and are edge-disjoint, their bases form a matching: |S|=2r. Privacy gives z not in S union{x}, and every edge zu with u in S lies outside B. Every xu with u in S lies in exactly one selected T_i.

The Q_i are pairwise edge-disjoint: their bases have disjoint endpoints and all share only z. They avoid every unrotated packed triangle, because they are private for their respective T_i. Therefore

    P'=(P minus {T_i}) union {Q_i}

is again a maximum packing of the same cardinality. Its support is exactly

    B' = (B minus F) union A,
    F={xu:u in S}, A={zu:u in S}.

The bases a_i b_i remain packed. The sets A and B are disjoint, as are F and A. No unmentioned edge changes support status.

Since each original T_i is type1 and has the private page Q_i, xz cannot be an actual edge outside B: if it were, x,a_i,b_i,z would give private pages on all three T_i edges. Thus xz is either absent or belongs to an UNROTATED packed member. In either event xz is not an edge of E(G) minus B'.

## Every rotated member remains type1

In P', the old triangle T_i is private for Q_i on base a_i b_i, since xa_i,xb_i were freed. Suppose Q_i acquired a private K4 completion with apex w.

If w=x, it would require xz outside B', which has just been excluded. If w!=x, the three new completion spokes wa_i,wb_i,wz are not incident with x, so none is a freed edge in F. Being outside B', they were therefore already outside B. The edges za_i,zb_i were also outside B by privacy. In particular z,a_i,w would be an actual triangle entirely outside B, contradicting maximality of P. The new Q_i has a private page and no private K4 completion, so the elementary0/1/3 private-page taxonomy makes it type1.

This verifies the type of the changed packed members themselves; their contribution to the type3 count remains zero.

## How an old private K4 can be lost

For an unchanged member T that was type3 in P, let w be its unique private K4 apex. Its three old private spokes are {wt:t in V(T)}, all outside B. The old completion remains private relative to P' exactly when none of these spokes enters A.

Thus the OLD completion is disrupted exactly in either of these two cases:

    (L1) w=z and V(T) intersects S;
    (L2) z belongs to V(T) and w belongs to S.

These are simply the two ways that an old spoke wt can equal a new support edge zu. No triangle list or degree approximation is being substituted for edge intersection.

A disrupted old type3 member cannot contain x. In case L1, containing both x and a vertex u in S would make T share packed edge xu with a rotated member. In case L2, containing x would make its old private spoke xw belong to B because w is in S. Both are impossible.

If a disrupted T is still type3 in P', its new private apex MUST be x. Indeed any new private K4 that was not private before must use a freed edge of F, and T does not contain x; hence its apex must be x. Therefore it remains type3 precisely if

    for every t in V(T), xt is an actual edge outside B'.

In case L2 this cannot happen, since z is in T and xz is not outside B'. Such members really lose type3. In case L1 the displayed test decides whether a different apex x preserves type3 despite loss of the old apex z.

Let D be the set of unchanged old type3 members satisfying L1 or L2 and failing this new-apex-x test. These, and only these, are the genuinely lost type3 members.

## How a new private K4 can be created

Let T be unchanged and not type3 in P. A new private K4 completion must use a freed edge in F; otherwise its three spokes were already outside B, making the completion private before rotation. There are exactly two geometries:

    (C1) x not in V(T): the new apex is x, and every edge xt,
         t in V(T), is actual and outside B'.

    (C2) x in V(T): the new apex is some u in S, and every edge ut,
         t in V(T), is actual and outside B'.

The common-centre packing condition ensures T intersects S trivially in C2: otherwise it would share an old packed edge xu with a rotated member. Hence no proposed apex u belongs to T. These tests are necessary by the freed-edge argument and sufficient by the literal definition of a private K4 completion. Let C be the set of unchanged old non-type3 members satisfying one of them. It is the exact set of newly created type3 members.

A useful sufficient instance of C1 is the following: if an unchanged packed member is T=aby, with a,b in S, x outside T, and xy an actual edge outside B, then T becomes type3 with apex x. The edges xa,xb are freed and xy cannot enter A, since x is neither z nor a member of S. Thus all three spokes from x are outside B'. This is the advertised two-covered-endpoint creation mechanism.

## Exact count and the available lexicographic objective

Write k3(P) for the number of type3 packed members. The rotated members remain type1; all unchanged old type3 members except D remain type3; the newly created ones are exactly C. Therefore

    k3(P') - k3(P) = |C| - |D|.

Choose P lexicographically by (maximum packing cardinality, maximum k3, then any stated secondary objective). The first two choices are available in every finite graph. For EVERY rotation above, they imply

    |C| <= |D|.

This is a genuine mixed-state constraint. It does not imply that C is empty or that the rotation preserves type3; it permits a large destroyed set. A secondary square-degree objective can constrain a rotation only when |C|=|D|. Under that equality, if P also maximizes F=sum_v d_P(v)^2 subject to the first two objectives, the rotation changes only the incidences at x,z and gives

    F(P')-F(P)=2r(d_P(z)-d_P(x)+r)<=0.

One must NOT import the unconditional private-page degree inequality from the earlier F-first objective into this different lexicographic order. A one-page move could lose primary type3 count.

If the globally maximum k3 is zero and P happens to be all-type1, D is empty, so C must be empty. Within any private-apex fibre, take all members with centre x. For another fibre member of centre y, adjacent centre edge xy outside B forbids its base from having both endpoints covered by that x-colour matching. This eliminates the repeated-centre escape in the local4-for3 lemma. However maximum k3=0 is an additional hypothesis, not an availability theorem for arbitrary graphs or minimal Tuza violations. Cross-fibre and all-U triangle compatibility also remain to be proved.

## Unbounded loss from one rotated member

There is no universal constant bound on |D| in terms of r without retaining additional structure. For any n>=1, take distinct vertices x,z,u,v and a_i,b_i for i=1,...,n. Include exactly:

- triangles xuv and zuv, sharing base uv;
- K4[z,u,a_i,b_i] for each i.

All K4 blocks share only edge zu; the two-triangle book meets them in that same edge. There are no other cross edges. Every actual triangle lies either in the two-page book or in one of the K4 blocks: a triangle with private vertices from different blocks would require a missing cross edge. There are2+4n actual triangles,4+2n vertices and5+5n edges.

Prescribe P={xuv} union {u a_i b_i}. The first member is type1 with private page zuv, and each of the n other members is type3 with private apex z. Every block has packing number one, so P is maximum of size n+1 by triangle ownership and attains that upper bound.

Rotate the single member xuv to zuv. Now every unchanged u a_i b_i has only its opposite-base page z a_i b_i private; its other two old private pages use the newly packed edge zu. It becomes type1. The rotated member is type1 as proved above. Thus |D|=n and |C|=0 for r=1.

This example satisfies Tuza very cheaply: {zu,uv} union {a_i b_i} is a cover of size n+2<=2(n+1), lying in both the original allowed private-K4 set A(P) and the new support B'. The shared destruction edge itself creates cover savings. The fan therefore identifies a required accounting phenomenon; it does not refute a more refined rotation-plus-cover argument.

## Decision and remaining exact gate

The operation and ledger are proved; a cover implication is not. A prospective global argument must use the actual shared new-support edges responsible for D, rather than merely counting lost type3 members, and must charge every cross-group triangle. The fan shows why a bounded one-created-for-few-destroyed rule cannot be assumed. The next consequential question is whether a Hall-deficient or over-budget support state forces a family of these rotations whose creation/destruction interfaces can be paid by the shared-edge cover savings. No such family or complete transfer theorem has been established here.
