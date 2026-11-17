> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Rebasing a compatible pair: strict outside-retention loss and component swaps

Frozen ordinary discriminator and conditional packing operation, TUZA-26. This compares actual maximum residual packings at arbitrary codegree. It does not assume that rebasing retains the old outside triangles, and does not prescribe another family of free graph edges.

## Compatible partners and a global canonical choice

Fix an actual edge uv of the accepted minimum Q, with nu(Q)=nu(K)=k for K=Q-uv. Let X be the full common-neighbor set. Every P_z={uz,vz} is a blocker in K, so nu(K-P_z)=k-1. Q is two-edge packing resilient.

Every z in X has at least one compatible partner w. Indeed a maximum packing of Q-P_z has size k and must use an uv-page, because K-P_z has packing k-1. If that page is uvw, removing it leaves a packing of size k-1 avoiding BOTH P_z and P_w. Therefore

    L_{z,w}=K-P_z-P_w has nu=k-1.

Choose a compatible pair g,h and a maximum L_{g,h} packing M so that its number of outside triangles, meaning those containing neither u nor v, is as large as possible over ALL compatible pairs and ALL their maximum residual packings. Write

    M=M_0 union M_u union M_v,
    s=|M_0|, r=|M_u|+|M_v|=k-1-s.

This is a finite optimization choice, not a new minimal graph assumption. In particular it implies the earlier canonicality for the selected pair.

Suppose an actual outside triangle T=zab avoids every edge of M_0 and crosses the two old endpoint triangles

    A=uza in M_u, B=vzb in M_v,

with ab unused by M. The vertices u,v,z,a,b are distinct; z is a common neighbor different from g,h. The matching geometry of the old endpoint fans makes A and B the ONLY M triangles using P_z, and the only M triangles meeting E(T). This is the canonical crossing configuration under investigation.

## 1. Strict retention inequality after every rebase at z

For EVERY compatible partner w of z,

    nu(L_{z,w}-E(M_0)) <= r-1,

where E(M_0) means all physical edges in all old outside triangles. Thus no maximum rebased packing can retain every triangle of M_0.

Suppose instead that L_{z,w}-E(M_0) had an r-packing P. Together with M_0 it would give a maximum rebased packing N of size k-1. If P contained an outside triangle, N would have more than s outside triangles, contrary to the GLOBAL choice of M. Consequently P consists entirely of endpoint-fan triangles.

Since the z-spokes are absent in L_{z,w}, these fan triangles cannot use za or zb as rims. The only possible intersection with T is therefore ab, and at most one fan triangle uses it. If there is none, T appends to N in L_{z,w}, contradicting nu(L_{z,w})=k-1. If there is one, replace that fan triangle by T. This preserves packing size in L_{z,w} and increases the outside count to s+1, again contradicting global canonicality.

This proves the strict inequality. The unknown lower bound that a naive retention argument would need is precisely

    nu(L_{z,w}-E(M_0)) >= r.

Two-edge resilience gives nu(L_{z,w})=k-1 after choosing a compatible partner; it does NOT give this lower bound with all occupied outside rims deleted. This is the exact retention/extension loss, not an assumed equality.

## 2. The complete actual conflict graph

Choose ANY maximum rebased packing N of L_{z,w}. Both M and N are packings of common K of size k-1. Build a bipartite graph whose vertices are their actual triangles, with an edge whenever the two triangles share a physical graph edge. Identical triangles in the two packings form their own balanced two-vertex component. No crossing has been omitted.

For a component C_i, let a_i and b_i be its numbers of M and N triangles, and d_i=b_i-a_i. One can independently choose the M or N side of EACH component: no selected triangles in different components intersect. Choosing all positive-imbalance N sides and all other M sides produces a K packing of size

    k-1 + sum_{d_i>0} d_i.

Since nu(K)=k, the sum is at most one. The total imbalance is zero, so exactly one of the following occurs:

* every component is balanced;
* there is one component C_+ with d=+1, one C_- with d=-1, and every other component is balanced.

In particular it is INVALID to assume all components balanced merely because M and N have the same size: these packings are one below the maximum of K.

The +1 swap gives a maximum K packing. Every maximum K packing must hit every page pair P_x, or it could be augmented by uvx in Q. M avoids P_g,P_h, so the N side of C_+ must itself hit BOTH P_g and P_h. Applying the reverse +1 swap to N, the M side of C_- must itself hit BOTH P_z and P_w.

