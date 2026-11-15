# Exact endpoint rotations in the unresolved K5 cycle gate

Status: ordinary local structural lemmas only. These preserve the K5 canonical constraint exactly; they do not prove the cycle-only or isolated-vertex gate. Root paused this proof attempt for the batched normalization. The already derived rotations are retained here, and no further research is pursued in this pass.

## Setup and extremal choice

Use the domain of notes/global_routes_two_apex_k5_states.md: H is a union of edge-disjoint K5 blocks meeting in at most one vertex, with all actual triangles copy-local. A canonical F is properly two-edge-colorable and uses at most four vertices through its selected local edges in each block. Let m be its maximum edge count and n=|V(H)|.

Assume, for the purpose of the lemmas, that the weak gate FAILS:

    m<n and EVERY maximum canonical F has no isolated vertex.

Choose among maximum canonical F one maximizing c(F), the number of vertices belonging to its even-cycle components. Every remaining component is a nontrivial path, and their number is n-m>=1. Fix a path P=(v_0,...,v_l), l>=1, write u=v_0, v=v_1, and let B be the unique K5 owner of its first edge uv. A vertex is locally used in B if it is incident to a selected F-edge of B; global degree and local degree are kept distinct below.

The possible nonempty local states meeting the endpoint u are K2, P3, 2K2 and P4. A local C4 cannot contain a global endpoint. Here P_j denotes a path on j vertices.

## Lemma 1: no P4 tail at a global endpoint

**Claim.** The local state F intersect E(B) cannot be P4 with u as an endpoint.

**Proof.** Its three edges necessarily form the initial segment (u,x,y,z) of P: x and y already have local degree2, hence have no other selected edges. If z is also a global endpoint, adding uz closes an even C4 and increases |F|, while using the same four B vertices, contradicting maximality.

Otherwise z has the next path edge zw. Delete zw and add uz. The first four vertices now form an even C4; the rest of P is a path beginning at w. The added B-edge uses only vertices already locally used. Deleting zw can only reduce the selected support in its owner. The result is canonical and still has m edges. If the remaining path has one vertex, it is isolated, contradicting the assumed weak-gate failure. If it has at least two vertices, all vertices remain covered and c(F) increases by4, contradicting its choice. This proves the claim.

In particular, in this extremal maximum, the block owning an endpoint's edge has at most two selected edges.

## Lemma 2: an even path cannot return to its first edge's block

**Claim.** If l is even and l>=4, the far endpoint v_l cannot lie in B.

**Proof.** Put w=v_l and suppose w lies in B. Replace uv by vw. Since v,w belong to B, vw is an actual graph edge. It is not already selected: its distance along P is l-1>=3. The path with u removed becomes an even cycle of length l, and u becomes isolated. The edge count is unchanged.

The support in B loses u, since u had global degree1, and gains at most w. It therefore still uses at most four vertices. Other blocks are unchanged. The result is a canonical maximum with an isolated vertex, contradicting the premise. The length-two case is excluded deliberately: then vw is already the second path edge and this is not a valid replacement.

For comparison, if l>=3 is odd and w lies in B, simply adding uw would close an even cycle. This contradicts maximality whenever w is already locally used in B or B currently uses at most three vertices. The remaining four-used-vertices case is not covered by that addition. No intermediate five-port state is treated as legal.

## Lemma 3: a same-color 2K2 return creates an extra cycle

**Claim.** Suppose F intersect E(B) consists of two disjoint edges uv and xy. If xy lies on the same path P, the two edges have opposite colors in every proper two-edge-coloring of P.

**Proof.** Orient xy along P as x=v_(j-1), y=v_j. The index j cannot be2 because the edges are disjoint. It cannot be3: then the intervening edge v_1v_2 would also belong to B, contradicting the assumed local2K2 state. If xy has the same color as the first edge, j is odd, hence j>=5.

Replace uv and xy by uy and vx, both edges of B. Recoloring is unnecessary: the two new edges can receive the common old color, since its incidences were freed at all four endpoints. The path segment (v_1,...,v_(j-1)) closes to an even cycle of length j-1>=4; the remaining vertices form the path (u,v_j,...,v_l). All four local ports remain the same, so the canonical condition is unchanged. The edge count remains m, no vertex becomes isolated, and c(F) strictly increases. This contradicts the extremal choice. Hence the same-color possibility is excluded.

The lemma does not exclude the other local edge lying on another path or cycle, nor an opposite-color return on the same path.

## Lemma 4: unused ports in a small endpoint state have degree2

**Claim.** If B currently uses at most three vertices, every locally unused vertex z of B has global degree2 in F.

**Proof.** Degree0 is excluded by the weak-gate-failure assumption. Suppose z has degree1. If its path differs from P, add uz and flip the coloring on one path if necessary. This joins two paths, is properly two-edge-colorable, and uses at most four local B vertices. It increases the edge count, a contradiction.

If z is on P, it must be the other endpoint. For odd l>=3, adding uz is the admissible even-cycle closure described after Lemma2. For even l>=4, Lemma2 exposes an isolated vertex. For l=1 the other endpoint is already locally used. For l=2, the second path edge vz also belongs to B because v,z are in that clique, so z is locally used again. All possibilities are excluded. Thus z has degree2.

This applies in particular to a single-edge endpoint state and to a P3 endpoint state. It does not assert that the unused port of a four-vertex2K2 state has degree2.

## Lemma 5: a whole P3 component sends its two unused ports into cycles

**Claim.** If the whole path component P is a P3 inside B, the two locally unused B vertices both belong to even-cycle components of F.

**Proof.** Let P=(u,v,w). Its exact local state is P3: adding another disjoint selected edge in the remaining two B vertices would use all five ports, which is forbidden. By Lemma4, any unused z has global degree2.

Suppose z lies in another path. Delete its two incident selected edges and add uz,wz. The old P3 plus z is now a C4, and the other path splits into its two remaining segments. The number of selected edges is unchanged. Since z was locally unused, its two removed edges have owners other than B; those owners only lose edges. The local B support becomes exactly four vertices.

If one remaining path segment is a single vertex, the resulting maximum isolates that vertex, contradicting the premise. Otherwise all vertices stay covered, the old cycle components are unchanged, and four former path vertices now lie in a cycle. This increases c(F), again a contradiction. Therefore z cannot lie on a path and must lie on an even cycle. The same applies to the second unused port.

## What remains unproved

These lemmas reduce endpoint configurations but do not eliminate them. Single-edge and P3 tails remain possible when their unused ports are globally degree2. A whole P3 can attach through its unused ports to even cycles. Trading its P3 for a C4 through a cycle vertex opens that other cycle into a new path, transferring the defect. The local2K2 case also permits opposite-color returns and connections to other components.

No potential was proved to force those transfers to terminate, and no alternating-tree/blossom theorem preserving all block supports was established. Thus neither the strong cycle-only gate nor the weaker isolated-vertex alternative follows from these lemmas. The exact K2-join packing profile and the two targeted controls remain as frozen in notes/global_routes_k5_cycle_gate.md.

These are ordinary self-contained transformations, not a finite-search inference. No extra computation, source theorem, or Lean process was used. Root's instruction to stop further new research after preserving this progress is observed. Original research cutoff09:23:58Z and hard deadline09:53:58Z on2026-11-15 are unchanged.
