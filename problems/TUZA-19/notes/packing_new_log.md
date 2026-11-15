# Reactivated packing lane — TUZA-19

Original start01:53:58Z, research cutoff09:23:58Z, hard deadline09:53:58Z are unchanged. Reactivation clock read04:32:20Z. Requested Astra/Ultra controls remain as originally set; no independently exposed serving identity is claimed. Local Darwin execution only; archives read-only.

## DY-J exact gate

Operation: simultaneously Delta-Y every triangle of a specified maximum packing, with the opposite-spoke edge bijection. H is triangle-free. Proposal: for connected graphs with even nu, some maximum packing admits an inverse-covering T-join of cost<=2nu with odd boundary exactly at the new centres. A positive availability theorem would prove unrestricted Tuza via a vertex sum of two copies (then componentwise). The analysis specified the parity and cover conditions before the first literal K5 test; the full written gate was frozen after that test.

Consequential test: K5, which meets edge-cover-criticality and two-edge packing resilience. All15 maximum packings are symmetric. The exact16-state T-join space contains seven inverse covers, minimumsize6>4. Thus the availability gate is false for every maximum packing. This is stronger than a failure of a local algorithm: arbitrarily long neutral cycle moves preserve the wrong boundary condition.

Structural amplification: a connected bouquet of m K5s has nu2m,tau=pi4m, satisfies both criticality assumptions, but needs6m edges in any inverse-covering T-join with old vertices even. Even after jointly choosing the maximum packing and a factor-two cover, its minimum old boundary size is2ceil(m/2), so a fixed number of parity terminals cannot repair the model. A free-boundary model is not refuted, but no cover transfer for it has emerged.

The exact Delta-Y correspondence also shows why ordinary cycle blocking is not the same problem: a selected packed edge maps to the third spoke OUTSIDE the lifted cycle. Triangle-free edge choices fail ordinary matroid augmentation already on K4. This does not rule out richer matroid-parity encodings; their additional transfer is the missing theorem.

Evidence/proof: notes/packing_new_delta_y_gate.md; checks/packing_new_delta_y.py; evidence/packing_routes/packing_new_delta_y.json. Producer check PASS:15 maximum packings,16 parity states each,56 deletion controls,5 bouquet instances. No further census is planned. No unrestricted proof or counterexample is asserted.
