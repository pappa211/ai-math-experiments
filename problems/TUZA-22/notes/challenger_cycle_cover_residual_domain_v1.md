> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Exact fourteen-shape domain for the remaining one-cycle-cover equality case

Status: ORDINARY_DOMAIN_DERIVATION_USING_DECLARED_FINITE_MATCHING_BOUND. The graph-theoretic shape argument is ordinary, but its matching-number-at-most-two input retains the independently validated P6 finite premise. No upcoming diagnostic verdict is assumed.

Let H be the class of graphs admitting ANY actual triangle-edge cover C of total selected cycle rank at most one. This class is hereditary under edge deletion by restricting C. The ordinary one_cycle_cover_tuza_v1.md proves the inequality throughout H. Thus a smallest combined-CS failure in H is tight and every proper edge subgraph satisfies CS; the authenticated class-local codegree and closed-link reductions apply.

The ordinary full apex-unicyclic exclusion removes every selected leaf, and the isolate-corrected one-cycle-cover structural theorem removes every vertex of selected degree zero. Forest covers are already excluded by the accepted forest-cover CS theorem. Hence every such C in a smallest failure is a single HAMILTONIAN CYCLE.

## K5-freeness and literal link condition

The graph G is K5-free. If it contains a literal K5 on five vertices and has more than five vertices, the restriction of its spanning cycle C to those vertices is a forest with at most four edges. It must cover every K5 triangle. A K5 triangle cover has at least four edges; at size four its complement is a triangle-free six-edge graph on five vertices. The elementary Mantel equality case makes that complement K2,3, so the cover is K3 disjoint K2, not a forest. This is a contradiction. If G itself has five vertices and contains K5, it is K5 and satisfies B, so is not a failure. Consequently every actual closed link in G is K4-free.

Fix a vertex v with selected cycle neighbors a,b. Every link edge avoiding a,b belongs to C, since its actual triangle through v has neither spoke selected. Every closed link component containing at most one of a,b is an apex-forest link or a forest and is already ordinarily excluded. Thus the WHOLE link L at v is connected, contains both a,b, and

    F=L-{a,b}

is a disjoint union of paths and isolates. The independently reviewed finite-supported two-apex theorem gives nu_match(F)<=2.

There is at most one F isolate. Every isolate has exactly the two L-neighbors a,b by minimum link degree two. Two such vertices would be degree-two internal vertices of two nondirect parallel length-two a-b paths, prohibited by the ordinary parallel-thread exclusion.

## Complete list, including the empty boundary

If F has no nontrivial path, it is empty or a single isolate. Then L has at most three vertices, contrary to closed-link robustness (and already within the ordinary small-branch exclusion). Thus these cases require no finite records.

A nontrivial path of matching number1 is P2 or P3. One of matching number2 is P4 or P5. The only way to have two nontrivial components within total matching budget2 is a pair of P2/P3 paths. Therefore the COMPLETE nontrivial list is

    P2, P3, P4, P5, P2+P2, P2+P3, P3+P3,

each with zero or one isolate: exactly fourteen F shapes. No longer path, third nontrivial component, or second isolate is possible. The maximum |F| is7 and maximum |L| is9.

For each fixed labelled shape, all ordered pairs of apex neighborhoods and both choices for ab are possible inputs. Before necessary-condition filtering, their total count is

    5*(2^5+2^7+2^9+2^11+2^9+2^11+2^13)=67360.

The factor5 is1+4, corresponding to no isolate or one isolate; the extra isolate adds two independent apex-incidence bits. Each exponent already includes the optional-ab bit. A diagnostic may filter ONLY actual delta(L)>=2, connectedness and K4-freeness. It must not silently quotient apex choices or impose unproved equality conditions.

This is a derived complete residual domain for a possible one-cycle-cover class proof. A passing finite producer alone does not prove that class theorem; every record and exact-domain coverage require independent checking, followed by an all-attachment certificate assembly. An UNKNOWN is a limitation of the certificate vocabulary, not a counterexample.

Inputs: one_cycle_cover_tuza_v1.md SHAe17c80362c3916da953f3dd5041dd5b4b4c228a244e38c564265ac25ac97a77f; apex_unicyclic_full_exclusion_ordinary_v2.md SHA3adee37d0c9badaeec2b57088b694816bd811eef727dbcf2d5d9f4576c4e43c4; challenger_two_apex_forest_matching_two_bound_v1.md SHAf93c47f54ab0f74974a67e09d346127751bb3a8e19c05a52b311dcde51126456; ordinary forest-cover, selected-degree-zero, apex-forest and parallel-thread reductions at their already reviewed class-local scopes. The K5 cover classification/Mantel equality is used only on five literal vertices.
