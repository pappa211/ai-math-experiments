"""Independent brute finite-weight checks and explicit final-restoration controls."""
from mixed_exact import Graph,solve,controls,cliques
from itertools import combinations
from functools import lru_cache
import json,time

def weighted_brute(G,N):
    q=len(G.edges)-N.bit_count();M=q+1
    if any(t&~N==0 for t in G.triangles):return {'status':'INADMISSIBLE'}
    bestc=None
    for C in range(1<<len(G.edges)):
        if all(C&t for t in G.triangles):
            cost=(C&~N).bit_count()+M*(C&N).bit_count()
            if bestc is None or cost<bestc:bestc=cost
    bestp=0
    for P in range(1<<len(G.triangles)):
        size=P.bit_count()
        if size<=bestp:continue
        if all(sum(bool(G.triangles[j]>>e&1) for j in range(len(G.triangles)) if P>>j&1)<=(M if N>>e&1 else 1) for e in range(len(G.edges))):bestp=size
    return {'status':'EXACT_BRUTE','M':M,'tau_weighted':bestc,'nu_capacitated':bestp}

def B(G,D=0):
    ts=[t for t in G.triangles if not t&D];todo=set(range(len(ts)));comps=[]
    while todo:
        st=[todo.pop()];comp=[]
        while st:
            j=st.pop();comp.append(j)
            new={i for i in todo if ts[j]&ts[i]};todo-=new;st+=list(new)
        support=0
        for j in comp:support|=ts[j]
        vertices={v for i,e in enumerate(G.edges) if support>>i&1 for v in e}
        if len(vertices) not in (4,5):return False
        if {e for i,e in enumerate(G.edges) if support>>i&1}!=set(combinations(sorted(vertices),2)):return False
        comps.append(comp)
    return True

def main():
    start=time.time();out={'status':'EXACT_COMPLETED','weighted':{},'recurrence':{},'restoration':[],'peeling':[]}
    for name in ['K3','K4','K5','K4_background']:
        G=controls()[name];count=bad=0;tight=0
        @lru_cache(None)
        def result(N,D=0):return solve(G,N,D)
        for N in range(1<<len(G.edges)):
            r=result(N)
            if r['status']=='INADMISSIBLE':bad+=1;continue
            b=weighted_brute(G,N);assert b['nu_capacitated']==r['nu'] and b['tau_weighted']==r['tau'];count+=1
            if r['tau']==2*r['nu']:tight+=1
            for e in range(len(G.edges)):
                if N>>e&1:continue
                child=result(N|(1<<e));delete=result(N,1<<e)
                assert r['tau']==min(1+delete['tau'],child['tau'] if child['status']=='EXACT' else float('inf'))
                out['recurrence']['branches']=out['recurrence'].get('branches',0)+1
                if child['status']=='INADMISSIBLE':out['recurrence']['inadmissible_forbids']=out['recurrence'].get('inadmissible_forbids',0)+1
        out['weighted'][name]={'admissible':count,'inadmissible':bad,'tight':tight}
    cycle=Graph(5,[(i,(i+1)%5) for i in range(5)]);out['weighted']['C5_all_forbidden']=weighted_brute(cycle,(1<<5)-1)
    for q in [4,5]:
        old=list(range(2,2+q));base=list(combinations(old,2))+[(0,1)]
        for pages in ['none','one','both']:
            for extraN in [False,True]:
                if pages=='none' and extraN:continue
                edges=base+[(0,2),(1,2)]
                if pages!='none':edges.append((0,3))
                if pages=='both':edges.append((1,4))
                G=Graph(2+q,edges);N=G.mask([(0,1)]+([(0,3)] if extraN else []));D=G.mask([(0,2),(1,2)])
                assert not any(t&N for t in G.triangles if not t&D)
                assert B(G,D)
                oldr=solve(G,N,D);newr=solve(G,N)
                assert newr['tau']<=2*newr['nu']-1
                if pages=='both':assert newr['nu']>=oldr['nu']+2
                out['restoration'].append({'old_clique':q,'pages':pages,'other_N_page_spoke':extraN,'edges':G.edges,'N':N,'deleted':D,'old':oldr,'new':newr})
    for name,G in controls().items():
        for e in range(len(G.edges)):
            N=1<<e;chosen=[];S=0
            for j,t in enumerate(G.triangles):
                if t&N and not((t&~N)&S):chosen.append(j);S|=t&~N
            assert not any(t&N for t in G.triangles if not t&S)
            full=solve(G,N);res=solve(G,N,S)
            assert full['tau']<=S.bit_count()+res['tau']
            assert full['nu']>=len(chosen)+res['nu']
            out['peeling'].append({'graph':name,'N':N,'P':chosen,'S':S,'residual_nu':res['nu'],'residual_tau':res['tau'],'full_nu':full['nu'],'full_tau':full['tau'],'paid_bound':S.bit_count()+2*res['nu'],'two_nu':2*full['nu']})
    out['elapsed_seconds']=time.time()-start
    json.dump(out,open('evidence/mixed_semantic_checks.json','w'),indent=2)
    print(json.dumps({k:v for k,v in out.items() if k not in ['restoration','peeling']},indent=2));print('restoration',len(out['restoration']),'peeling',len(out['peeling']))
if __name__=='__main__':main()
