"""Literal cone-control check; stdlib only. No covering theorem is computer inferred."""
from itertools import combinations, product
from pathlib import Path
import json

def edge(a,b): return tuple(sorted((a,b)))
E = {edge(i,(i+1)%5) for i in range(5)}
E |= {edge(i+5,(i+d)%5) for i in range(5) for d in (-1,1)}
E |= {edge(10,i+5) for i in range(5)}
V = set(range(11)); Z = 11
GE = E | {edge(Z,v) for v in V}
triangles = [t for t in combinations(range(12),3) if all(edge(*p) in GE for p in combinations(t,2))]
assert len(E)==20 and len(GE)==31
assert len(triangles)==20 and all(Z in t for t in triangles)
assert {edge(t[0],t[1]) for t in triangles}==E
covers=[s for k in range(12) for s in combinations(range(11),k) if all(set(e)&set(s) for e in E)]
minimum=min(map(len,covers)); cover=next(s for s in covers if len(s)==minimum)
assert minimum==6
matching=[]
for F in combinations(sorted(E),5):
    if len(set().union(*map(set,F)))==10:
        matching=list(F); break
assert len(matching)==5
three_colourings=0
for colours in product(range(3),repeat=11):
    if all(colours[a]!=colours[b] for a,b in E):
        three_colourings+=1
assert three_colourings==0
four_colours=[0,1,0,1,2,0,1,0,1,2,3]
assert all(four_colours[a]!=four_colours[b] for a,b in E)
packed_triangles=[tuple(sorted((Z,*e))) for e in matching]
packed_edges=[{edge(*p) for p in combinations(t,2)} for t in packed_triangles]
assert len(set().union(*packed_edges))==15
spoke_cover={edge(Z,v) for v in cover}
assert all(any(edge(*p) in spoke_cover for p in combinations(t,2)) for t in triangles)
# Independent edge-sharing triangle connectivity.
seen={0}
while True:
    nxt=seen|{j for i in seen for j in range(len(triangles)) if len(set(triangles[i])&set(triangles[j]))>=2}
    if nxt==seen: break
    seen=nxt
assert len(seen)==len(triangles)
result={"status":"PASS","scope":"Literal 12-vertex cone; ordinary sheet-splitting theorem separate", "rim_vertices":11,"rim_edges":[list(e) for e in sorted(E)],"graph_vertices":12,"graph_edges":[list(e) for e in sorted(GE)],"all_actual_triangles":[list(t) for t in triangles],"triangle_connected":True,"rim_3_colourings":three_colourings,"rim_4_colouring":four_colours,"rim_vertex_cover_number":minimum,"rim_minimum_cover":list(cover),"rim_maximum_matching":matching,"triangle_packing_number":5,"triangle_packing":packed_triangles,"triangle_cover_number":6,"triangle_cover":[list(e) for e in sorted(spoke_cover)],"packing_upper_certificate":"Every triangle uses two of 11 apex spokes; five displayed triangles attain floor(11/2)","cover_lower_certificate":"Replace selected rim edges by endpoint spokes; all 2048 rim vertex subsets checked"}
out=Path(__file__).resolve().parents[1]/'evidence'/'late_cover_verified.json'
out.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({"status":"PASS","nu":5,"tau":6,"triangles":20,"evidence":str(out)}))
