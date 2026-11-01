#!/usr/bin/env python3
"""Build matched Markdown, LaTeX and PDF from manuscript.md and references.bib.

Requires Pandoc 3.13 and Tectonic 0.17.0. Tectonic may read its typesetting
bundle cache; this is separate from Lean dependency reproduction.
"""
from pathlib import Path
import argparse, hashlib, json, shutil, subprocess, re
from urllib.parse import quote

PREAMBLE=r'''\documentclass[11pt]{article}
\usepackage[T1]{fontenc}
\usepackage{lmodern,amsmath,amssymb,amsthm,mathtools}
\usepackage[margin=1in]{geometry}
\usepackage{microtype,enumitem,booktabs,longtable,array,calc}
\usepackage{fancyvrb,fvextra,graphicx}
\usepackage[hidelinks,unicode]{hyperref}
\usepackage{xurl}
\hypersetup{pdftitle={Further Investigations of Tuza's Conjecture: Equality Extensions, Cover Switching, and Integrality Obstructions},pdfauthor={AI Math Experiments},pdfsubject={AI-developed mathematical research report. AI-produced mathematics, proofs, code, formalization, manuscript and internal reviews. Human-directed goals, budgets and authorization.},pdfkeywords={Tuza, equality extensions, cover switching, integrality obstructions, Lean, AI research},pdfcreator={LaTeX with Tectonic},pdfproducer={Tectonic}}
\setlength{\emergencystretch}{3em}
\widowpenalty=10000\clubpenalty=10000
\setlength{\parskip}{3pt}
\setcounter{secnumdepth}{-1}
\setcounter{tocdepth}{1}
\setlist{itemsep=2pt,topsep=4pt}
\providecommand{\tightlist}{\setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
\DefineVerbatimEnvironment{Highlighting}{Verbatim}{fontsize=\small,breaklines=true,commandchars=\\\{\}}
\newenvironment{Shaded}{}{}
\newcommand{\passthrough}[1]{#1}
\newcommand{\CSLBlock}[1]{#1\hfill\break}
\newcommand{\CSLLeftMargin}[1]{\parbox[t]{2em}{#1}}
\newcommand{\CSLRightInline}[1]{\parbox[t]{\dimexpr\linewidth-2em}{#1}\par}
\newcommand{\CSLIndent}[1]{\hspace{2em}#1}
\newenvironment{CSLReferences}[2]{\par\setlength{\parindent}{0pt}\setlength{\parskip}{6pt}}{}
\begin{document}
'''

def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--pandoc',default='pandoc');ap.add_argument('--tectonic',default='tectonic')
    ap.add_argument('--output',type=Path,required=True,help='New build directory')
    a=ap.parse_args(); root=Path(__file__).resolve().parent
    out=a.output.resolve();out.mkdir(parents=True,exist_ok=False)
    common=[a.pandoc,'manuscript.md','--from=markdown-raw_tex','--citeproc','--bibliography=references.bib','--csl=numeric.csl','--wrap=none']
    tex=subprocess.check_output(common+['--to=latex'],cwd=root,text=True)
    tex=re.sub(r'\\bibitem\[\\citeproctext\]\{([^}]+)\}',lambda m:r'\par\phantomsection\label{'+m[1]+'}',tex)
    def public_pdf_link(match):
        target=match[1]
        if target.startswith(('https://','http://','#')): return match[0]
        path,separator,fragment=target.partition('#')
        repo=root.parents[1].resolve()
        destination=(root/path).resolve()
        relative=destination.relative_to(repo)
        if not destination.exists(): raise RuntimeError('Missing public PDF link target: '+path)
        url='https://github.com/pappa211/ai-math-experiments/blob/main/'+quote(relative.as_posix(),safe='/')
        if separator: url+='#'+fragment
        return r'\href{'+url+'}'
    tex=re.sub(r'\\href\{([^}]+)\}',public_pdf_link,tex)
    md=subprocess.check_output(common+['--to=gfm'],cwd=root,text=True)
    (root/'main.tex').write_text(PREAMBLE+tex+'\n\\end{document}\n')
    # The PDF and Markdown both contain the same citation-resolved manuscript.
    (root/'main.md').write_text(md)
    shutil.copyfile(root/'main.tex',out/'main.tex')
    with (out/'compile.log').open('w') as f:
        subprocess.run([a.tectonic,'--keep-logs','--keep-intermediates','main.tex'],cwd=out,stdout=f,stderr=subprocess.STDOUT,check=True,timeout=240)
    shutil.copyfile(out/'main.pdf',root/'main.pdf')
    result={'status':'COMPILED','manuscript_sha256':sha(root/'manuscript.md'),'bib_sha256':sha(root/'references.bib'),'tex_sha256':sha(root/'main.tex'),'markdown_sha256':sha(root/'main.md'),'pdf_sha256':sha(root/'main.pdf'),'pandoc':subprocess.check_output([a.pandoc,'--version'],text=True).splitlines()[0],'tectonic':subprocess.check_output([a.tectonic,'--version'],text=True).strip(),'parity':'Both text outputs derived from the same manuscript and citation database; visual/text checks recorded separately.'}
    (out/'BUILD.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))
if __name__=='__main__':main()
