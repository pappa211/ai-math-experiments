> Historical research record, curated for the 17 November 2026 archive. Read the [final scope, corrections and evidence status](../PUBLICATION_STATUS.md) before using any claim. Earlier proposals and future-work decisions are historical; the series is now paused. Internal reviews are AI reviews.

# Parallel degree-two paths give a combined-CS exclusion

Status: ordinary all-size proof candidate, frozen for independent review. These configurations were reducible for the WKE inequality framework in TUZA-19; the argument here proves that they cannot occur in a minimum CS obstruction, with arbitrary outside pages included. No finite certificate is a premise.

## Statement

Let L be a closed link component at a vertex h of a minimum combined-CS failure G. A thread is a path whose internal vertices have degree exactly two in L; its two distinct endpoints u,v may have other link neighbors. Then the following configurations are impossible:

1. two internally vertex-disjoint nondirect u-v threads (each of length at least2);
2. the direct edge uv together with an odd-length nondirect u-v thread (length at least3).

A returning thread, which is a cycle containing only one branch vertex, is already excluded by the accepted link-vertex-deletion theorem. Consequently, after suppressing degree-two interiors, every branch pair has at most one nondirect path, and a direct edge may coexist with it only when that path has even length.

The theorem is not restricted to four branch vertices. It supplies the ordinary infinite reduction for that next target, without asserting that all remaining WKE kernels have a CS exclusion.

## 1. Boundary-selected reduction and footprint rules

Let U consist of u,v and the chosen thread interiors. Since all interior vertices have link degree2, L[U] is exactly the chosen path union, with at most the extra direct edge uv. Only u,v can have link neighbors outside U.

Suppose P is a matching in L[U], Q covers L[U]-P, {u,v} is contained in Q, and |Q|<=|P|=s. Delete all h-spokes to U and all edges P, obtaining K. The s hub triangles on P append to any K-packing. The set

    P union {hq:q in Q}

covers every removed triangle. Removed rim edges are selected directly. A removed spoke to an interior vertex has its other link endpoint within U; the tuple covers that triangle. Outside triangles on hu or hv are covered by hu,hv, since both boundary vertices lie in Q.

Minimum-CS accounting forces |Q|=s, B(K), and nu(K)=nu(G)-s. A strict tuple already gives a contradiction.

The chosen induced graph L[U], a cycle possibly with the single chord uv, has clique number at most3. Thus any residual clique block contains at most three U vertices, and any matching in L[U] contributes at most one surviving edge per block. A larger matching than s immediately augments K.

We will also use a safe selected edge f=ab in P whose two endpoints are internal vertices of a thread and which lies in no triangle of L[U]. Codegree at least two gives a page abz other than hab. Its apex z lies outside the whole N_G(h): an internal endpoint has only its two thread neighbors in L, and those neighbors do not complete a triangle on f. If a size-s matching M' of L[U] avoids f, the s hub triangles on M' and page abz are pairwise edge-disjoint. The page contributes at most one spoke per residual block because f was deleted. A block containing one of its endpoints cannot contain three U vertices, since those would make an L[U] triangle at that endpoint. Therefore a surviving matching edge and page spoke cannot be disjoint. The entire footprint is a star of at most two edges in each block, avoidable by a maximum K4/K5 packing. This appends s+1 triangles, contradiction.

This safe-page argument also applies when L[U] is triangle-free and only ONE endpoint of f is a degree-two interior vertex: the interior endpoint still forces the extra apex outside the whole link, while triangle-freeness limits every block to at most two U vertices.

## 2. Two nondirect threads: the parity tuples

Let their lengths be l1,l2, and let C be their union cycle, of order N=l1+l2. The possible extra edge uv is covered by Q because both endpoints are selected.

### Both lengths odd

Each path has a positive even number of interior vertices. Match those interiors consecutively within each path, leaving u,v unmatched. This gives |P|=N/2-1. Select u,v in Q; they cover the four path-end edges. Select one endpoint of each remaining nonmatching edge, giving |Q|=N/2-1 as well. (The remaining nonmatching interior edges are disjoint.)

The cycle C has a matching of size N/2, larger than P. Section1 gives a contradiction. Both paths have length at least3, so even the possible uv chord creates no triangle, although the general three-vertex block bound already suffices.

