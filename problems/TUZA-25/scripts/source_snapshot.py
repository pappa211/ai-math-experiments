from pathlib import Path
import os,json,hashlib,shutil,subprocess,datetime,argparse
W=Path(__file__).resolve().parents[1]
def cmd(args,cwd):
 p=subprocess.run(args,cwd=cwd,text=True,capture_output=True,env={**os.environ,"GIT_OPTIONAL_LOCKS":"0"}); return {"returncode":p.returncode,"stdout":p.stdout,"stderr":p.stderr}
def repo_state(p):
 r=cmd(["git","rev-parse","--show-toplevel"],p if p.is_dir() else p.parent)
 if r["returncode"]:return None
 root=r["stdout"].strip()
 return {"root":root,"head":cmd(["git","rev-parse","HEAD"],root),"tree":cmd(["git","rev-parse","HEAD^{tree}"],root),"status":cmd(["git","status","--porcelain=v1","--untracked-files=all"],root),"branch":cmd(["git","symbolic-ref","--short","-q","HEAD"],root)}
def snapshot(label,paths,hash_only=False):
 d=W/"sources"/label;d.mkdir(parents=True,exist_ok=False)
 records=[]; repos={}
 for i,v in enumerate(paths):
  p=Path(v);b=p.read_bytes(); dst=d/(str(i)+"_"+p.name)
  if not hash_only:dst.write_bytes(b)
  records.append({"source":str(p),"sha256":hashlib.sha256(b).hexdigest(),"bytes":len(b),"snapshot":None if hash_only else str(dst.relative_to(W)),"mtime_ns":p.stat().st_mtime_ns})
  r=repo_state(p)
  if r:repos[r["root"]]=r
 out={"label":label,"at_utc":datetime.datetime.now(datetime.timezone.utc).isoformat(),"files":records,"repos":list(repos.values()),"scope":"selected files and source Git state only"}
 (d/"manifest.json").write_text(json.dumps(out,indent=2)+"\n")
 print(json.dumps({"label":label,"files":len(records),"repos":len(repos)}))
if __name__=="__main__":
 a=argparse.ArgumentParser();a.add_argument("label");a.add_argument("paths",nargs="+");a.add_argument("--hash-only",action="store_true");v=a.parse_args();snapshot(v.label,v.paths,v.hash_only)
