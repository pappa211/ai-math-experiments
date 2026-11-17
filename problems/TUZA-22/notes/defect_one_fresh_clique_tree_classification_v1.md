> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Exact defect-one classification for fresh K4/K5 edge gluings

Status: ordinary all-size proof candidate, frozen for independent review. This class is literal and deliberately restricted: no new crossing edges, larger old-vertex overlaps, or arbitrary clique representations are assumed.

## Theorem and construction class

Start with one K4 or K5. Repeatedly choose an actual old edge ab and attach a fresh K4 or K5 whose only old vertices are a,b; add precisely the edges of that clique. All its other vertices are new. Let G be any graph obtained in this way, and write delta(G)=2nu(G)-tau(G).

If delta(G)=1, then its literal construction has one of the following forms:

1. two K5s sharing one edge; or
2. a central K4 and between one and three fresh K4/K5 leaves, attached along distinct edges of one star of that central K4.

In the second form, the leaf vertex sets outside the central K4 are disjoint. Conversely every listed form has delta1. Every graph in this construction class is resilient under deletion of any single edge. Consequently every connected defect-one graph in this class has

    nu(G)<=7,

and the bound is sharp, attained by a central K4 with three K5 leaves on a star. This is not a classification of arbitrary connected defect-one or edge-resilient graphs.

## 1. Literal family and attachment identities

Every actual triangle is contained in one of the attached clique pieces. At a fresh step, a triangle using a new vertex can use old vertices only from the two attachment endpoints; otherwise a necessary edge is absent. Induction gives the assertion, including all crossing-triangle checks needed here.

