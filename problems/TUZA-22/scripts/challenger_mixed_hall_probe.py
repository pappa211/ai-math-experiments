#!/usr/bin/env python3
"""Abstract mixed matching/list-coloring Hall discriminator; not graph realization."""
import itertools,functools,time,json,datetime
from pathlib import Path
start=time.monotonic();tested=0;passing=0;failure=None;unknown=[];domains=[]
for name,n,edges in [('two_triangles_at_cutvertex',5,[(0,1),(0,2),(1,2),(2,3),(2,4),(3,4)]),('path4',4,[(0,1),(1,2),(2,3)]),('path5',5,[(0,1),(1,2),(2,3),(3,4)])]:
    if failure or unknown:break
    adj=[0]*n
    for u,v in edges:adj[u]|=1<<v;adj[v]|=1<<u
    full=(1<<n)-1
    @functools.lru_cache(None)
    def alpha(s):
        if not s:return 0
        b=s&-s;u=b.bit_length()-1
        return max(alpha(s^b),1+alpha((s^b)&~adj[u]))
    aa=[alpha(s) for s in range(1<<n)]
    row={'F':name,'n':n,'color_count':2,'complete':False};domains.append(row)
    for jm in range(1<<len(edges)):
        ja=[0]*n;je=[]
        for i,(u,v) in enumerate(edges):
            if jm>>i&1:ja[u]|=1<<v;ja[v]|=1<<u;je.append((u,v))
        if any(ja[u]&ja[v] for u,v in je):continue
        independent=[s for s in range(1<<n) if all(not((s>>u&1) and(s>>v&1)) for u,v in je)]
        for colors in itertools.combinations_with_replacement(range(1<<n),2):
            if time.monotonic()-start>7:unknown.append({'reason':'internal7s','next_state':(name,jm,colors)});break
            tested+=1
            if any(sum(aa[s&c] for c in colors)<s.bit_count() for s in independent):continue
            passing+=1
            @functools.lru_cache(None)
            def solve(s,c0,c1):
                if not s:return ()
                bit=s&-s;v=bit.bit_length()-1;rest=s^bit
                for u in range(n):
                    if rest>>u&1 and ja[v]>>u&1:
                        z=solve(rest^(1<<u),c0,c1)
                        if z is not None:return (('M',v,u),)+z
                cs=(c0,c1)
                for k in range(2):
                    if colors[k]&bit and not(adj[v]&cs[k]):
                        nxt=list(cs);nxt[k]|=bit;z=solve(rest,*nxt)
                        if z is not None:return (('color',v,k),)+z
                return None
            sol=solve(full,0,0)
            if sol is None:
                failure={'F_name':name,'n':n,'F_edges':edges,'J_edges':je,'color_support_masks':colors,'lists':[[k for k,c in enumerate(colors) if c>>v&1] for v in range(n)],'J_independent_Hall_rows':[{'vertices':[v for v in range(n) if s>>v&1],'h':sum(aa[s&c] for c in colors)} for s in independent],'claim':'No partition into J-matched pairs and remaining proper listed colors despite Hall on every J-independent subset','realization':'ABSTRACT ONLY; no actual triangle graph/minimum C asserted'};break
        if failure or unknown:break
    else:row['complete']=True
result={'tested_states':tested,'Hall_passing_states':passing,'domains':domains,'failure':failure,'unknown':unknown,'elapsed_seconds':time.monotonic()-start,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat()}
Path('evidence/challenger_mixed_hall_probe.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
