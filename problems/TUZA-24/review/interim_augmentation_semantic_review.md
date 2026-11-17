> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Interim review: whole-footprint augmentation and path-free structure

Status: source snapshots accepted mathematically. Source hashes and matching successful coordinator receipts are in interim_augmentation_source_hashes.json. A missing matching receipt means only a draft source snapshot was reviewed. No independent compiler invocation occurred. Full forest-cover CS is still incomplete; the conditional augmentation lemmas must be instantiated by the remaining branch arguments.

## One simultaneous residual avoidance choice

`minimal_link_augmentation` starts from actual MinimalCS, a genuine full LinkMatching, nonempty deleted matching M, and its proved cover bound. `minimal_link_matching` first obtains proper-subgraph Good, then exact accounting and residual ComponentCliques. The residual block decomposition is therefore justified from the class-local induction premise, not assumed from numerical tightness alone.

The forbidden family passed to `blocks_avoid_edges` is the ENTIRE `support P` of the selected augmented triangle packing. Its hypothesis is supplied for every complete residual K4/K5 block as `(support P ∩ edges k).card ≤ 2` together with one common endpoint for all those edges. The result is one maximum residual packing disjoint from support P. The proof then unions it with P and uses exact cardinal additivity and the balanced matching loss. There is no step selecting mutually incompatible packings separately for individual triangles.

## Footprint geometry

An acyclic graph has no three-vertex clique. Removing the apex therefore limits every clique in an apex-forest link to three vertices. Consequently every residual clique contains at most three actual link vertices, so an entire vertex-disjoint link matching contributes at most one edge there. The hub's spokes cannot survive deletion of all edges incident to the hub; the entire surviving support of all hub triangles is contained in the matching-rim footprint.

If the page base ab is deleted, no residual clique contains both a and b. Any two distinct page edges would together force both endpoints into that clique, so the entire page footprint has at most one edge. This argument uses deletion of the base, not an unsupported bound on outside attachments.

For an internal page all its vertices are actual link vertices. A surviving matching edge and surviving page edge in one block cannot be vertex-disjoint, since that would require four link vertices in a set proved to contain at most three.

For a safe external page, each base endpoint is a link vertex in no actual link triangle. If a surviving page edge and a surviving matching edge were disjoint in one residual clique, the page edge's base endpoint and the two matching endpoints would form an actual link triangle. This contradicts the explicit endpoint-safety hypothesis. Thus the matching and page footprints intersect whenever both are nonempty.

`two_singleton_edge_families_star` proves the UNION has at most two edges with a common endpoint. The actual augmented support is a subset of that union, so the same certificate applies to it. This checks simultaneous compatibility of all selected triangles, including the matching and page contributions together.

## Actual packings and page quantifiers

`hub_page_packing` proves that all new hub triangles and the extra actual page form one packing. The hypothesis `Disjoint Z (edges t)` is the required edge-disjointness of the full new rim matching from all page edges, not merely avoidance of the deleted base. The extra page excludes the hub vertex so surviving page edges cannot be hub spokes. Its cardinality is exactly |Z|+1.

`minimal_internal_page_augmentation` requires an actual page triangle within the full neighborhood and an actual deleted base in M. `minimal_safe_external_page_augmentation` requires an actual triangle, exclusion of the hub, endpoint safety, and the complete matching/page disjointness. Its third vertex z has no imposed order, degree, membership or outside-attachment restriction. No restricted triangle list replaces the actual graph. The whole-footprint certificate is valid even more generally than its named external application; later branch code still must prove the displayed safety and disjointness hypotheses.

## Additional path-free matching lemmas

The one-edge swap in AlternatingForestAllowed keeps cardinality and vertex-disjointness, adds the requested exposed-vertex edge, and exposes the former matching partner. A is saturated into D in every maximum matching, so exposing one D-neighbor of an A vertex forces another distinct D-neighbor. These are proved facts, not imported allowed-edge assumptions.

`exposureBipartite G` keeps exactly actual G edges having an exposable endpoint. Since D is independent, these are D-A edges in a forest. Every original neighbor of a D vertex is retained. In a nontrivial component, both tree leaves must lie in D because every A vertex has at least two D-neighbors. A component leaf in D is therefore also an ORIGINAL G degree-one leaf. The root-neighbor assumption ensures a nontrivial component; retained deleted isolates cannot supply spurious leaves. The returned leaves are explicitly reachable from the root in G.

## Perfect-branch reorganization

The reviewed PerfectForestStructure snapshot replaces an ordered-path representation with exactly the structural consequences used by the ordinary proof. For a nonempty matching perfect on the graph's incident support, the forest edge bound gives fewer residual edges than matching edges. If there are at least two fewer residual edges, endpoint choice yields a strict saving; if two residual edges meet, selecting their common endpoint yields the extra saving. Otherwise the full residual edge family R is a matching with |R|+1=|M|.

The explicit active set is matchingVertices M. Its cardinality is 2|M|, while matchingVertices R has cardinality 2|R| and is a subset. Thus exactly two active vertices are unmatched by R. Any such vertex has its unique original neighbor through M: every edge not in M is in R, and matching disjointness allows only one M edge through that vertex. These are original leaves, independent of any implicit path ordering.

When |M|≥2, every f in M leaves one such leaf outside f. If both unmatched vertices were precisely the endpoints of f, then all R edges and M minus f would survive isolation of f. On the remaining nonempty active set their number would equal the vertex count, contradicting the strict forest edge bound. This correctly supplies the ordinary path-endpoint choice without proving connectivity or introducing vertex labels. Downstream applications must retain the explicit |M|≥2 and incident-support-perfectness hypotheses.

The suggested nonperfect Fact B reorganization is also valid at the ordinary proof level: a maximum matching of F-ab retaining the original optimum cannot miss both a and b; deficiency at least two on the explicit active set yields an unmatched active vertex elsewhere. Its component after edge deletion is nontrivial, and the forest bridge property prevents that component from containing both a,b. Two exposable leaves therefore include one outside the endpoints, whose original degree is unchanged. The final Lean implementation still requires review when available.
