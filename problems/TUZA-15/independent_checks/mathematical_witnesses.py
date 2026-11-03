"""Independent transcription of selected ordinary witnesses, not source checkers.
Projection tests range over cliques on footprint endpoints in a maximal allowed
residual graph; arbitrary additional vertices cannot change that footprint.
"""
from itertools import combinations
import json
from pathlib import Path

def E(vertices):
    return {frozenset(x) for x in combinations(vertices, 2)}

def check(label, triangles, allowed, forbidden=()):
    used=set()
    for t in triangles:
        es=E(t)
        assert es<=allowed,(label,'nonedge',t)
        assert not used&es,(label,'overlap',t)
        assert not es&set(forbidden),(label,'forbidden',t)
        used|=es
    return {'label':label,'triangles':len(triangles),'used_edges':len(used)}

def cover(label, allowed, selected, hubs=()):
    triangles=[t for t in combinations(sorted(set().union(*allowed)),3) if E(t)<=allowed]
    for t in triangles:
        if not hubs or set(t)&set(hubs):
            assert E(t)&selected,(label,'uncovered',t)
    return {'label':label,'cover_size':len(selected),'triangles_tested':len(triangles)}

def footprint(label, allowed, selected):
    vertices=sorted(set().union(*allowed,*selected))
    counts={4:0,5:0}
    for size in range(6):
        for c in combinations(vertices,size):
            ce=E(c)
            if not ce<=allowed: continue
            f=ce&selected
            if size<=4:
                counts[4]+=1
                assert not f or set.intersection(*(set(e) for e in f)),(label,'nonstar',c,f)
            counts[5]+=1
            assert len(f)<=2,(label,'three K5 footprint edges',c,f)
    return {'label':label,'clique_projections':counts}

rows=[]
B=E('0123456')-{frozenset('12'),frozenset('34')}
for f,ts in [('13',['014','025','036','156','246']),('15',['013','024','056','146','235']),('56',['013','025','046','145','236'])]:
    rows.append(check('R6 avoid '+f,ts,B,[frozenset(f)]))
rows.append(check('R6 initial',['014','023','056','135','245'],B))
rows.append(cover('R6 seven-edge cover',B,{frozenset(e) for e in ['01','02','35','36','45','46','56']}))
R=(E('12345')-{frozenset('12'),frozenset('34')})|{frozenset('56')}
residual={frozenset('6'+t) for t in '1234'}|{frozenset('x'+t) for t in '123456'}
for f in R:
    selected={frozenset('6'+t) for t in '1234'}|{frozenset(('x',t)) for t in f}
    rows.append(footprint('R6 maximal selected footprint/page '+''.join(sorted(f)),residual,selected))
B=E('uvabcdw')-{frozenset('wa'),frozenset('wb')}
rows.append(check('TWIN initial',['uab','ucd','vbc','vad','uvw'],B))
rows.append(check('TWIN restored',['wuv','wcd','auc','avd','bud','bvc'],B))
rows.append(footprint('TWIN footprint',E('abcdw')-{frozenset(e) for e in ['ab','bc','cd','da']},{frozenset(e) for e in ['wc','wd','ac','bd']}))
B=E('123456')
rows.append(check('K6 matching decomposition',['135','146','236','245'],B,[frozenset(e) for e in ['12','34','56']]))
B=E('uvabcd')-{frozenset('ab')}
for f,ts in [('ac ad',['auv','bcu','bdv']),('ac bc',['auv','bdu','cdv']),('ac bd',['auv','bcu','cdv'])]:
    rows.append(check('donor8 IIb avoid '+f,ts,B,[frozenset(x) for x in f.split()]))
rows.append(cover('donor8 IIb Cc',B,{frozenset(e) for e in ['ac','bc','uv','ud','vd']}))
rows.append(cover('donor8 IIb Cd',B,{frozenset(e) for e in ['ad','bd','uv','uc','vc']}))
B=E('0123456')
rows.append(check('DOM K7 decomposition',['013','026','045','124','156','235','346'],B))
B=E('uv12345')-{frozenset('12')}
rows.append(check('DOM K7-e',['u25','u34','v23','v45','uv1','135'],B))
for dense in [False,True]:
    W=E('1234') if dense else {frozenset(e) for e in ['12','24','43','31']}
    B=W|{frozenset((h,w)) for h in 'uvpq' for w in '1234'}|{frozenset(e) for e in ['uv','up','vq','pq']}
    ts=['u12','v13','uv4','up3','vq2']+(['234'] if dense else [])
    X=W|{frozenset(e) for e in ['uv','up','p3','vq','q2']}
    label='B2 '+('K4' if dense else 'C4')
    rows.append(check(label,ts,B))
    rows.append(cover(label+' hub-cover',B,X,'uv'))
W={frozenset(e) for e in ['ab','bc','cd','da']}
B=W|{frozenset((h,w)) for h in 'uvq' for w in 'abcd'}|{frozenset(e) for e in ['uv','vq','up','ur']}
rows.append(check('THIN restored',['uab','qcd','vuc','vad','vbq'],B))
rows.append(cover('THIN hub-cover',B,W|{frozenset(e) for e in ['uv','up','ur','vq']},'uv'))
rows.append(footprint('THIN footprint',{frozenset(('q',w)) for w in 'abcd'},{frozenset(('q',w)) for w in 'bcd'}))
H={frozenset(e) for e in ['ab','bc','ca','ax','bx','by','cy','cz','az']}
M0={frozenset(e) for e in ['az','bx','cy']}
J=(H-M0)|{frozenset(('t',w)) for w in 'abcxyz'}
rows.append(footprint('THREE-SUN page az',J,{frozenset(e) for e in ['ax','by','cz','at','zt']}))
B=H|{frozenset(('v',w)) for w in 'abcxyz'}
rows.append(cover('THREE-SUN six edges',B,{frozenset(e) for e in ['va','vb','vc','ab','bc','ca']}))
# Two selected pages with arbitrary distinct or coincident apices: W is independent.
for first in combinations('abcd',2):
    for second in combinations('abcd',2):
        for same_apex in [False,True]:
            apex2='x' if same_apex else 'y'
            selected={frozenset(('x',w)) for w in first}|{frozenset((apex2,w)) for w in second}
            allowed={frozenset((apex,w)) for apex in 'xy' for w in 'abcd'}|{frozenset('xy')}
            rows.append(footprint('two-page '+''.join(first)+' '+''.join(second)+' '+str(same_apex),allowed,selected))
result={'scope':'independent ordinary fixed-core rows and footprint projection tests; no original checker imported; not a full six-link verification','passed':True,'checks':rows}
Path('independent_checks/mathematical_witnesses.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'passed':True,'checks':len(rows)}))
