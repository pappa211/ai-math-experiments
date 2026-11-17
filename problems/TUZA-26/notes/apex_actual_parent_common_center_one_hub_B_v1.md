> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Common-center cube: two opposite-base B families and one hub-base B family

Status: ordinary proof candidate, for independent review. This completes the remaining all-B combination in the current common-center cube, subject to the separate shared-pair two-hub-B exclusion. No new family mixture is started here.

## Exact supplied families

Restore T=abc,U=ade,V=afg over literal B with nu(B)=m,tau(B)=2m. Use the same cube parameters: each single restoration (m+2,2m+2), each pair (m+3,2m+5), and full X target (m+4,2m+8).

Suppose T and U have full apices p,q and additional pages only on their opposite bases bc,de. Suppose V has full apex r and its nonempty additional page family lies on the hub base af. Choose one such extra page afs, with s!=r. The canonical individual covers are

    {bc,ap}, {de,aq}, {af,gr}.                    (1)

The old edges ap,aq,gr are background in B: if any were supported, an old minimum cover through it plus its paired restored base would give single cover increment one instead of two. The four apices p,q,r,s all lie outside the seven core vertices, since their a-spokes are old whereas every a-spoke to another core leaf is restored and absent from B.

Let J12 be the old cross rim graph between {b,c} and {d,e}. All other mixed triangles involve f or g. Selecting af hits every mixed triangle involving f; selecting ag in addition hits all remaining mixed triangles outside J12.

## 1. Equal first two full apices

If p=q, then J12 is a matching. Adjacent rims such as bd,be would give old triangles bdp,bep sharing bp and force the missing edge de into one old clique. Distinct matching rims lie in distinct old components, since a common clique would contain b,c,d,e and force the missing opposite bases.

Choose an old minimum cover F containing all J12 edges, independently in those components. The union of the three canonical covers (1) has only five edges. Add ag. All individual families and all mixed triangles are covered, giving at most 2m+6 edges, contradiction. This allows r or s to coincide with p whenever the stated full/extra roles permit it.

## 2. Distinct first two full apices

Assume p!=q. If J12 is empty, any old minimum cover, the at most six edges (1), and ag give a cover of size at most 2m+7. Thus suppose an old cross rim ij exists, where i belongs to {b,c} and j to {d,e}.

Take the five actual triangles

    bcp, deq, fgr, afs, aij.                     (2)

They are edge-disjoint. The three opposite-base pages have distinct bases and outside apices. The afs page has a different base and s!=r, so it does not meet fgr in an old spoke. The hub triangle aij uses two a-spokes at the first four leaves and a cross rim; neither occurs in the other four pages. All allowed identifications of r or s with p or q preserve these facts.

We verify the COMPLETE old footprint, including all possible apex identifications. It is contained in

    {bp,cp,dq,eq,fr,gr,as,fs,ij},

and gr is background. A literal old component contains at most one of bp,cp (otherwise it contains missing bc), at most one of dq,eq, and at most one of as,fs (otherwise it contains missing af).

An old clique supporting ij contains none of p,q,r,s. If it contained p, its old edge pj together with ap would create a U hub page at apex p!=q, forbidden because U's only hub apex is q. The q case is symmetric. If r differs from p,q, its old adjacency to i would give a forbidden T hub page at r; if r equals either, the previous argument applies. The same reasoning uses the old a-spoke as for s. Thus the rim component meets no other footprint edge.

No old clique can meet both the first two page footprints: containing a spoke t p with t in {b,c} and a spoke u q with u in {d,e} would force old pu and hence a forbidden U hub page at p!=q.

Consider a clique containing t p from the first page footprint. It cannot also contain as, because then it contains a,t and forces the missing edge at. If it contains fr, the old adjacency tr forces a T hub page at r, so r=p; the two footprint edges are then adjacent p-spokes. If it contains fs, the same argument using as forces s=p; again they are adjacent p-spokes. It cannot contain both fr and fs, because that would require r=s=p, contrary to s!=r. The argument for the second page footprint is symmetric with q.

A clique meeting neither of the first two page footprints sees at most fr and one of as,fs. The pair fr,as is impossible because it forces missing af; the pair fr,fs is adjacent. Therefore EVERY old component has either one footprint edge or two adjacent footprint edges. Background edges impose no restriction on an old packing.

A maximum K4 packing avoids an adjacent pair by taking the opposite face. A maximum K5 packing avoids adjacent edges 12,13 by taking triangles 145 and 234. These choices are independent over the old triangle components. Hence a maximum B packing avoids the whole footprint of (2). Appending the five triangles gives m+5, contradiction.

## Scope of the completed all-B branch

The separately frozen three-opposite-B theorem covers three opposite-base extra families. This note covers exactly one hub-base extra family, including every full-apex equality pattern. The shared-pair two-hub-B operation in matching26_actual_parent_cycle_core_v1.md excludes two B families whose extra bases are incident with their common hub; its theorem is a shared-pair statement independent of the cyclic application. Subject to independent acceptance of that dependency and this note, these statements pay all-B common-center cubes.

Mixtures involving A or exceptional C families remain outside this conclusion. Neither a triple cube nor a defect-one double residual has been forced. All old background, outside pages, and mixed triangles are retained; no numerical work, new model, defect-two naming or minimum-Q hypothesis is used.
