> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# A minimum spanning-cycle triangle cover need not save an edge

Status: ORDINARY_BOUNDARY_PROOF. This refutes a proposed cover-normalization shortcut, not Tuza or the equality classification.

## Exact family

For every integer n>=10, use vertices Z/nZ and let G_n have all edges of cyclic distances 1, 2, and 3. Let C be the n distance-1 edges, a spanning cycle.

The graph G_n-C consists of distances 2 and 3 and is triangle-free. Indeed a triangle would yield a signed sum of three numbers from {2,3} equal to 0 modulo n. Such a sum has absolute value at most9, and none is0 as an integer. Since n>=10, this is impossible. Thus C covers every actual triangle, including triangles with two C-edges.

For every i in Z/nZ take T_i={i,i+1,i+3}. Its three edges have distances 1, 3, and 2 respectively. As i varies, each distance-1 edge occurs once as the base, each distance-3 edge occurs once as {i,i+3}, and each distance-2 edge occurs once as {i+1,i+3}. These are distinct edge classes for n>=10. Consequently the n triangles T_i partition E(G_n).

It follows that nu(G_n)=tau(G_n)=n: the displayed packing gives nu>=n, the explicit cover gives tau<=n, and always nu<=tau. In particular C is a minimum ordinary triangle-edge cover. The graph is strictly below the Tuza equality threshold: tau=n<2n=2nu.

The first instance n=10 has 10 vertices, 30 edges, and 30 actual triangles. No finite enumeration is needed for the family or its optimum certificates.

## Meaning for the current route

A minimum-CS graph with a pure cycle cover might have no vertices outside that cycle, using the independently established closed-cycle-link exclusion. This observation does not imply that its cycle cover admits a smaller ordinary cover. The family above refutes that latter statement even when every vertex is on the selected cycle and the selected cycle is genuinely minimum. Any useful reduction must exploit equality/minimality beyond the cover shape alone.

## Scoped preliminary diagnostic, not proof input

The parent-authorized script scripts/challenger_spanning_cycle_mincover_probe.py inspected every chord subset of a fixed spanning C6 and C7. Of512 and16384 chord masks,392 and7269 respectively had the selected cycle as a triangle cover. Each admitted a cover of size at most n-1. This statement is limited to those two orders and does not imply a general bound; the ordinary family above explains why expansion would not establish the desired shortcut.

Evidence: evidence/challenger_spanning_cycle_mincover_probe.json. Monitor: operations/challenger_spanning_cycle_mincover_probe.json. Completed in0.353898 external seconds, peak sampled RSS14.609375MiB, cap10s/2200MiB, no UNKNOWN or timeout. The nonspanning control consisting of two independent full apices over C5 has tau5, as certified by its separate exact branching control.

Inputs: the displayed elementary construction; the named local script, evidence, and monitor. No external source or solver theorem.
