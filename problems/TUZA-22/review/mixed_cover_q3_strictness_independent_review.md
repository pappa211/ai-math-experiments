> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Independent review: strictness from a three-page triangle core

Verdict: ACCEPT as an ordinary all-size equality restriction, conditional only on the previously reviewed ordinary tree/triangle compatibility construction and two-full-apices packing lemma. This is not a complete equality classification.

Frozen source: `notes/challenger_mixed_cover_q3_strictness_v1.md`, SHA256 6229a1dda3d92af4b00f900ebd61d85ef8a56ff621628bf48b3560c548450dde. Reviewer: source_audit, 2026-11-16 UTC.

I reconstructed the exchange by first fixing the actual conflict geometry. Every external-conflict component has exactly two assigned core labels, and every selected page from a given label lies on the same side. Thus omitting all selected pages of a designated q3 triangle imposes only requirements u_i=1 on q2 cores. Requirements from free components can always be met, including choosing the empty side for an isolated page. Multiple requirements at the same q2 core agree.

If the q2 target graph contains a cycle, each core spends both of its distinct full-apex slots on its two cycle neighbors. The entire collection is target-closed. Two pages per core therefore form a packing whose members cannot conflict with any page assigned outside that collection: an actual conflict requires reciprocal targets. Combining with the unchanged familywise construction pays cost 3k with 2k members, strictly. This argument is valid for even cycles as well as odd cycles and does not rely on a residual graph having additive covering numbers.

After excluding cycles, the q2 target graph is a union of paths and isolates. Under assumed equality, the finite fair distribution of compatible packings must have every positive-probability outcome maximum: its expectation is at least c/2, where c is the sum of local cover costs, while tau <= c and every outcome has size <= tau/2. Thus c=tau and every fair-sign/free-orientation assignment may be used in an equality argument.

Consistent omission requirements leave the designated q3 core's internal triangle unused and permit it to be appended. That internal triangle is edge-disjoint from all other families, including their external pages, because an external page assigned elsewhere has at most one vertex in this core.

For inconsistent requirements, two required cores lie on opposite sides of one path. Each has a full apex in the designated triangle, so its target degree among q2 cores is at most one. They are therefore the two endpoints of the entire path, with an even number k >= 2 of cores. Endpoints use their remaining apex in the path and interior cores use both apices there. This proves full potential target closure in the path plus the designated triangle; it remains true after resampling pages for the two-full-apices lemma. The reserved 2k pages plus the designated internal triangle are mutually compatible and have no conflicts with any remaining family. Their surplus over half the local cost is (k-1)/2 > 0.

I also checked the subcollection issue: the accepted construction applies to the remaining assigned families with their original local costs and local packings. Removing families cannot create a conflict, while a newly broken target path is still handled by coherent signs. No induced-graph or cover additivity premise is required.

Consequences accepted: a tight graph with any supplied tree/literal-triangle cover has no cost-three q3 component, no q2 target cycle, and no cost-one triangle component (its internal triangle already gives local surplus). Cost-two triangle families and q2 paths meeting larger tree components remain unresolved by this note. No minimum-cover assumption, finite census, or general CS assertion was used.
