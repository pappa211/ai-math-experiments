> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: combined CS for any tree-and-triangle cover

Verdict: ACCEPT at the stated hereditary-class scope. Ordinary reconstruction using the previously authenticated class-local minimum-CS, robustness, balanced residual, forest-anchor, compatibility and peeling inputs. No new finite certificate, Gallai-Edmonds theorem, or unrestricted cover-availability assertion is used.

Reviewed frozen sources (SHA256):

- `notes/challenger_tree_triangle_cover_cs_v1.md`: `352f3b8f8720449f2b08c735eb81fbbe0260b4c19c0cb37f6d5eadee17e149fd`
- `notes/challenger_tight_mixed_cover_q2_k5_v1.md`: `868a534af474a70926490165285e69f30b6be49a2baf1d1aeb18e8a85b8b1c69`
- `notes/challenger_mixed_cover_low_cost_triangle_exclusion_v1.md`: `f45bdbd2b6cd6baab47a283e013ca70ae7546448d7907c80edfc64c8cdc844f3`

Reviewer: source_audit, 2026-11-16 UTC. I reconstructed the full-triangle link deletion independently, then checked the two recent equality-normalization inputs as well as their use in the assembled theorem.

## 1. Arbitrary selected covers and normalization

The class is hereditary by restricting any witnessing cover after edge deletion. A partly deleted K3 becomes a forest; no minimality of the cover is required. The accepted arbitrary-cover inequality proves tau<=sum local tau_i<=2nu throughout the class. Consequently a minimum CS failure in this class is tight, with proper-subgraph CS available. Equality also makes arbitrary minimum local covers edge-disjoint across families: any overlap would save a global cover edge. Deleting another family's minimum cover cannot reduce a local cover cost for the same reason.

I checked the q2-to-K5 proof without assuming the selected cover is minimum. Every private spoke of a two-full-apex triangle belongs to a minimum size-three family cover, so reciprocal q2 targets would contradict the preceding no-overlap fact. Thus its potential target graph is edgeless. Deleting the same-terminal pair av,ax through the minimum local cover {bc,av,ax} preserves every other local cost. For tree families this deletes only outside pages, so the internal forest-anchor argument and arbitrary-subfamily external minmax still apply. Other q2 families are unaffected by the absence of reciprocal targets; low-cost cores retain their disjoint internal triangle.

With the resulting other-family packings fixed, changing the distinguished q2 sign has no hidden effect outside its fixed-core-pair conflict components. The choices vab,xac and vac,xab respectively give b_v+c_x=1 and c_v+b_x=1. If the two used spokes are at one apex, a new two-page choice produces two distinct conflicting outside triangles and hence a 2-versus-3 sign comparison. If they are at one terminal, the same contradiction holds unless both spokes lie in a single outside triangle vxb or vxc. That triangle is assigned to a tree family, forcing vx to be its selected tree base and completing the literal K5. The two outside triangles in the former cases are distinct because their apices in the distinguished core differ. The common-triangle case is explicitly the three-vertex conflict path and is correctly retained.

The cost-two strictness argument is also valid: with q2 target graph edgeless, all requirements to omit the two supplied pages ask independently for q2 signs equal to one. There is no incompatible constraint. Every fair outcome is maximum under equality; appending the now-unused internal triangle contradicts this. If only one private page can be packed in a minimum CS failure, codegree at least two supplies a page on each base; different apices on different bases would pack, so the three page sets are the same singleton. The resulting K4 has no outside pages on its face, hence its complete outside boundary lies in its apex star. The already accepted star-boundary peeling theorem applies using proper-subgraph CS within this hereditary class. These checks justify normalization (N) for ANY chosen witnessing cover.

## 2. New local full-triangle link lemma

Let L be the chosen closed connected link component at v and let F=L-w have tree/K3 components. Minimum link degree two excludes isolates in F. Suppose one component abc is fully joined to w.

For a perfectly matchable tree component with matching size r_J, deleting its maximum matching leaves only r_J-1 edges, giving the strict auxiliary vertex-cover saving used in Case A. Every other forest component has a cover of its matching complement of size at most its matching number, by the elementary forest equality; a K3 contributes one matching edge and one covering vertex. If another component is nonperfect, an exposed original leaf can be selected by the ordinary forest alternating-path argument, and minimum degree two forces its edge to w. A second K3 likewise has a w-neighbor and a matching exposing that vertex. Thus Case B's additional edge wz is disjoint from the componentwise matching.

In both cases the supplied P is an actual link matching, Q covers L-P, and |Q|<=|P|. Deleting all v-spokes to this CLOSED link component plus P accounts for every lost triangle: hub triangles by P or vQ, arbitrary outside pages by P itself. The hub triangles over P use only deleted edges, so they extend every residual packing. Tightness and proper-subgraph CS force a literal B residual, unless the strict cover saving already contradicts tightness.

Exactly one edge of abc is deleted, while all wa,wb,wc remain. The hub v is outside these four vertices. Therefore the residual contains an actual diamond with its missing edge absent. Its two shared-edge triangles must belong to a single B component, whose literal completeness would require that missing edge. This contradiction is independent of every outside attachment. If abc is the sole F component, L is K4 and violates the already authenticated five-vertex lower bound for a closed link component. All component cases are covered.

## 3. Closing the hereditary class

Normalization requires a selected tree edge for every selected triangle component; thus a nonempty witnessing cover in the hypothetical failure has a tree component. Choose a leaf v with unique selected neighbor w. Every actual link edge ab away from w must itself be selected, since neither va nor vb is selected. Hence F=L(v)-w is a subgraph of the witnessing cover and has only tree/K3 components.

A K3 component in F is the entire corresponding selected K3 component. Its three vertices are all adjacent to v, making v one of its two full apices. Normalization says the other apex x satisfies vx in C. Uniqueness of the selected edge at v gives x=w, exactly the full-triangle configuration excluded above. Thus F is a forest. The accepted perfect and nonperfect apex-forest v2 exclusions now apply with their original class-local hypotheses, yielding the final contradiction.

The equality converse is the actual K4/K5 block calculation on shared-edge triangle components. Vertex sharing and triangle-free background are allowed; all actual triangles remain included. K5 belongs to this class through a triangle plus its complementary disjoint edge, so the conclusion properly retains K5 equality components.

The result is complete CS for the existence-of-ANY-tree/K3-cover class. It does not show every graph has such a cover, and it does not settle unrestricted CS, original H-D, or unrestricted Tuza. The previously open mixed-cover equality gap is closed only inside this precisely stated class.
