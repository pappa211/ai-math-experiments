# Primary-source stress test and finite-certification boundary

## What the source supplies

Baron–Kahn, *Tuza's Conjecture is Asymptotically Tight for Dense Graphs*, arXiv1408.4870v2, CPC25(2016),645–667, Sections2–4: choose a triangle-free regular c-fair graph H on t vertices, join two copies, replace each vertex by a clique of order a, and retain cross-clique edges independently with probabilities p=(1−c)/(2cd), q=(1−c)/(2ct). Clique edges remain. For fixed c=alpha/6 and a sufficiently large, the construction has tau>(1−o(1))m/2 and nu<(1+alpha)m/4. A fractional cover weights clique edges1, external edges1/2, internal edges0. The difficult lower cover bound uses regularity and fairness, not an enumeration/classification of exact finite minimum covers. The fairness lemma uses sufficiently large Alon graphs; the proof gives a finite random construction recipe and existence, but no certified small instance or exact integer optima. [Primary paper, especially printed9–12](https://arxiv.org/pdf/1408.4870v2).

Local PDF and download hash: evidence/literature_sources.json. Printed9 was visually rendered and inspected. The primary theorem is not treated as a current general bound on Tuza, only as the stated construction theorem.

## Exact finite second-order test reconstructed here

These are our deductions, not statements claimed from Baron–Kahn.

For a particular finite realization, write v,i,e for its numbers of clique/vertex, internal, and external edges, and m=v+i+e. The displayed fractional cover is an EXACT feasible cover with total

    W = v + e/2.

Indeed, a triangle with a vertex edge has weight at least1. A triangle without a vertex edge either projects to a triangle in one copy of H, impossible, or uses exactly two external edges, hence has weight1. Therefore nu<=floor(W), independently of asymptotics.

For a certified minimum C, let lambda_C be the smallest number of all-red members among full maximum packings. Removing those members gives

    loss(G,C) <= lambda_C.

Equality is not asserted: a maximum eligible packing need not extend to a full maximum packing. If allowance=0, loss=0 iff lambda_C=0. Counting all-red triangles alone does not determine lambda_C or loss: triangles can mutually overlap, and candidate replacements may consume already used blue or red edges.

A valid finite S-refutation route would supply an actual minimum cover C, an exact tau certificate, and a feasible fractional cover u of ONLY the eligible family with value U satisfying

    floor(U) < ceil(tau/2).

Weak LP duality would then certify the required eligible packing upper bound. A uniform version over ALL minimum covers would be required to refute E. An asymptotically large cover or a guessed cut complement is not enough.

The source's original fractional cover has W approximately (1+3c)m/4. If a finite rigorous lower bound tau>=(1−epsilon)m/2 were available, it would only yield

    allowance <= floor(W) − ceil(tau/2)
              <= W − (1−epsilon)m/4,

approximately (3c+epsilon)m/4. This is an UPPER bound on allowance; its nonnegativity is not assumed, since that would already assume Tuza. An eligible dual refutation would have to lower W by roughly this second-order quantity, with exact integer rounding, while keeping every eligible constraint. No relation in the consulted construction proves that deleting all-red constraints permits that saving. No exact finite minimum-cover structure needed to establish it is supplied.

Conversely, proving lambda_C<=allowance for every optimum C would suffice for S, but neither an asymptotic packing estimate nor the total number of all-red triangles supplies that arrangement-sensitive bound. For E one could select a favorable optimum, but the regularity reduction acts on approximate maximum triangle-free subgraphs; it does not select an exact minimum cover with a specified eligible packing.

## Why the new small-gap LP theorem does not settle this construction

The distinct lemma proved in TRACK_B gives

    k(G,C) >= ceil((3 tau* − tau)/4),

where tau* is the full fractional cover optimum. Its simple S regimes require an additive integrality gap delta=tau−tau* below4/3 (even tau) or2/3 (odd tau). Here tau*<=W. The displayed asymptotic estimates imply

    delta >= tau − W
           >= ((1−2epsilon−3c)/4 + o(1)) m,

when expressed with a valid small epsilon and fixed small c. Thus the gap is of order m, rather than bounded by those constants. This shows concretely why that restricted mechanism does not reach the intended dense near-two regime. It does not refute S/E.

## Feasibility verdict and switch

**FINITE SECOND-ORDER TEST NOT CERTIFIED FROM AVAILABLE INFORMATION.** We reconstructed an exact dual test and its missing inputs, read the actual construction and minimum-cover argument, and did not label random dense samples as Baron–Kahn extremal instances. No practical finite c-fair parameter/realization with certified tau, all optimum cover structure and nu was obtained within this mission. This is a certification limitation, not a claim that finite realizations do not exist.

The finite work therefore switched to exact high-ratio clique interactions, retained hard seeds and their unreduced perturbations. It also produced a rigorous connected near-two K4-attachment family with positive loss exactly exhausting allowance. That family is an analytically transparent control, not a proxy for the dense construction.

## Haxell–Kostochka–Thomasse scope

The actual near-two integral examples in the introduction of their fractional-stability paper add a universal vertex to a triangle-free graph with small independence number. These are K4-free, generally nonflat cones. In contrast their flat theorem assumes each edge lies in at most two triangles and gives tau<=3nu/2 for K4-free graphs. [Fractional stability, printed2](https://perso.ens-lyon.fr/stephan.thomasse/liste/fractuza.pdf); [flat theorem, printed2](https://perso.ens-lyon.fr/stephan.thomasse/liste/packplanar.pdf).

Our independent cone exclusion explains why those particular integral near-two examples cannot falsify S: a selected rim edge plus both selected incident spokes would contain redundant selected edges. Every triangle is eligible under every optimum cover. This does not say every nonflat K4-free graph is a cone, that every such graph is automatic, or that near-two graphs must contain K4s. The new bounded small nonflat K4-free perturbations did not reach the hard ratio; that search gap is reported, not concealed.

Historical novelty of all new deductions is UNESTABLISHED. No public breakthrough or literature-priority claim is made.
