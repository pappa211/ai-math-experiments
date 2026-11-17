> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Diamond opposite residual: direct central-vertex augmentation

Versioned strengthening of Sections 3-6 of apex_diamond_degree_four_resilience_v1.md. The earlier proof remains frozen. This shorter ordinary operation does not use Q codegree, minimum degree, or old-clique boundary exclusions. It uses the complete actual c-neighborhood, the exact neutral profile, and forbidden minimum-cover pairs derived there from full Q triangle-cover eligibility.

## Exact interface

Let N_Q(c)={x,y,u,z}, with all five diamond edges on these vertices present and uz absent. Put J=Q-c and k=nu(Q). Assume the already established neutral profile

    nu(J)=k, tau(J)=2k-3,
    every one of the five diamond edges is packing-critical in J,
    M={xu,yz}, R=J-M has nu(R)=k-2, tau(R)=2k-5.

No minimum J cover contains {xu,xz} or {yu,yz}: adding respectively cy or cx would otherwise cover Q with 2k-2 edges. Suppose a critical deletion f of R gives S=R-f in B. Write m=k-3, so

    nu(S)=m, tau(S)=2m;
    J=S+{xu,yz,f}, nu(J)=m+3, tau(J)=2m+3.

This is precisely the fragile branch supplied by proper CS. Arbitrary S background and shared old-component vertices are retained.

## Background and a marked bare page

Every minimum S cover, with the three restored bases adjoined, is a minimum J cover. The forbidden pairs imply f is neither xz nor yu. They also imply that both xz and yu are background in S: if supported, a minimum old-clique cover could be chosen through that edge, producing a forbidden pair after adjoining the bases.

An ordinary page uses exactly one restored base. Call it bare when both its old spokes are background. There exists a bare ordinary xu-page P avoiding yu. Indeed, suppose every bare ordinary xu-page used yu. In each old clique choose a minimum cover through its complete ordinary xu-page footprint, which has at most one edge. Their union C_S hits every nonbare ordinary xu-page. Then

    C_S union {yu,yz,f}

is a J cover: it hits the old triangles, the nonbare xu-pages, the supposed bare xu-pages, and every remaining new triangle via yz or f. Its size is 2m+3=tau(J), but it contains the forbidden pair {yu,yz}. This proves the marked bare-page existence. By reflection, the analogous statement holds if the roles of the two opposite bases are interchanged.

P has an apex outside A={x,y,u,z}: apex y would use yu, while apex z would require the absent uz. In particular P avoids both yu and xz.

## The actual packing repair

Take a maximum J packing. Since only three edges were restored over S and its size is m+3, it consists of an old maximum S packing plus three ordinary pages, one for each restored base. Every critical background edge must occur in one of those pages. In particular the pages must use yu and xz.

The ordinary f-page cannot use both yu and xz: they are disjoint old edges, whereas its two old spokes are adjacent. The only xu-page using either of them is the internal page xuy; the only yz-page doing so is the internal page yzx. Those two internal pages intersect on xy. Thus exactly one M page is internal. Reflect labels if necessary so it is xuy. The other M page is U=yzq with q outside A, and the f-page uses xz.

Retain the m old packed triangles and U. Delete xuy and the f-page. Add the three actual triangles

    cuy, cxz, P.

They are edge-disjoint from one another and from the retained packing:

* The c-triangles use disjoint pairs of c-spokes and the old background edges yu,xz. Thus they miss the old packing and U, whose apex lies outside A.
* P is bare and hence misses the old packing. It avoids yu and xz and contains no c-spoke.
* P and U have disjoint bases xu,yz, and both their apices are outside A. Therefore they share no edge, even if the two apices coincide.

The result is a Q packing of size m+1+3=m+4=k+1, a contradiction.

Consequently R has no critical deletion to B. In the proper-CS setting every fragile defect-one R would have exactly such a deletion, so R is resilient. The reflected opposite matching has the same conclusion.

## Scope and dependencies

This proves the full fragile-branch exclusion without a placement classification for f, and without any availability claim beyond the actual degree-four diamond vertex. The old B footprint and minimum-cover facts are ordinary all-size facts. No computation, finite census, C12 naming, private-region inference, or defect-two classification is used in this operation. The positive-gain branch and exact neutral profile are in the separately frozen v1 note; the resilient named branch is matching26_diamond_neutral_named_reconstruction_v1.md.

The marked bare-page observation and direct replacement were proposed by matching_geometry and independently checked by apex_challenger. Independent opening review is requested before promotion.
