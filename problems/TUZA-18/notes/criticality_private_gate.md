# Private-only matching gate: known decisive failure

Status: REFUTED_KNOWN_INPUT. This is not a new TUZA-18 theorem or counterexample.

Candidate PM-all said that every minimum triangle-edge cover C of every finite simple graph G satisfies |C|<=2nu(T1(C)), where T1(C) consists of actual triangles meeting C in exactly one edge. Existential PM asked for some minimum C. Either would imply Tuza directly.

Before the archived decisive example was identified, `checks/criticality_private_matching.py` tested the installed graph-atlas corpus, including every minimum cover of each tested graph. Its saved result is `evidence/criticality_private_matching.json`: 1245 graphs with at least one edge, no failure, runtime about 0.46 seconds. No atlas-completeness claim or positive universal evidence is drawn from this survival. The prior mission had already observed the same small-corpus survival.

The coordinator then identified the exact frozen no-go source, read in full:

    repository/ai-math-experiments
    commit d4029fbafc3dffc250b50ed237ad81c3206cd1a0
    problems/TUZA-11/arguments/CLEBSCH_PRIVATE_OBSTRUCTION.md

Let H have vertices F_2^4, with x adjacent to y iff x xor y lies in {1,2,4,8,15}, and let G be its cone with apex 16. The source gives complete ordinary arguments, supported by exact finite certificates, for:

    nu(G)=8, tau(G)=11;
    exactly 16 minimum covers C;
    nu(T1(C))=5 for EVERY minimum C.

Each minimum cover consists of the eleven spokes outside one of the sixteen five-vertex neighborhoods of H. Thus 11>2*5 refutes both PM quantifiers while 11<=2*8 confirms ordinary Tuza. The all-minimum-cover classification, not merely one chosen cover, is essential.

The source's full proof was inspected here; its old 65536-subset computation was not rerun by this track. Its hash is included in `evidence/criticality_sources.json`. General one/two-red eligible-triangle mechanisms are distinct: they retain multiply-hit triangles that private-only PM excludes. The archived TUZA-14B sources were read for that distinction, not taken as a proof of unrestricted S/E.

Decision: abandon private-only PM. Any renewed cover-based mechanism must explicitly use multiply-hit triangles or additional cover states; repeating the small corpus cannot repair the failed existential claim.
