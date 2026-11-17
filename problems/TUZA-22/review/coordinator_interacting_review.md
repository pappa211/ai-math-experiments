> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Fresh coordinator review of the interacting Clebsch-cone family

Verdict: ACCEPT the ordinary proof using declared TUZA21 inputs. The source proof is notes/challenger_interacting_clebsch.md. I reconstructed the cover restriction argument, private maximum characterization, and extension obstruction independently. No original Clebsch census was rerun.

Gluing on exactly one actual rim edge produces no triangle spanning exclusive vertices of the two pieces. Cover restriction is therefore exact. A cover containing the shared edge must cost at least12 in each piece, by the inherited classification of all minimum cone covers, and hence at least23 after sharing. Covers omitting it cost at least22, attained by every pair of eleven-spoke covers. Thus the256 stated minimum covers are exhaustive. Private family restrictions have packing upper bound5 each; Hall after removal of one prescribed cut edge gives a matching of size5 avoiding the overlap. The all-cover private optimum is10.

For any maximum privateQ, each piece contributes exactly5 and leaves six unmatched link vertices. Their induced graph has at least two edges: zero contradicts alpha5; exactlyone would extend an independent five-set by a vertex with onlyone neighbor, contradicting the declared neighborhood characterization. The otherpiece Q can block only the common rim edge. Each piece therefore retains an actual triangle. If one extra triangle avoids the shared edge, the other piece still has a triangle. If it contains the shared edge, noQ used that edge, so the otherpiece had at leasttwo residual rim edges and retains another after the added triangle. Hence one extra is insufficient for full maximality and every extension has size>=12.

Minor wording clarification only: the first extension case means R DOES NOT CONTAIN the shared edge; every triangle of either case also has nonshared edges. This does not affect the proof. Fullnu16 follows by choosing one of the five explicit Clebsch perfect matchings avoiding the overlap independently in bothpieces. This is a successful scoped all-quantifier D mechanism on an interacting private-deficient noncone, not a D or Tuza counterexample.

Reviewed source SHA256: 3a46a373107e4d16480f783520c1232765ae2e02fe7c4a44f9d8fdfc118b49ce
UTC: 2026-11-15T22:06:05.776452+00:00
