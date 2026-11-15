#!/usr/bin/env python3
"""Fresh reviewer standard-library-only reconstruction. No producer checker imported."""
from itertools import combinations
from pathlib import Path
from collections import Counter
import ast,hashlib,json,platform,shutil,time
EXPECTED="ae0bd41560dae51e58f5197a46eb5cd62e7859f10fb7aeb2f488178c052da1a4"

def edge(u,v):return tuple(sorted((u,v)))
def alltri(n,E):
    return {t:tuple(sorted(edge(u,v) for u,v in combinations(t,2)))
            for t in combinations(range(n),3) if all(edge(u,v) in E for u,v in combinations(t,2))}
def mask(es,ids):return sum(1<<ids[e] for e in es)
def checkpacking(P,triangles,deleted=(),want=None):
    P=[tuple(sorted(t)) for t in P];assert len(P)==len(set(P))
    if want is not None:assert len(P)==want
    used=set()
    for t in P:
        assert t in triangles
        es=set(triangles[t]);assert not es&used;assert not es&set(deleted);used|=es
    return used

def main():
    assert platform.system()=="Darwin";started=time.time()
    outdir=Path('evidence/codegree_two_fresh');outdir.mkdir(parents=True,exist_ok=True)
    snap=Path('review/codegree_two_fresh_inputs');snap.mkdir(parents=True,exist_ok=True)
    manifest=json.loads(Path('evidence/codegree_two/input_manifest.json').read_text())
    assert manifest['notes/codegree_two_tf_resilience_counterexample.md']==EXPECTED
    for f,h in manifest.items():assert hashlib.sha256(Path(f).read_bytes()).hexdigest()==h
    for f in ['notes/codegree_two_tf_resilience_counterexample.md','evidence/codegree_two/input_manifest.json',
              'evidence/codegree_two/petersen_join.json','evidence/codegree_two/tf_lift_witness.json']:
        shutil.copyfile(f,snap/Path(f).name)
    # Rebuild the named base literally, without using a producer edge list.
    rim={edge(i,(i+1)%5) for i in range(5)}|{edge(5+i,5+(i+2)%5) for i in range(5)}|{edge(i,5+i) for i in range(5)}
    B=rim|{edge(a,v) for a in (10,11) for v in range(10)}|{(10,11)}
    BE=sorted(B);bid={e:i for i,e in enumerate(BE)};BT=alltri(12,B)
    assert len(rim)==15 and not alltri(10,rim) and len(B)==36 and len(BT)==40
    expected={tuple(sorted((a,u,v))) for a in (10,11) for u,v in rim}|{(v,10,11) for v in range(10)}
    assert set(BT)==expected
    # Independently enumerate all 2^15 subsets and retain literal ordinary matchings.
    RE=sorted(rim);match=[]
    for bits in range(1<<len(RE)):
        es=[RE[i] for i in range(len(RE)) if bits>>i&1];vertices=[v for e in es for v in e]
        if len(vertices)==len(set(vertices)):
            vm=sum(1<<v for v in vertices)
            pa=[tuple(sorted((10,*e))) for e in es];pb=[tuple(sorted((11,*e))) for e in es]
            match.append((bits,vm,len(es),pa,pb,mask(set().union(*(set(BT[t]) for t in pa)) if pa else set(),bid),
                          mask(set().union(*(set(BT[t]) for t in pb)) if pb else set(),bid)))
    assert len(match)==332
    perfect=[m for m in match if m[2]==5];assert len(perfect)==6
    complement_components=[]
    for m in perfect:
        remaining={RE[i] for i in range(15) if not(m[0]>>i&1)};adj={v:set() for v in range(10)}
        for u,v in remaining:adj[u].add(v);adj[v].add(u)
        assert all(len(a)==2 for a in adj.values());pending=set(range(10));sizes=[]
        while pending:
            todo={min(pending)};seen=set()
            while todo:
                v=todo.pop();seen.add(v);todo|=adj[v]-seen
            pending-=seen;sizes.append(len(seen))
        assert sorted(sizes)==[5,5];complement_components.append(sizes)
    allmasks=set();maxmasks={};best=0
    def record(used,P):
        nonlocal best,maxmasks
        assert used.bit_count()==3*len(P)
        allmasks.add(used)
        if len(P)>best:best=len(P);maxmasks={}
        if len(P)==best:maxmasks.setdefault(used,P)
    for A in match:
        for C in match:
            if A[0]&C[0]:continue
            used=A[5]|C[6];P=A[3]+C[4];record(used,P)
            available=((1<<10)-1)&~(A[1]|C[1])
            for v in range(10):
                if available>>v&1:
                    t=(v,10,11);record(used|mask(BT[t],bid),P+[t])
    assert best==9 and len(allmasks)==157258 and len(maxmasks)==960
    for used,P in maxmasks.items():assert mask(checkpacking(P,BT,want=9),bid)==used
    maxlist=list(maxmasks.items());avoid={}
    def baseavoid(R):
        if R not in avoid:
            for used,P in maxlist:
                if not(used&R):avoid[R]=P;break
            else:raise AssertionError(('base blocker',R))
        return avoid[R]
    basepair={}
    for e,f in combinations(BE,2):
        P=baseavoid((1<<bid[e])|(1<<bid[f]));checkpacking(P,BT,[e,f],9)
        basepair[str((e,f))]=P
    assert len(basepair)==630
    print('independent base: 332 matchings, 157258 packing masks, nu9, all630 pairs verified',flush=True)
    # Ancillary failed-base claims: exhaust both apex spoke sets directly.
    full=(1<<10)-1
    needed=[]
    for S in range(1<<10):
        needed.append(sum(1<<i for i,(u,v) in enumerate(RE) if not(S>>u&1) and not(S>>v&1)))
    best_ab=99;states_ab=[];best_noab=99
    for Sa in range(1<<10):
        for Sb in range(1<<10):
            fs=needed[Sa]|needed[Sb]
            value=1+Sa.bit_count()+Sb.bit_count()+fs.bit_count()
            if value<best_ab:best_ab=value;states_ab=[]
            if value==best_ab:states_ab.append((Sa,Sb,fs))
        # With ab omitted, every rim vertex must have at least one selected spoke.
        sub=Sa
        while True:
            Sb=(full^Sa)|sub;fs=needed[Sa]|needed[Sb]
            best_noab=min(best_noab,Sa.bit_count()+Sb.bit_count()+fs.bit_count())
            if sub==0:break
            sub=(sub-1)&Sa
    assert best_ab==12 and best_noab==13 and len(states_ab)==5
    basecovers=[]
    for Sa,Sb,fs in states_ab:
        C={(10,11)}|{edge(10,v) for v in range(10) if Sa>>v&1}|{edge(11,v) for v in range(10) if Sb>>v&1}|{RE[i] for i in range(15) if fs>>i&1}
        assert len(C)==12 and all(C&set(es) for es in BT.values());basecovers.append(C)
    assert set().union(*basecovers)==B
    base_TF={t for t,es in BT.items() if any(set(es)<=C for C in basecovers)}
    assert base_TF=={(v,10,11) for v in range(10)}
    base_pi=min(sum(((z>>u)&1)==((z>>v)&1) for u,v in B) for z in range(1<<12) if not(z>>10&1))
    assert base_pi==12
    # The induced H is rebuilt from the literal base.
    HV={0,1,2,3,4,10,11};H={e for e in B if set(e)<=HV};HE=sorted(H);hid={e:i for i,e in enumerate(HE)}
    HT={t:es for t,es in BT.items() if set(t)<=HV};hmasks=[mask(es,hid) for es in HT.values()]
    assert len(H)==16 and len(HT)==15
    assert not any(all(mask(es,hid)&t for t in hmasks) for es in combinations(HE,5))
    hcovers=[set(es) for es in combinations(HE,6) if all(mask(es,hid)&t for t in hmasks)]
    assert len(hcovers)==31
    Hbytri={t:next(C for C in hcovers if set(es)<=C) for t,es in HT.items()}
    Hbyedge={e:next(C for C in hcovers if e in C) for e in HE}
    # Independently make complete K5 cover/packing tables.
    KE=set(combinations(range(5),2));KEL=sorted(KE);kid={e:i for i,e in enumerate(KEL)};KT=alltri(5,KE)
    kcovers=[]
    for pair in combinations(range(5),2):
        A=set(pair);C={e for e in KE if (set(e)<=A or not(set(e)&A))};assert len(C)==4
        assert all(len(C&set(es)) in (1,3) for es in KT.values());kcovers.append(C)
    kpairs=[]
    for a,b in combinations(KT,2):
        if not(set(KT[a])&set(KT[b])):kpairs.append(([a,b],set(KT[a])|set(KT[b])))
    assert len(kpairs)==15
    kavoid={}
    for count in range(3):
        for S in combinations(KEL,count):
            kavoid[frozenset(S)]=next(P for P,used in kpairs if not used&set(S))
    assert len(kavoid)==56
    kr={x:next(C for C in kcovers if int((0,1) in C)==x) for x in (0,1)}
    ktcover={t:next(C for C in kcovers if set(es)<=C) for t,es in KT.items()}
    # Build all attachments from sorted B minus H, not from producer output.
    roots=sorted(B-H);assert len(roots)==20;W=set(B);blocks=[];owner={}
    for j,(u,v) in enumerate(roots):
        verts=[u,v,12+3*j,13+3*j,14+3*j]
        es={edge(verts[a],verts[b]) for a,b in KE};W|=es
        for e in es:assert e not in owner;owner[e]=j
        blocks.append(dict(vertices=verts,edges=es,root=(u,v)))
    WE=sorted(W);wid={e:i for i,e in enumerate(WE)};WT=alltri(72,W);Wnames=sorted(WT);tid={t:i for i,t in enumerate(Wnames)}
    tmask={t:mask(es,wid) for t,es in WT.items()}
    assert len(W)==216 and len(WT)==240
    localtri=set()
    def lifttri(j,t):return tuple(sorted(blocks[j]['vertices'][a] for a in t))
    def liftcover(j,C):return {edge(blocks[j]['vertices'][a],blocks[j]['vertices'][b]) for a,b in C}
    for j,bl in enumerate(blocks):
        bl['tcovers']={lifttri(j,t):liftcover(j,C) for t,C in ktcover.items()}
        bl['rootcovers']={x:liftcover(j,C) for x,C in kr.items()}
        bl['defaultpack']=[lifttri(j,t) for t in kavoid[frozenset({(0,1)})]]
        bl['epos']={edge(bl['vertices'][a],bl['vertices'][b]):(a,b) for a,b in KE}
        localtri|=set(bl['tcovers'])
    assert set(WT)==set(BT)|localtri and not(set(BT)&localtri)
    assert set(H)|set(owner)==W and not H&set(owner)
    assert all(len(set(es)&H)<=1 for t,es in BT.items() if t not in HT)
    codeg={e:sum(e in es for es in WT.values()) for e in W}
    oldcg={e:sum(e in es for es in BT.values()) for e in B}
    assert all(codeg[e]==oldcg[e] for e in H)
    low={e for e,d in codeg.items() if d==2}
    assert low=={edge(i,(i+1)%5) for i in range(5)}
    assert Counter(codeg.values())==Counter({2:5,3:180,4:10,5:10,7:10,10:1})
    # Freshly construct and check a minimum containing cover for EVERY actual triangle.
    covers_by_tri={}
    for t,es in WT.items():
        special=None
        if t in HT:HC=Hbytri[t]
        elif t in BT:
            he=set(es)&H;assert len(he)<=1;HC=Hbyedge[next(iter(he))] if he else hcovers[0]
        else:
            special=next(j for j,bl in enumerate(blocks) if t in bl['tcovers']);HC=hcovers[0]
        C=set(HC)
        for j,bl in enumerate(blocks):C|=(bl['tcovers'][t] if j==special else bl['rootcovers'][1])
        assert len(C)==86 and set(es)<=C
        cm=mask(C,wid);assert all(cm&tm for tm in tmask.values())
        covers_by_tri[str(t)]=sorted(C)
    # Independently produce an optimal odd cover with H cost6.
    color={i:(i%2 if i<5 else 0) for i in range(10)};color[10]=0;color[11]=1
    BC={e for e in B if color[e[0]]==color[e[1]]};assert len(BC&H)==6
    OC=set(BC)
    for bl in blocks:OC|=bl['rootcovers'][int(bl['root'] in BC)]
    assert len(OC)==86 and all(len(set(es)&OC)%2==1 for es in WT.values())
    # Exhaust every global pair of deleted edges using independently generated base/local data.
    digest=hashlib.sha256();samples=[];paircount=0
    for e,f in combinations(WE,2):
        S={e,f};affected={owner[x] for x in S if x in owner}
        R={blocks[j]['root'] for j in affected}|(S&H)
        assert len(R)<=2
        P=list(baseavoid(mask(R,bid)))
        for j,bl in enumerate(blocks):
            if j in affected:
                ds=frozenset(bl['epos'][x] for x in S if x in bl['edges'])
                P.extend(lifttri(j,t) for t in kavoid[ds])
            else:P.extend(bl['defaultpack'])
        assert len(P)==49 and len(set(P))==49
        used=0;deletedmask=mask(S,wid)
        for t in P:
            tm=tmask[t];assert not(tm&used) and not(tm&deletedmask);used|=tm
        assert used.bit_count()==147
        row=[wid[e],wid[f],sorted(tid[t] for t in P)]
        digest.update((json.dumps(row,separators=(',',':'))+'\n').encode())
        if paircount<3:samples.append(dict(deleted=[e,f],packing=P))
        paircount+=1
    assert paircount==23220
    print('independent W: all240 TF covers and all23220 deletion pairs verified',flush=True)
    # Now check producer certificates as additional inputs, not as construction premises.
    pb=json.loads(Path('evidence/codegree_two/petersen_join.json').read_text())
    pw=json.loads(Path('evidence/codegree_two/tf_lift_witness.json').read_text())
    assert {tuple(e) for e in pb['edges']}==B and {tuple(t) for t in pb['triangles']}==set(BT)
    seenpairs=set()
    for key,P in pb['packing_certificates_by_deleted_pair'].items():
        S={tuple(e) for e in ast.literal_eval(key)};assert len(S)==2;checkpacking(P,BT,S,9);seenpairs.add(frozenset(S))
    assert seenpairs=={frozenset(p) for p in combinations(BE,2)}
    assert {tuple(e) for e in pw['edges']}==W and {tuple(t) for t in pw['triangles']}==set(WT)
    assert set(map(ast.literal_eval,pw['TF_cover_certificates']))==set(WT)
    for key,rows in pw['TF_cover_certificates'].items():
        t=ast.literal_eval(key);C={tuple(e) for e in rows};assert len(C)==86 and C<=W and set(WT[t])<=C
        cm=mask(C,wid);assert all(cm&tm for tm in tmask.values())
    poc={tuple(e) for e in pw['minimum_odd_cover']};assert len(poc)==86 and poc<=W
    assert all(len(set(es)&poc)%2==1 for es in WT.values())
    checkpacking(pw['maximum_packing'],WT,want=49)
    for key,P in pw['local_K5_deletion_certificates'].items():
        S={tuple(e) for e in ast.literal_eval(key)};assert len(S)<=2 and S<=KE;checkpacking(P,KT,S,2)
    assert {ast.literal_eval(e):d for e,d in pw['codegrees'].items()}==codeg
    assert hashlib.sha256(Path('notes/codegree_two_tf_resilience_counterexample.md').read_bytes()).hexdigest()==EXPECTED
    result=dict(status='PASS',verification_scope='Fresh ordinary reconstruction plus independent fixed-graph exhaustive certificate checks; no Lean or human review',
                frozen_note_sha256=EXPECTED,checker_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
                host=platform.system(),matching_count=len(match),perfect_matching_count=len(perfect),perfect_matching_complement_components=complement_components,
                base_packing_masks=len(allmasks),base_maximum_masks=len(maxmasks),base_nu=best,base_deletion_pairs=len(basepair),
                base_tau=best_ab,base_tau_without_ab=best_noab,base_pi=base_pi,base_minimum_cover_count=len(basecovers),base_TF_triangles=len(base_TF),base_edge_critical=True,
                H_tau=6,H_minimum_cover_count=len(hcovers),W_vertices=72,W_edges=len(W),W_triangles=len(WT),W_nu=49,W_tau=86,W_pi=86,
                W_codegree_histogram=dict(sorted(Counter(codeg.values()).items())),W_codegree_two_edges=sorted(low),
                independent_TF_certificates=len(covers_by_tri),independent_deletion_pairs=paircount,independent_deletion_sequence_sha256=digest.hexdigest(),
                producer_base_certificates_checked=630,producer_TF_certificates_checked=240,producer_local_K5_certificates_checked=56,
                producer_checkers_imported=False,elapsed_seconds=time.time()-started)
    (outdir/'results.json').write_text(json.dumps(result,indent=2)+'\n')
    (outdir/'base_pair_certificates.json').write_text(json.dumps(basepair,indent=2)+'\n')
    (outdir/'TF_certificates.json').write_text(json.dumps(covers_by_tri,indent=2)+'\n')
    (outdir/'literal_witnesses.json').write_text(json.dumps(dict(edges=WE,triangles=Wnames,odd_cover=sorted(OC),deletion_samples=samples),indent=2)+'\n')
    print(json.dumps(result,indent=2))
if __name__=='__main__':main()
