#!/usr/bin/env python3
"""Derive the full GitHub manuscript from canonical LaTeX and compiled numbering."""
from pathlib import Path
import argparse,re,subprocess
ap=argparse.ArgumentParser()
ap.add_argument('--build-dir',type=Path,default=Path('build'))
ap.add_argument('--pandoc',default='pandoc')
ap.add_argument('--output',type=Path,default=Path('main.md'))
args=ap.parse_args()
root=Path(__file__).resolve().parent
aux=(args.build_dir/'main.aux').read_text()
labels=dict(re.findall(r'\\newlabel\{([^}]+)\}\{\{([^}]+)\}',aux))
citations=dict(re.findall(r'\\bibcite\{([^}]+)\}\{([^}]+)\}',aux))
tex=(root/'main.tex').read_text()
tex=tex.split(r'\begin{document}',1)[1].split(r'\end{document}',1)[0]
tex=tex.replace(r'\begin{abstract}',r'\section*{Abstract}').replace(r'\end{abstract}','')
tex=tex.replace(r'\maketitle','').replace(r'\tableofcontents','')
tex=tex.replace(r'\D(',r'\mathcal D(').replace(r'\oct',r'\operatorname{oct}')
anchors={}
def anchor(label):
 marker='EDITORIALANCHOR'+str(len(anchors))+'TOKEN'
 anchors[marker]='<a name="'+label.replace(':','-')+'"></a>'
 return '\n\n'+marker+'\n\n'
# Resolve citations and cross-references against the compiled PDF metadata.
tex=re.sub(r'\\cite\{([^}]+)\}',lambda m:'['+', '.join(r'\href{#reference-'+citations[k]+'}{'+citations[k]+'}' for k in m[1].split(','))+']',tex)
tex=re.sub(r'\\eqref\{([^}]+)\}',lambda m:r'\href{#'+m[1].replace(':','-')+'}{('+labels[m[1]]+')}',tex)
tex=re.sub(r'\\ref\{([^}]+)\}',lambda m:r'\href{#'+m[1].replace(':','-')+'}{'+labels[m[1]]+'}',tex)
# Number all theorem environments using exactly the LaTeX shared section counter.
sec=0;counter=0
pat=r'\\section\{([^}]+)\}|\\begin\{(theorem|lemma|corollary|proposition|definition|remark)\}(?:\[([^\]]+)\])?'
def numbered(m):
 global sec,counter
 if m[1]:
  sec+=1;counter=0
  return r'\section{'+str(sec)+'. '+m[1]+'}'
 counter+=1
 title=m[2].capitalize()+' '+str(sec)+'.'+str(counter)
 if m[3]:title+=' ('+m[3]+')'
 return '\n\n'+r'\textbf{'+title+'.}'+'\n\n'
tex=re.sub(pat,numbered,tex)
tex=re.sub(r'\\end\{(?:theorem|lemma|corollary|proposition|definition|remark)\}', '\n\n',tex)
tex=re.sub(r'\\begin\{proof\}\[([^\]]+)\]\\leavevmode',lambda m:'\n\n'+r'\emph{'+m[1]+'.}'+'\n\n',tex)
tex=tex.replace(r'\begin{proof}\leavevmode','\n\n'+r'\emph{Proof.}'+'\n\n').replace(r'\end{proof}','\n\n'+r'\(\square\)'+'\n\n')
# Number displayed equations exactly as in the PDF; unnumbered displays remain so.
eq=0
def equation(m):
 global eq
 eq+=1
 body=m[1];found=re.findall(r'\\label\{([^}]+)\}',body)
 for lab in found:assert labels[lab]==str(eq),(lab,labels[lab],eq)
 body=re.sub(r'\\label\{[^}]+\}','',body)
 return ''.join(anchor(lab) for lab in found)+'\n\\[\n'+body+'\n\\tag{'+str(eq)+'}\n\\]\n'
tex=re.sub(r'\\begin\{equation\}([\s\S]*?)\\end\{equation\}',equation,tex)
tex=re.sub(r'\\label\{([^}]+)\}',lambda m:anchor(m[1]),tex)
tex=tex.replace(r'\bibliographystyle{plain}','').replace(r'\bibliography{references}','')
tex=re.sub(r'\\begin\{description\}\[[^\]]+\]',r'\\begin{description}',tex)
tex=tex.replace(r'\par\medskip\noindent', '\n\n').replace(r'\hfill','').replace(r'\leavevmode','')
# Use the compiled BibTeX bibliography to retain the PDF's exact order and metadata.
bbl=(args.build_dir/'main.bbl').read_text().replace(r'\newblock',' ')
entries=re.split(r'\\bibitem\{([^}]+)\}',bbl)
tex+='\n\\section*{References}\n'
for i in range(1,len(entries),2):
 key=entries[i];body=entries[i+1].split(r'\end{thebibliography}',1)[0]
 tex+=anchor('reference-'+citations[key])+r'\textbf{['+citations[key]+']}'+' '+body+'\n'
(args.build_dir/'markdown-input.tex').write_text(tex)
result=subprocess.run([args.pandoc,'-f','latex','-t','gfm','--wrap=none'],input=tex,text=True,capture_output=True,check=True)
assert not result.stderr.strip(),result.stderr
out='# Triangle Restoration and Packing–Covering Stability in Tuza’s Conjecture\n\nAI Math Experiments · 29 October 2026\n\n[PDF](main.pdf) · [Canonical LaTeX](main.tex) · [BibTeX](references.bib) · [Scope and provenance](README.md)\n\n'+re.sub(r'(?m)^# ', '## ', result.stdout)
section_no=0;subsection_no=0
for heading in re.finditer(r'\\(section|subsection)\{([^}]+)\}',(root/'main.tex').read_text()):
 if heading[1]=='section':section_no+=1;subsection_no=0
 else:
  subsection_no+=1
  out=out.replace('## '+heading[2]+'\n','### '+str(section_no)+'.'+str(subsection_no)+' '+heading[2]+'\n')
for marker,html in anchors.items():out=out.replace(marker,html)
# GitHub display math is kept on separate lines.
out=re.sub(r'(?m)^\\\[(.*?)\\\]$',r'$$\1$$',out)
out=re.sub(r' {2,}\n','<br>\n',out)
args.output.write_text(out)
print(f'{args.output}: {len(out.encode())} bytes; {sec} sections; {eq} numbered equations; {len(citations)} references')
