> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh review: paid-triangle collapse and the two unicyclic shapes

Verdict: ACCEPT, ORDINARY PROOFS USING DECLARED CLASS-LOCAL INPUTS. Reviewer: challenger,2026-11-16 UTC.

Frozen sources:
- notes/wke_residual_triangle_count_collapse_v1.md, SHA8143c49ad20f0dc7ef5d9d585be5d759b346be2ff1cf9b31ffab3e6f1cc57865;
- notes/triangular_unicyclic_matching_two_ordinary_v1.md, SHA084ca3822c32b8c9442090a9177b2a73a1cec85db54eda8af6dd965c3aaa3074.

## Paid-triangle theorem

I independently checked the asserted bound |P|<=|S|+|Z|+t, where t counts ALL actual triangles of L-S, including intersecting ones. The old-block intersection with L-S is a complete surviving clique. Every intact such triangle lies in exactly one old triangle component, so the sum of binomial(q_B,3) is exactly the intact triangle count. Each row of the K4/K5 cover table is valid for the entire clique block, including its outside vertices. Its excess never exceeds the number of prescribed-clique triangles. Thus all supported residual F edges can be prescribed simultaneously at total excess at most t0.

For an unsupported F edge off Z, codegree supplies a second page. An outside apex or an apex in S would survive; hence the second page is an actual broken F triangle. Its matching edge is unique, and its opposite vertex meets the unsupported edge. Selecting one opposite vertex per broken triangle therefore covers every such exception, at cost at most t1. The final cover retains all deleted P bases and adds the hub spokes to S,Z,W, so arbitrary outside pages and every lost hub triangle are accounted for. The resulting inequality is correct without disjointness assumptions on F triangles.

With F connected triangular unicyclic and nonperfect, the exposed-leaf tuple has |P|=nu(F)+1, S={w}, |Z|=1 and t=1. Thus nu(F)<=2 ordinarily. This removes the need for the larger finite interface at this branch.

## Exact two-shape domain and cases

The matching-two specialization of the rooted attachment formula leaves precisely triangle abc with leaves at a,b, or triangle abc with a path2 at a. The doubled-leaf prohibition is used at its declared ordinary parallel-thread scope. No count-based inference enters.

For Shape I, when wc is absent only a,b,w can be branch vertices. When wc is present and wb absent, P={ac,by,wx}, Q={a,c,y} covers every remaining edge, including optional wa. All actual L triangles contain a, so S={a} gives the strict3>2 collapse. When all wa,wb,wc exist, the same P and Q={a,b,w} leave triangles abw,bcw sharing bw with ac deleted. The residual literal-clique contradiction is valid with arbitrary attachments.

For Shape II, if at most one of b,c,x is a w-neighbor, only a,w and that one vertex can branch. Otherwise relabel b,c so wc is present and use P={ab,wc,xy}. If wx exists, Q={a,b,w}, S={w,c} gives a triangle-free deletion and an internally matched S. If wx is absent, both wb,wc exist; Q={a,b,y}, S={a,b} has the same property. I checked every optional wa and every remaining path/apex edge. These cases exhaust the actual apex neighborhoods.

The two ordinary proofs therefore replace the374-record completion as a mathematical dependency of the connected apex-unicyclic theorem, once the assembly is repinned. The old finite proof remains valid and preserved; it is not retrospectively relabeled ordinary. No GE, Kotzig, four-branch certificate or outside-attachment assumption is added.
