> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Matching deletion at defect three produces a resilient defect-one residual

Frozen coordinated proof for independent review, 2026-11-16. This closes the resilience obligation left in `mixed_k4_separator_zero_gain.md`. It does not yet reconstruct or exclude the resulting smaller core.

## Three-edge restoration lemma

Let J be a finite simple graph in which every actual triangle lies in a literal K4. Let S be three distinct edges containing a two-edge matching, and let L=J-S satisfy B(L). Put m=nu(L), so tau(L)=2m. It is impossible to have simultaneously

    nu(J)=m+3,  tau(J)>=2m+3.

Every K4 of J containing a deleted edge contains at least TWO edges of S. Otherwise its surviving K4-minus-one-edge diamond would lie in one L triangle component, forcing its absent edge into that literal K4/K5 component. Every triangle lost by deleting S therefore lies in a K4 containing a pair of S edges.

Since S contains a matching of size two, its endpoint graph has exactly one of the following three forms.

### Case 1: three disjoint edges

Write S={ab,cd,ef}. Each pair determines a unique four-vertex K4, so there are at most three possible completion K4s. If all three exist, old triangles ace and bce occur in L and share ce. Their B component contains a,b and would contain the missing ab, contradiction. Thus at most two completion K4s exist. Every lost triangle lies in their union, and a packing uses at most one triangle from each K4. Hence nu(J)<=nu(L)+2.

### Case 2: a two-edge path and a disjoint edge

Write S={ab,ae,cd}, with five distinct displayed vertices. The disjoint pairs determine Q0=K4[abcd] and Q1=K4[aecd]. A K4 containing the adjacent pair ab,ae has form Q_z=K4[abez]. There is at most one such z. Indeed two distinct z,z' give old triangles bez,bez' in the same B component; that component forces zz' (if zz' were cd this is already a contradiction). The old edges az,az' then form the old triangle azz', merging a into the same component and forcing absent ab.

Thus again there are at most three possible completion K4s. If all Q0,Q1,Q_z exist, Q_z supplies old be; Q0,Q1 supply old bc,bd,ce,de. The old triangles bce and bde share be, so their B component contains c,d and would contain missing cd. Contradiction. Therefore at most two K4s contain all lost triangles, and nu(J)<=nu(L)+2.

### Case 3: a three-edge path

Write S={ab,bc,cd}, with four distinct vertices. We prove the COVER saving

    tau(J)<=tau(L)+2=2m+2.

Include the outer edges ab and cd. They cover every lost triangle except a possible bc-page bcz with z outside {a,b,c,d}. A K4 completing that page must contain another S edge; hence it is either K4[abcz] or K4[bcdz].

There is at most one external apex x of the first type. Two such apices x,x' give old triangles acx,acx' sharing ac; their B component forces xx'. The old edges bx,bx' then make bxx' an old triangle, merging b into that component and forcing the absent bc (also ab). Contradiction. Similarly there is at most one external apex y of the second type.

For the first type, choose a minimum cover of its old B component containing cx, which lies in the old triangle acx. For the second type choose a minimum cover containing by, which lies in the old triangle bdy. If both types occur, their components are distinct: otherwise that component would contain both b and c while bc is absent. Every edge of a literal K4 or K5 occurs in a minimum triangle cover, so these choices combine into a minimum L cover. They cover all remaining bc-pages. Adding ab,cd proves the bound. If the two apices coincide, the same argument still applies; the shared page is covered and the two components remain distinct.

This exhausts the endpoint forms and proves the lemma. Importantly, Case 3 uses a cover saving; a universal packing-gain bound of two is false.

## Matching-deletion resilience theorem

Let J have every actual triangle in K4, and suppose proper-subgraph CS holds for the graphs used below. Put p=nu(J) and suppose tau(J)=2p-3. Let M be a matching of two J edges satisfying

    nu(J-M)=p-2,  tau(J-M)=2p-5.

Then R=J-M is one-edge packing resilient (and already defect one by the displayed identities).

Proof. If an edge f were critical in R, then L=R-f would have nu(L)=p-3. Cover deletion gives tau(L)>=2p-6=2nu(L), so proper-subgraph CS makes L tight B. With S=M union {f}, the three-edge lemma applies. But

    nu(J)=nu(L)+3,
    tau(J)=2p-3=2nu(L)+3,

contradicting that lemma. Therefore no critical f exists.

## Connection to the zero-gain K4-separator branch

The hypotheses on M are exactly supplied by `mixed_k4_separator_zero_gain.md`: a final defect-one graph G with a fresh K5-on-K4 leaf, zero packing gain, predecessor J of defect three yields an opposite pair M from a J minimum cover with these exact packing/cover losses. Since a frozen-F predecessor has every triangle in K4, the theorem now supplies the missing one-edge resilience of R.

Triangle-component accounting under proper CS then gives exactly one defect-one component of R, with all other nonempty components tight literal K4/K5; that defect-one component inherits resilience. Taking its triangle-support graph supplies a strictly smaller connected supported resilient defect-one object. The full R, including background edges and attachment positions, must be retained for reconstruction.

The reduction does NOT assert that every triangle of this smaller component extends to a maximum packing, that it has a tight two-edge-resilient parent obtained by restoring a triangle, or that it belongs to frozen F. A classification hypothesis about smaller resilient defect-one graphs is still an availability premise. Reconstructing/excluding the original configuration from this component and its boundary is an unresolved obligation; the numerical descent is not itself a contradiction.

## Necessary negative control for the rejected stronger statement

Let J be the union of K4s on

    {0,2,4,6}, {0,1,2,4}, {0,1,2,3}, {1,2,3,5}, {1,3,5,7}.

Put S={01,12,23}. Then L=J-S has two literal K4 triangle components (plus background edges), with nu(L)=2,tau(L)=4. Exact checking gives nu(J)=5,tau(J)=6. Thus packing gain THREE is possible in the path case; the needed cover saving is present, and J has defect four. This refutes only the discarded packing-only surrogate, not the lemma proved above or the zero-gain profile.


## Dated supersession — 2026-11-16 16:55:54 UTC

The earlier local statement that matching reconstruction remains unresolved is superseded, at its exact conditional scope, by [Named-core matching reconstruction](mixed_named_matching_reconstruction_frozen.md). Together with the matching-deletion resilience theorem and the exact marked-edge component transfer, that proof excludes the zero-gain configuration when its smaller active component is named by the explicitly stated wider-class minimality. It does not supply a leaf region, prove broad rigidity/frozen-F availability, or prove unrestricted CS/Tuza. The earlier numerical/proof arguments are retained unchanged; consult the final reconstruction note and fresh critic receipt for authoritative scope and review status.
