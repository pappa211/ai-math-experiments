# Coordinator frozen probes — 4 November 2026

Literal AC is the mission statement: H triangle-edge-3-colourable, X subset V(H), H[X] triangle-free, G=H plus new z adjacent exactly to X. Ask whether some minimum triangle cover C of H has |C|+vc(H[X]-C)<=2nu(G).

The coordinator's targeted computational family consists of random subgraphs of complete four-partite graphs (8–12 vertices), with optionally planted colour-respecting K4s and arbitrary remaining cross-part edges. Each edge receives the XOR difference of its endpoint part labels in F_2^2, so every actual triangle has three different nonzero colours. This is only a sufficient source of eligible H, not the full class. Choose triangle-free X with at least one old-supported link edge. The test is for AC itself. Fixed random seed, strict individual and total time limits. No census, and no filtering for an actual Tuza violation.

Exact all-minimum-cover test: for S subset X let F=E(H[X\S]). A minimum H-cover C with S covering L-C exists iff |F|+tau(H-F)=tau(H). Necessity: F subset C, and C-F covers H-F; sufficiency: add F to a minimum cover of H-F. Thus lambda is the least |S| passing that equality. This is an exact state reformulation for verification, not a new compatibility theorem. It handles deletion of edges, not endpoints.

A possible stronger contact lemma will be considered only as an intermediate probe, not silently substituted for AC: given maximum old packing P and appropriate maximal matching Q in L-E(P), can a minimum old cover contain all but D(H) of the surviving designated L-edges from P? Existence/quantifiers are not established. Each old triangle has at most one L-edge since L is induced and triangle-free. Failure of this stronger assertion would not refute AC.
