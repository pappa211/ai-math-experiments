> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Apex-pseudoforest links reduce to a bouquet of four-cycles

Frozen ordinary proof candidate, 2026-11-16. This is a necessary boundary classification, not a claim that the final boundary is excluded.

Let L be a closed connected link component at h in a minimum combined-CS failure, and suppose F=L-w is a pseudoforest. Then F must have at least two components, EVERY component must be C4, and w must be adjacent to either three or four vertices in each C4.

Equivalently, the only remaining apex-pseudoforest links are bouquets of at least two four-cycles attached to a common extra vertex w, with three or four apex neighbors on each cycle. All outside graph attachments remain arbitrary. These bouquets need not be WKE.

## 1. Preliminary availability and a global matching tuple

The accepted link-vertex-deletion theorem says every component of F contains a cycle. Since F is a pseudoforest, each component is connected unicyclic. A single component is excluded by the accepted ORDINARY full apex-unicyclic theorem, so write c>=2 for the number of components.

Let r_i be their matching numbers, r=sum r_i, and let t be the number of components whose cycle is a triangle. The ordinary pseudoforest matching-complement lemma gives vc(F_i-M_i)<=r_i for every maximum matching M_i.

Suppose at least one component is nonperfect. If it has attached trees, the ordinary original-leaf exposure lemma supplies a maximum matching exposing a leaf z, and wz is forced by minimum link degree two. If it is a bare odd cycle, choose any w-neighbor z in it and expose z by a maximum cycle matching. Such a neighbor exists because L is connected. Combining that matching with arbitrary maximum matchings of the other components gives a WKE tuple

    P=M union {wz}, Q={w} union union_i cover(F_i-M_i),
    |P|=r+1, |Q|<=r+1.

The paid-triangle collapse with S={w} forces

    r+1<=t+2, hence r<=t+1.                       (1)

Any nontriangular unicyclic component has matching number at least two, whereas each triangular one has matching number at least one. Thus a nontriangular component would give r>=t+2, contradicting(1). All components are triangular.

Moreover at most one component has matching number two, and all others have matching number one, hence are bare triangles. No component can have larger matching number.

If a component were perfect and noncycle, delete its perfect matching from its r_i-edge complement. A degree-at-least-three vertex gives two adjacent complement edges, so a vertex cover costs at most r_i-1. Using that saving in the global Q above makes |Q|<=r<|P|, a strict contradiction. A perfect triangular unicyclic component is necessarily noncycle. Therefore all remaining components are NONPERFECT.

A nonbare triangular component of matching number two, with no doubled original leaf neighbor, is one of the two ordinary shapes abc+ax+by or abc+a-x-y. The no-double-leaf hypothesis follows from the ordinary parallel-thread exclusion. Thus the entire nonperfect branch has bare triangles, with at most one of these two attached shapes.

## 2. Apex neighborhoods of bare triangles

Let abc be a bare triangle component. The vertex w must have at least two neighbors in it. With exactly one neighbor a, deleting a from L would leave the isolated edge bc as an acyclic component, contrary to the link-vertex-deletion theorem.

It cannot see all three vertices either. Choose the exposed vertex for the global P tuple in a DIFFERENT component, possible because all components are nonperfect and c>=2. In this bare triangle choose M_i={ab}. Its two residual triangles wac and wbc share wc, while ab was deleted. Balanced equality would put them in one old literal clique and force ab back, impossible.

Hence w sees exactly two vertices in every bare component. Name them a_i,b_i and the third vertex c_i.

## 3. All bare components give a packing augmentation

If all c=t components are bare, use the global WKE tuple with

    P on component1: wa_1,b_1c_1;
    P on every component i>=2: a_i b_i;
    Q={w,a_1,c_2,...,c_t}.

Its size is s=t+1. Balanced deletion gives B(K), nu(K)=nu(G)-s. The residual link in the first component together with w is the path c_1-a_1-b_1-w. In every other component together with w it is the four-cycle w-a_i-c_i-b_i-w. There are no edges joining different F components, so the full residual link is triangle-free.

For each i select the two actual triangles

    w a_i b_i, h a_i c_i.

All2t triangles are edge-disjoint, including across components: none uses hw, and every other selected edge belongs to its own component's vertices and spokes. Every old block has at most two L vertices because the residual link is triangle-free, so the ENTIRE selected footprint has at most one surviving edge in that block. Maximum block packings avoid all those edges simultaneously. Since2t>t+1 for t>=2, appending the local packing contradicts equality.

## 4. One attached component also gives a packing augmentation

Let F_* be the unique attached component and let b>=1 be the number of bare components. Then r=b+2 and s=|P|=b+3. Use the exposed leaf for P inside F_*, and use P={a_i b_i} on every bare component. The apex sees exactly a_i,b_i there, so each bare residual is the triangle-free four-cycle from Section3. Select its same two triangles w a_i b_i and h a_i c_i.

