> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Simultaneous residual covers collapse WKE links near a triangle-free graph

Frozen ordinary proof candidate, coordinator, 2026-11-16 UTC. This generalizes restoration's independently developed one-apex criterion. It is a conditional reduction exclusion, not a proof that every graph has a suitable link.

Let G be a class-minimum failure of combined CS in an edge-subgraph-hereditary class. Let L be a closed link component at hub h. Suppose (P,Q) witnesses WKE, with P a matching of size r and Q a vertex cover of L-P of size at most r. Let S be ANY vertex set such that F=L-S is triangle-free. Define

    Z={z outside S : some sz belongs to P with s in S}.

Then necessarily

    r <= |S|+|Z|.                                      (1)

Consequently r>2|S| is sufficient to exclude this supplied tuple. If P has no edge between S and its complement, the sharper threshold is r>|S|. No minimality or optimality of S is assumed.

## Proof

Delete every h-spoke to L and all P rim edges, obtaining K. The usual tuple either is strict, immediately impossible, or balanced accounting gives B(K) and nu(K)=nu(G)-r.

Every surviving F edge e=xy whose endpoints avoid Z is triangle-supported in K. Codegree at least two supplies an actual triangle xyt other than hxy. Its apex cannot lie in F because F is triangle-free. If t lies in S, a page spoke tx or ty could belong to the matching P only if x or y belongs to Z, excluded. If t lies outside L, neither spoke belongs to P because every P endpoint lies in L. A different h-link component cannot supply t adjacent to x, by closedness. Thus the second triangle survives intact.

A residual literal K4/K5 block contains at most TWO F vertices, because three would form a triangle in the induced graph F. Hence each such block contains at most ONE F edge. All the supported F edges just identified can therefore be prescribed SIMULTANEOUSLY in a minimum K triangle cover D: choose a minimum cover containing the prescribed edge in each distinct affected block, and arbitrary minimum covers elsewhere. The blocks may share vertices; their triangle-edge supports are disjoint, which is all this prescription uses.

The set

    D union P union {hu:u in S union Z}

covers every G triangle. Triangles using a removed P edge are covered by that edge. Every other lost triangle is a hub page on L-P. Its rim either meets S or Z, in which case the selected hub spoke covers it, or is one of the supported F edges already in D. All surviving triangles are covered by D. Thus

    tau(G) <= 2nu(K)+r+|S|+|Z|.

If r>|S|+|Z| this is smaller than 2nu(G), a contradiction. Since P is a matching, |Z|<=|S|. This proves all claims. QED.

## Triangle-free WKE corollary: no Kotzig input is needed

Take S empty. Then Z is empty and r>0 for a nonempty closed link under the minimum-codegree condition. Formula (1) is impossible. Thus NO triangle-free WKE closed link occurs in a class-minimum CS failure.

This is an ordinary alternative proof of the previously accepted triangle-free WKE exclusion. It requires neither Kotzig's theorem, uniqueness of a perfect matching, nor a maximum-matching replacement. The older proof remains valid with its declared input, but that input is no longer necessary for this local transfer. Any separately established WKE availability theorem retains its own dependencies; this corollary does not make that availability ordinary automatically.

For S={w}, Z is empty when P avoids w and otherwise contains its unique mate. The bounds become r<=1 or r<=2 respectively, recovering restoration's near-bipartite collapse. This also explains why three or more matching edges suffice for the one-apex case.

## Exact global role

The argument turns literal residual clique structure into an actual simultaneous cover, rather than requiring simultaneous packing avoidance. It excludes WKE certificates whose matching is large compared with a supplied triangle-vertex deletion set. Neither the existence of a WKE certificate in every link nor a small such deletion set is established. Dense links and small matching certificates outside the displayed inequality remain separate obligations. All outside pages on P remain covered by retaining their actual rim bases.
