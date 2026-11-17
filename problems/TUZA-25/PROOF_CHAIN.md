> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Exact proof chain and the remaining reconstruction bridge

Integration frozen for explicit circularity review at the original mission deadline; local statement updates are recorded in the research log. Unrestricted Tuza and CS remain OPEN. Defect means delta=2nu−tau; defect one is positive slack1, not a Tuza violation. Every actual triangle is counted. The support graph contains precisely triangular edges; its background edges must be retained separately whenever restoring the original parent.

## 1. Start at the actual smallest CS failure

Assume, for contradiction, that CS fails. Choose G with the fewest edges among failures, removing isolates. Proper edge-subgraphs of G satisfy CS. Archived M0/R1/R2/attachment and triangle-plus-edge restoration, with their recorded scopes, imply:

- G is tight non-B, with all edges triangular and connected nonempty shared-edge triangle support;
- writing k=nu(G), every deletion of at most two edges preserves k;
- for every actual triangle T, H=G−E(T) has nu(H)=k−1, tau(H)=2k−3, connected nonempty triangle support and single-edge packing resilience;
- every H triangle extends to a maximum H packing (archived two-triangle extension).

Let S be H's triangle support. It has the same nu,tau and resilience. Proper-subgraph CS holds on S and every edge-subgraph used below because they are proper edge-subgraphs of G. It gives only nonnegative defect and, at defect ZERO, literal B support. It does not classify S at defect one.

An all-size strict-restoration theorem for a specified support class, valid with arbitrary retained background, excludes that class for S: it would give tau(G)<=2nu(G)−1. Archived fresh-edge classification/restoration and the directly reconstructed W5/K5-e restoration exclude the twelve named supports C12. The W5/K5-e exclusion and codegree corollary have earlier archived consequences; their new direct derivation is not a novelty claim.

## 2. Valid separator descent on S

For a two-vertex separator {u,v} of connected triangle support, uv is present. Split support into two genuine sides A,B sharing exactly that edge. Single-edge resilience forces exact packing additivity and resilience on both sides. Exact covering is

    nu(S)=nu(A)+nu(B),
    tau(S)=tau(A)+tau(B)−epsilon,
    delta(S)=delta(A)+delta(B)+epsilon,

where epsilon=1 precisely when uv lies in some minimum cover of each side. Proper-subgraph CS makes side defects nonnegative. At delta(S)=1, either both sides are tight literal K4/K5, or one is a literal tight clique and the other is resilient defect one, with uv cover-ineligible on that active side.

Peel the tight side in the second case. Supported-edge count strictly decreases (and packing drops by1 or2). Connected support, defect one, resilience and proper-subgraph CS survive. If every triangle initially extended to a maximum packing, exact packing additivity preserves that property too. All peeled pieces, attachments and original background are recorded; they are not silently discarded from a parent-restoration problem.

Iteration either enters the archived fresh-edge class or leaves a three-vertex-connected active core. A W5 or K5-e terminal core cannot accept a neutral leaf, since all its supported edges are minimum-cover eligible. Those cases are excluded. An unknown core remains. This is a valid reduction WHEN the separator exists, not a proof that an unknown core has another applicable configuration.

## 3. A separate minimization that licenses smaller defect-one comparisons

There is a useful, explicit second choice that avoids circularity. Since S is outside C12, the following finite collection is nonempty: triangle-support graphs Q of proper edge-subgraphs of the fixed G, such that Q has connected nonempty support, delta1, single-edge resilience, and Q is not isomorphic to a member of C12. Choose Q with the FEWEST SUPPORTED EDGES.

This is a minimum counterexample to a named-support classification inside the finite edge universe of G; it is not another minimum CS failure. Every smaller connected/resilient/defect-one support inside G is in C12 BY THIS CHOICE, never merely by proper-subgraph CS. Membership in frozen F, every-triangle extension, a missing-triangle parent, and a particular restoration interface are NOT part of this wider minimization and are NOT inherited by Q.

The separator descent above makes Q three-vertex-connected. Indeed a smaller active side would be named by this separate minimality. W5/K5-e cannot accept its neutral leaf; a named fresh-edge side plus a fresh neutral clique leaf is still a fresh-edge defect-one graph, hence named by the archived construction-class classification. The two-tight-sides case is named directly. Each contradicts Q outside C12.

This establishes a precise unknown object: a three-connected, triangle-supported, single-edge-resilient defect-one graph Q inside G, with proper-subgraph CS, outside C12. It does not establish that Q is in F or has low degree.

