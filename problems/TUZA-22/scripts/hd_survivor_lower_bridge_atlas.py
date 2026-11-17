"""One fixed, bounded actual-graph discriminator; no historical census import."""
import hashlib, itertools, json, time
from functools import lru_cache
from pathlib import Path
import networkx as nx
START=time.monotonic(); LIMIT=25.0
ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'evidence/hd_survivor_lower_bridge_atlas.json'
calls=0
class Deadline(Exception): pass
def tick(force=False):
    global calls
    calls+=1
    if (force or calls%256==0) and time.monotonic()-START>LIMIT:
        raise Deadline()
def literal(G):
    n=len(G); E=sorted(tuple(sorted(e)) for e in G.edges()); es=set(E)
    T=[t for t in itertools.combinations(range(n),3) if all(tuple(e) in es for e in itertools.combinations(t,2))]
    ei={e:i for i,e in enumerate(E)}
    tm=[sum(1<<ei[e] for e in itertools.combinations(t,2)) for t in T]
    hits=[sum(1<<j for j,t in enumerate(tm) if t>>i&1) for i in range(len(E))]
    conflicts=[sum(1<<j for j,u in enumerate(tm) if t&u) for t in tm]
    full=(1<<len(T))-1
    @lru_cache(maxsize=100000)
    def cover(s):
        tick()
        if not s:return 0
        j=(s&-s).bit_length()-1
        return 1+min(cover(s&~hits[i]) for i in range(len(E)) if tm[j]>>i&1)
    @lru_cache(maxsize=100000)
    def pack(s):
        tick()
        if not s:return 0
        j=(s&-s).bit_length()-1
        return max(1+pack(s&~conflicts[j]),pack(s&~(1<<j)))
    return n,E,T,tm,hits,conflicts,full,cover,pack
atlas=nx.graph_atlas_g()
domain=[{'n':len(G),'edges':sorted(tuple(sorted(e)) for e in G.edges())} for G in atlas]
result={'candidate':'tau=2nu-1 AND every minimum cover exact-one => SOME (minimum C, maximum P) has survivor nu>=nu-1',
        'networkx_version':nx.__version__,'raw_domain':len(atlas),'domain_max_vertices':max(map(len,atlas)),
        'domain_sha256':hashlib.sha256(json.dumps(domain,separators=(',',':')).encode()).hexdigest(),
        'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        'admission_sha256':hashlib.sha256((ROOT/'operations/hd_survivor_lower_bridge_atlas_admission.md').read_bytes()).hexdigest(),
        'processed':0,'near_tight':0,'all_minimum_exact':0,'bridge_witnesses':0,'unknown':0,'records':[]}
current=None
try:
    assert len(atlas)==1253 and max(map(len,atlas))==7
    for idx,G in enumerate(atlas):
        current=idx; tick(True)
        n,E,T,tm,hits,conflicts,full,cover,pack=literal(G)
        k=pack(full)
        if k<2:
            result['processed']+=1; continue
        tau=cover(full)
        if tau!=2*k-1:
            result['processed']+=1; continue
        result['near_tight']+=1
        allC=set()
        def enumerate_covers(s,c):
            tick()
            if c.bit_count()+cover(s)>tau:return
            if not s:
                assert c.bit_count()==tau
                allC.add(c);return
            j=(s&-s).bit_length()-1
            for e in range(len(E)):
                if tm[j]>>e&1:enumerate_covers(s&~hits[e],c|(1<<e))
        enumerate_covers(full,0)
        assert allC
        bad=next((c for c in sorted(allC) if any((c&t).bit_count()!=1 for t in tm)),None)
        record={'atlas_index':idx,'n':n,'edges':E,'triangles':T,'nu':k,'tau':tau,'minimum_cover_count':len(allC)}
        if bad is not None:
            record.update(status='ALL_MINIMUM_EXACT_FALSE',nonexact_minimum_cover=[E[i] for i in range(len(E)) if bad>>i&1])
            result['records'].append(record);result['processed']+=1;continue
        result['all_minimum_exact']+=1
        def maximum_packings(s,left,chosen=()):
            tick()
            if left==0:
                yield chosen;return
            if pack(s)<left:return
            j=(s&-s).bit_length()-1
            if 1+pack(s&~conflicts[j])>=left:
                yield from maximum_packings(s&~conflicts[j],left-1,chosen+(j,))
            if pack(s&~(1<<j))>=left:
                yield from maximum_packings(s&~(1<<j),left,chosen)
        tested=0;best=-1;witness=None
        for c in sorted(allC):
            for p in maximum_packings(full,k):
                tested+=1; tick()
                blue=0
                for j in p:blue|=tm[j]&~c
                surv=sum(1<<j for j,t in enumerate(tm) if not(t&blue))
                q=pack(surv);best=max(best,q)
                if q>=k-1:
                    sp=next(maximum_packings(surv,q))
                    witness={'cover':[E[i] for i in range(len(E)) if c>>i&1],
                             'packing':[T[j] for j in p],
                             'deleted_blue_edges':[E[i] for i in range(len(E)) if blue>>i&1],
                             'survivor_nu':q,'survivor_packing':[T[j] for j in sp]}
                    break
            if witness:break
        record.update(cover_packing_pairs_tested=tested,best_survivor_seen=best)
        if witness:
            record.update(status='EXISTENTIAL_BRIDGE_WITNESS',witness=witness)
            result['bridge_witnesses']+=1
        else:
            record.update(status='COUNTEREXAMPLE_TO_LOWER_BRIDGE',minimum_covers=[[E[i] for i in range(len(E)) if c>>i&1] for c in sorted(allC)])
            result['status']='COUNTEREXAMPLE_FOUND'
        result['records'].append(record);result['processed']+=1
        if not witness:break
    else:
        result['status']='FIXED_ATLAS_PASSED_NO_GLOBAL_INFERENCE'
except Deadline:
    result['status']='UNKNOWN_INTERNAL_DEADLINE';result['unknown']=1;result['unknown_atlas_index']=current
result['elapsed_seconds']=time.monotonic()-START
result['recurrence_calls']=calls
OUT.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='records'}))
