# Frozen Track B addendum 1: small-budget bound to four

Joint coordinator/scout deduction, 4 November2026. This supplements, and does not overwrite, B_FROZEN_v1.md. Exact AC is unchanged. No independent-final or Lean verification claim.

**Lemma.** For any triangle-free graph F with matching number m>=3, vc(F)<=2m-2.

**Proof.** Take a maximum matching M and let U be its unmatched vertices. For EVERY matched edge uv, at least one of u,v has no neighbor in U: if both did, two distinct neighbors would form an augmenting path of length3, while a shared neighbor would form a triangle. Choose one such endpoint from each edge of M, producing a set W of m vertices with no neighbor in U. Since F is triangle-free and |W|>=3, some pair x,y in W is nonadjacent. The set V(M)\{x,y} is a vertex cover. Indeed M is maximal, so U is independent; x and y have no neighbors in U and are nonadjacent to each other. This cover has size2m-2. QED.

More precisely, for this W, every independent I subset W gives vc(F)<=2m-|I|. This refinement is recorded only as an elementary bound; no Ramsey or global structural theorem is invoked.

**Corollary.** Exact AC holds whenever b=2nu(G)-tau(H)<=4.

**Proof.** As in the frozen proof, m=matching(L)<=b. If m=b, AC-saturation supplies a minimum cover. If m=0, the link is empty. Otherwise m<b<=4, hence m<=3. For m=1, vc(L)<=1; for m=2, vc(L)<=3; for m=3, the lemma gives vc(L)<=4. In each possible branch the corresponding value is at most b (m<b forces b>=m+1). Thus any minimum H cover works. QED.

**Sharper surviving necessary window.** Every AC counterexample must have b>=5 and m>=3 with

    2m-2 > b,  m <= b-1.

The first numerical possibility is b=5,m=4,vc(L)>=6. This is necessary arithmetic only, not proof such a link instance or AC counterexample exists. A disconnected union of two C5s has m=4 and vc=6, making it a literal link shape for a targeted probe; colourability of the complete H and all-minimum-cover failure would still have to be proved.

Evidence: the matching lemma is PROVED_ORDINARY and standard in spirit, with no originality claim. The AC corollary is PROVED_USING_PUBLISHED_INPUT through the saturated-matching theorem's Aharoni/HNS dependencies. Full AC remains unresolved.