For Q=K4 put r(Q)=1, and for Q=K5 put r(Q)=2. Each Q has nu=r and tau=2r, and admits a maximum packing avoiding any prescribed edge. If G' is obtained from G by attaching Q along f, then

    nu(G')=nu(G)+r.

The upper bound partitions a packing's triangles between the old family and the new clique family. The lower bound combines an old maximum packing with a maximum Q-packing avoiding f.

Call an old edge eligible when it occurs in some ordinary minimum triangle cover of G. Minimum-cover accounting gives

    tau(G') = tau(G)+2r-1  if f is eligible,
    tau(G') = tau(G)+2r    if f is ineligible.                 (1)

Indeed a cover omitting f costs at least tau(G)+2r. A cover containing f restricts to covers of both pieces and costs at least tau(G)+2r-1; equality in this bound requires an old minimum cover containing f. If f is ineligible, adjoining f to an old minimum cover and taking a Q-minimum cover containing f attains tau(G)+2r. If f is eligible, old and new minima containing f attain the other value. The same statements hold when f lies in several old pieces; the argument only distinguishes the entire old graph from the new piece.

Thus each attachment increases delta by exactly one at an eligible edge and leaves delta unchanged at an ineligible edge. The first attachment is always at an eligible edge of the initial clique, so it raises delta from0 to1. Every subsequent attachment in a final delta1 construction must therefore be neutral, at an ineligible edge. There is no cancellation of earlier increases.

For any old edge e, including e=f, the same triangle-family partition and avoidance give

    nu(G'-e)=nu(G-e)+r.                                    (2)

For a new edge e, choose an old maximum packing avoiding f, which exists inductively, and a Q-maximum packing avoiding e. They combine because their only possible shared edge is f, avoided by the old packing. The upper bound is nu(G') itself. Since the initial clique is deletion-resilient, these observations inductively prove every graph in the class is deletion-resilient. Equation(2) also shows that fresh clique gluing preserves any old packing-critical edge if one starts from a more general old graph.

## 2. The first two pieces

Suppose Q and P share ab. A minimum cover has size tau(Q)+tau(P)-1, so its restrictions must be minimum covers of both cliques containing ab.

In K4 on {a,b,c,d}, the only minimum cover containing ab is {ab,cd}; hence exactly its four other edges are ineligible in the two-piece graph, unless eligibility is supplied by another shared support (there is no such support at this first step).

In K5 every edge belongs to a minimum cover containing ab. For an edge incident with a or b, use a triangle containing ab and that edge, plus the complementary pair. For an edge disjoint from ab, use that pair together with a triangle on ab and the remaining vertex. Thus all K5-side edges are eligible.

If both pieces are K5, all edges are eligible and no further neutral attachment is possible. This is form1, with nu4,tau7.

Otherwise any neutral third piece must attach along an ineligible spoke of a K4 side. Rename that K4's vertices a,b,c,d so the old attachment is ab and the new one is ac. The graph is now a central K4 Q with two clique leaves P,R along ab,ac. The newly added vertices lie only in their own leaf.

## 3. Two adjacent attachments leave exactly one ineligible edge

Let the two leaves have cover minima s_P=2r(P) and s_R=2r(R), and put S=s_P+s_R. For any cover, let F be its restriction to the six central K4 edges. Let c=|F| and let j count how many of ab,ac belong to F. Restriction to the leaves gives the lower bound

    cover size >= S+c-j.                                  (3)

Equality can be attained for any central cover F by choosing leaf minimum covers containing the selected attachment edges; when an attachment is unselected, choose a leaf minimum cover omitting it. Such minimum covers exist in both K4 and K5.

The target minimum is S+1, already given by(1). Therefore every minimum cover satisfies c-j<=1. Since F must cover K4, its possibilities at this target are exactly:

- c=2,j=1: either {ab,cd} or {ac,bd};
- c=3,j=2: {ab,ac,z}, where z is one of bc,bd,cd.

Larger c is impossible because j<=2; c=2,j=0 would cost S+2. These possibilities prove that every central edge except ad is eligible and that ad is ineligible.

Every edge in either leaf is eligible. In a K5 leaf this follows already from choosing its attachment selected. In a K4 leaf, the attachment and its opposite edge occur with the attachment selected. Any of its four spokes occurs in a minimum matching cover omitting the attachment; use the central two-edge cover containing the OTHER attachment. This leaves the total cost at S+1. Thus the whole graph has exactly one ineligible edge, ad.

Accordingly a fourth neutral piece, if any, must attach along ad. This produces form2 with three star leaves.

## 4. Three star attachments leave no ineligible edges

Write S for the sum of the three leaf cover minima. For a central cover F of size c selecting j of the star edges ab,ac,ad, the same accounting gives cost at least S+c-j. Every central K4 cover has c-j>=1, because the opposite face bcd must be covered by a nonstar edge. Conversely any central minimum matching cover selects one star edge and its opposite edge, giving cost S+1. Therefore tau=S+1 and delta1, as claimed.

Every central edge lies in such a matching cover, hence is eligible. In a K5 leaf every edge can occur in a minimum cover containing its attachment. In a K4 leaf the attachment and opposite edge occur that way; its spokes occur with its attachment omitted, choosing a central matching cover that selects a DIFFERENT star attachment. There are three available attachments, so this is always possible. Hence every graph edge is eligible. No further neutral step is possible.

The same accounting also verifies the two-leaf and one-leaf forms directly. This exhausts every delta1 construction and proves the classification.

## 5. Packing bound, sharpness and residual role

The two-K5 form has nu4. In the central-K4 form, exact packing additivity gives

    nu=1+sum_leaf r(leaf)<=1+3*2=7.

With three K5 leaves the cover formula gives tau=1+3*4=13, so nu7,tau13; Section1 proves edge-deletion resilience. This is the previously identified sharp classified-residual example, now placed inside an exact construction-class classification.

Deleting the face opposite the star center from the central K4 leaves exactly the leaf clique triangle components; the surviving central star edges not used by leaves are triangle-free. Thus that branch has a B triangle residual. The two-K5 shared-edge exception is retained separately and is not claimed to have such a residual.

This sharpens the earlier crude bound18 for the literal fresh-clique construction class. It does not show that an arbitrary near-tight graph has any such clique construction. In particular it cannot be used to bound the unrestricted connected edge-resilient defect-one residual without a new availability theorem.

## Dependencies

Only the literal K4/K5 packing, covering, and one-/two-edge avoidance facts are used. They are authenticated in `notes/restoration.md` and the pinned clique lemmas. All attachment, eligibility and exact classification arguments are supplied above. No finite search or solver result is a premise.
