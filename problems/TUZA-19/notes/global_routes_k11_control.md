# Odd cover number survives TF and two-edge resilience

Status: the auxiliary gate 'TF plus two-edge packing resilience forces even tau' is FALSE. Root and global_routes independently identified K11 before computing; one explicit packing was found locally, then checked by a separate standard-library literal script. No Tuza counterexample, historical originality, or Lean verification is claimed.

For K11, tau=pi=25 and nu=17. Every triangle belongs to some minimum cover (TF), every edge is cover-critical, and deleting any set of at most two edges preserves nu.

A maximum triangle-free graph on11 vertices has at most30 edges: for any edge uv of a triangle-free graph, d(u)+d(v)<=11. Summing and applying Cauchy gives4m²/11<=11m, hence integer m<=30. A complete5-by-6 bipartite graph attains30. Its complement in K11 is an odd triangle cover of size55-30=25, proving tau=pi=25. Any prescribed triangle can be placed inside the six-vertex part, so it is fully contained in a minimum cover. Every prescribed edge can likewise be placed within a part, proving edge-cover-criticality.

The following17 triangles are edge-disjoint:

    014, 028, 056, 07(10), 12(10), 139, 158, 167, 237,
    245, 269, 35(10), 368, 46(10), 478, 579, 89(10).

Their unused edges are03,09,34,49, a four-cycle. Eighteen packed triangles would leave a single edge, impossible: K11 has even degree at every vertex, and deleting triangle edges preserves even degree, whereas a one-edge remainder has two odd-degree vertices. Thus nu=17.

Any two graph edges, whether adjacent or disjoint, can be embedded in a four-cycle. Every permutation of K11 vertices is an automorphism. Therefore relabel the displayed packing so that its unused four-cycle contains the prescribed deleted pair. It still has17 triangles after that deletion. Singleton and empty deletion sets follow as well. This ordinary symmetry argument covers every pair; no pair census or packing upper-bound solver is needed.

The proposed arithmetic gate would have excluded a minimal Tuza counterexample because that counterexample has tau=2nu+1. K11 refutes the gate with substantial slack,25<34. It does not refute a statement using the actual near-tight arithmetic, simultaneous triangle-deletion tightness, or H-O2.

Reproduction: source the mission environment and run `python3 checks/global_routes_k11_control.py`. The original positive SAT witness, all graph edges, and literal remainder are retained in evidence/global_routes/k11_odd_tf_resilience.json. The SAT solver was used only to find the17-packing, not to justify any negative or optimum claim.
