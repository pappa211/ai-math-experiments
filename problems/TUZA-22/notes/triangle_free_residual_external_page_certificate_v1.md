> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# An outside-page certificate from a triangle-free residual link

Frozen ordinary certificate rule, 2026-11-16. This is stronger than requiring the ORIGINAL link to be triangle-free, but its scope is exact.

Let L be a closed link component at h in a minimum CS failure. Suppose P,Q are WKE with |P|=r, and set R=L-P. Assume:

1. R is triangle-free;
2. some f=ab in P belongs to NO actual L triangle;
3. Z is an actual L matching of size at least r avoiding f.

Then this tuple excludes minimum-CS equality, with arbitrary outside attachments.

Balanced deletion of all h-spokes and P supplies B(K) and nu(K)=nu(G)-r (or strictness already contradicts equality). Codegree gives a page abx other than hab. Because f is in no L triangle, closedness forces x outside all of N(h): any h-neighbor adjacent to a would belong to the same link component. Thus its two spokes survive in K and are distinct from every selected hub spoke or L edge except the avoided base f.

Every old clique block contains at most TWO vertices of L, since its L intersection is a clique of R and R is triangle-free. Hence Z contributes at most one surviving edge in a block. The page contributes at most one spoke, because f is absent in K. If the matching edge and page spoke were disjoint, their block would contain the page endpoint and both matching endpoints, three L vertices, impossible. The ENTIRE footprint is therefore at most two incident edges per block, avoidable by maximum K4/K5 packings. Append the |Z| hub triangles and abx, obtaining more than the balanced r increment, contradiction.

The certificate requires no actual outside apex in its finite record: its existence is forced by codegree, and the proof covers every possible outside apex. It does not apply merely because f is missing from some listed triangle family; the checker must rebuild ALL L triangles. It does not assume every WKE residual is triangle-free.

## Concrete five-branch example in the admitted interface

Let F be triangle abc with paths a-x-y and b-z-t, and let w see exactly x,y,z,t. For

    P={ac,bz,xy,wt}, Q={a,b,w,z},
    f=bz, Z={bc,ax,zt,wy},

the tuple is WKE, L-P is triangle-free, f lies in no L triangle, and Z is a four-matching avoiding f. Thus the rule excludes this apex-neighborhood state without a bounded-outside assumption or a new enumeration.

This rule may be used as the literal EXTERNAL_R_TF certificate in a separately admitted fixed-domain check. The ordinary proof, not a producer label, is its arbitrary-attachment justification.
