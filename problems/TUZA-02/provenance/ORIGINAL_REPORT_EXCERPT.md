# TUZA-02 original research report — curated excerpt

Historical campaign claims; final verification status is in TUZA-03. Later mission-planning material and private execution context are omitted.

# TUZA 02 two triangle restoration findings

28 October 2026. Independent discovery mission. **The unrestricted restoration conjecture and OCT-five remain unresolved.** The mission produced complete ordinary candidate proofs for two substantial additional classes, a further family of nonflat remainders, and a sharper description of the remaining problem. These are new deductions relative to TUZA-01; historical originality is not established.

Write `nu(J)` for the maximum number of edge-disjoint triangles and `tau(J)` for the minimum number of edges meeting all triangles. Throughout, T1 and T2 are edge-disjoint triangles of G, and

\[
H=G-(E(T_1)\cup E(T_2)),\qquad h=\nu(H).
\]

An individual family Fi consists of the triangles in `H+E(Ti)` absent from H. Triangles using restored edges from both T1 and T2 belong to neither individual family.

## Main new deductions

**Theorem A, restoration with an unavoidable old edge.** Suppose the triangle hypergraph of H is 3-partite. If some edge e satisfies

\[
\nu(H-e)=\nu(H)-1,
\]

then `tau(G)<=2nu(G)`. Equivalently, the hypothesis says that every maximum triangle packing of H uses e. In the critical case `tau(H)=2h-1` and `nu(G)=h+2`, the proof establishes the proposed stronger conclusion

\[
\min\{\tau(\mathcal F_1),\tau(\mathcal F_2)\}\le2.
\]

The detailed proof is in Essential edge restoration (archived source: `proof/ESSENTIAL_EDGE_RESTORATION.md`). Its main new mechanism is a free old triangle followed by a forced common pair of auxiliary vertices. It uses Aharoni and the graphical HNS equality consequence from TUZA-01.

**Theorem B, restoration from a flat remainder.** If every edge of H lies in at most two triangles of H, then

\[
\tau(G)\le2\nu(G).
\]

No tripartiteness assumption is needed. In the critical slack-one case, both individual families satisfy `tau(Fi)<=2`. The proof is in Flat remainder restoration (archived source: `literature/FLAT_REMAINDER_DEDUCTION.md`), Theorems 6–7. Its published input is Haxell–Kostochka–Thomassé's theorem for K4-free flat graphs; it does not require HNS.

**Additional nonflat family.** Restoration also holds when all triangles of H lie in isolated K4 components and one component formed by a central K4 with one, two, or three further K4s attached along distinct edges of a single central star, using two fresh vertices per attachment. This handles remainders with neither flatness nor an unavoidable edge. See K4 star defects (archived source: `proof/K4_STAR_DEFECTS.md`).

All three arguments were reconstructed and checked in a fresh independent proof audit (archived source: `review/INDEPENDENT_PROOF_AND_SCOPE_AUDIT.md`). No substantive gap remains identified. This is internal checking of written ordinary proofs, not external specialist verification or Lean verification.

## Why the essential edge theorem works

It suffices to consider `tau(H)=2h-1` and `nu(G)=h+2`. Indeed, Aharoni applied to H−e gives `tau(H)<=2h-1`; slack at least two is settled by adding the six restored edges to an old cover. A packing increase of at least three is also immediate.

Put J=H−e and k=h−1. Then

\[
2h-2\le\tau(J)\le2\nu(J)=2h-2.
\]

HNS supplies k edge-disjoint K4s in J. Every J-triangle must be a face of one: otherwise it meets each K4 in at most one edge, so compatible faces together with that triangle give k+1 packed triangles.

Write e=xy. Each K4 can touch at most one triangle xyw. If it touched two, their other endpoint would form a J-triangle outside that K4. Consequently, if every xyw touched a K4, choosing suitable opposite-edge covers in the K4s would cover H with only 2k edges. There is therefore a **free page** xyw using no K4 edge.

A short Hall argument shows that a single restoration family with cover number three and packing number at most two consists exactly of the base triangle and its six pages on two auxiliary vertices p,q. Choosing K4 faces outside V(Ti) gives the required packing bound on Fi. If p,q were nonadjacent, two new pages could avoid the free old triangle and enlarge the packing. If pq were an old edge different from e, two surviving triangles pqu would force two independent vertices of Ti into one K4. Hence necessarily `{p,q}={x,y}`.

