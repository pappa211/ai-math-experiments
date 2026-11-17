> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A general C6-or-ineligible-spokes alternative for triangle restoration

Frozen ordinary proof candidate, 2026-11-16. This is a necessary structural alternative, not a classification or a robustness theorem.

Let H be any finite simple graph with p=nu(H) and tau(H)=2p-1. Let a,b,c be independent in H and put G=H+{ab,bc,ca}. Suppose G is not strict: tau(G)>=2nu(G). Since abc appends to any H packing and its three edges extend a cover, necessarily

    nu(G)=p+1, tau(G)=2p+2.

In particular Tuza's inequality itself always holds in this single-triangle restoration setting; only equality can obstruct strictness. No CS induction, connectedness or single-edge resilience is required for this accounting.

Let N be the ENTIRE new triangle family. Besides abc it consists of ordinary pages on the three new bases, with outside apices. The base/apex incidence graph has three left vertices, and each nonempty right vertex has degree1 or3. Two pages are edge-disjoint exactly when their bases and apices are both different.

Exactly one of the following two branches occurs.

## A. Three independent pages force a C6 packing loss of at least two

If the incidence graph has a matching of size three, choose its pages abx,bcy,caz with distinct x,y,z outside {a,b,c}. Their six old spokes form the literal cycle

    a-x-b-y-c-z-a.

The alternating triple {a,b,c} is independent in H. Additional chords among the other three vertices or between opposite parts are allowed; this is not an induced-cycle assertion.

Every H packing avoiding those six cycle edges is disjoint from all three pages. Therefore nu(H-E(C6))>=p-1 would give a G packing of size p+2, contradiction. Consequently

    nu(H-E(C6))<=p-2.

The conclusion holds for EVERY three-page incidence matching, not just one chosen witness. It is a necessary loss bound, not a claim that such a damaging cycle exists in every near-tight H.

## B. The entire new family is K5-e with cover-ineligible old spokes

If the incidence matching number is at most two, the actual-page classification gives a cover of N with at most two edges unless N is exactly the seven-triangle K5-e family on abc and two full apices u,v. The short proof is independent of B: with two full apices no third apex is allowed; with one full apex all singleton apices must lie on one base, covered by that base and the opposite full-apex spoke; with no full apex there are at most two occupied bases. A two-edge N cover plus an H minimum cover would give2p+1, contradiction. Thus exactly the exceptional family remains.

Each of its six old spokes lies in a three-edge N cover: for terminal a use {au,av,bc}, and relabel. If a spoke belonged to any minimum H cover, the union would have size at most(2p-1)+3-1=2p+1. Hence NONE of the six old spokes occurs in ANY minimum H cover. Triangle-free background spokes are allowed and automatically have this property; the substantive restriction concerns triangle-supported spokes.

Furthermore, if S is the set of all six old spokes, then

    nu(H-S)<=p-1.

Otherwise a maximum H packing avoiding S combines with a two-packing of N to give p+2 in G. This is a necessary condition, not a sufficient condition for non-strict restoration.

## Cover-eligibility corollary and a necessary control

If EVERY triangle-supported H edge belongs to some minimum H cover, branch B is impossible: all six spokes would then be background, so every H packing avoids them, contradicting its displayed packing-loss condition. Therefore non-strict restoration from such an H forces branch A, an actual six-cycle with an independent alternating triple whose deletion lowers packing by at least two.

For arbitrary H, branch B cannot be discarded. Let H be a three-page book with spine uv and apices a,b,c. Then p1,tau1; adding abc produces K5 with nu2,tau4. The six spokes are all ineligible for its unique old minimum cover {uv}, and their deletion leaves packing zero. This exact control satisfies branch B and shows why universal strict restoration would be false. It is not a Tuza counterexample.

For a minimum-CS failure, every triangle residual is near-tight and restoring its deleted triangle is non-strict. Thus this alternative applies to EVERY such residual. The missing bridge is exclusion of the independent-alternating-C6 packing loss, or control of the ineligible-spoke branch; neither is supplied here. The ordinary fresh-clique restoration proofs establish suitable avoidance/eligibility in specific classes only.

Dependencies: elementary packing and cover accounting and the actual-page incidence classification independently written above (also in notes/two_triangle_restoration_v1.md, Section1). No finite evidence or external theorem is used.
