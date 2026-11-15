# Simultaneous triangle-deletion tightness: global route gate

Status: exact implication, unproved auxiliary hypothesis. Neither an unrestricted proof nor a refutation. All graphs finite and simple. All packings are edge-disjoint graph triangles and all covers use graph edges.

## H-D (falsifiable global availability claim)

Let G contain a triangle and put k=ν(G). Suppose that, for EVERY actual graph triangle T,

    ν(G−E(T))=k−1,     τ(G−E(T))=2k−2.

Then there is a graph-edge set S with1≤|S|≤2 such that ν(G−S)<k.

This is asserted on ordinary graphs meeting exactly the displayed premise, not on an unspecified positive-defect graph. Counterexamples can satisfy Tuza and would still decisively refute H-D.

## Why H-D would prove unrestricted Tuza

Choose a counterexample G with as few edges as possible, and k=ν(G). Deleting any edge e gives a proper subgraph satisfying Tuza. Since τ(G)≤τ(G−e)+1≤2ν(G−e)+1≤2k+1, while τ(G)>2k, we have τ(G)=2k+1. For any S of at most two edges, if ν(G−S)≤k−1 then

    τ(G)≤τ(G−S)+|S|≤2(k−1)+2=2k,

contradiction. Thus all such deletions preserve k.

For any triangle T, ν(G−E(T))≤k−1 because its packing can be adjoined to T. Also

    2k+1=τ(G)≤τ(G−E(T))+3≤2ν(G−E(T))+3≤2k+1.

All inequalities are equalities, giving the H-D premise. Its conclusion contradicts two-edge resilience. Hence H-D, if proved universally, settles Tuza.

Weakest link: the entire H-D implication. Generic3-uniform systems need not satisfy it; the frozen finite-incidence obstruction preserves the same criticality arithmetic. A successful proof must use globally consistent graph endpoints, not merely bounded triangle incidences or the displayed arithmetic.

## Initial exact attack

checks/global_routes_deletion_gate.py rebuilds all triangles from literal edges and computes ν and τ by memoized exhaustive recurrences. Its first domain is NetworkX3.7 graph_atlas_g,1253 isomorphism representatives on at most7vertices. Evidence is evidence/global_routes/deletion_atlas.json.

Only one ν≥2 graph qualifies: twoK4s sharing one vertex; it hasν2,τ4, eight triangles, and six explicit two-edge blockers.336 trianglefulν1 cases qualify. In that case every triangle deletion destroys all other triangles, so the triangle family is pairwise edge-intersecting. Such a family either shares an edge or lies among four faces of an actualK4, and has a cover (hence a packing blocker) of size at most2. The finite count is supporting evidence only; no census beyond the stated domain has been performed.

## Triangle insertion restatement and a stronger test

If H lacks all three edges of a triple {a,b,c}, let G=H+{ab,ac,bc}. Then ν(G)≥ν(H)+1 and τ(G)≤τ(H)+3. If τ(H)≤2ν(H)−1, these two elementary inequalities already transfer Tuza to G. Therefore the difficult inductive insertion is exactly a tight H with τ(H)=2ν(H).

A prospective stronger lemma H-E is: for every tight H and independent triple {a,b,c}, either ν(G)≥ν(H)+2, or some minimum cover C of H extends to a cover of G by adding at most two arbitrary graph edges. H-E implies Tuza by deleting the three edges of any triangle in an edge-minimal violation. H-E is stronger than the target and is genuinely falsifiable even on graphs satisfying Tuza; a budget cover of G might need to change more old edges.

The added edges in the covering extension are deliberately arbitrary old or new G edges. Restricting them to two of {ab,ac,bc} fails already when H is a three-edge star and G=K4; the valid two-cover uses one star edge and its opposite new edge. That elementary failed subrule is retained to prevent accidentally excluding privateK4 repairs.
