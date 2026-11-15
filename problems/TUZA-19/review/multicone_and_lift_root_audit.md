# Root reconstruction: independent multi-cones and optimal odd-cover lifts

Ordinary parent-context AI reconstruction during TUZA-19. This is distinct from fresh-context review and from formal verification. No historical originality claim.

## Independent multi-cone exclusion

Input `notes/independent_multicone_tf_exclusion.md`, SHA-256 `18aba1671b088d58ab73235d24a66df95ccc45b8bb34dc0b6e2efd43185fc934`.

The complete triangle classification and the replication argument reconstruct without a gap. Conditional on selected rim edges F, every apex must use a minimum vertex cover of the same graph R-F. Copying one such cover to all apices preserves cardinality. A selected rim edge incident with that cover would then be removable; triangle-freeness of R is exactly the premise ensuring that no old rim triangle is uncovered. Thus each minimum cover has loads only1 or2 and TF fails for every actual triangle. Connectivity is unnecessary for this conclusion; the parity formula correctly switches complement choices separately by rim component.

The matching formulation and all three two-apex identities also reconstruct. In Proposition B, both endpoints miss color a, so absence of uv in color b would augment the original packing; its occurrence in b then isolates that edge. In Proposition C, opposite missing colors force endpoint degree one; a color switch on separate path components would augment. The common path therefore has even length and closes an odd cycle. The corrected n-2 bounds for either parity of n follow from the appropriate vertex deletion identity. None of these identities is claimed to classify every resilient rim.

## Optimal odd-cover two-lift obstruction

Input `notes/fresh_global_odd_lift_transfer.md`, SHA-256 `f687a25e945b476b0220d1635de593ba92c73624242f5d211922cf3b8381ee8a`.

Root reconstructed the arbitrary family n=4r+1, r>=2, including actual triangles, both optima, all minimum odd covers, the voltage switch, and connected amplification. The n>=7 triangle classification excludes the short wraparound exceptions. Triangle conflicts are exactly C_n. A minimum odd cover has k rims and one chord by the summed odd-load bound, so complementary voltage has odd rim sum exactly when k is even. The resulting cover is C_(2n)^2; this does not assume that an arbitrary two-lift is two disjoint copies. The lifted odd cover and packing both have size n, and the base's one-edge versus two-edge deletion distinction follows from the stated conflict paths.

The connected vertex-sum amplification has no additional crossing triangles, either downstairs or upstairs: different blocks share only the fibre vertices and no edges. Therefore the additive defects sum. The alternative voltage x=C has odd triangle sums and kills triangles but preserves odd lifted rim cycles, so bipartiteness is correctly not claimed.

The separate Klein-bottle finite case was read for scope only; root did not rerun or independently reconstruct its quotient enumeration. Its producer records an independent recursion confirming the decisive two-edge blocker. It is not an H-O2 counterexample. The arbitrary cycle-square result above needs none of those finite surface calculations.
