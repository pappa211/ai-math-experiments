> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Local star-Hall is insufficient, even for actual common-apex lists

Status: ORDINARY_COUNTEREXAMPLE, exact hypotheses below. TUZA-22 challenger, 2026-11-16 local date. This refutes a local-condition shortcut, not any minimum-cover statement.

## Abstract list boundary

On K6, give each vertex v its own color c_v and give edge uv the list {c_u,c_v}. A nonempty set of s edges in any one vertex star has exactly s+1 colors in its list union, so all local star-Hall inequalities hold. A proper partial list edge coloring uses each color c_v at most once, because all edges admitting that color meet v. Thus at most6 of the15 edges can be colored. A directed Hamilton cycle, each edge colored by its tail's color, attains6. Consequently local star-Hall alone does not imply a coloring of at least half the edges.

This K6 list system is not a common-apex realization: an apex representing c_v would have to be adjacent to v and all five other vertices, which would put c_v in the list of every K6 edge, contrary to the prescribed lists.

## Literal graph realization with the same failure

Take A to be K5,5 with sides U={u_0,...,u_4} and V={v_0,...,v_4}. Add an independent set B={z_x:x in U union V}. Join z_x to x and all neighbors of x in A. Let G contain exactly these edges and the25 edges of A. Let C=E(A).

There are20 vertices,85 edges, and exactly50 actual triangles. For each A-edge xy, its two triangles have apices z_x and z_y. Indeed a third apex z_w could see both endpoints only if w were a common A-neighbor of x,y, impossible in triangle-free A. There are no triangles wholly in A or with two B-vertices.

Thus every triangle is private to exactly one C-edge, and its page list is precisely {z_x,z_y}. Again every nonempty s-edge star subset has s+1 page colors and satisfies Hall. Each C-edge has private witnesses, so C is also inclusion-minimal.

Every triangle with apex z_x contains the identity spoke x z_x. Hence a packing has at most10 triangles. Ten are explicit, with indices modulo5:

    u_i v_i z_(u_i), and v_i u_(i+1) z_(v_i), for i=0,...,4.

Their ten A-bases are distinct and their ten apices are distinct, so no graph edge is repeated. Thus the private and full packing numbers both equal10, while |C|=25>20.

The ten identity spokes D={x z_x:x in A} cover every actual triangle. The packing proves this cover minimum, so tau(G)=nu(G)=10. Therefore C is emphatically NOT a minimum ordinary cover. The construction does not refute the proposed private bound when C is minimum, and does not refute Tuza, CS, or D-some-choice.

## Exact lesson

The intersection form L(xy)=S_x intersection S_y and literal triangle closure do not repair local star-Hall alone. Minimum-cover optimality must be retained globally, beyond swaps on one star. Root independently identified the same general mechanism using a triangle-free Clebsch core; K5,5 supplies the smaller elementary instance above.

The same construction works on any triangle-free core A: its actual page lists are {z_x,z_y}, and the identity spokes give a cover of size |V(A)|. Any core with more than2|V(A)| edges violates the local-condition half bound, whether or not that upper bound on packing is attained.