## 4. Chosen missing bridge: reconstruct a critical-triangle predecessor

The remaining research focused on this reconstruction bridge, not on assuming a general reduction is available. A literal fresh K4 leaf attached along an old triangle has at most one unit of packing gain; a K5 leaf on an old triangle has at most two. Exact leaf response formulas separate full-gain branches from submaximal ones. In the identified submaximal branch, the predecessor J has delta2, every triangle lies in a K4, and every edge of the separator triangle A is packing-critical. These hypotheses must be verified from the particular leaf; they are not true for arbitrary cores. Removing a genuine fresh triangle-overlap leaf preserves connected old triangle support: every new triangle attaches to the one old component containing the separator triangle A, and cannot join two old triangle components.

The new critical-edge deletion theorem says: under proper-subgraph CS, deleting ANY critical edge e from such a K4-completed delta2 graph yields R=J−e with delta1 and single-edge resilience. If J has connected triangle support, R has connected triangle support as well. Every supported J edge other than e remains triangular via a K4-e diamond. The proof is an actual graph argument: a second critical deletion would leave B, force all lost triangles into a single K4, and contradict two units of packing loss.

The supported-edge count strictly decreases. Proper-subgraph CS and broad connected/resilient/defect-one premises survive. Every-triangle extension, three-connectivity, no-two-edge-B deletion, and a particular tight missing-triangle parent do NOT automatically survive.

For the twelve named R supports, diamond confinement removes the apparent infinite background issue: a new e-page completed to K4 leaves an old diamond, so all page edges and endpoints lie inside R's support. The entire insertion interface is therefore finite. Independent exact verification of all210 labeled nonedge presentations found only4 delta2 K4-completed cases (one graph type), and each has ONLY the inserted edge critical. None has a wholly critical triangle.

Consequently, if Q from Section3 has a verified leaf predecessor J of this type, R is a strictly smaller qualifying support inside G, so Section3's explicit minimality makes it named. The finite interface then contradicts J's critical triangle. This EXCLUDES THAT IDENTIFIED CONFIGURATION in Q. It does not establish that Q contains it. No induction restricted to F is used: edge deletion need not preserve a clique construction certificate.

## 5. The matching interface and an actual one-edge-boundary reduction

For a K5 leaf along a K4 separator A, consider the zero-packing-gain branch with every predecessor J triangle completed to a K4. Let the fresh vertex be x and p=nu(J)=nu(H). Every A edge is critical. For every perfect matching M={ab,cd} of A, the two edge-disjoint new triangles xab,xcd append to any J−M packing. Zero gain therefore forces nu(J−M)=p−2. No every-triangle-extension assumption is needed.

The defect-three predecessor value follows by an explicit additional argument. The exact cover response gives 0<=tau(H)−tau(J)<=2, hence delta(J) is1,2or3. At defect one the K4-completion lemma would make J resilient, contradicting its critical A edges. At defect two, deleting one matching edge would yield a resilient graph by the reviewed critical-edge theorem, while the other matching edge is critical there because deleting the pair loses two packing units. This contradiction leaves delta(J)=3. Zero gain alone was not treated as a cover calculation.

A minimum cover of J cannot contain all three edges of an A triangle: the exact leaf cover response would then give defect at least two in the larger graph. Its restriction to A is a triangle-free K4 cover and contains an opposite pair M. Removing that pair from the minimum cover gives exactly tau(J−M)=tau(J)−2. For this M,

    nu(J−M)=nu(J)−2,
    tau(J−M)=tau(J)−2,
    delta(J)=3, delta(J−M)=1.

The new matching-deletion resilience proof handles a hypothetical further critical edge f by considering the three shapes of M union {f}: a three-edge matching, P3 plus an edge, or P4. The first two cannot supply three units of new packing over B. The P4 case can do so (a preserved exact counterexample refutes the packing-only claim), but an old minimum cover through one edge in each of two distinct B components saves a cover edge. Thus R=J−M is resilient. Proper-subgraph CS and component additivity give exactly one active defect-one triangle component C, with all other components literal tight K4/K5 supports. They do not classify C.

There is now a concrete reconstruction interface. Every restored matching-page whose apex lies outside A has a surviving K4−edge diamond entirely inside C. Hence every tight R component meets the entire larger graph H only along one old A crossedge. Connected triangle support makes that boundary nonempty; there are at most four distinct tight pieces. Delete each piece's edges except its boundary edge, retaining ALL vertices, shared vertices, background and outside triangles. Write K for the resulting graph, F for the retained boundary edges and r for the sum of the removed pieces' packing numbers. Then

    nu(H)=r+nu(K),
    tau(H)=2r+tau(K−F).

