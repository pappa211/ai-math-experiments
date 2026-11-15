#!/usr/bin/env python3
"""Literal standard-library verification of the one fixed K11 control."""
from itertools import combinations
P=[(0,1,4),(0,2,8),(0,5,6),(0,7,10),(1,2,10),(1,3,9),(1,5,8),(1,6,7),(2,3,7),(2,4,5),(2,6,9),(3,5,10),(3,6,8),(4,6,10),(4,7,8),(5,7,9),(8,9,10)]
E=set(combinations(range(11),2));used=[e for t in P for e in combinations(t,2)]
assert len(P)==17 and len(used)==len(set(used))==51 and set(used)<=E
L=E-set(used)
assert L=={(0,3),(0,9),(3,4),(4,9)}
A=set(range(5));C={e for e in E if (e[0] in A)==(e[1] in A)}
assert len(C)==25
assert all(set(combinations(t,2))&C for t in combinations(range(11),3))
assert set(combinations((0,1,2),2))<=C
print({'vertices':11,'edges':55,'triangles':165,'packing':17,'cover':25,'leave':sorted(L),'full_triangle':(0,1,2),'status':'PASS'})
