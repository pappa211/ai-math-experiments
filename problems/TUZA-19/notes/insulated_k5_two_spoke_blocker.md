# Insulated K5 blocks forbid two-spoke packing resilience

Status: complete ordinary proof, independently reconstructed by packing_critic from root's proposed lemma. No material objection found. No external packing theorem, finite census, Lean verification, or originality claim is used.

Provenance: TUZA-19, local Darwin host. Original start 2026-11-15T01:53:58Z, research cutoff 2026-11-15T09:23:58Z, hard deadline 2026-11-15T09:53:58Z. Requested Astra/Ultra; actual serving identity and effort are not exposed.

## Exact theorem

Let G be any finite simple graph. Let S be a five-element vertex set and let a be a vertex outside S. Assume:

1. G[{a} union S] is K6;
2. every actual triangle containing an edge of G[S] has all its vertices in {a} union S.

Then for EVERY two distinct u,v in S,

    nu(G-{au,av}) <= nu(G)-1.

There are no restrictions on the other vertices or edges of G beyond assumption 2. No TF, cover-criticality, chosen maximum packing, connectivity, or bound on gadget size is assumed.

Since S is complete, assumption 2 is equivalently the following endpoint condition:

    Every vertex outside {a} union S has at most one neighbor in S.

Indeed two such neighbors would form an external triangle over their S-edge; conversely every external triangle using an S-edge supplies such a common neighbor.

## Explicit packing extension

Fix u,v and ANY triangle packing P in G-{au,av}. Divide its triangles into three classes:

* old triangles lying wholly in S;
* apex triangles axy with x,y in S;
* all other triangles.

By the insulation assumption, the third class uses no S-edge. At most two triangles of P lie wholly in S. For completeness, three edge-disjoint triangles in K5 would use nine of its ten edges; the single leftover edge is impossible because K5 has all degrees even and removing edge-disjoint triangles preserves every degree modulo two.

At most one apex triangle axy is present: only the three spokes from a to S\{u,v} survive the deletion, while two edge-disjoint apex triangles would require four distinct spokes.

Keep every non-old triangle of P, including its apex triangle if one exists. If that triangle is axy, retain its labels and let z be the unique fifth vertex of S, so S={u,v,x,y,z}. If no apex triangle is present, choose any ordering x,y,z of S\{u,v}.

Discard the old triangles of P and insert these THREE triangles of G:

    uxz,    vyz,    auv.

The first two are disjoint in edges, share only z, and avoid both uv and xy. They also share no edge with auv. If the kept apex triangle axy exists, it shares only one vertex with each inserted triangle, hence no edge. Every kept triangle from the third class avoids all S-edges. The inserted triangle auv uses the two previously deleted spokes au,av, so those spokes occur in no kept triangle either. Thus the resulting family P' is an edge-disjoint triangle packing in G.

If r<=2 old triangles were discarded, then

    |P'|=|P|-r+3 >= |P|+1.

Apply this extension to a maximum packing of G-{au,av} to obtain the theorem. The proof needs only the displayed disjoint-two-edge K5 pattern; it does not import a general K5 resilience assertion.

## Exact scope of the gadget obstruction

Suppose a cone with apex a has an induced K5 rim block S, and all triangles using a rim edge of this block are either inside the block or use a. Every subsequent modification that preserves the endpoint insulation condition above still has the same two-spoke blocker, regardless of its effect on tau, TF, odd covers, or its other triangles.

In particular, arbitrary private gadgets attached along individual spokes av cannot repair two-edge packing resilience at this block. The gadgets need not be cliques. They may have arbitrary internal triangle structure, and edges or interactions elsewhere are allowed provided that no external vertex becomes adjacent to two vertices of S.

The quantifier is the stated insulation condition, not an informal gadget name. If gadgets on different spokes share a vertex that acquires two S-neighbors, the hypothesis can fail. A second universal apex is excluded for exactly this reason: it supplies an external page over every S-edge. No packing-loss claim is made in that setting.

For the K5-incidence cones used elsewhere in this run, the existing full-triangle ownership lemma supplies the initial rim-edge insulation. Thus the theorem excludes all genuinely spoke-only repairs of their packing resilience, not only the previously checked complete-clique decorations. It is an obstruction to that route; it is not an obstruction to arbitrary global repairs that introduce new pages on the rim edges.
