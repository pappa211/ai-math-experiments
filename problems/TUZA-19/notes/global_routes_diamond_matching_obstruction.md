# Why the exact square-cell matching gadget does not extend to one diagonal

Status: complete elementary obstruction for a precisely specified LOCAL matching interface. Root and global_routes independently derived the same alternating-path exchange. No unrestricted matching-reduction impossibility, no weighted-gadget impossibility, and no Tuza conclusion is claimed. This explains a remaining availability gap in notes/global_routes_square_cells_matching.md.

## Exact interface and the forbidden signature

A two-page diamond has one private graph edge shared by its two triangles. Label its four other graph-edge resources a1,b1,a2,b2 so that the two genuine triangles use resource pairs {a1,b1} and {a2,b2}. A triangle packing may choose no page or exactly one page. It cannot choose both pages, since their private edge is shared, and it cannot choose a cross pair that does not form a genuine triangle.

Consider a finite ordinary matching gadget K with four distinguished terminal vertices

    T={a1,b1,a2,b2}

and any finite set I of internal vertices. Its feasible-terminal-set family is defined by

    F(K)={ S subset T : there exists a matching of K
           covering EVERY internal vertex and covering EXACTLY the
           terminal vertices in S }.

This is a MATCHED-terminal convention. Terminals outside S are exposed. The equivalent boundary-deletion convention uses the complementary four-terminal sets; it is not mixed into the argument below.

The proposed exact diamond interface would require

    F(K)={ empty, {a1,b1}, {a2,b2} }.                    (1)

In particular, singleton/three-terminal states, all four terminals, and every other two-terminal state must be infeasible. The condition includes all matchings covering I; it does not merely describe a preferred subset of optimal or minimum-weight matchings.

## Elementary alternating-path obstruction

Suppose such a gadget exists. Let M_X and M_Y be feasible matchings for

    X={a1,b1},       Y={a2,b2}.

In the symmetric difference M_X triangle M_Y, every internal vertex has degree zero or two, because it is matched in both matchings. The same holds for terminals matched in both or neither. Each terminal in X triangle Y has degree one. Thus the nontrivial components are alternating cycles and alternating paths, with each path's two endpoints in X triangle Y.

Start the path at x=a2, which is unmatched by M_X and matched by M_Y. Let y be its other endpoint. Flipping M_X along this entire alternating path preserves coverage of every internal vertex and changes its matched-terminal set to

    X triangle {a2,y}.

There are only three possibilities for y:

* y=b2 gives all four terminals;
* y=a1 gives {b1,a2};
* y=b1 gives {a1,a2}.

Every resulting set is forbidden by (1). This contradiction proves that NO ordinary matching gadget with the stated saturated internal interface has the exact diamond signature.

The exchange property proved by this argument is often described as the even delta-matroid symmetric-exchange condition. No external delta-matroid theorem is needed here; the displayed alternating path is the full proof.

## Relation to full K4 cells and limits

For a full square K4 cell the four boundary resources are split into opposite pairs {a1,a2} and {b1,b2}. Its four genuine triangles allow ALL four cross pairs {a_i,b_j}. The two adjacent internal vertices used in the square-cell auxiliary graph realize exactly the empty state and those four cross-pair states while keeping both internal vertices matched. The additional choices supply the exchanges missing from a one-diagonal diamond.

The obstruction does NOT rule out gadgets with exposed internal vertices, weighted/offset optimization that suppresses some otherwise feasible states, additional interface states, global sharing between gadgets, or a different packing-covering transfer. It also does not show that the broad triangle-free-heavy-edge Tuza gate is false. It only closes the direct extension in which each private two-page diamond is independently replaced by an exact ordinary matching gadget with all internal vertices saturated.

No computation, finite census, or Lean verification was used.