If F_*=abc+ax+by, take inside this component

    P_*={ac,by,wx}, Q_*={w,a,b},

and select the three triangles

    abc, hax, hby.

The stated Q_* covers the local residual for EVERY optional apex neighborhood. The selected surviving edges inside F_* are ab,bc,ax. Each old block contains at most one of these edges, since its F_* intersection is a clique in F_*-ac-by, which is triangle-free. The selection uses no surviving w-spoke.

If F_*=abc+a-x-y, take

    P_*={bc,ax,wy}, Q_*={w,a,x},

and select

    abc, hax, hwy.

Again Q_* covers every local residual regardless of optional apex neighbors. Only ab,ac survive from the selected triangles; they cannot lie in one old block because bc was deleted. The selected triangle hwy uses hw, but no selected triangle in any bare component uses hw, so the entire selection is still edge-disjoint.

In either case add c_i to Q_* for every bare component, making a global cover Q of size b+3=s. Every old block contains vertices from at most one F component, apart from the common vertex w: vertices in two distinct F components are nonadjacent. Hence the local footprint bounds combine without adding independent contributions inside a block. On a bare component the residual is triangle-free and gives at most one selected old edge; on F_* the selected edges are entirely F_* edges and also give at most one. Thus all whole footprints are avoidable.

The selection has3+2b triangles, exceeding s=b+3 because b>=1. This contradicts balanced equality. The ENTIRE branch with any nonperfect F component is excluded.

## 5. All components perfect: only even bare cycles remain

Now every F component is perfect, so r_i>=2. If some component is noncycle, its complement cover has the one-vertex saving above. Combining all perfect component matchings gives P=M of size r, leaving w unmatched, and Q of size at most r. The paid-triangle bound gives r<=t+1. But

    r>=2c>c+1>=t+1

for c>=2, contradiction. Consequently every component is a bare even cycle.

If one cycle has length2q>=6, label it0,1,...,2q-1 with w0 present. On it choose

    P_i={w0,12,45,67,...,(2q-2)(2q-1)}.

There are q edges. Its remaining cycle edges form two P3s, centered at0 and3, and q-3 isolated edges. They have a cover of size q-1. On every other cycle use a perfect matching and one endpoint of each complementary matching edge. Adding w to the union of those covers gives a global WKE tuple of size r. The tuple matches w, and F is triangle-free, so the paid-triangle bound forces r<=2, contradicted by r>=2c>=4. Thus every component is C4.

## 6. A two-neighbor C4 is excluded while keeping hw

A C4 component has at least two w-neighbors: with only one, deleting that neighbor leaves a P3 as an acyclic link component. Suppose it has exactly two, and label the cycle0123.

For opposite neighbors0,2, use P={01,23}, Q={0,2}. For adjacent neighbors0,1, use the same P and Q={0,1}. In both cases P avoids w, Q covers every edge of the local graph R'=(C4+w)-P, and |P|=|Q|=2.

Delete ONLY the four h-spokes to C4 and the two P edges, retaining hw and every h-spoke to the other F components. The two hub triangles on P append to every residual packing. Every lost non-hub triangle has a P base, while every lost hub triangle has a rim in P or meets Q. All other pages on hw remain intact. Balanced minimality therefore gives a B residual K with nu(K)=nu(G)-2.

In both cases R' is a five-vertex path, hence triangle-free. Every old block has at most two vertices of C4+w, so a single minimum K cover D can include all its supported R' edges simultaneously. An unsupported R' edge must have its second page destroyed on P; any apex outside C4+w has both spokes surviving, and an apex in another link component cannot be adjacent to a C4 vertex.

In the opposite-neighbor case the local graph has no triangle, so EVERY R' edge is supported. Then D union P covers G at cost2nu(G)-2, contradiction.

In the adjacent-neighbor case the only local triangle is w01. Therefore the only possibly unsupported R' edges are w0,w1. They are both covered by hw, which was retained. The cover D union P union {hw} has size at most2nu(G)-1, contradiction.

Thus every remaining C4 component has three or four w-neighbors, as claimed.

## Scope and remaining exact boundary

The classification uses only ordinary reviewed mechanisms and explicit new whole-footprint/local-deletion arguments. It does NOT exclude the final bouquet. In particular multiple full C4 wheels sharing w form a genuine non-WKE boundary; importing componentwise WKE or silently omitting pages on hw would be invalid.

Since equality deg_L(w)=mu(L) already forces every component of L-w to be unicyclic, the theorem also identifies the only possible equality configuration in the previously proved inequality mu(L)>=Delta(L). It does not yet improve that inequality to strictness.

Dependencies: ordinary full apex-unicyclic v2; ordinary paid-triangle collapse; ordinary link-vertex-deletion cyclic-components theorem; ordinary pseudoforest matching-complement and exposed-leaf lemmas; parallel-thread exclusion; and elementary minimum-CS/B-block accounting. No finite computation or external matching theorem is a premise.
