# Supported-link slack (SLS): frozen auxiliary assertion

Frozen 2026-11-04T01:08:25Z, before this follow-up's tests. Original TUZA-17 start/deadline remain 00:45:12Z/02:45:12Z; subtask development deadline 01:28Z. This is the same Track A agent with inherited context, not independent criticism and not a new campaign. No earlier frozen A proof is edited.

Let H be a finite simple graph whose actual triangles are rainbow under an edge colouring with three colours. Let X subset V(H), and suppose L=H[X] is triangle-free. Let L_old be the spanning subgraph on X containing exactly those L edges that lie in at least one actual H triangle. Write nu(H), tau(H) for triangle packing/edge cover, and D(H)=2nu(H)-tau(H).

**SLS:** There exists a MINIMUM triangle-edge cover C of H such that

    vc(L_old-C) <= D(H).

C deletes only its edges from L_old, not their endpoints. The quantifier is existence among all minimum covers; one bad minimum cover does not refute it. This is a stronger proposed intermediate lemma, not a replacement or patched definition of AC. Any counterexample must verify eligibility, every minimum-cover obstruction, and exact D.

## Why this would imply AC

Let z be the apex with neighbourhood X and G=H+zX. Every edge of L_new=L-L_old lies in no H triangle. Any matching in L_new therefore appends its apex pages to every H packing, so mu(L_new)<=a=nu(G)-nu(H). The endpoints of a maximum matching cover L_new, giving vc(L_new)<=2a. Combining this vertex cover with the SLS vertex cover gives vc(L-C)<=D(H)+2a, which is AC. This implication assumes SLS, not vice versa.

## First probes and possible obstruction

The assertion spends only existing slack on link edges already supporting old triangles. Tight K4 components and D<=1 packing-essential cases are already being handled elsewhere. Probe colourable H with overlapping old triangles, supported link cycles or matchings, and a genuinely incompatible minimum-cover choice. Full induced-link triangle-freeness must be checked: taking a convenient triangle-free edge subset of H[X] is not eligible. A counterexample to SLS may still satisfy AC through positive apex packing gain.

No heavy computation is authorized for this scout yet. Begin with symbolic constructions and inspect existing raw graph records. Any decisive witness will be independently reconstructed.
