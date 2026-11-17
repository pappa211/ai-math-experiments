> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Triangle-bearing subcubic four-branch links admit an ordinary CS exclusion

Status: ordinary all-size proof candidate, frozen for fresh review. The explicit small tables below are mathematical witnesses checked edge by edge; no census completeness or solver verdict is a proof premise. A tiny scratch search helped find them. The triangle-free corollary at the end has a separately declared WKE input.

## Theorem

A closed link component L of a minimum combined-CS failure cannot be subcubic, have at most four branch vertices, and contain a triangle.

The accepted three-branch theorem leaves exactly four branch vertices, each of degree three. Suppress their degree-two paths. Returning paths and prohibited parallel patterns have already been excluded. A connected loopless cubic multigraph on four vertices with no triple edge has exactly two possibilities:

- the simple K4;
- two doubled opposite pairs, joined by two cross edges.

For the second assertion, if a pair a,b is doubled, each endpoint has one remaining incident edge. Without a doubled opposite pair c,d, the latter two vertices would each require their edge cd and both connections to a,b, overloading a,b. Thus cd is doubled and the remaining edges form a matching between the pairs. By the parallel-thread theorem each double consists of one direct edge and one even nondirect path.

## 1. Three sufficient tuple forms

For the K4-free links occurring below, a matching P and vertex cover Q of L-P with |Q|<=|P|=s give a balanced residual K after deleting all hub spokes and P. Every residual block meets L in at most three vertices.

Any one of the following is therefore contradictory:

- **Strict:** |Q|<s.
- **Larger:** L has a matching Z with |Z|>=s+1. Its surviving footprint is at most one edge per block, so its hub triangles augment K.
- **Rim:** a fixed actual triangle T has an edge in P, and L-E(T) has a matching Z with |Z|>=s. Append its hub triangles and T. T contributes at most one surviving edge per block, because its selected P-edge is absent; Z contributes at most one. A disjoint pair would require four L vertices in a block. Thus the complete footprint is a star of at most two edges and augments K.

Every removed triangle is covered by P plus the hub spokes to Q, including arbitrary outside pages on P. Closedness of L covers all removed hub spokes. These are CS arguments, not automatic consequences of WKE alone.

## 2. Lifting the explicit witnesses

Replacing a nondirect path edge uv by u-x-y-v lifts P,Q as follows. If uv is in P, replace it by ux,yv and add x to Q. Otherwise an endpoint, say u, is in Q; keep the old matching, add xy, and add y to Q. Both sizes increase by one and all nonmatching edges are covered.

Any comparison matching Z also lifts by one edge: replace uv by ux,yv if it is selected, and otherwise add xy. Hence strict slack, a one-edge larger matching, and an equal-size rim-deletion matching are all preserved. In the rim case we subdivide no edge of the fixed triangle T, so its edge in P remains selected and the comparison lift takes place in L-E(T).

Consequently explicit bases for lengths2/3 (or1/2 where indicated) handle every original path of the same parity. This is a direct simultaneous witness lift for these three sufficient forms, not a universal CS subdivision theorem.

Notation in the tables: ij denotes the edge {i,j}; a listed path contains consecutive edges; 012 denotes the triangle on vertices0,1,2. In each row, the whole graph is exactly the stated core plus the displayed paths.

## 3. The simple-K4 suppressed kernel

Every L triangle uses three branch vertices: a triangle containing a degree-two interior vertex would require a second direct path between that thread's endpoints, contrary to this simple suppressed kernel. Label an actual branch triangle012. The fourth branch is3. The number of direct branch edges is3,4,5 or6.

### Three direct edges: triangle012 only

The three paths from3 to0,1,2 are nondirect. Up to permuting the triangle vertices, their parities are determined by the number o of odd paths. Use odd length3 and even length2 in the bases:

| o | paths | P | Q | sufficient form |
|---|---|---|---|---|
|0|3-4-0; 3-5-1; 3-6-2|04,12,36|1,2,3|Rim T=012; Z={04,15,26}|
|1|3-4-5-0; 3-6-1; 3-7-2|02,16,37,45|0,2,3|Strict|
|2|3-4-5-0; 3-6-7-1; 3-8-2|12,38,45,67|0,1,2,3|Rim T=012; Z={34,05,67,28}|
|3|3-4-5-0; 3-6-7-1; 3-8-9-2|05,12,34,67,89|1,2,3,4|Strict|

