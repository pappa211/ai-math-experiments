# Independent audit of K2-join triangle fullness

**Verdict: accept the exact TF characterization and the subcubic theorem, with an explicit scope clarification for the even-b all-edge criticality statements.** No failure was found in the three-condition iff, the ordinary/odd cover identities, the optimizer quantifier, or the proof that q=t for subcubic rims. The claim that every edge is alpha-critical requires the tie together with OCT-criticality of every edge; it is false under the tie alone.

## Frozen input and independence

Reviewed input: `notes/global_routes_k2_join_tf.md`, SHA256 `e01b8f74c39c86fd4810fd4a6ad13e666441de359f708b9fd7548e0a8a5a53ef`. The exact input is preserved in `review/k2_join_tf_fresh_inputs/global_routes_k2_join_tf.md`. The note was read and then snapshotted before the independent checker was written; the source still had this hash when the audit artifacts were finalized.

I reconstructed the arguments from the note without reading or importing producer code, producer evidence, favorable reviews, or the research log. I then wrote the small standard-library checker `review/k2_join_tf_fresh_checker.py`. Its computations are fixed controls, not graph generation or an expanded search. Requested model controls were Astra / Ultra; actual serving identity and applied controls are not independently exposed. This is ordinary AI mathematical review, not human or Lean verification.

The original mission clock remains start 2026-11-15T01:53:58Z, research cutoff 09:23:58Z, hard deadline 09:53:58Z. All checks ran locally on Darwin using the existing pinned environment. No remote computation, publication, package installation, or Lean run was used.

## Cover identities and triangle ownership

The standing hypotheses, finite triangle-free R with at least one edge, are sufficient; connectedness is not needed. Its join with the adjacent apices has exactly the triangles abv, auv and buv for rim edges uv. No original rim triangles have been silently omitted because triangle-freeness is assumed.

If ab is selected, deleting it leaves the I2-join cover problem. For a fixed selected rim set D, each apex must select a vertex cover of R-D, and minimum cost uses a minimum such cover at both apices. Choosing the same optimum S at both and retaining exactly the rim edges inside U=V-S gives cost 1+2(n-|U|)+e(U). The converse construction is a cover for every U, proving the selected-ab mode equals 1+t.

If ab is omitted, each vertex has at least one selected spoke. In a minimum cover, unnecessary rim edges can be removed, leaving exactly the rim edges inside the two single-spoke parts A,B; vertices S with both spokes contribute the additional |S|. Deleting S and one endpoint of each internal selected edge bipartizes R, so the cost is at least n+k. A minimum OCT and a bipartition of its complement attain this cost without selected rim edges. Hence tau=min(1+t,n+k).

For odd covers, assign binary colors using the a-spokes. The triangle equations axy force every other edge indicator to be one exactly when its endpoints have the same color. Conversely every cut complement is odd on all triangles. Opposite apex colors give n plus minimum monochromatic rim-edge count, which is eta; equal apex colors give 1+q. This proves pi=min(n+eta,1+q). The pointwise comparison of the two S objectives gives q>=t.

The independent-multi-cone lemma is valid in its strong form. If a selected rim edge uv had an endpoint in any minimum vertex cover C of R-D, use C at every apex and remove uv from D. All triangles remain covered and total size drops by one. Thus selected rim edges have both endpoints excluded from every available optimum spoke cover. It follows that no minimum I_s-join cover contains a full actual triangle, including noncanonical minima.

## The iff and its exact quantifiers

The TF definition is equivalent to tau(G-E(T))=tau(G)-3: removing the three triangle edges from a minimum cover containing them gives the forward inequality; adjoining them to any cover after deletion gives the reverse inequality and the converse construction.

For necessity of the mode tie, a full abv triangle requires the selected-ab mode. A full auv triangle cannot occur in that mode, since removing ab would yield a minimum independent-two-apex cover with a full triangle. Thus both modes attain the global optimum.

For condition 3, suppose a minimum cover contains ab,av,bv. At least one optimum spoke vertex cover contains v; use it at both apices. Removing unnecessary rim edges cannot strictly decrease cost because the original cover was minimum. Its complement U therefore attains t and excludes v. Conversely an optimum U excluding v produces a minimum selected-ab cover containing ab,av,bv when the mode tie holds.

The quantifier is exactly **for every vertex v there exists an optimum U excluding v**. The optimizer may depend on v. It is not a common optimizer excluding all vertices, and it includes isolated vertices if any occur in R. The positive C5 control exhibits distinct suitable optimizers U=V-{v} for its different vertices.

For condition 2, in a minimum omitted-ab cover containing au,av,uv, the edge uv is internal to A, not incident to S: any selected rim edge incident to S would be redundant. Delete S and an endpoint of each other internal selected rim edge. This bipartizes R-uv with at most k-1 vertices. A single-edge deletion can decrease OCT by at most one, giving equality.

Conversely, an OCT S of R-uv of size k-1 contains neither endpoint. In any bipartition of R-uv-S the endpoints must be in the same part; if a bipartition put them in opposite parts, S would also bipartize R. This reasoning also handles disconnected R-uv-S: if the endpoints were in different components, their colors could be chosen opposite. Choose their common part to receive the a-spokes, select both spokes at S, and select the sole internal rim edge uv. This gives n+k edges and contains the entire auv triangle. Swapping the apex labels handles buv.