The second formula makes the marked F edges free in the active cover problem; it does not assume simultaneous eligibility in an unmarked minimum cover. Every outside triangle and the literal K5 on A plus x survive. Connected triangle support and one-edge resilience pass to K. Every-triangle extension passes only if it was present initially; it is unnecessary for these numeric transfers. If a tight piece exists, supported-edge count strictly decreases. Proper-subgraph CS gives delta(K) in {0,1}, since tau(K−F)=2nu(K)−1. If no tight piece exists, K=H and this operation gives no descent.

The boundary proof permits arbitrary shared vertices. A one-edge triangle boundary alone is NOT a fresh gluing certificate. A further reconstruction argument now resolves this identified zero-gain branch under Section3's wider minimality:

1. The unique active support C of R is connected, resilient and defect one. It has strictly fewer supported edges than Q, so it is in C12 by the explicit minimum-Q choice, not by proper-subgraph CS.
2. Perform the tight-piece removals in J as well as H, giving J',H'=K and R'=J'−M. Exact packing partition gives nu(J)=r+nu(J') and nu(H)=r+nu(H'), so zero gain survives. R' has exactly C as its triangle support; background and all A crossedges remain.
3. Every J' triangle remains K4-completed. A completion of an old C triangle has zero M edges and stays in C, or one M edge and a retained C diamond. A completion with both M edges is A, whose faces are not old R triangles. Every external restored page has its retained C diamond; central pages retain A itself. These cases exhaust the triangles.
4. Every C12 support has a universal support vertex and is induced-C4-free. Thus no background edge lies between its support vertices. Put I=A intersect V(C). If |I|<=1, H' is triangle-disconnected; if |I|=4, the old A crossedges induce a forbidden C4. For |I|=2, the triangle families compare a K4 and a K5 attached to the same edge (use C+e if that edge is a restored matching edge). Their packing contributions are one and two. For |I|=3, put L=C+e for the matching edge within I. J' and H' are respectively K4-on-triangle and K5-on-triangle families over L. Their exact packing formulas are max(p0,1+b) and max(p0+1,2+b), where p0=nu(L), b=max_f nu(L−f). In every possible case nu(H')=nu(J')+1, contradicting zero gain.

Therefore the identified zero-gain K5-on-K4 leaf with K4-completed predecessor is also excluded in Q. This reconstruction uses the known supports' proved structural properties, not another census. It preserves the full actual triangle family and permits the removed tight pieces to share extra vertices. The ordinary proof is `notes/mixed_named_matching_reconstruction_frozen.md`; independent review is recorded separately. It still does not supply such a leaf in an arbitrary unknown Q.

## 6. Where the chain stops

(a) **Valid reductions when configurations exist:** the support edge-separator peel; the K4-completed defect-two critical-edge deletion; the defect-three matching deletion with its derived profile; and the critical-triangle and zero-gain matching reconstruction exclusions under the separate minimum-Q choice. Their proofs, measures and limits are stated above.

(b) **Availability:** not proved. Neither proper-subgraph CS nor the computations force an unknown three-connected core to have a suitable clique leaf, degree-three vertex, critical-triangle predecessor, or another restoration-compatible reducible region. Nonchordal three-connected searches reached zero defect-one states; this is inconclusive, not evidence of universal availability. The210 known-model interface discharges only the named reconstruction obligation.

(c) **Exact remaining obstacle:** exclude an unknown Q by a configuration actually guaranteed in Q, OR enlarge the reconstruction argument so that a smaller defect-one state can be used without silently assuming named classification, triangle extension, or a restored-triangle parent. For the chosen reconstruction direction, both the critical-triangle branch and the zero-gain K5-on-K4 matching branch are now eliminated whenever their explicit K4-completed-predecessor hypotheses hold inside the minimized wide class. The exact remaining obstacle is the unknown core: no applicable configuration or predecessor K4-completion is guaranteed. In particular a general degree-three wedge has a defect-two predecessor with two adjacent critical edges, but that predecessor need not be K4-completed; the reviewed deletion theorem cannot be applied to it without a new proof. Other leaf gain branches require their own stated response/reconstruction analysis. No classification of arbitrary three-connected defect-one supports follows.

The checked progress is partial and precise. It does not close a well-founded induction for unrestricted CS or Tuza. Mixed equivalence and the K5-ring topology control are consolidation results here; neither supplies the missing ordinary reduction.
