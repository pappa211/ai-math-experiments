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
\renewcommand{\textquotesingle}{\char39}\renewcommand{\textasciigrave}{\char96}
\providecommand{\lt}{<}\providecommand{\gt}{>}
\usepackage{fancyvrb,fvextra,graphicx}
\usepackage[hidelinks,unicode]{hyperref}
\usepackage{xurl}
\hypersetup{pdftitle={Structural Results, Reductions, and Obstructions for Tuza: A Synthesis of TUZA-1-26},pdfauthor={AI Math Experiments},pdfsubject={AI-developed technical research report. Ordinary computer-assisted proofs and internal AI verification; no external human peer review or historical-priority certification.},pdfkeywords={Tuza, structural reductions, triangle packing, triangle cover, finite certificates},pdfcreator={LaTeX with Tectonic},pdfproducer={Tectonic}}
\setlength{\emergencystretch}{5em}
\widowpenalty=10000\clubpenalty=10000
\setlength{\parskip}{3pt}
\setcounter{secnumdepth}{-1}
\setcounter{tocdepth}{2}
\makeatletter\renewcommand{\@tocrmarg}{5em}\renewcommand{\@pnumwidth}{3em}\makeatother
\setlist{itemsep=2pt,topsep=4pt}
\providecommand{\tightlist}{\setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
\font\codefont="Menlo" at 9.5pt
\DefineVerbatimEnvironment{Highlighting}{Verbatim}{fontsize=\small,breaklines=true,breaksymbolleft={},breaksymbolright={},formatcom=\codefont,commandchars=\\\{\}}
\newenvironment{Shaded}{}{}
\newcommand{\passthrough}[1]{#1}
\newcommand{\CSLBlock}[1]{#1\hfill\break}
\newcommand{\CSLLeftMargin}[1]{\parbox[t]{2em}{#1}}
\newcommand{\CSLRightInline}[1]{\parbox[t]{\dimexpr\linewidth-2em}{#1}\par}
\newcommand{\CSLIndent}[1]{\hspace{2em}#1}
\newenvironment{CSLReferences}[2]{\par\setlength{\parindent}{0pt}\setlength{\parskip}{6pt}}{}
\RecustomVerbatimEnvironment{verbatim}{Verbatim}{fontsize=\small,breaklines=true,breaksymbolleft={},breaksymbolright={},formatcom=\codefont}
\begin{document}
\renewcommand{\textquotesingle}{\char39}\renewcommand{\textasciigrave}{\char96}

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
    common=[a.pandoc,'manuscript.md','--from=markdown+tex_math_single_backslash-raw_tex','--lua-filter=typeset.lua','--citeproc','--bibliography=references.bib','--csl=numeric.csl','--wrap=none','--syntax-highlighting=none']
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
    tex=tex.replace(r'\pandocbounded{\includesvg[keepaspectratio]{final-core.svg}}',r'\includegraphics[width=0.72\linewidth]{final-core.pdf}')
    tex=tex.replace(r'\square',r'\rule{0.55em}{0.55em}')
    tex=re.sub(r'\\begin\{longtable\}\[\]\{@\{\}llrr@\{\}\}(?=\s*\\toprule\\noalign\{\}\s*q & containing block)',lambda m:r'\begin{longtable}[]{@{}p{0.06\linewidth}p{0.17\linewidth}p{0.52\linewidth}p{0.15\linewidth}@{}}',tex)
    tex=tex.replace('ő', r'\H{o}').replace('Ő', r'\H{O}')
    tex=re.sub(r'\\href\{([^}]+)\}',public_link,tex)
    # Print-only pagination keeps the overview together and starts references cleanly.
    tex=tex.replace(r'\subsection{3. Evidence and status across the phase}',r'\clearpage'+r'\subsection{3. Evidence and status across the phase}')
    tex=tex.replace(r'\subsection{References}',r'\clearpage'+r'\subsection{References}')
    md=subprocess.check_output(common+['--to=gfm'],cwd=root,text=True)
    tex=re.sub(r'(\\section\{(?:\\texorpdfstring\{)?(?:[1-9]\.|10\.|Appendix|References))', r'\\clearpage\1', tex)
    shutil.copyfile(root/'final-core.pdf',out/'final-core.pdf')
    tex=tex.replace(r'\section{\texorpdfstring{1. Definitions',r'\tableofcontents\clearpage\section{\texorpdfstring{1. Definitions')
    tex=re.sub(r'\\texttt\{([0-9a-f]{40,64})\}',lambda m:r'\nolinkurl{'+m[1]+'}',tex)
    (out/'main.tex').write_text(PREAMBLE+tex+'\n\\end{document}\n')
    (out/'main.md').write_text(md)
    env={**os.environ,'SOURCE_DATE_EPOCH':'1794873600'}
    # --only-cached prevents network acquisition, including typesetting assets.
    with (out/'compile.log').open('w') as f:
        subprocess.run([a.tectonic,'--only-cached','--keep-logs','--keep-intermediates','main.tex'],cwd=out,env=env,stdout=f,stderr=subprocess.STDOUT,check=True,timeout=600)
    result={'status':'COMPILED','canonical_source':'manuscript.md','source_sha256':sha(root/'manuscript.md'),
            'bibliography_sha256':sha(root/'references.bib'),'filter_sha256':sha(root/'typeset.lua'),'build_script_sha256':sha(root/'build.py'),'style_sha256':sha(root/'numeric.csl'),'code_font':'Menlo from installed macOS font collection','code_font_sha256':sha(Path('/System/Library/Fonts/Menlo.ttc')),'figure_svg_sha256':sha(root/'final-core.svg'),'figure_pdf_sha256':sha(root/'final-core.pdf'),
            'artifacts':{n:sha(out/n) for n in ['main.md','main.tex','main.pdf']},
            'pandoc':subprocess.check_output([a.pandoc,'--version'],text=True).splitlines()[0],
            'tectonic':subprocess.check_output([a.tectonic,'--version'],text=True).strip(),
            'cache_policy':'Existing bundle assets only; no download; SOURCE_DATE_EPOCH=1794873600',
            'parity':'Markdown and LaTeX share the same citation-resolved manuscript; final visual/text checks recorded separately.'}
    (out/'BUILD.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
if __name__=='__main__':main()
