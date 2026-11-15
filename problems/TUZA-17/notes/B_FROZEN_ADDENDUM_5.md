# Frozen Track B addendum 5: final deterministic marked-ear reductions

The fresh internal critic supplied the simplification below. The earlier case-split proof in addendum4 is preserved unchanged as a valid, more complicated predecessor. This file is the final preferred statement: ONE explicitly determined smaller apex instance suffices. No packing-number oracle or two-branch recursion is needed. Exact AC is unchanged.

## Final K4-ear transfer

Let H contain Q=K4 on {u,v,a,b}, with N_H(a)={u,v,b} and N_H(b)={u,v,a}. Let X be any eligible marked apex neighborhood: H is rainbow triangle-edge-3-colourable and H[X] is triangle-free. Let G add z adjacent exactly to X. Put J=H-{a,b}-uv and X0=X intersect V(J).

If X intersects Q in exactly one old endpoint u and exactly one private vertex a (renaming endpoints/tips as needed), define Y=X0\{u}. In every other case define Y=X0. Then (J,Y) is an explicitly determined eligible smaller AC instance, and

    AC(J,Y) implies AC(H,X).

Thus AC failure for (H,X) implies AC failure for (J,Y). The map removes two vertices and six edges from H, and may remove one additional vertex from the marking only; it creates no new graph triangles. Both colourability and triangle-free induced-link eligibility are inherited.

**Minimum-cover identity and lift.** As proved in full in addenda3/4, tau(H)=tau(J)+2, and every minimum J cover C_J lifts to the MINIMUM H cover C=C_J union {uv,ab}. The normalization handles all covers: replace private Q-cover edges by uv and ab at no greater size. This identity is independent of the marking X.

**Nonexceptional marking.** Since H[X] is triangle-free, |X intersect Q|<=2. Outside the one-old/one-private pattern, selecting uv and ab removes every Q link edge; any surviving marked private vertex is isolated in the link. Therefore the residual link cost equals vc(J[Y]-C_J). Every packing in R=J+zY appends a Q face, because all Q-face edges are absent from R. AC(J,Y) consequently gives

    |C|+vc(H[X]-C)<=2nu(R)+2<=2nu(G).

**Exceptional marking.** Now X intersect Q={u,a}, and Y=X0\{u}. Let R=J+zY. Choose a minimum J cover C_J and residual-link vertex cover S supplied by AC(J,Y), so tau(J)+|S|<=2nu(R). The set S union {u} covers H[X]-C: it covers all remaining old link edges incident with u and the new leaf edge ua; S covers all other old residual link edges. Hence

    |C|+vc(H[X]-C)<=tau(J)+2+|S|+1<=2nu(R)+3.

Append the two actual triangles zua and vab to ANY R packing. They are mutually edge-disjoint. All their edges lie outside R: the za spoke and all a/b incident edges are absent since a,b were removed, and zu is absent because u was removed from the apex marking. Thus nu(G)>=nu(R)+2. It follows that the displayed cover cost is at most2nu(G)-1. This completes the deterministic reduction. QED.

The exact finite checks in `b_k4ear_allx.py` include both old-spoke stability cases and therefore also verify the stronger universal lower bound nu(G)>=nu(R)+2 for every exceptional marking: its saved R-without-endpoint-spoke is precisely this final R. The ordinary proof, not the finite run, establishes arbitrary order and outside incidence.

## Companion simplicial degree-two ear

This compact companion is recorded as one additional explicit operation, without starting a degree-by-degree program.

Suppose a is a vertex of H with N_H(a)={u,v} and uv is an edge. Let J=H-a-uv and Y=X\{a}; all old vertices remain. Then AC(J,Y) implies AC(H,X).

Indeed every H cover normalizes to include uv instead of any private ear edge, proving tau(H)=tau(J)+1 and that a minimum J cover C_J lifts to a minimum H cover C=C_J union {uv}. If a is in X, triangle-freeness permits at most one of u,v in X. Thus after selecting uv, the residual link differs from J[Y]-C_J by at most one leaf edge (and an isolated marked vertex otherwise). Its vertex-cover number is at most vc(J[Y]-C_J)+1. The triangle uva appends to every packing of R=J+zY, because its three edges are absent from R. Therefore

    |C|+vc(H[X]-C)<=tau(J)+1+vc(J[Y]-C_J)+1
      <=2nu(R)+2<=2nu(G).

If a is outside X, or has no marked old neighbor, the extra vertex-cover cost is zero. The map removes one vertex and three edges and preserves the AC class by restriction. QED.

## Scope and evidence

These two ordinary implications form a finite explicit reduction catalogue. Repeatedly applying them is well founded, but no theorem guarantees an applicable ear in every eligible remainder. Any smallest AC counterexample must avoid both configurations. No conclusion about arbitrary minimal Tuza counterexamples follows without an independently established eligible apex decomposition and an availability theorem for these or other safe operations.

Evidence: PROVED_ORDINARY for both counterexample-preserving transfer implications, with exact minimum-cover lifts. No Aharoni/HNS or unrestricted equality dependency. Historical originality UNESTABLISHED. New Lean NOT_RUN; independent_final_verification NOT_RUN. The deterministic K4 simplification is credited to fresh internal AI criticism, which is not the separately commissioned final audit.