In every row P is a matching and Q covers all nonmatching core/path edges. In the rim rows Z is a matching of the same size avoiding all three edges of012. The table entries directly verify the sufficient forms. Lift along the three nondirect paths; triangle012 remains fixed.

### Four direct edges: triangle012 and edge03

The paths3-to1 and3-to2 are nondirect. Their three parity types have bases:

| parities | paths | P | Q | sufficient form |
|---|---|---|---|---|
|even,even|3-4-1; 3-5-2|01,34,25|0,1,3|Rim T=012; Z={03,14,25}|
|even,odd|3-4-1; 3-5-6-2|12,34,56|1,2,3|Rim T=012; Z={03,14,56}|
|odd,odd|3-4-5-1; 3-6-7-2|03,12,45,67|1,2,3|Strict|

The mixed case with reversed parities is obtained by interchanging1,2. Again all witnesses are direct edge checks, and lifting changes no edge of012.

### Five direct edges: core K4 minus01

The core edges are02,03,12,13,23, and the remaining0-to1 path is nondirect.

| path parity | path | P | Q | sufficient form |
|---|---|---|---|---|
|even|0-4-1|23,04|0,1|Rim T=023; Z={04,12}|
|odd|0-4-5-1|23,45|0,1|Larger Z={02,13,45}|

The fixed triangle023 is unchanged by path lifting.

### Six direct edges

The component is literally K4, with no remaining interiors, and is excluded by closed-link robustness. This exhausts the triangle-bearing simple-K4 suppressed shape.

## 4. Two doubled pairs and two cross paths

Label the doubled pairs01 and23, and the cross paths0-to2 and1-to3. Each double consists of a direct edge and an even nondirect path. A triangle can occur only when one of those even paths has length two: the direct branch edges and cross paths do not form a branch triangle.

Choose an actual short ear on01, with tip4, and fix T=014. The opposite even path on23 has base tip5 and may later be lengthened by two-vertex subdivisions. The cross paths use lengths1 for odd parity and2 for even parity. Up to symmetry there are three bases:

| cross parities | extra cross paths | P | Q | sufficient form |
|---|---|---|---|---|
|odd,odd|0-2; 1-3|14,25|0,3|Larger Z={04,13,25}|
|odd,even|0-2; 1-6-3|14,25,36|0,1,3|Rim T=014; Z={02,16,35}|
|even,even|0-6-2; 1-7-3|14,26,35|0,2,7|Larger Z={04,17,26,35}|

In addition to the displayed cross paths, every row has edges01,23,04,14,25,35. Direct checking verifies P, Q and Z, including the fixed triangle edge14 in P for the rim row. Lift the cross paths to their actual lengths and the opposite even path to its actual length, leaving the actual short ear014 fixed. Section2 preserves the indicated sufficient form.

This exhausts the second suppressed shape and proves the theorem. ∎

## 5. Corollary with a declared triangle-free WKE input

For a triangle-free subcubic link with at most four branches, the authenticated TUZA-19 all-size four-branch WKE theorem supplies a WKE tuple. The already accepted triangle-free WKE CS exclusion then removes that case. Together with the ordinary theorem above, this excludes EVERY subcubic closed link with at most four branch vertices.

The triangle-free corollary uses the historical complete finite WKE domain and the previously declared Kotzig input of the general triangle-free WKE mechanism. Those dependencies are not being relabeled ordinary or newly replayed here. The triangle-bearing theorem in Sections1–4 uses neither one.

In particular the one-cycle-cover leaf interface with parent link degree three is excluded: the accepted link-excess corollary makes its link subcubic with exactly four branches. Under these declared inputs, such a leaf's parent has link degree at least four. This remains a restriction on a hypothetical equality obstruction, not full CS for one-cycle covers or unrestricted Tuza.

## Verification scope

The displayed finite list consists of explicit parity witnesses within a proved two-topology reduction, not a census of graphs. A tiny local scratch matching search suggested the entries; every property needed is visible in the edge lists and the simultaneous witness lift. No optimization output is trusted. Fresh reconstruction is required before accepting the theorem.
