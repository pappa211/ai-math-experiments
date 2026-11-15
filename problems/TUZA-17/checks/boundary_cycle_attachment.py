"""Targeted full-instance realizability probe: broken double-cones over odd cycles."""
import json,time,sys
sys.path.insert(0,'checks')
from exact_core import Graph,rainbow_coloring,vertex_cover
from pathlib import Path
s=time.monotonic();out=[]
for n in (5,7,9):
 E={tuple(sorted((i,(i+1)%n))) for i in range(n)}
 E|={(i,n) for i in range(n)}|{(i,n+1) for i in range(1,n)}|{(n,n+1)}
 H=Graph(n+2,E);X=list(range(n));G=H.apex(X);colors=rainbow_coloring(H)
 assert colors and H.tri_free_link(X)
 out.append({'cycle_length':n,'H_edges':H.edges,'X':X,'colouring':colors,'H_triangles':H.triangles,'nu_H':H.nu(),'tau_H':H.tau(),'nu_G':G.nu(),'budget':2*G.nu()-H.tau(),'vc_L':vertex_cover(n,[e for e in E if max(e)<n])[0],'lambda':H.lambda_cover(X),'packing_H':H.pack_witness(),'packing_G':G.pack_witness(),'cover_H':H.cover_witness()})
res={'target':'Full eligible odd-cycle links at low budget using C_odd joined to K2 with one spoke removed','status':'COMPLETE_EXACT_FOR_LISTED_THREE_INSTANCES','rows':out,'runtime_seconds':time.monotonic()-s}
Path('evidence/boundary_cycle_attachment.json').write_text(json.dumps(res,indent=2)+'\n')
print(json.dumps([{k:r[k] for k in ('cycle_length','nu_H','tau_H','nu_G','budget','vc_L','lambda')} for r in out]))
