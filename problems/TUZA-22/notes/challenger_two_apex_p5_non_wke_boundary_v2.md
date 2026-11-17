> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A seven-vertex K4-free two-apex forest link that is not WKE

Status: ORDINARY_BOUNDARY_PROOF, strengthened v2 after coordinator reconstruction. The valid weaker v1 is preserved. This is the exact first new UNKNOWN in the complete14-shape cycle-cover diagnostic v2. It refutes a WKE-availability shortcut, not CS, Tuza, or the possibility of a different local reduction.

## Literal graph and non-WKE proof

Let F be the path0-1-2-3-4. Add nonadjacent apices a,b, each adjacent to exactly{0,1,3,4}. The graph L has seven vertices, twelve edges, and precisely four triangles:

    a01, b01, a34, b34.

Its degrees are3,4,2,4,3,4,4. It is K4-free, has minimum degree2, and L-{a,b}=P5. Its matching number is3, for example{a0,b4,12}.

Suppose P,Q were WKE: P a matching, Q a vertex cover of L-P, |Q|<=|P|. Since L has seven vertices, |P|<=3. Thus at least four vertices lie outside Q, and their induced L graph must be a matching, since every edge among them belongs to P.

No four-vertex set containing an apex induces a matching. If it contains both apices, then among its two F vertices at least one differs from2 and is adjacent to both apices, giving degree2. If it contains exactly one apex, at least two of its three F vertices differ from2 and are adjacent to that apex, again giving degree at least2.

Among four-vertex subsets of F=P5, the only one inducing a matching is{0,1,3,4}, obtained by omitting the middle vertex2. Every other omission leaves a P3 or P4. Therefore Q must be exactly{2,a,b}, and P must contain both01 and34. But the three remaining vertices{2,a,b} have no edge, so P cannot have a third edge. This contradicts |Q|=3<=|P|. Smaller Q is also impossible, since a five-vertex complement would contain a four-set other than the unique permitted one. Hence L is NOT WKE.

This is a K4-free two-apex-forest non-WKE obstruction beyond the five-wheel. The ordinary matching-number-at-most-two restriction is consistent: nu_match(F)=2.

## It is an actual cycle-cover link, but not a minimum-CS example

Add a universal hub h to L and call the cone A. The cycle

    h-b-0-1-2-3-4-a-h

meets every actual triangle of A. Every rim triangle uses01 or34, every hub triangle on a/b spokes meets ha or hb, and every remaining hub triangle has a path base. Thus the local graph is realizable under an actual Hamiltonian-cycle triangle cover.

The cone is strictly below the Tuza equality threshold. It has the explicit five-packing

    a01, b34, hb0, h12, ha4,

and the six actual edges

    {01,34,h1,h3,ha,hb}

cover ALL its triangles. The two path-end bases cover the four rim triangles and their hub pages; h1,h3 cover the remaining path-base hub pages12,23; ha,hb cover every hub page whose rim meets an apex. Thus tau(A)<=6<10=2nu(A). Every packing has at most two rim triangles and at most three hub triangles, so nu(A)=5 exactly. No exact covering optimum is asserted.

The missing ordinary codegree condition explains why A itself is not a minimum-CS witness: the path edges12 and23 have only their hub pages in A. In a genuine minimum-CS graph each would need an additional page with apex outside N(h), because neither edge belongs to a rim triangle of L. Those arbitrary outside pages are the remaining local obligation. The non-WKE proof does not justify ignoring them or declaring the link globally realizable in a minimum failure.

## Forced outside pages and the exact remaining balance gap

An outside page12x can be appended to the five-packing

    a01, b34, hb0, h23, ha4,

which avoids the rim edge12. All local vertices lie in N(h) or equal h, whereas x lies outside N(h), so the two outside spokes conflict with none of these local edges. This gives an explicit six-packing involving that page. The construction for an outside23-page is symmetric.

This is NOT by itself a global contradiction. The outside spokes may belong to triangle components of the undeleted graph; no B classification of that residual is available yet. Deleting them as well creates new lost triangles that need additional cover edges. In particular, deleting all cone edges leaves twelve rim bases potentially supporting outside pages, while the cone's displayed five-packing only pays ten cover edges. A six-packing using an outside page does not authorize treating its whole footprint as deleted or automatically avoidable.

The stronger six-edge core cover implies that the complete outside rim-page family has cover number at least four in a hypothetical minimum-CS graph: deleting the cone leaves K with nu(K)<=nu(G)-5, so a K cover, the six-edge core cover and an outside-family cover of size at most three would make G strict. This necessary abundance condition still does not supply the balanced residual needed for clique avoidance. No unavailable outside-page compatibility is assumed.

## Diagnostic provenance and scope

The v1 run stopped at the already excluded five-wheel, preserved as an UNKNOWN caused by its missing ordinary theorem rule. The parent-authorized SAME-domain v2 added only the literal apex-unicyclic reference and stopped at this graph after1321 of8220 eligible states. The raw domain remained67360, with57954 rejected for minimum degree/connectivity and1186 for K4-freeness. The monitored v2 run took0.715861s at32.5625MiB, with no timeout.

Files: evidence/challenger_cycle_cover_residual_interface_v2.json and operations/challenger_cycle_cover_residual_interface_v2.json. No remaining state is claimed to pass. No third run or vocabulary change follows from this note alone.

The non-WKE statement and displayed cone packing/cover are ordinary literal certificates, independent of the diagnostic. No external theorem is used beyond the definition of WKE and elementary matching/cover counting.
