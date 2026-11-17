> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A literal clique test for an arbitrary outside-page augmentation

Corrected frozen v3 ordinary certificate rule, 2026-11-16. The unreviewed v1 example listed Q={w,a,b,c}, which missed xy; the correct Q={w,a,b,x} is supplied below. The v3 also includes xy in the written list of residual edges; the general certificate rule and proof are unchanged. This generalizes the triangle-free-residual rule; the outside apex is not assumed bounded or enumerated.

Let L be a closed link at h in a minimum CS failure. Let P,Q be WKE with r=|P|, and put R=L-P. Suppose f=ab lies in P and belongs to NO actual L triangle, and Z is an L matching of size at least r avoiding f.

For EVERY clique C in R with2<=|C|<=5 require:

1. at most one edge of Z lies entirely in C;
2. if that edge exists and C contains a or b, the edge is incident with the contained endpoint.

The two endpoints a,b cannot both lie in C because f was deleted. These are literal finite conditions on the selected matching and actual residual link.

Then the tuple excludes minimum-CS equality with arbitrary outside attachments.

Balanced deletion supplies B(K) and nu(K)=nu(G)-r. Codegree and the absence of an L triangle on f supply a page abx with x outside N(h), hence outside L. It is edge-disjoint from all hub triangles on Z because Z avoids f.

For any old K4/K5 block B, its L intersection C is a clique in R, of size at most five. If |C|<=1 the matching contributes no edge. Otherwise condition1 gives at most one matching edge. The page contributes at most one spoke because f is absent in K. If the page contributes ax or bx, C contains that endpoint; condition2 forces any selected matching edge in the same block to meet it. Thus the ENTIRE old footprint is at most two incident edges, simultaneously avoidable by a maximum old block packing. The selected hub triangles and the page append at least r+1 triangles, contradiction.

The test is deliberately sufficient rather than claimed necessary. For instance it rejects some two-edge matchings in a residual K5 even though that K5 could avoid them. This conservatism cannot create a false certificate.

The triangle-free-residual rule is a special case: every C then has at most two vertices, so condition1 holds automatically and a contained page endpoint must be incident with its only possible matching edge.

## A further exact example from the fixed domain

Let F be triangle abc with path a-x-y and leaves z at b and t at c. Let w see exactly x,y,z,t. The tuple

    P={wy,ax,bz,ct}, Q={w,a,b,x},
    f=ax, Z={ab,ct,xy,wz}

is WKE of size four. The base ax lies in no L triangle. The residual link's only triangle is abc, and its other edges are xy,wx,wz,wt; the only surviving Z edge inside abc is ab, incident with the base endpoint a. The base endpoint x lies in no residual triangle. All clique tests therefore pass, giving an outside-page augmentation even though R is not triangle-free.

No computation or unavailable outside graph information is required by the proof. A checker must reconstruct every R clique and every original L triangle; checking only a chosen list is insufficient.
