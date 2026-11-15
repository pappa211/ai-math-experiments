# Concentration obstruction: reviewed proof clarification

This addendum leaves the frozen producer proof unchanged at SHA-256 `7faef08e207c5ef9dbfd58cc3b42820bb42012a451ce9932a7f68e8b598296c4`. Read it with [the original statement](packing_routes_concentration_obstruction.md) and the independently authored [fresh audit](../review/packing_concentration_fresh_audit.md). The exact obstruction survived fresh-context AI reconstruction and an independent literal/profile verifier; no human or Lean review is claimed.

The audit correctly objects that the original paragraph's coarse incidence bounds and total incidence nine, BY THEMSELVES, do not establish F0<=15. The same paragraph's alternative exhaustive twenty-case argument is valid and was implemented, but the following direct calculation replaces the insufficient shortcut.

If the central core face is acy, let r be the number of the two chosen K4 faces containing y. They are abx or bxy, and cdw or dwy. The a,c incidences are 2-q1,2-q2 with q1+q2=r; y has incidence1+r, b,x,d,w each have incidence1, and z has incidence0. Therefore F0=13-r+r^2, which is13,13,15 for r=0,1,2.

If the central core face is acz, let I_a,I_c indicate that the corresponding K4 face contains a or c, and let r count K4 faces containing y. Total incidence is nine. Only a,c,y can have incidence exceeding one, and their excess-square contributions give

    F0 = 9 + 2 I_a + 2 I_c + r(r-1) <= 15.

This proves the needed bound directly from the actual maximum-packing structure. All subsequent concentration and equality arguments remain unchanged.

The fresh audit additionally records exact multiplicities: there are20*15^6=227,812,500 maximum packings, exactly2*3^6=1,458 square-sum and lexicographic maximizers, and exactly3^6=729 all-type1 maximizers. All729 fail the canonical-centre quotas. It also proves the witness's unrestricted cover number is29, equal to the support minimum. The producer's weaker explicit29-cover already sufficed to distinguish the auxiliary failure from a Tuza counterexample.
