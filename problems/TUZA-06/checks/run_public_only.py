#!/usr/bin/env python3
"""Exercise finite checkers with file opens restricted to this public archive
and Python's installed standard library. This is an audit of these trusted
scripts' file resolution, not an adversarial security sandbox.
"""
from pathlib import Path
import datetime,hashlib,itertools,json,os,re,runpy,sys,sysconfig
from collections import Counter
from functools import lru_cache
root=Path(__file__).resolve().parents[1]
stdlib=Path(sysconfig.get_paths()['stdlib']).resolve()
opened=set();denied=[]
sys.dont_write_bytecode=True
def audit(event,args):
 if event!='open' or not isinstance(args[0],(str,bytes,os.PathLike)):return
 p=Path(os.fsdecode(args[0])).resolve()
 if p==root or root in p.parents:opened.add(str(p.relative_to(root)));return
 if p==stdlib or stdlib in p.parents:return
 denied.append(str(p));raise PermissionError('File outside public archive and Python standard library')
sys.addaudithook(audit)
for name in ['independent_final_core','independent_five_coverage','independent_overlap_certificates']:
 runpy.run_path(str(root/'checks'/(name+'.py')),run_name='__main__')
print(json.dumps({'status':'PASS','method':'Python audit restricts file opens to public archive and installed standard library; not an adversarial sandbox','checks':3,'nonpublic_file_opens':len(denied),'public_files_opened':sorted(opened),'finished_utc':datetime.datetime.now(datetime.timezone.utc).isoformat()},indent=2))