If both families required three cover edges, they would have this same auxiliary pair. Four compatible new pages, together with one face of each K4 avoiding x and y, give h+3 packed triangles—a contradiction. One family therefore has a two-edge cover. Combining it with an old cover and all three edges of the other triangle costs at most `2h+4`; those last three edges also cover every mixed triangle.

## Why flatness is enough

In a flat graph, every K4 is an isolated triangle component. After removing these components, the published HKT bound is `tau(R)<=3nu(R)/2`, with equality precisely for five-wheel triangle components. Thus a flat remainder of defect one has exactly one remaining component: a triangle, a two-page book, or a five-wheel. This classification is a short deduction from [HKT Theorem 2](https://www.kostochk.web.illinois.edu/docs/accepted/plan-ht.pdf), not a new published-input theorem.

The new step is a local augmentation: whenever a restored family needs three cover edges, the book or wheel together with that family supplies two more packed triangles than the old component. For the wheel, the only exceptional terminal placement is handled by an explicit packing of three new pages and one old wheel triangle. Faces of all other K4s can be chosen outside the restored triple, so they remain compatible simultaneously.

This contradicts the critical one-triangle packing increase. Slack at least two is elementary; defect zero uses the already supplied equality-case covering argument, now with K4s furnished directly by flatness. The earlier equality proof was audited but is not counted as a TUZA-02 discovery.

## Counterexamples and finite evidence

**No counterexample was found to the unrestricted theorem or the intended individual-family lemma.** The following negative results have different scopes:

* An overly small classification of the remaining cores fails. Let Rr be a central K4 with r leaf K4s attached along distinct central star edges, for r=1,2,3. Then `nu(Rr)=r+1`, `tau(Rr)=2r+1`, and deleting any one edge preserves nu. For r=3 this is one connected triangle component with `(nu,tau)=(4,7)`. Its full edge list, rainbow labels, optimal cover and packing, and a surviving maximum packing after every edge deletion are in the independent certificates (archived source: `checks/independent_certificates.json`). The new star theorem resolves these examples, but their existence blocks a classification restricted to W5, K5−e, and two overlapping K4s.
* The distinction between individual and full-G families is essential. Take K5 on vertices 0–4, add edges 15 and 35, and restore T1=012 and T2=034. Then `(nu(H),tau(H),nu(G),tau(G))=(1,1,3,4)`. Both full-G families of triangles touching Ti have cover number three, while both individual families have cover number one. This refutes the incorrectly enlarged-family version, not the intended lemma.

Focused tests included all 32,768 completions of a fixed bowtie on seven labelled vertices, seeded searches on eight and nine vertices, and all qualifying pairs of independent triples on the existing vertices of the three specified star cores. The seven-vertex test found no intended-lemma counterexample. The star tests found 56 pairs with both individual cover numbers three; all increased the packing by three. These tests do not cover arbitrary attachments or all larger graphs. Exact commands, seeds, counts, and generator restrictions are in the experiment README (archived source: `adversarial/README.md`).

The named obstruction graphs and the family-definition example were checked again by a separate subset-enumeration implementation (archived source: `checks/independent_certificates.py`), independent of the research stream's recursive solver. Finite tests corroborate the constructions; the general restricted theorems rest on the proofs.

## Literature and originality limits

The bounded literature review (archived source: `literature/LITERATURE_AND_NOVELTY.md`) located no exact predecessor of the two principal restoration theorems, the general restoration conjecture, or OCT-five. That is a search result, not evidence sufficient to claim originality.

Three distinctions matter. HNS supplies exact equality structure, not slack-one stability. HKT's [fractional stability theorem](https://www.kostochk.web.illinois.edu/docs/accepted/frac-ht.pdf) concerns `tau*`, so integer near-equality cannot simply be substituted. Regular and high-density tripartite stability theorems have hypotheses absent here. HKT's K4-structure deletion lemmas and Szestopalow's constrained-matching treatment of HNS are useful sources for further work. The existing theorem for `nu(G)<=3` already covers the smallest critical case h=1; the new results handle unbounded numbers of old K4 components.

