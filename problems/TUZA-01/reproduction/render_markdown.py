#!/usr/bin/env python3
"""Render this manuscript's deliberately small LaTeX subset to GitHub Markdown.

This is manuscript-specific, not a general LaTeX parser. Run after editing the
canonical TeX/BibTeX and review the result. Equations and proof text are retained.
"""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
PAPER = ROOT / 'manuscript'
tex = (PAPER / 'TuzaTriangleDeletion.tex').read_text()
bib = (PAPER / 'references.bib').read_text()

def group(text, start):
    depth = 1
    end = start
    while depth:
        end += 1
        if text[end] == '{':
            depth += 1
        elif text[end] == '}':
            depth -= 1
    return text[start + 1:end], end + 1

def command(text, name, render):
    token = '\\' + name + '{'
    while token in text:
        start = text.index(token)
        value, end = group(text, start + len(token) - 1)
        text = text[:start] + render(value) + text[end:]
    return text

def plain(text):
    for old, new in [(r"\'o", 'ó'), (r"\'a", 'á'), (r"\'e", 'é'),
                     (r'\"o', 'ö'), (r'\v e', 'ě'), (r'\_', '_'),
                     (r'\&', '&'), ('--', '-')]:
        text = text.replace(old, new)
    return text.replace('{', '').replace('}', '')

refs = {}
for entry in re.finditer(r'@\w+\{([^,]+),', bib):
    end = bib.find('\n@', entry.end())
    fragment = bib[entry.end():end if end >= 0 else len(bib)]
    fields = {}
    for field in re.finditer(r'(\w+)\s*=\s*\{', fragment):
        value, _ = group(fragment, field.end() - 1)
        fields[field[1]] = plain(value)
    refs[entry[1]] = fields

labels = {}
section = count = equation = 0
token = re.compile(r'\\section\{([^}]+)\}|\\begin\{(theorem|lemma|corollary)\}(?:\[([^\]]+)\])?(?:\\label\{([^}]+)\})?|\\begin\{equation\}(?:\\label\{([^}]+)\})?')
body = tex.split(r'\begin{document}', 1)[1].split(r'\bibliographystyle', 1)[0]

def structural(match):
    global section, count, equation
    if match[1]:
        section += 1
        count = 0
        return '\n## ' + str(section) + '. ' + match[1] + '\n'
    if match[2]:
        count += 1
        number = f'{section}.{count}'
        if match[4]:
            labels[match[4]] = number
        title = match[2].capitalize() + ' ' + number
        if match[3]:
            title += ' (' + match[3] + ')'
        return '\n**' + title + '.** '
    equation += 1
    if match[5]:
        labels[match[5]] = str(equation)
    return '\n$$\n' + r'\tag{' + str(equation) + '}\n'

body = token.sub(structural, body)
body = body.replace(r'\end{equation}', '\n$$\n')
body = re.sub(r'\\end\{(?:theorem|lemma|corollary)\}', '\n', body)
body = body.replace(r'\maketitle', '')
body = body.replace(r'\begin{abstract}', '## Abstract\n')
body = body.replace(r'\end{abstract}', '')
body = re.sub(r'\\begin\{proof\}(?:\[([^\]]+)\])?', lambda m: '\n**' + (m[1] or 'Proof') + '.** ', body)
body = body.replace(r'\end{proof}', ' ∎\n')
body = command(body, 'ref', lambda x: labels[x])
body = command(body, 'eqref', lambda x: '(' + labels[x] + ')')
body = command(body, 'paragraph', lambda x: '\n### ' + x + '\n')
body = command(body, 'emph', lambda x: '*' + x + '*')
body = command(body, 'textbf', lambda x: '**' + x + '**')
body = command(body, 'texttt', lambda x: '`' + x.replace(r'\_', '_') + '`')
body = command(body, 'cite', lambda x: ', '.join('[' + k + '](https://doi.org/' + refs[k]['doi'] + ')' for k in x.split(',')))
body = body.replace(r'\noindent', '').replace(r'\D', r'\mathcal{D}').replace(r'\oct', r'\mathrm{oct}')
# GitHub's Markdown pass consumes backslash-escaped punctuation before math
# rendering and can interpret '<t' as HTML. Equivalent named TeX commands
# preserve set delimiters, thin spacing, and strict inequalities in the UI.
body = body.replace(r'\{', r'\lbrace ').replace(r'\}', r'\rbrace ')
body = body.replace(r'\,', r'\thinspace ').replace('<', r'\lt ')
body = body.replace('~', ' ')
for old, new in [(r"Szab\'o", 'Szabó'), (r"Bujt\'as", 'Bujtás'),
                 (r'R\"odl', 'Rödl')]:
    body = body.replace(old, new)
body = body.replace('--', '–')
body = re.sub(r'\n{3,}', '\n\n', body).strip()
body = re.sub(r'\$\$\n(.*?)\n\$\$',
              lambda m: '$$\n' + '\n'.join(x for x in m[1].splitlines() if x.strip()) + '\n$$',
              body, flags=re.S)
references = []
for key, fields in refs.items():
    line = f"**[{key}]** {fields['author'].replace(' and ', ', ')}. [{fields['title']}](https://doi.org/{fields['doi']}). "
    if 'journal' in fields:
        line += f"*{fields['journal']}* {fields['volume']} ({fields['year']}), {fields['pages']}."
    else:
        line += fields['year'] + '.'
    if 'note' in fields:
        line += ' ' + fields['note'] + '.'
    if 'url' in fields:
        line += ' [Source](' + fields['url'] + ').'
    references.append(line)
header = '# A Triangle-Deletion Criterion for Tuza’s Conjecture via Equality in Ryser’s Bound\n\nAI Math Experiments: TUZA-01 · 28 October 2026\n\n'
header += 'Complete Markdown rendering of the [canonical LaTeX manuscript](TuzaTriangleDeletion.tex), with [BibTeX references](references.bib). [Build and checking instructions](../reproduction/README.md).\n\n'
result = header + body + '\n\n## References\n\n' + '\n\n'.join(references) + '\n'
result = '\n'.join(line.rstrip() for line in result.splitlines()) + '\n'
(PAPER / 'README.md').write_text(result)
print('Wrote manuscript/README.md; visually review before publication.')
