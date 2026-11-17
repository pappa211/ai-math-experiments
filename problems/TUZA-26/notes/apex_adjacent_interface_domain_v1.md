> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Frozen complete adjacent-blocker interface

Freeze BEFORE main exact run, TUZA-26. Conditional universe: minimum unknown Q has minimum degree at least four, every edge eligible, and an adjacent blocker pair whose resilient residual has exactly one frozen C12 support C. The separate all-size geometry/domain lemmas license this universe. This finite work does not supply a blocker or settle the no-blocker branch.

Write the restored pair ab,ac and r=nu(C). Then nu(Q)=r+1,tau(Q)=2r+1. Saturation/resilience makes each one-edge deletion have packing r+1 and cover2r. All C12 models and actual triangles remain fixed.

**Zero outside terminals.** All three lie in C, and universality forbids hidden internal background. Q=C+{ab,ac}. Each individual insertion has nu=r+1,tau=2r. The complete independently checked210 interface gives only nonedges24,25,34,35 in double-K4 C=0123 union0145. Their four adjacent pairs form the entire case; exact controls give nu3,tau4,mindegree3 for each. They fail the required defect-one profile and minimum degree four.

**One outside leaf.** If c is outside, Q-ac has exactly C+ab's triangle family: the old c-neighbor set is independent and excludes a, so inserting ab cannot create a c-triangle. The same210 table forces C=double-K4, whose independence number is two. Thus c has at most two old neighbors plus restored ac, contradicting minimum degree four. This case needs no larger enumeration.

**One outside common center (main domain).** If a is outside, its old neighbors form an independent set I in C excluding b,c. Put A=I union{b,c}. The ENTIRE graph is C plus fresh a adjacent precisely to A. Every C12 has independence number at most three; minimum degree four forces |I|2 or3 and |A|4 or5. Enumerate EACH frozen C12 and EVERY A of size4/5 admitting some pair b,c with A-minus-pair independent. Merge duplicate restored-pair choices because Q depends only on A; record both labelled-neighborhood and pair-presentation counts. No old background is omitted: it is exactly aI; old internal C edges are fixed, and prior confinement excludes other outside vertices.

The domain phase verifies alpha(C)<=3 and applies only necessary structural filters: minimum degree4, every new apex edge triangular (C[A] has no isolate), and three-vertex-connectivity. Every rejection records a concrete vertex/unsupported edge/separator. Every new triangle meets old C in its base edge, so surviving triangle support is connected automatically.

**Exact protocol.** For these candidates,

    nu(Q)=max over matchings M in C[A] of |M|+nu(C−E(M)).

This is an exact apex decomposition including old triangles. Since |A|<=5, M has at most2 edges. A single edge gives r+1 by C resilience. Any two-edge matching with nu(C−M)=r gives r+2 and rejects the required blocker profile. Precompute exact old pair optima and actual old packing witnesses. If every two-edge matching loses one old unit, the displayed formula proves EXACTLY nu(Q)=r+1. Only those profiles need exact cover. Completed recurrence returns a minimum cover; a20-second timeout remains UNKNOWN and prevents a complete exclusion. Any defect-one survivor receives full exact all-single-deletion and support certificates, and is not silently added to C12.

Implementation scripts/apex_adjacent_interface.py has separate domain and exact phases. First generate/freeze literal domain output, inspect counts and timing, then start exact. One serial pinned local-Mac process, no installation/full graph census. A separately authored checker must regenerate the domain, validate structural rejection certificates and matching witnesses, and independently resolve any exact-cover survivors before promotion. The ordinary all-size confinement and its premises require independent review regardless of finite absence.
