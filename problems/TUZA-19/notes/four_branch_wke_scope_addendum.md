# Accepted scope, sharp branch threshold, and component form

The frozen proof notes/root_four_branch_wke.md (SHA67011b7544cd8d8c516a738572c10f5d828b5631c3d8ce491fcd08ae3f71ce99) has been independently accepted in review/four_branch_wke_fresh_audit.md, including all5375 canonical witnesses and the all-size reduction. Its original bytes remain unchanged.

One secondary phrase requires precision. A sufficient condition placed on G[K] must be closed under arbitrary subgraphs, including EDGE deletions, or must directly guarantee Tuza for every subgraph of G[K]. Induced-hereditary alone does not suffice, since the survivor R may omit matching edges. The main inequality uses R contained in G[K], and the empty-core corollary is unaffected.

The number four in the WKE branch lemma is sharp: K5 has five branch vertices and no WKE witness. Any matching has size at most2, while K5 minus a matching has independence number at most2 and vertex-cover number at least3. This does not prove that the global5-core sufficient condition is best possible by other methods.

The component form is also valid. If any connected component of a link has at most four branch vertices, apply the WKE witness just to that component and delete its spokes. No triangle at the center crosses between link components. Therefore every link COMPONENT of a graph admitting no standard edge reduction has at least five vertices of degree at least3. This is stronger than the per-vertex high-codegree count, but still gives no theorem resolving a surviving nonempty core.

The primary prior-art audit review/four_branch_wke_prior_art_audit.md found no exact unrestricted statement in the sources it inspected. Novelty is unresolved. The WKE framework/reduction is Puleo's, and the two-vertex subdivision method and localization template are explicitly attributed to Tsujimura. The current finite certificates and unrestricted four-branch scope are the checked claims of this mission. A Lean finite-domain check is in progress; no all-size formal-verification claim is made.