These constructions cover all actual triangle types. The tie plus conditions 2 and 3 are therefore sufficient as well as necessary, for every finite triangle-free rim with at least one edge.

## Structural consequences and the scope correction

The tie is M=b+1. Since independent sets give 2alpha<=M and bipartite sets give b<=2alpha, it follows that b is 2alpha-1 or 2alpha. Any color class of a maximum induced bipartite graph has size at most floor((b+1)/2), so every coloring is balanced or nearly balanced. Independently flipping its components proves that the sum of their absolute imbalances is at most one.

If b=2alpha and an individual edge uv is OCT-critical, choose a bipartite induced set of size b+1 in R-uv. In R this set has only uv internal to one color part A; the other part B is independent. The inequalities 2|A|-1<=M and 2|B|<=M force |A|=alpha+1 and |B|=alpha. Thus **each OCT-critical edge is alpha-critical**. Every edge is therefore alpha-critical under TF, or more precisely under the tie plus condition 2.

The frozen section is titled “Structural consequences of the tie” and then says “Therefore every edge of R is alpha-critical.” This needs the explicit qualifier above. The connected path P4 disproves the reading that the tie alone implies it: b=4, alpha=2, M=5=b+1, but deleting the middle edge leaves two independent edges and does not increase alpha. The note's per-OCT-critical-edge argument is correct; the unqualified conclusion has broader wording than that argument establishes. The even-b all-edge maximum-worth-criticality addendum should likewise explicitly retain the TF/tie-plus-condition-2 scope used by its proof.

Suggested wording: “If the mode tie and condition 2 hold and b is even, every edge of R is alpha-critical.” In the addendum, begin “Under these same hypotheses, every edge is also critical for M.” No change to the TF characterization or the subcubic result is required.

When b is odd, M=2alpha. An alpha-critical edge would give an (alpha+1)-set inducing exactly that edge in R, of worth 2alpha+1, a contradiction. This no-alpha-critical-edge statement genuinely follows from the tie alone.

The simplification of a maximum-worth set is correct: induced degree at least three would permit strict improvement on deletion, while deleting a degree-two vertex preserves the objective. Repeating leaves only isolated vertices and isolated edges. The single-swap degree bound is also correct: two outside vertices with one neighbor in a maximum independent set cannot share that neighbor, and if nonadjacent their addition would give worth 2alpha+2. Hence they form a clique of size at most two in the triangle-free rim. No connectedness or global classification of the state graph follows from this local degree bound, and none is claimed.

## Subcubic proof

For S=V-U, direct edge counting gives

    2|S|+e(V-S)=m+sum_{v in S}(2-d_R(v))+e(S).

Removing a vertex v of original degree at most two changes the right side by d_R(v)-2-d_{R[S]}(v), which is nonpositive. Thus some optimum is contained in the original degree-three vertex set J. There the objective is m-|S|+e_J(S).

For every S, deleting one endpoint per internal edge leaves an independent set of size at least |S|-e_J(S), so |S|-e_J(S)<=alpha(J). A maximum independent set attains equality. Therefore t=m-alpha(J). Choosing that independent S makes e(S)=0, and the q objective equals the t objective. Along with q>=t, this proves q=t. The argument does not assume that an arbitrary optimizer is independent; it constructs one that is.

Under the TF tie, pi<=1+q=1+t=tau, while every odd cover is an ordinary cover. Thus pi=tau. No packing theorem or unavailable transfer is used. This is the claimed restricted conclusion.

## Literal checks, limits, and hashes

The independent checker exhausted all edge subsets of six fixed small joins, with rims K2, P3, P4, C4, C5 and the claw. It directly computed ordinary minimum covers, odd minimum covers, both apex-edge modes, and whether each actual triangle occurs fully in some minimum cover. It compared these with independently enumerated rim values and the three TF conditions. All passed. The positive C5 join has 15 actual triangles, 31 minimum covers, and tau=pi=6; all 15 triangles are full in some minimum cover. P4 verified the scope counterexample. A named Petersen rim subset calculation checked alpha=4, b=7, M=9 and t=q=11, confirming its tie failure.

These finite checks diagnose exact quantifiers and arithmetic. The universal results rest on the ordinary proofs reconstructed above, not the small sample. I did not audit the external literature attribution, the Kalbfleisch or 13-vertex exploratory numerical claims, or the previously recorded SAT timeout; none is needed for the accepted theorem. The unproved maximum-worth classification remains unproved.

| Artifact | SHA256 |
|---|---|
| Frozen input and snapshot | `e01b8f74c39c86fd4810fd4a6ad13e666441de359f708b9fd7548e0a8a5a53ef` |
| `review/k2_join_tf_fresh_checker.py` | `ec62430f8bfd2caca8224acd2e593576634bc5e32bbf0abf9e783b8a59eaa4d9` |
| `evidence/k2_join_tf_fresh/results.json` | `ef1695927dd30081a956ae1d38f205580b083947c2525d54c17eabbc6167bd46` |

No unrestricted Tuza result, formal verification, human review, or novelty claim is established by this audit.
