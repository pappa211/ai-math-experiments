# Intrinsic private-tip packing lemma

Status: complete ordinary proof draft. The central augmentation and conclusion were independently checked by the apex track; a final frozen-text review is requested. Originality unestablished. This is an all-size scoped PK result, not unrestricted Tuza.

## Exact hypotheses and conclusion

Let G be a finite simple graph and P a maximum edge-disjoint triangle packing, with p=|P| and B=E(P). Suppose every T_i in P can be written

    T_i = a_i b_i x_i

so that:

1. x_i belongs to no other packed triangle. In particular the x_i are distinct and no x_i is any base endpoint a_j or b_j.
2. T_i has at least one actual private triangle on its base edge e_i=a_i b_i: a triangle Q_i distinct from T_i with E(Q_i) intersect B={e_i}.
3. T_i has no private triangle on either spoke a_i x_i or b_i x_i.

Then G has a triangle-edge cover C contained in B with |C|<=2p. In particular this specified P satisfies PK, with no private K4 edges needed.

The selected private witnesses may have apices anywhere in G, including vertices of other packed triangles. There is no common-apex, external-apex, bipartite-ambient-graph, or bound on graph order hypothesis. Hypotheses 2 and 3 say precisely that every packed triangle is in the one-supported-private-edge case and that its uniquely supported edge is opposite its private packed vertex.

## 1. Every remaining triangle is an anchor-tip cross

Let A be the set of all base endpoints and X={x_i}. The hypotheses give A intersect X=empty. The packed spokes form a bipartite graph between A and X. Distinct bases e_i are distinct graph edges because P is edge-disjoint.

We will select all p base edges. Consider an actual G triangle Q containing no base edge. It cannot avoid B, since then Q could append to P. It cannot meet B in exactly one spoke, by hypothesis 3. It therefore contains at least two packed spokes. Three spokes cannot form a triangle because the packed-spoke graph is bipartite.

Two packed spokes in Q cannot come from the same packed triangle: their closing edge would be its selected base. Nor can they meet at a tip, since each tip belongs to only one packed triangle. Consequently Q has exactly the form

    a x_i x_j,

where the distinct bases e_i,e_j share the anchor a and x_i x_j is an actual graph edge. This classification uses maximum-packing and private-page hypotheses, not a prescribed ambient edge list.

Define a graph K on the indices i by joining i,j exactly when such a cross triangle exists. Because distinct base edges share at most one endpoint, the anchor associated with each K edge is unique. K is triangle-free: a K triangle would make x_i x_j x_l an actual triangle all of whose edges are outside B, which could append to P.

## 2. A mixed index has only the closing-triangle configuration

An index i with base ab is called mixed if some K neighbor has a base sharing a and another has a base sharing b. Suppose these two bases are

    e=ab, f=ac, g=bd,

and their distinct private packed tips are x_e,x_f,x_g. The two actual cross triangles are

    U=a x_e x_f,    V=b x_e x_g.

Assume c!=d. Simplicity of the three distinct base edges also gives c,d outside {a,b}, so f and g are vertex-disjoint. Choose actual private base pages Q_e,Q_f,Q_g as in hypothesis 2.

Each chosen private page is edge-disjoint from U and V. It uses no packed spoke, by the definition of a private base page. Its base endpoints are anchors, so it contains at most one tip and cannot contain the tip-tip edge of either cross. These are all edges of U and V. Also U and V are edge-disjoint: they share only x_e.

If Q_f and Q_g are edge-disjoint, the four triangles U,V,Q_f,Q_g replace the three packed triangles T_e,T_f,T_g, giving a larger packing. They avoid every other packed member by privacy and by the displayed spoke supports.

If Q_f and Q_g share an edge, their disjoint base pairs force reciprocal apices: the apex of Q_f lies in {b,d}, and the apex of Q_g lies in {a,c}. The choices b for Q_f or a for Q_g would make the private page contain the packed edge ab, which is forbidden. Therefore the only possible intersecting pair is

    Q_f=acd,    Q_g=bcd,

sharing cd. Write Q_e=abz. Privacy forces z!=c, since ac is packed, and z!=d, since bd is packed. Hence Q_e is edge-disjoint from Q_f=acd. As already shown it is disjoint from U and V. Now U,V,Q_f,Q_e again replace T_e,T_f,T_g by four edge-disjoint triangles. This also contradicts maximal cardinality of P.

Thus c=d is necessary. Moreover a mixed base ab has exactly one K neighbor at each endpoint: once neighbors ac and bc exist, any other neighbor at a or b would produce the just-excluded unequal-other-endpoint configuration. Its two neighbors are precisely the other two edges of a base triangle abc.

## 3. Mixed indices are independent

Suppose mixed e=ab and mixed f=ac were adjacent in K. Mixed e forces its other neighbor to be g=bc. Mixed f, having neighbor e at a, forces its other neighbor at c to be that same g. Therefore e,f,g form a triangle in K, impossible by Section 1. Hence no K edge has two mixed endpoints.

## 4. The explicit cover

Select all p bases. For every nonmixed index having K neighbors, select the packed spoke at its unique active base endpoint. For a mixed or isolated index, select either of its two packed spokes arbitrarily. This adds at most p edges, so the total cost is at most 2p and every selected edge lies in B.

Any G triangle containing a base is covered. Every other triangle is a cross a x_i x_j corresponding to a K edge. At least one of i,j is nonmixed. Its unique active endpoint must be a, so its selected spoke hits the cross. This covers every actual G triangle and completes the proof.

## Relevance and missing global step

This proves a real local-support mechanism for arbitrarily large ambient graphs and arbitrary actual private-page intersections. It is stronger than the initially constructed common-private-apex model: the intersecting-page case is handled by the central base's private witness, rather than assumed absent.

No theorem guarantees that an arbitrary graph, or a genuine minimal Tuza violation, has a maximum packing satisfying these hypotheses. A packed triangle may have no private page, may have a private K4 completion, may have no vertex private among packed triangles, or may have its private edge incident to the available private packed vertex. Those are distinct missing geometries; they are not removed by the present proof or by small finite survival.

The apex track observed a simpler strategic-packing corollary: if P maximizes its covered vertex set among maximum packings and a private base page has an apex outside V(P), its opposite packed vertex must already be private among P. Otherwise replacing the packed triangle by that page preserves every old covered vertex and adds the outside apex. Thus the proposed separate shared-tip/external-witness extension is subsumed by this one-triangle exchange and the theorem above; it is not counted as a second independent result. Mixed type0/type3 states and absence of the required private-tip incidence remain unresolved.
