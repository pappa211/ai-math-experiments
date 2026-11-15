"""Editorial spacing only in report prose; preserve code spans and link targets."""
from pathlib import Path
import re
ROOT=Path(__file__).resolve().parents[1]
path=ROOT/'REPORT.md';source=path.read_text()
parts=re.split(r'(`[^`]*`|\]\([^)]*\))',source)
prefixes='against|all|and|at|checked|codegree|costs|deficiency|distance|exact|has|is|least|minimum|of|on|prescribed|retained|size|the|weaker|with'
for i in range(0,len(parts),2):
    s=parts[i]
    s=s.replace('exact2-in4-inconsistent K4 incidence blocks','K4 incidence blocks whose balancing constraints are inconsistent')
    s=re.sub(r'\b('+prefixes+r')(?=\d)',r'\1 ',s)
    s=re.sub(r'\b(nu|tau)(?=\d)',r'\1=',s)
    s=re.sub(r'\bstar(?=\d)','star size ',s)
    s=re.sub(r'\btype([013])\b',r'type \1',s)
    s=s.replace('Lean4.33.1','Lean 4.33.1').replace('SHA256','SHA-256').replace('TUZA17','TUZA-17').replace('TUZA16','TUZA-16').replace('2ceil','2 ceil')
    s=re.sub(r',(?=\d)',', ',s)
    for raw,pretty in [('41984','41,984'),('393643','393,643'),('36218','36,218')]:s=re.sub(r'\b'+raw+r'\b',pretty,s)
    parts[i]=s
path.write_text(''.join(parts))
print('Report prose spacing updated; code spans and link targets preserved.')
