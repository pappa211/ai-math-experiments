> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Three-edge restoration: exact preliminary reductions

Frozen ordinary lemmas, 2026-11-16. Let B(H), let F consist of three distinct nonedges, and G=H+F. Assume G is tight, tau(G)=2nu(G), and put m=nu(H).

If no new triangle is created, B(G) is immediate. Otherwise any one new triangle can be appended to a maximum H packing: with one new edge its two old spokes lie in different old blocks, with two new edges it has only one old edge, and with three it has none. Thus nu(G)>=m+1. Adding F to an old minimum cover costs at most three, so tightness forces

    nu(G)=m+1, tau(G)=2m+2.                            (1)

## A pure new triangle closes the restoration

Suppose some new triangle T has every one of its old edges triangle-free in H. Delete E(T) from G. Removing those background H edges leaves a graph H0 with exactly the old B triangle components and nu(H0)=m. The residual is H0 plus at most two remaining restored edges.

It contains an m-packing from H0, and appending T bounds its packing number above by nu(G)-1=m. If it had any new triangle over H0, elementary one-/two-edge insertion would increase that number to at least m+1: every triangle using at most two restored edges has an old footprint avoided by a maximum B packing. Hence it has NO new triangle and satisfies B.

Restoring the three missing edges of T is exactly the accepted R1 theorem, so B(G). Therefore a non-B tight three-edge restoration would have EVERY new triangle meet old triangle support. In particular no restored edge has a bare ordinary page, and every two-new-edge triangle has a supported old closing edge. If F itself is a triangle, its new triangle is pure and this recovers the accepted R1 case.

## Every two-edge intermediate is defect one

Assume G is tight but not B. For each e in F put J=H+(F minus {e}). Its packing number is at most m+1, and its cover number is at least tau(G)-1=2m+1. The accepted full two-edge restoration consequence gives CS(J), so

    nu(J)=m+1, tau(J) in {2m+1,2m+2}.

If tau(J)=2m+2 then B(J). If inserting e creates a new triangle, Lemma A makes G strict; if it creates none, B(G)=B(J). Either contradicts the assumption. Therefore EVERY two-edge intermediate has

    nu(J)=m+1, tau(J)=2m+1.

No classification of that defect-one graph is inferred. These reductions do not yet prove restoration for all three-edge shapes. The star case is treated separately; matching, path and disconnected shapes remain exact research obligations.

Dependencies: elementary clique avoidance and cover extension; accepted R1 and R2. No minimum-counterexample hypothesis, arbitrary-near-tight classification, finite computation or external theorem is used.
