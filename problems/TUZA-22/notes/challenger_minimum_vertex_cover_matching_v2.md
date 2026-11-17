> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Saturating a minimum vertex cover: a self-contained Hall proof and weighted stars

Status: ORDINARY_PROOF_CANDIDATE; frozen for fresh review. TUZA-22 coordinator's elementary improvement, written by the challenger, 2026-11-16 UTC. This supersedes the Gallai–Edmonds-dependent proof in v1 at the same theorem scope. No novelty claim is made.

## 1. Saturation with an arbitrary maximal internal matching

Let Q be ANY specified minimum vertex cover of a finite simple graph L, and put B=V(L) minus Q. Choose ANY maximal matching M0 in L[Q], and let U be the Q-vertices it misses. Then U is independent, since an edge between two such vertices could be appended to M0.

For every S subset U, replacing S in Q by N_B(S) still gives a vertex cover. Edges with an endpoint in Q minus S remain covered; edges within S do not exist; edges from S to B meet the added neighborhood; and B is independent. Since Q is minimum,

    |N_B(S)| >= |S|.

Hall's theorem supplies a matching from U into B saturating U. It is vertex-disjoint from M0, so their union saturates EVERY vertex of Q. This proves the assertion without the Gallai–Edmonds theorem.

If a maximum matching of L is desired, augment the resulting matching until it is maximum. Each augmenting-path flip leaves every previously matched vertex matched, so Q remains saturated. The initial internal matching M0 is preserved by the Hall extension, though it need not remain as an edge subset after subsequent arbitrary augmentations. In particular M0 may initially be chosen maximum in L[Q].

The conclusion is saturation of Q; matching edges inside Q are permitted. It does not assert a matching of all Q into B.

## 2. Exact weighted packing at a star cover component

Let C be a minimum triangle-edge cover of G and suppose one selected-edge component is the star with center h and leaf set Q. Put A0={h} union Q and m=|Q|. Assign each actual triangle to the unique C-component containing its selected edges, and let G0 be the union of the edges of the assigned star family.

Every G0-triangle is assigned to this star and contains h. To check closure, each selected edge of G0 belongs to the star, because an edge from another selected component could occur only in a triangle assigned to that other component. Thus any actual triangle in G0 contains a star edge and hence h. Consequently G0 is a cone over a triangle-free rim L, and Q covers every rim edge.

The cone's triangle-cover number equals the rim's vertex-cover number: a rim vertex cover gives a spoke cover; conversely replace every rim edge in any triangle-edge cover by a spoke at either endpoint. This replacement cannot lose coverage because the only triangle using that rim edge is its cone triangle. Minimum optimality of C gives tau(G0)=m, since a smaller assigned-family cover could replace its m star edges in C. Therefore Q is a minimum vertex cover of L.

Apply Section1 and take cone triangles on the resulting Q-saturating matching. A matching edge inside Q gives an internal triangle entirely in A0 and contributes two matched Q-vertices. A matching edge from Q to its complement gives an external page and contributes one. There is no matching edge entirely outside Q, since Q covers L. Hence the resulting edge-disjoint triangle packing P satisfies

    2|{T in P: V(T) subset A0}| + |{T in P: V(T) not subset A0}| = m.

Moreover the internal triangles can be prescribed by ANY maximal matching of L[Q], and the Hall extension supplies the external pages while keeping those internal triangles. This is the extra flexibility of the elementary proof.

## 3. Scope and evidence boundary

This is an ordinary all-size result using only Hall's marriage theorem, maximality of a matching, and minimum ordinary-cover replacement. It has no Gallai–Edmonds dependency, finite-census premise, or source-authentication gap. The earlier v1 remains preserved as a correct proof with a declared classical input; its finite atlas test is not a premise here.

The result treats a STAR component of a minimum cover, including arbitrary actual outside pages. It does not by itself establish compatibility between local packings from different components. The analogous weighted statement for arbitrary TREE components remains an open candidate in this campaign, and the K4 face-apex boundary refutes its unrestricted connected-component extension.
