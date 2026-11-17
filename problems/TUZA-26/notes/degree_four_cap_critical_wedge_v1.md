> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Degree-four cap remainder: critical wedge and fragile deletion

Frozen root candidate v1. Independent review requested. No universal availability claim.

## Input and actual deletion

Use the fixed minimum-CS universe and minimum unknown Q. The base edge uv has CODEGREE TWO, with pages x,y. Let L=Q-{uv,ux,vx,uy,vy}, nu(Q)=k. A degree-four cap c has N_Q(c)={u,x,y,z}, uz absent. The reviewed cap theorem forces every maximum L packing to contain xyc. The reviewed degree-four descent leaves only delta(L)=3, tau(L)=2k-5 with eligible hub xy. The argument below does not additionally use that eligibility.

In L, c has the triangle family of a genuine K4 on cxyz; uc is background. Put A=L-c, r=k-2. Every maximum L packing consists of xyc and r other triangles. Therefore nu(A)=nu(A-xy)=r. Both xz,yz are critical in A: an r-packing avoiding xz could append cxz and give a maximum L packing omitting compulsory xyc; similarly for yz.

Every A cover meets xyz, and adding the c-spoke opposite a selected triangle edge covers every c-triangle. Hence tau(A)>=tau(L)-1=2r-2. Proper CS after a critical-edge deletion gives tau(A)<=2r-1.

If tau(A)=2r-1, then A-xz is tight B. For an xz-page xzp with p!=y, each old clique receives at most one page spoke; the clique containing yz, if any, receives only zp as an additional spoke, adjacent to yz. Full K4/K5 packings avoid this two-edge star. Thus append xzp to old maximum packings avoiding yz and its footprint, contradicting yz-criticality. The sole xz-page would therefore be xyz. Every r-packing of A would use that sole new triangle over B, contradicting nu(A-xy)=r. Consequently

    nu(A)=r, tau(A)=2r-2;
    xz,yz critical, xy noncritical, xyz an actual triangle.

The same B argument for R=A-xz gives nu(R)=r-1, tau(R)=2r-3, delta(R)=1. This is a smaller defect-one graph obtained by actual deletions. Defect-two A is NOT named.

## Excluding a resilient R

Suppose R resilient. Proper CS decomposes it into one resilient defect-one support C and tight clique components. Explicit Q-minimality names C in C12. Retain every background edge and vertex. Set e=xz, f=yz, g=xy.

For every new e-page xzp with p!=y, a maximum C packing cannot avoid its C page spokes together with f, since tight cliques can avoid the same footprint: the f-clique gets at most the adjacent spoke zp, and each other clique at most one page spoke. Appending xzp would contradict critical f. Therefore the union of these forbidden C edges has size at least two. Some p!=y exists because a maximum A packing avoiding g must use an e-page other than xyz.

If f is outside C, BOTH spokes of every noncentral page lie in C, hence x,z in C; y is outside C. If C+e raises packing, combine it with tight-piece maxima avoiding f to contradict f-criticality. Named neutral insertion thus forces C=K5-e and its packing-neutral completion to K5. But every noncentral page lies in this completed C, while a maximum A packing avoiding g cannot use the central page xyz. It then cannot gain over R, contradiction. Thus f is in C and y,z are C vertices.

If x also belongs to C, the footprint bound confines every page to C. Hence A's triangle family is C+e plus unchanged tight pieces. Defect2 and f-criticality contradict the independently reviewed 210-insertion fact: the four defect-two insertions have only the inserted edge critical.

If x is outside C, every page apex p lies in C, with zp in C and xp outside it. The set I of page apices is independent in C: an old C edge pq together with xp,xq would put x in C. It contains y and another vertex. Criticality of f forces every pair {zy,zp}, p in I-{y}, to be a blocker in C.

The exact named-family fact below says an induced-wedge blocker occurs only in W5 (hub center) or K5-e (universal center and peripheral ends). Both have independence number2 and a minimum cover containing the two wedge edges. Thus I has exactly two vertices. A minimum C cover containing every zp, combined with tight-component minimum covers, is a minimum R cover already hitting every new e-page. This contradicts tau(A)=tau(R)+1.

R is therefore FRAGILE. For a critical edge h of R, cover extension and proper CS give

    B=A-{xz,h}, nu(B)=r-2, tau(B)=2r-4, literal B.

The remaining exact restoration adds TWO edges with packing gain2 and cover gain2. A still has critical yz, noncritical xy and actual triangle xyz. Payment of that interface remains OPEN.

## Exact C12 induced-wedge blocker fact

In the fresh clique models, an induced wedge has its two edges in different clique pieces. Each affected leaf clique admits a full packing avoiding its attachment edge and its wedge edge; these forbidden edges are adjacent because the wedge center is shared. The central K4 has at most one deleted wedge edge and admits one triangle avoiding it. Choose leaf packings avoiding their attachment edges, so the central packing may use any surviving attachment edge. This also covers the central vertex shared by several leaves. For two K5s sharing an edge, each K5 avoids the shared edge and its one adjacent forbidden edge. Thus those ten named models have no induced-wedge blocker.

In W5, a rim-centered induced wedge deletes two adjacent rim edges, leaving a four-vertex path with a two-edge matching. It is not a blocker. A hub-centered induced wedge removes two nonadjacent spokes and leaves only one available rim edge among the other three rim vertices, dropping packing from2 to1. The chosen two spokes extend to a three-spoke minimum cover.

In K5-e, the only induced wedge has universal center and peripheral ends. Deleting both spokes leaves all triangles through the opposite universal edge, dropping packing from2 to1. The two spokes and that opposite edge form a minimum three-edge cover.

This fact concerns only the twelve frozen models. It is not a classification of arbitrary defect-two supports.

## Status

Reviewed cap profile -> critical-wedge residual (candidate ordinary proof) -> resilient named branch excluded (candidate ordinary proof plus reviewed210 fact) -> two-edge B restoration (candidate ordinary proof) -> its payment and cap availability (OPEN) -> exclusion of minimum Q (OPEN) -> universal CS -> Tuza. W5 plus a rim chord has A equal to a four-wheel and a fragile R, so resilience of R is deliberately not claimed. No numerical work is needed for the stated proof.