### One length even and the other odd

Orient the even path from u to v and match alternating edges beginning at u, leaving v unmatched on that path. Match the interior vertices of the odd path consecutively. The union P has size s=(N-1)/2. Select u,v in Q and one endpoint of each nonmatching edge not already incident with u or v. There are s-2 such edges, so |Q|=s.

The odd path has length at least3, and P contains an edge f joining two of its interior vertices. This is a safe edge: both endpoints have degree2 in the entire link, and their path neighbors do not form a triangle. The odd cycle C-f is an odd-order path and has a matching of size s. The safe-page augmentation of Section1 applies.

### Both lengths even, with at least one length at least4

Choose one of the two perfect matchings P of C by matching from u along the first path and from v along the second. Then s=N/2. The complementary matching has exactly two distinct edges incident with u or v. Select u,v in Q and one endpoint of each of its remaining s-2 edges. Thus |Q|=s.

On a path of length at least4, the chosen alternating matching has an edge f joining two interior vertices. It is safe. The complementary perfect matching of C avoids f and has size s, so Section1 again gives the augmentation.

### Both lengths are2, with uv absent

Here L[U] is C4. Use either perfect matching P and Q={u,v}, selecting the orientation in which both matching edges are path legs. The other perfect matching avoids any chosen f in P. One endpoint of f is an interior vertex. Since uv is absent, no link vertex completes a triangle on f, so the triangle-free variant of the safe-page argument applies.

## 3. The diamond: both lengths2 and uv present

Write the two internal vertices x,y, so L[U] has edges ux,xv,uy,yv,uv. If neither u nor v has a link neighbor outside U, this is a closed diamond component, excluded by the authenticated robustness lemma.

Otherwise rename u,v if necessary so u has a link neighbor z outside U. Use

    P={vx,uy}, Q={u,v}.

This is a balanced tuple and accounts for all outside pages on both boundary spokes. After its deletion, append the following three triangles:

    hvx, uvy, huz.

They are actual and pairwise edge-disjoint. Their surviving K footprints are respectively empty, {uv,vy}, and {hz,uz}.

A block cannot contain both uv and vy, because uy was deleted; it cannot contain both hz and uz, because hu was deleted. The only possible cross pair in a block is {uv,uz}, a star at u. Indeed uv with hz would require deleted hu or hv, vy with hz would require deleted hv or hy, and vy with uz would require deleted uy. Hence the entire footprint is a star of at most two edges per residual block. Avoid it and append all three triangles, contradicting the balanced two-triangle reduction.

This completes every case of statement1.

## 4. Direct edge plus an odd nondirect thread

The chosen union is an even cycle C of order N>=4. Match uv and match the even number of thread-interior vertices consecutively, giving a perfect matching P of size s=N/2. Select u,v in Q and one endpoint of each nonmatching cycle edge not incident with u or v, giving |Q|=s.

P contains an edge f between two thread-interior vertices, even when the thread has the shortest possible length3. It is safe, and the complementary perfect cycle matching avoids it. Section1 gives the same arbitrary-attachment augmentation. This proves statement2.

## 5. Exact reduction scope and provenance

A returning thread cycle becomes a nonempty tree component after its sole branch vertex is removed from the link, contrary to `link_vertex_deletion_cyclic_components_v1.md`. With loops excluded, simplicity permits at most one direct edge per branch pair. Any three parallel paths include two nondirect ones, now excluded. With two paths, the only surviving type is one direct edge plus one even nondirect path.

These are exactly the irreducible parallel types retained in the historical four-branch WKE finite domain. The present note upgrades the discarded configurations to CS exclusions, but it does not automatically upgrade the remaining 5375 WKE certificates or their subdivision lift to CS. The remaining four-branch equality problem stays open.

Historical prompt/provenance, read-only: `problems/TUZA-19/notes/root_four_branch_wke.md`, SHA-256 `67011b7544cd8d8c516a738572c10f5d828b5631c3d8ce491fcd08ae3f71ce99`. The parity tuples above are written out directly, so no historical finite certificate or compiler result is a premise.

Other dependencies are the accepted class-local M0/codegree/robustness, literal clique avoidance, and the accepted link-vertex-deletion theorem only for returning loops. No external matching theorem or computation is used.
