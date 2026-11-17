> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: the ten-shape triangular-unicyclic remainder domain

Verdict: ACCEPT as an ordinary finite structural DOMAIN classification and the exclusion of two of its twelve initial shapes. This is not an apex-neighborhood census or a completed link exclusion.

Frozen source: `notes/triangular_unicyclic_small_remainder_classification_v1.md`, SHA256 c9b339a1ea4eb34e549a8a2786bad43685533afc85a8f7ec34fc3209e9871d53. Reviewer: source_audit, 2026-11-16 UTC.

I independently reconstructed the attachment enumeration under the exact supplied hypotheses: F connected unicyclic with triangle abc, no perfect matching, at least one attachment, matching number at most three, and no vertex adjacent to two original leaves. The matching bound and leaf restriction remain the separately proved class-local inputs identified in the source.

For each rooted attachment T_i, deleting its root changes matching number by b_i in{0,1}. A matching either takes no cycle edge, receiving all h root benefits, or takes one cycle edge and at most the third root benefit. This gives exactly p+g(h), with g=(1,2,2,3). All alternatives can be realized independently, so no upper bound is mistaken for an equality.

At p_i=0, all attachment vertices are direct leaves, hence there is at most one. At p_i=1, deleting the root leaves exactly one nontrivial star component and possibly one isolated direct leaf. If the root attaches to the center, there is at most one other star leaf; if it attaches to a leaf, there is at most one other original leaf at the star center. Thus the only nontrivial component is path2 or path3 from the root, optionally with a direct root leaf. Their root benefits and vertex counts match the table.

At p_i=2,b_i=0, a size-two tree vertex cover has centers at distance one or two, and every off-path vertex is a leaf at a center. The root is the only leaf of this rooted tree that might not be an original F-leaf. Hence there are at most three leaves. For adjacent centers, the only permitted root-deletion-preserving case is the five-vertex double star rooted at one of its two same-center leaves. For distance-two centers, an endpoint with no extra leaf reduces to that same shape. With leaves at both centers, P5 permits root placement at an endpoint or its middle, giving path4 or two paths2. The six-vertex case has leaves distributed2+1, with the root necessarily one of the doubled leaves. This gives exactly the source's fourth attachment type. No larger attachment meets the leaf restriction.

I then checked the complete parameter bookkeeping. At p=0 only h=2 survives nonperfectness and nonbareness. At p=1, the four attachment types together with zero/one leaves at the other roots produce exactly IDs2--7 after excluding perfect cases and matching number four. At p=2, h must be zero, yielding the two path2 attachments or the four p_i=2 types, IDs8--12. Larger p is impossible. All displayed orders, matching numbers and deficiencies follow directly from these parameters. Thus the twelve-shape list is exhaustive up to the explicitly allowed cycle permutations and attachment isomorphisms.

For the two exclusions I checked the sharper transversal-collapse hypotheses and can give explicit WKE covers, avoiding any ambiguity in the matching-complement invocation:

* ID7 has M={al,bm,xy}, exposing c,z. With P=M+{wz}, take Q={w,a,b,y}. The complement F-M has edges abc,ax,yz, all covered by {a,b,y}; w covers every additional link edge at w. Thus |P|=|Q|=4. For S={w,c}, only w is P-matched into the complement, so Z={z}, |S|+|Z|=3. L-S is a forest.
* ID12 has M={bc,xy,zt}, exposing a,u. With P=M+{wu}, take Q={w,a,x,t}. The complement F-M has edges ab,ac,ax,xz,tu, all covered by {a,x,t}. For S={w,a}, Z={u} and the same four-versus-three contradiction applies; L-S is a forest.

The added w-leaf edges exist because an original F-leaf has degree at least two in L and only w can supply its second neighbor. These explicit tuples use actual edges, allow every other w-neighbor, and satisfy the accepted general criterion r<=|S|+|Z|. Thus IDs7 and12 are indeed excluded without a finite search.

The remaining ten shapes are exactly IDs1--6 and8--11, all of deficiency one and order five or seven. No choices of w-neighborhood beyond mandatory original leaves have been omitted. No conclusions about arbitrary outside pages or passing WKE tuples are silently promoted to CS. GE, a solver, or a census is not a dependency of this domain proof.
