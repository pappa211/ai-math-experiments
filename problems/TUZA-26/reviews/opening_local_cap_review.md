> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: local cap repair and compulsory spine

Verdict: PASS, PROVED_ORDINARY for notes/matching26_local_cap_augmentation_v1.md, SHA-256 fb1f9307be2f15ec6c393eb8a630817c815bf7985ab2d40aaf55e0f674b6ecea. The theorem is a packing-only conditional operation at arbitrary codegree. No computation or Lean verification was needed.

## Local hypotheses and actual repair

For compatible common neighbors x,y of the missing edge uv, L deletes uv and the four marked endpoint spokes and has nu(L)=k-1, while nu(Q)=nu(K)=k. A cap vertex c is outside u,v,x,y and has its two hub spokes in L, together with an edge wc to an endpoint w that lies in no actual L triangle.

The stated local non-spine condition is exact. Triangles xcr and ycs, excluding the opposite-hub apices, share an edge if and only if r=s, when they share cr. All other possible edge identifications are excluded by the distinct vertices and removed opposite apices. Hence every cross pair intersects precisely when one apex family is empty or both are the same singleton. The condition permits arbitrary triangles through c using neither cap spoke and does not impose vertex privacy.

In a maximum L packing M, if both cap spokes occur in different triangles, those are non-spine triangles from opposite families, which the local condition makes edge-intersecting. This is impossible. Thus any packing using both spokes uses them together in the exact spine triangle xyc.

If M omits that triangle, at least one cap spoke ch is unused. Append wch and the opposite-hub uv-page uvh'. Their edges exist and the two triangles are edge-disjoint. Edge wc is unused because it belongs to no L triangle; ch was selected unused; every other appended edge is uv or one of the four endpoint spokes absent from L. Thus they avoid every triangle of M and give k+1 triangles in Q, contradiction. All arbitrary outside triangles are retained literally in M.

It follows that every maximum L packing contains the EXACT triangle xyc. This is stronger than compulsory use of the hub edge and uses no cover assumption.

## Criticality, multiple caps and strip corollary

If xy is absent, the mandatory triangle cannot exist and a single cap gives the augmentation. If xy is present, each of its three edges is packing-critical: no maximum L packing survives its deletion, while removing the one compulsory triangle from any maximum packing leaves k-2 triangles avoiding all three edges. Thus every single spine-edge deletion and deletion of the whole spine triangle have packing k-2.

Two distinct CAP VERTICES are impossible, because their two different compulsory spine triangles share xy. The same vertex certified at both endpoints is only one cap vertex and does not give this contradiction; the K5 control correctly demonstrates that distinction.

For the first internal vertex v1 of a literal length-l strip, l>=3, the stated complete triangle list on uv1,xv1,yv1 ensures uv1 is triangle-free in L: its only strip triangles lose the endpoint spokes. The only remaining non-spine triangles on the other two cap edges use the common next rim edge v1v2, giving the shared singleton apex. The analogous end condition produces the distinct last internal cap vertex. Hence two such three-edge cap lists exclude the strip while permitting arbitrary middle crossings consistent with those local lists. Neither the middle path nor a complete middle boundary is needed in the cap theorem itself.

The sharp single-cap control is valid: Q=K5, e=uv, has packing two both before and after deleting e. L has only triangle xyc and background edges uc,vc, so its maximum packing consists of that spine. The vertex c is a cap at either endpoint. This illustrates compulsory-spine survival under the local packing hypotheses; it is not the required defect-one unknown core.

## Essential downstream cover-scope guard

The frozen theorem makes no cover claim and passes at arbitrary codegree. Its proposed subsequent payment must keep that distinction.

At the accepted minimum-Q profile, if uv has EXACTLY TWO common neighbors, L has nu=k-1 and tau in {2k-5,2k-4}, hence defect three or two. The lower bound follows because a minimum L cover plus the four marked spokes covers every Q triangle: these two uv pages are the entire new family. This was the precise scope of the earlier codegree-two four-spoke accounting.

At arbitrary codegree, additional uv-pages need not meet those four marked spokes. The same cover extension argument then requires uv as a fifth edge. The direct bounds supplied by the accepted global profile are only

    2k-6 <= tau(L) <= 2k-4,
    delta(L) in {2,3,4}.

The upper bound uses containment in K-P_x, whose exact cover number is2k-4. No argument in the cap theorem removes the possible defect-four value. This scope guard was sent to the coordinator and the subsequent cover-payment author. A descent must either restrict to codegree two or independently strengthen the general bound; it must not name a defect-two residual using the defect-one minimum-Q rule.

## Accepted operation versus open payment

The actual progress is a local repair or a specific compulsory triangle with all three edges critical and exact packing after deleting the triangle. It replaces the full-strip boundary requirement with two explicit local triangle-family conditions. Obtaining such a cap, repairing a violation, or paying for its compulsory spine using correct cover bookkeeping remains OPEN. Universal triangle eligibility does not automatically provide the needed minimum K or L covers, since a minimum Q cover containing a crossing triangle need not contain uv.

Frozen UTC: 2026-11-16T23:37:46.580022+00:00
