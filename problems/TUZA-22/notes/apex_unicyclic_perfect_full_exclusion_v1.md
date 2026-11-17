> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Every perfect unicyclic link remainder is excluded

Frozen ordinary assembly and new support-criticality argument, 2026-11-16. This removes the entire perfect-matching branch of the apex-unicyclic interface. No finite census or Kotzig premise is used.

## Theorem

In a minimum combined-CS failure G, globally or within an edge-subgraph-hereditary class, there is no closed link component L at h and vertex w in L such that F=L-w is connected unicyclic and has a perfect matching.

The bare-cycle case is already excluded by the accepted `apex_cycle_link_exclusion_full_v2.md`, with its explicit historical five-wheel input. If the unique cycle of F is a triangle, the accepted `apex_unicyclic_triangle_cycle_perfect_exclusion_v1.md` applies. It remains to treat a TRIANGLE-FREE, noncycle F with a perfect matching.

## 1. Balanced tuple and universal old support

Choose any perfect F matching M, |M|=r. The accepted perfect-remainder morphology shows that R=F-M consists of one P3 or P4 and otherwise isolated edges and vertices. The K3 possibility in that morphology is unavailable because F is triangle-free. In particular R has r edges and a vertex cover Q0 of size r-1.

Use P=M and Q=Q0 union {w}; these have equal size r. Delete all h-spokes to L and M, obtaining K. Standard class-local minimum-CS accounting gives B(K) and nu(K)=nu(G)-r.

EVERY edge e=xy in R is triangle-supported in K. To prove this, codegree at least two supplies a G page xyz other than hxy. If z lies in F, the three edges would form a forbidden F triangle. If z=w, both page spokes wx,wy survive because M is entirely in F. If z lies outside L, its page spokes also survive because every M endpoint lies in F and neither spoke is incident with h. A z in a different link component is impossible, as its adjacency to x would join that component to L. Thus the chosen second page survives intact in K in every possible case.

This universal old-support statement is the new input that is special to a triangle-free F and a matching entirely in F.

## 2. A single critical complement edge gives a contradiction

Suppose some e in R satisfies

    tau_vertex(R-e)<=r-2.

By Section1, e belongs to a literal K4/K5 component of B(K), so K has a minimum cover D containing e. Choose a vertex cover Q1 of R-e of size at most r-2. The set

    D union M union {hw} union {hx:x in Q1}

covers every G triangle. All deleted M-edge pages retain their M base. A remaining removed hub triangle has rim in R or is incident with w: the former is hit by D if its rim is e and otherwise by Q1, while the latter is hit by hw. Every other triangle survives in K and is met by D. Thus the total cover size is at most

    2nu(K)+r+1+(r-2)=2nu(G)-1,

contradiction.

Equivalently this is the supported-edge consequence of `coordinator_wke_residual_cover_invariance_v1.md`, applied with an explicit w-plus-complement cover. The above proof spells out the actual lost-triangle audit independently.

## 3. The morphology always supplies such an edge

If R has an isolated-edge component, deleting that edge lowers its vertex-cover number from r-1 to r-2, so Section2 applies.

If its sole nontrivial component is P4, deleting either end edge leaves a P3 and lowers that component's vertex-cover number from two to one. Again Section2 applies, with or without other isolated-edge components.

The only remaining possibility is R=P3 plus isolates and NO isolated-edge components. Since R has exactly r edges, this forces r=2 and |V(F)|=4. But a triangle-free connected unicyclic graph on four vertices is exactly C4, contradicting the standing noncycle assumption.

Every case is excluded, proving the theorem.

## Scope and next exact branch

This ordinary proof closes all perfect unicyclic remainders at once, including the formerly remaining two-degree-three-vertex configurations and arbitrary apex adjacencies along their unbounded paths. The separately developed one-branch proof is still a valid independent mechanism at its own scope, but is no longer needed for the shortest full assembly.

For a minimum-CS graph with a one-cycle triangle cover and a cover leaf v with parent w, the established local structure gives F=L_G(v)-w connected unicyclic. The present theorem now forces F to have NO perfect matching. The accepted exposable-leaf lemma then supplies a maximum F matching M exposing an original F leaf z adjacent to w, so P=M+{wz} is a maximum L matching of size nu(F)+1. This nonperfect branch remains the open apex-unicyclic obligation; no general WKE equality conclusion is inferred.

## Frozen dependencies

- `apex_unicyclic_perfect_remainder_restriction_v1.md`, SHA 64effb6b26ceabbb06b3507282fd6d3e487c6c6c6cf4ad500015d882958461ce;
- `apex_cycle_link_exclusion_full_v2.md`, SHA 558a0d1f99c1672328aee8c1dd7a38d2c3dc9677233e561f0c90521a428815b7;
- `apex_unicyclic_triangle_cycle_perfect_exclusion_v1.md`, SHA 58d8ca562d17313aa4df6e9ca5992dd707589625aed00ebbfdd3da09da7bdc4c;
- authenticated class-local M0/codegree and elementary literal clique covers.

The coordinator's general invariance note is an independently accepted equivalent interface, SHA aafae631369cb67c7c13074efa850ce673fd47e161286fd7fae35d1ad76d8cfc; no additional hypothesis from it is used silently here.
