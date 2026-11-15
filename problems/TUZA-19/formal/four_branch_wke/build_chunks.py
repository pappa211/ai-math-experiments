from pathlib import Path
import subprocess,sys,json,time,datetime
F=Path(__file__).resolve().parent
for i in range(128):
 name=f'Chunk{i:03d}'
 cmd=[sys.executable,str(F/'run_lean.py'),name+'.lean',name.lower()+'_final']
 p=subprocess.run(cmd,cwd=F,text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
 if p.returncode:
  print(p.stdout,flush=True);sys.exit(p.returncode)
 if i%10==0 or i==127:print(f'completed {i+1}/128: '+name,flush=True)
print('ALL_CHUNKS_PASS',flush=True)
