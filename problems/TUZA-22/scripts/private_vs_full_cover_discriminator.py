from pathlib import Path
import subprocess,json,hashlib,itertools,datetime,time
R=Path(__file__).resolve().parents[1];start=time.monotonic()
src=R/'scripts/private_vs_full_cover_discriminator.cpp';exe=R/'build/private_vs_full_cover_discriminator'
exe.parent.mkdir(exist_ok=True)
subprocess.run(['clang++','-O2','-std=c++17',str(src),'-o',str(exe)],check=True)
p=subprocess.run([str(exe)],capture_output=True,text=True,check=True)
d=json.loads(p.stdout);d['source_sha256']=hashlib.sha256(src.read_bytes()).hexdigest();d['domain']='all unlabeled 4-vertex cores with up to6 apex incidence types counted with multiplicity; all unlabeled5-vertex cores with up to5; triangle-containing cores only; equal induced-edge apex types identified'
if d['status']=='COUNTEREXAMPLE':
 n=d['nA'];C={tuple(e) for e in d['core_edges']};E=set(C);N=d['neighborhood_vertex_masks']
 for i,z in enumerate(N):E.update((a,n+i) for a in range(n) if z>>a&1)
 T=[t for t in itertools.combinations(range(n+len(N)),3) if all(e in E for e in itertools.combinations(t,2))]
 private=[t for t in T if sum(e in C for e in itertools.combinations(t,2))==1]
 S={tuple(d['core_edges'][i]) for i in range(len(C)) if d['violating_core_edge_mask']>>i&1};D=C-S
 for i,z in enumerate(N):
  edges=[e for e in S if all(z>>a&1 for a in e)]
  masks=[q for q in range(1<<n) if all(any(q>>a&1 for a in e) for e in edges)]
  q=min(masks,key=int.bit_count);D.update((a,n+i) for a in range(n) if q>>a&1)
 assert len(D)==d['private_tau']<len(C)
 assert all(any(e in D for e in itertools.combinations(t,2)) for t in private)
 missed=[t for t in T if not any(e in D for e in itertools.combinations(t,2))]
 assert missed and all(set(itertools.combinations(t,2))<=C for t in missed)
 # Independent formula replay over every literal subset, including exact full optimum.
 ce=sorted(C);full=len(C);priv=len(C);tf_count=0
 for bits in range(1<<len(C)):
  ss={ce[j] for j in range(len(C)) if bits>>j&1};h=0
  for z in N:
   ed=[e for e in ss if all(z>>a&1 for a in e)]
   h+=min(q.bit_count() for q in range(1<<n) if all(any(q>>a&1 for a in e) for e in ed))
  val=len(C)-len(ss)+h;priv=min(priv,val)
  if not any(set(itertools.combinations(t,2))<=ss for t in itertools.combinations(range(n),3)):
   tf_count+=1;full=min(full,val)
 assert full==len(C)==d['ordinary_tau'] and priv==d['private_tau']
 d['literal']={'n':n+len(N),'edges':sorted(E),'triangles':T,'private_triangles':private,'C':sorted(C),'private_cover':sorted(D),'missed_internal_triangles':missed,'trianglefree_subsets_checked':tf_count,'independent_formula_replay':True}
d['total_seconds_including_compile']=time.monotonic()-start;d['completed_utc']=datetime.datetime.now(datetime.timezone.utc).isoformat()
(R/'evidence/private_vs_full_cover_discriminator.json').write_text(json.dumps(d,indent=2)+'\n')
print(json.dumps(d,indent=2))