If the two compatible pairs share an apex, all components are balanced: both packings lie in that same blocker-deleted graph, whose maximum is only k-1. This also follows because the asserted C_+ or C_- would have to hit a page pair avoided by both entire packings.

## 3. A stronger page-localization constraint

In the unbalanced case, select the N side of C_+, the M side of C_-, and arbitrary sides in all balanced components. EVERY such hybrid is a maximum K packing and therefore hits every P_x.

For each common neighbor x, at least one of the following must hold:

1. the N side of C_+ hits P_x;
2. the M side of C_- hits P_x;
3. some balanced component hits P_x on BOTH its M and N sides.

Otherwise choose, independently in each balanced component, a side avoiding P_x; the fixed two unbalanced sides also avoid it, producing a maximum K packing avoiding P_x and hence a forbidden Q augmentation. This localizes simultaneous page-blocker responsibility to actual conflict components. It is not a claim that the auxiliary component graph itself is a triangle packing.

## 4. A localized hybrid that retains every unaffected triangle

Let I be the set of conflict components containing an M triangle that uses P_z or P_w. There are at most FOUR such components, because an edge-disjoint packing has at most one triangle through each of the four marked spokes. In the unbalanced case C_- belongs to I, by the preceding page responsibility.

Let S be I together with C_+ if C_+ exists. Define the actual hybrid H by taking N triangles on components in S and M triangles on every other component. Then

    |H|=k-1, and H is a packing of L_{z,w}.

Indeed the selected imbalances sum to zero: either all are balanced, or C_- and C_+ are both selected. Every old M triangle on a deleted z/w spoke was removed, and the selected N triangles avoid those spokes. All actual crossing conflicts are accounted for by whole-component selection.

This confines the necessary change to at most FIVE conflict components. Their sizes are not bounded, and the statement does not assert a finite graph-order domain. If w is g or h, all components are balanced and only the two possible old z-fan components need change.

Here is an explicit paid discriminator. If the N triangles in the selected components S avoid every edge of T, then H also avoids T: all old M intersections with T were A,B, and both lie in I. H avoids P_z as well. Therefore append the two disjoint actual triangles

    T=zab and uvz.

They avoid each other because T contains neither u nor v, and they avoid all of H by the displayed conditions. This gives k+1 Q triangles. Consequently, in every surviving rebase, a new N triangle blocking T must lie in one of these selected components. A blocking triangle in any other conflict component can simply be removed by retaining that component's old M side and cannot protect the obstruction.

The operation does not require M_0=N_0. It retains all unaffected old triangles literally and checks the whole actual conflict graph for the changed region.

## 5. A closest rebase and the exact remaining debt

One may choose N to maximize its number of triangles in common with M among maximum L_{z,w} packings. Then no nontrivial balanced component avoiding the old z/w spokes can remain outside the selected set: replacing its N side by its M side preserves size and all deleted-spoke constraints while increasing agreement. Thus a closest rebase has at most the same five nontrivial components described above. This does not make their physical triangle boundaries small.

The strict retention inequality shows that at least one old outside triangle must change. The localized hybrid criterion shows exactly where the crossing T must acquire a new blocker. Neither statement proves that the change is profitable. It may replace lost outside triangles by an equal or smaller number of different outside triangles, while putting an occupied edge back on T inside a marked or +1 component.

This is the precise remaining extension obstruction. The complete Q profile has supplied compatible partners and page responsibilities, but full-triangle minimum-cover eligibility has not yet forced a component choice avoiding T or paid the outside-retention deficit. No cover matching is identified with a packing, no common outside packing is assumed, and no defect-two support is named. The stronger degree and two-hub exclusions have not been used to assert an unproved monotonic rebase.

## Scope and review request

Proved conditional operations: an extension retaining all M_0 would contradict global canonicality; the actual component hybrid augments whenever its selected N sides avoid T. Proved necessary obstructions: strict loss of outside retention; the exact {0} or {+1,-1} imbalance pattern; simultaneous page responsibilities; and confinement to at most five (possibly arbitrarily large) conflict components. Universal availability remains OPEN.

The component imbalance idea was proposed by root. Apex_challenger derived the strict retention inequality, explicit localized hybrid, and closest-rebase scope. Relied sources: the accepted compatible-page/blocker profile; notes/matching26_canonical_outside_packing_v1.md; notes/arbitrary_book_release_compression_v1.md. No numerical computation, free-edge catalogue, or graph search was run. Independent review requested.
