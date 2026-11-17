> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Exposable leaves in deficient trees and unicyclic graphs

Status: PROOF_USING_DECLARED_INPUT_CANDIDATE, frozen for fresh review. Source_audit, 2026-11-16 UTC. The sole new external dependency is the standard Gallai-Edmonds structure theorem, whose exact statement was authenticated earlier in TUZA-22. No finite computation is used. The ordinary deductions below concern graph matchings, not triangle-packing availability.

Write mu(F) for ordinary matching number, and d(F)=|V(F)|-2mu(F). A vertex is exposable if some maximum matching leaves it unmatched. A leaf has degree exactly one in the ORIGINAL graph being named; a one-vertex tree has no leaf under this convention.

## Declared matching structure

Use Gallai-Edmonds with D the exposable vertices, A=N(D) minus D, and R the remaining vertices. Every component of F[D] is factor-critical, F[R] has a perfect matching, and every maximum matching matches A to distinct D-components, matches the R region perfectly, and leaves exactly one vertex unmatched in each unused D-component. In particular

    d(F) = number_of_components(F[D]) - |A|.

Primary authentication already recorded in `review/apex_forest_nonperfect_v2_independent_review.md`: Gallai's original paper at https://real.mtak.hu/189486/ (introductory Satz(E.1)); inspected author-hosted primary research-paper restatement, Busch et al., *Packing of Graphic n-tuples*, theorem3.6 on PDF page9, https://dwest.web.illinois.edu/pubs/degpack.pdf. Its notation(A,B,C) corresponds to this note's(D,A,R). The complete general theorem is declared, not re-proved here. The forest-specialized part can instead use the accepted elementary alternating-path decomposition.

## 1. Leaf counts

**Tree count.** A nontrivial connected tree T with d(T)>=1 has at least d(T)+1 exposable original leaves.

A nontrivial factor-critical tree is impossible: deleting the neighbor of a leaf would leave that leaf isolated. Thus every D-component is one vertex. Every D vertex has all its neighbors in A; because T is connected and nontrivial, its degree is positive. Let ell be the number of degree-one D vertices. The bipartite incidence graph H between D and A is a forest with c>=1 components. Hence

    2|D|-ell <= |E(H)| <= |D|+|A|-c,

so ell>=|D|-|A|+c=d(T)+c>=d(T)+1.

**Unicyclic count.** A connected unicyclic F with d(F)>=1 has at least d(F) exposable original leaves, unless F is a bare odd cycle. The latter has deficiency one and no leaves.

A factor-critical connected unicyclic graph other than a single vertex has no leaf, by the same deletion argument, and therefore is its odd cycle. Thus D-components are isolated vertices and possibly one odd cycle.

If there is no odd-cycle D-component, the D-A incidence graph has at most one cycle and c>=1 components. The preceding degree count becomes

    2|D|-ell <= |D|+|A|-c+1,

and gives ell>=d(F)+c-1>=d(F).

If there is an odd-cycle D-component, contract it to a single D-side vertex z. The resulting incidence graph H between D-components and A is a forest. Let D0 be the isolated D-components and let h=deg_H(z). If F is not the bare cycle, connectedness and the definition of A give h>=1. Writing c>=1 for the number of components of H,

    2|D0|-ell+h <= |E(H)| <= |D0|+1+|A|-c.

Since d(F)=|D0|+1-|A|, this yields

    ell >= d(F)-2+h+c >= d(F).

The leaves counted are actual degree-one vertices of the original F; the contracted cycle is not counted as a leaf. This proves both counts.

## 2. Retaining an allowed edge

**A.** Let F be connected and unicyclic, with d(F)>=2. If ab belongs to some maximum matching of F, there is a maximum matching of F that contains ab and exposes an original leaf of F.

Set K=F-{a,b}. Since ab is allowed, mu(K)=mu(F)-1, so d(K)=d(F)>=2. A component of K is a tree or the unique possible unicyclic component. Each component attaches to {a,b}. Contracting the components and retaining edge ab shows the following exact alternatives:

* If K contains a unicyclic component, every component has one attachment edge.
* Otherwise every component has one attachment edge, except one tree component which has two attachment edges.

Indeed the unique cycle is either retained within a component or is accounted for by exactly one extra attachment.

Suppose no maximum matching of K exposes an original F-leaf. For a nontrivial tree component with positive deficiency d_i and b_i attachment edges, every exposable leaf of that component must be newly created by deletion; there are at most b_i such leaves. The tree count gives d_i+1<=b_i. Thus an ordinary one-attachment component is perfect, and the sole possible two-attachment component has deficiency at most one.

A singleton component with one attachment is itself an original F-leaf and would immediately succeed. A singleton with two attachments has deficiency one and is the same unique exceptional component.

A surviving unicyclic component has one attachment. By the unicyclic count it can have deficiency at most one if no original F-leaf is exposable; the bare odd-cycle exception also has deficiency one. Every other component is perfect by the tree argument.

Thus in every case d(K)<=1, contradicting d(K)>=2. Choose a maximum K matching exposing the resulting original leaf, and add ab. This proves A.

## 3. Deleting an edge without changing matching number

**B.** Let F be connected and unicyclic, with d(F)>=2. If mu(F-ab)=mu(F), then F-ab has a maximum matching exposing an original leaf of F outside {a,b}.

Set K=F-ab, so d(K)=d(F)>=2.

If ab is on the unique cycle, K is a nontrivial tree. It has at least d(K)+1>=3 exposable leaves. At most two, the endpoints a,b, can be newly created by deleting ab. Every other leaf is an original F-leaf outside the endpoints.

If ab is a bridge, K consists of a tree T and a unicyclic component U. Name a as the endpoint in T and b as the endpoint in U. Each side has only its boundary endpoint as a possible newly created or excluded leaf. If T is nontrivial and deficient, its at least d(T)+1>=2 exposable leaves include a permitted original leaf. Hence, if no desired leaf exists, T is perfect or is the singleton {a}, whose deficiency is one.

Similarly the unicyclic leaf count implies d(U)<=1 if no permitted leaf exists (with the bare odd cycle included as the deficiency-one exception). Since total deficiency is at least two, the only remaining possibility is T={a} and d(U)=1.

Matching preservation then says b is not exposable in U: otherwise expose b in a maximum U matching and add ab to increase mu(F) over mu(K). If U is a bare odd cycle, every vertex, including b, is exposable, contradiction. Otherwise U has at least one exposable original U-leaf; the only potentially forbidden one is b, which is not exposable. Thus a permitted original F-leaf exists after all. This proves B.

## Scope and limitations

Connectedness, deficiency at least two, and the stated matching hypotheses are explicit. A bare odd cycle shows that deficiency one cannot simply replace deficiency two in either A or B. This note does not assert that every edge is allowed or matching-preserving, and does not itself construct a WKE pair or establish CS for unicyclic links. It supplies the leaf choices requested for that separate interface. No new novelty claim is made for the matching facts.
