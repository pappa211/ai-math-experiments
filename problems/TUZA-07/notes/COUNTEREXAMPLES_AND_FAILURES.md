> Curated historical source note. Its original status statements refer to the discovery stage. Current formal status and public paths are given in [STATUS_AND_PROVENANCE.md](../../../STATUS_AND_PROVENANCE.md). Internal AI review is not external human peer review. Operational paths are omitted.

# TUZA-07 failures, corrected statements, and exact witnesses

None of these witnesses is a counterexample to Tuza.

1. **An arbitrary old cover is not a minimum old cover.** H is the path 0-1-2; G adds02. C={01} covers H and already covers G, so c=0, but C has excess1 over tau(H)=0. With P={012}, F={01,12}, ell=0, sigma(G)=1 whereas the uncorrected accounting RHS is2. Charge the excess or require a minimum cover. Exact record (historical source reference); review (historical source reference).

2. **Triangle-free old spokes cannot be placed into a minimum old cover at zero cost.** An early third-addition proof attempted this and was retracted. The accepted proof pays for every edge outside old triangle supports explicitly. See [corrected proof](GAIN_ONE_THEOREM.md).

3. **K5 three-star avoidance is false.** Remove01,02,03 from K5. The remaining nonempty triangle support is K4{1,2,3,4}, hence nu=1,tau=2, compared with original2,4. Any original cover containing all three removed spokes needs five edges, one above the original minimum. Witnesses (historical source reference).

4. **Scalar slack and footprint size do not determine compatibility.** In K4 both adjacent and opposite two-edge footprints start at sigma=0 and have size2. The adjacent pair causes no packing loss but forces cover size3 if both prescribed edges must be included; the opposite pair causes packing loss1 but is itself a minimum cover. In K5 a three-star and a three-edge path both have size3, but losses1 and0. The path-plus-disjoint-edge pattern has loss1 and admits an original minimum cover containing its footprint. All 64 K4 and 1024 K5 deletion profiles (historical source reference).

5. **Equality converse needs support-disjoint spokes.** H consists of K4{0,1,2,3} and K4{0,4,5,6}. Add41,42,43. The six pages from4 over the first K4 occur, but spoke04 already belongs to the second block. H has(nu,tau)=(2,4); G has(3,5), not(3,6). The accepted rigidity theorem explicitly excludes this overlap. Exact witness (historical source reference).

6. **Two-apex loss cannot always be discarded without cost.** H=K4; two nonadjacent new vertices both adjacent to all four old vertices give K6 minus an edge. Four selected new triangles can have a C4 old footprint; deleting that footprint loses one old triangle. Discarding only one selected triangle leaves a three-edge path footprint, still losing that old triangle. The graph itself has(nu,tau)=(4,5), so has ample slack. This refutes a normalization shortcut, not the extension conjecture.

7. **A local cover saving can miss outside triangles.** In the preceding K4/two-apex graph, replacing apex spokes by all six old K4 edges covers internal pages. Add a new vertex6 with edges06 and46. Triangle046 avoids those six cover edges. Outside attachments must remain in the state. Exact graph and missed triangle (historical source reference).

8. **Connected tight-wedge padding hides the full conjecture.** Attach a fresh diamond along an outer edge of X. Both nu and tau increase by1, while a designated open wedge blocks all maximum packings of the enlarged graph. First choose a violating triangle component X of a hypothetical counterexample. Repeating d times turns that deficit-d component into a tight graph with one triangle component and such a blocker. The enlarged graph contains X as a proper subgraph, so hereditary-Tuza critical ancestry distinguishes it. [Full proof](PADDING_OBSTRUCTION.md).

9. **Do not infer four-addition equality from the proved inequality.** Removing old block supports need not leave cover number4 merely because the whole graph has cover gain4. Interacting new triangles and choices of old minimum covers have not been eliminated.

10. **No general iteration has been proved.** A one-apex extension or edge addition may leave a positive-slack graph whose triangle components are no longer K4/K5. Reusing block compatibility there would assume the missing theorem. Individually cover-preserving deletions also cannot be unioned without a simultaneous cover argument.

11. **K4-free alone supplies no fixed proportional strict margin.** HKT's triangle-free-core cones approach the factor2 bound. The relevant source is fractional stability and its examples; integral tightness cannot be substituted into a fractional-cover hypothesis.

Serious failed ideas and precise remaining branches are also recorded in route B limits (historical source reference) and route A candidates (historical source reference).
