> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: corrected apex-cycle theorem and full W5 assembly

Verdict: ACCEPT USING THE DECLARED ORDINARY LOCAL INPUTS. Reviewer: challenger, 2026-11-16 UTC.

Frozen sources checked:
- notes/apex_cycle_link_exclusion_except_w5_v3.md, SHA29cfda23bc0b09ab09553a8d5baa6a7eaf5ad8add858ddaed1fd86118908f9f2;
- notes/apex_cycle_link_exclusion_full_v2.md, SHA558a0d1f99c1672328aee8c1dd7a38d2c3dc9677233e561f0c90521a428815b7;
- pinned sources/public/papers/tuza-five-degenerate/main.md, SHA6f89ec20ce3d954a5912cd19e5e2156fbcab87460bdc6eeb4d09b9bcdc55d59f, especially the opening scope of Section5 and complete Section5.3.

## New all-size parity proof

I reconstructed both reusable footprint audits. For n>=4 the cycle remainder contains no triangle, so L is K4-free and an old clique block has at most three L vertices. A rim triangle with a deleted P-edge leaves at most one edge per block; a matching also leaves at most one; two disjoint contributions would require four link vertices. For an external page, deleting its base prevents both spokes from occurring in one old block, and the safe-endpoint or triangle-free condition prevents a disjoint matching edge alongside a surviving spoke. Thus both audits use the ENTIRE footprint, including arbitrary outside attachments.

For even n>=6, the r-1 rim matching exposing0,3 leaves two separate P3 components and r-3 isolated edges, giving the needed r-1 cover. Adding w0 and covering by w produces the balanced tuple. An adjacent S-pair has a rim-triangle augmentation via the alternating perfect cycle matching avoiding its rim edge; an independent S uses the external-page audit on w0. The n=6 endpoint of the construction checks directly.

The three C4 neighbor-set representatives were checked literally. Each listed Q covers L-P, and each comparison matching avoids the chosen rim triangle or deleted safe base. The only omitted type is full W5, consistently left to the historical input.

For odd cycles, the tuple P_a={wa}+M_a has r+1 edges and its complement cover has r cycle vertices plus w. Independent S gives a triangle-free alternate matching; two adjacent S vertices give the previously reviewed parallel-even-thread contradiction.

The corrected Section5 is valid. For an ADDITIONAL vertex u outside{0,1}, M_u avoids01 exactly at odd u, while M_0 and M_1 are the separately stated endpoint exceptions. If a rim test fails for every adjacent S-pair, the first/last additional even neighbor gives a long odd gap unless p=2,q=2r, which triggers the rim test at pair1,2. In the first gap,23 belongs to M_1 and not M_0; in the final gap,(q+1)(q+2) belongs to M_0 and not M_1. Both endpoints lie outside S and therefore in no L triangle. These are genuine alternate matchings, not the invalid switch between the two odd-gap endpoints.

Version history matters: v1's wrong endpoint switch remains unaccepted. During this review I also identified that v2's parity sentence omitted its u outside{0,1} domain; all uses already had that domain, and v3 explicitly corrected it. The accepted source is v3.

## Historical full-W5 input and scope

The pinned Section5 explicitly switches from the degree-five global application to an arbitrary five-vertex CLOSED LINK COMPONENT. Its K_(2,2,1) argument uses no ambient degeneracy or assumption that this is the hub's only component. Closedness is precisely what ensures that lost hub-spoke triangles stay local.

I checked the four local triangles vac,vbd,ade,bce in K6 minus ab,cd: they are edge-disjoint. Deleting every local edge leaves the six local vertices independent in K, so each old block contains at most one of them. The eight rim edges cover all lost triangles, including every outside rim page. The four-edge local cover then forces the outside-page family to have cover number at least four under equality.

The bad-pair list is a perfect matching on the eight rim bases. The four good-pair witness rows are valid and exhaust the good orbits: adjacent cycle pairs, different-part e-spoke pairs, incident mixed pairs and nonincident mixed pairs. I checked each three-packing avoids its specified bases.

The good-disjoint-page existence argument is complete. A third base good with both members of a bad pair must intersect both pages; this forces their common external apex. Adjacent bad partners with disjoint pages have different apices and admit no third base. Disjoint bad partners with one common apex allow only the two other cycle bases, giving the stated two-spoke cover. Thus absence of a good disjoint pair would force a two-cover, contradicting the lower bound four.

Finally the two selected outside pages and local three-packing have an entire old-block footprint of at most two spokes at the block's unique local vertex. The local packing has no surviving edge. The five-triangle augmentation is therefore valid with arbitrary outside pages. This excludes W5 without falsely calling it WKE.

## Accepted scope

No closed link component of a global or hereditary-class minimum CS failure can become a cycle after deleting one link vertex. The all-size part is ordinary parity/footprint reasoning; the full assembly additionally uses the authenticated historical ordinary local W5 proof and the established M0/M3/codegree/clique facts. No finite WKE table, four-branch census, Kotzig theorem or new solver run is a premise. Connected unicyclic remainders with attached trees remain outside this particular theorem.
