#!/usr/bin/env python3
"""Build matched Markdown, editable LaTeX and PDF in a new output directory.
Requires Pandoc 3.13, Tectonic 0.17.0 and a populated Tectonic bundle cache.
No automatic installation, download or edits to source/report siblings.
"""
from pathlib import Path
import argparse, hashlib, json, os, re, shutil, subprocess
from urllib.parse import quote
PREAMBLE=r'''\documentclass[11pt,a4paper]{article}
\usepackage[T1]{fontenc}
\usepackage{lmodern,amsmath,amssymb,amsthm,mathtools}
\DeclareMathSizes{10.95}{10.95}{8}{8}
\DeclareMathSizes{10}{10}{8}{8}
\DeclareMathSizes{8}{8}{8}{8}
\usepackage[margin=24mm]{geometry}
\usepackage{microtype,enumitem,booktabs,longtable,array,calc}
\usepackage{fancyvrb,fvextra,graphicx}
\usepackage[hidelinks,unicode]{hyperref}
\usepackage{xurl}
\hypersetup{pdftitle={TUZA-11-15 Research Summary: Sparse Equality, Compatibility and Proof Obstructions},pdfauthor={AI Math Experiments},pdfsubject={AI-developed technical research report. Ordinary computer-assisted proofs and internal AI verification; no external human peer review or historical-priority certification.},pdfkeywords={Tuza, sparse equality, triangle packing, triangle cover, finite certificates},pdfcreator={LaTeX with Tectonic},pdfproducer={Tectonic}}
\setlength{\emergencystretch}{3em}
\widowpenalty=10000\clubpenalty=10000
\setlength{\parskip}{3pt}
\setcounter{secnumdepth}{-1}
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
    ap.add_argument('--output',required=True,type=Path)
    ap.add_argument('--pandoc',default='pandoc');ap.add_argument('--tectonic',default='tectonic')
    a=ap.parse_args();root=Path(__file__).resolve().parent;repo=root.parents[1]
    out=a.output.resolve()
    if out==repo or repo in out.parents:raise ValueError('Build output must be outside the checkout')
    out.mkdir(parents=True,exist_ok=False)
    common=[a.pandoc,'manuscript.md','--from=markdown-raw_tex','--citeproc','--bibliography=references.bib','--csl=numeric.csl','--wrap=none','--syntax-highlighting=none']
    tex=subprocess.check_output(common+['--to=latex'],cwd=root,text=True)
    tex=re.sub(r'\\bibitem\[\\citeproctext\]\{([^}]+)\}',lambda m:r'\par\phantomsection\label{'+m[1]+'}',tex)
    def public_link(m):
        target=m[1].replace(r'\#','#')
        if target.startswith(('http://','https://','#')):return m[0]
        path,sep,fragment=target.partition('#');destination=(root/path).resolve()
        rel=destination.relative_to(repo)
        if not destination.exists() and path not in {'main.pdf','main.md','main.tex'}:raise ValueError('Missing PDF link target: '+path)
        url='https://github.com/pappa211/ai-math-experiments/blob/main/'+quote(rel.as_posix(),safe='/')
        if sep:url+='#'+fragment
        return r'\href{'+url+'}'
    tex=re.sub(r'\\href\{([^}]+)\}',public_link,tex)
    # Print-only pagination keeps the overview together and starts references cleanly.
    tex=tex.replace(r'\subsection{3. Evidence and status across the phase}',r'\clearpage'+r'\subsection{3. Evidence and status across the phase}')
    tex=tex.replace(r'\subsection{References}',r'\clearpage'+r'\subsection{References}')
    md=subprocess.check_output(common+['--to=gfm'],cwd=root,text=True)
    (out/'main.tex').write_text(PREAMBLE+tex+'\n\\end{document}\n')
    (out/'main.md').write_text(md)
    env={**os.environ,'SOURCE_DATE_EPOCH':'1793664000'}
    # --only-cached prevents network acquisition, including typesetting assets.
    with (out/'compile.log').open('w') as f:
        subprocess.run([a.tectonic,'--only-cached','--keep-logs','--keep-intermediates','main.tex'],cwd=out,env=env,stdout=f,stderr=subprocess.STDOUT,check=True,timeout=240)
    result={'status':'COMPILED','canonical_source':'manuscript.md','source_sha256':sha(root/'manuscript.md'),
            'bibliography_sha256':sha(root/'references.bib'),'style_sha256':sha(root/'numeric.csl'),
            'artifacts':{n:sha(out/n) for n in ['main.md','main.tex','main.pdf']},
            'pandoc':subprocess.check_output([a.pandoc,'--version'],text=True).splitlines()[0],
            'tectonic':subprocess.check_output([a.tectonic,'--version'],text=True).strip(),
            'cache_policy':'Existing bundle assets only; no download; SOURCE_DATE_EPOCH=1793664000',
            'parity':'Markdown and LaTeX share the same citation-resolved manuscript; final visual/text checks recorded separately.'}
    (out/'BUILD.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
if __name__=='__main__':main()
