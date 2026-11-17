-- Presentation-only normalization. Mathematical tokens remain mathematical tokens.
local symbols={['ℓ']='\\ell',['∖']='\\setminus',['ν']='\\nu',['τ']='\\tau',['δ']='\\delta',['Δ']='\\Delta',['ε']='\\epsilon',['ϵ']='\\varepsilon',['α']='\\alpha',['β']='\\beta',['γ']='\\gamma',['Γ']='\\Gamma',['λ']='\\lambda',['μ']='\\mu',['π']='\\pi',['ρ']='\\rho',['σ']='\\sigma',['χ']='\\chi',['ω']='\\omega',['θ']='\\theta',['Θ']='\\Theta',['κ']='\\kappa',['η']='\\eta',['ϕ']='\\phi',['φ']='\\varphi',['Σ']='\\Sigma',['Π']='\\Pi',['Ω']='\\Omega',['ψ']='\\psi',['ζ']='\\zeta',['ξ']='\\xi',['≤']='\\le',['≥']='\\ge',['≠']='\\ne',['∈']='\\in',['∉']='\\notin',['⊆']='\\subseteq',['⊂']='\\subset',['⊇']='\\supseteq',['∪']='\\cup',['∩']='\\cap',['∅']='\\varnothing',['∀']='\\forall',['∃']='\\exists',['⇒']='\\Rightarrow',['⇐']='\\Leftarrow',['⇔']='\\Longleftrightarrow',['→']='\\to',['←']='\\leftarrow',['↔']='\\leftrightarrow',['↦']='\\mapsto',['∞']='\\infty',['×']='\\times',['·']='\\cdot',['−']='-',['⌊']='\\lfloor',['⌋']='\\rfloor',['⌈']='\\lceil',['⌉']='\\rceil',['√']='\\sqrt{}',['≈']='\\approx',['≅']='\\cong',['≡']='\\equiv',['⊕']='\\oplus',['∨']='\\vee',['∧']='\\wedge',['¬']='\\neg',['ℕ']='\\mathbb{N}',['ℤ']='\\mathbb{Z}',['ℝ']='\\mathbb{R}',['ℚ']='\\mathbb{Q}',['𝔽']='\\mathbb{F}',['₂']='_2',['₀']='_0',['₁']='_1',['₃']='_3',['₄']='_4',['₅']='_5',['₆']='_6',['₇']='_7',['₈']='_8',['₉']='_9',['²']='^2',['³']='^3',['¹']='^1',['∎']='\\square',['✓']='\\checkmark'}
local function convert(s)
 for k,v in pairs(symbols) do s=s:gsub(k,function() return v..' ' end) end
 return s
end
function Math(m) m.text=convert(m.text);return m end
function Str(s)
 s.text=s.text:gsub('>=','≥'):gsub('<=','≤')
 local out=pandoc.List(); local buf=''
 local function flush() if #buf>0 then out:insert(pandoc.Str(buf));buf='' end end
 for _,cp in utf8.codes(s.text) do
  local c=utf8.char(cp)
  if symbols[c] then flush();local t=symbols[c];if t:sub(1,1)=='_' or t:sub(1,1)=='^' then t='{}'..t end;out:insert(pandoc.Math('InlineMath',t));if c=='≤' or c=='≥' or c=='⇒' or c=='⇔' then out:insert(pandoc.Space()) end
  elseif c==',' or c=='/' then buf=buf..c;flush();out:insert(pandoc.RawInline('latex','\\allowbreak{}'))
  elseif c=='=' or c=='<' or c=='>' then buf=buf..c;flush();out:insert(pandoc.Space())
  else buf=buf..c end
 end
 flush();return out
end
function Code(c)
 for k,_ in pairs(symbols) do if c.text:find(k,1,true) then return Str(pandoc.Str(c.text)) end end
 return c
end
function CodeBlock(c) return c end
function RawBlock(x)
 if x.format=='html' then local id=x.text:match('<a id="([^"]+)"');if id then return pandoc.Div({},pandoc.Attr(id)) end end
end
function RawInline(x)
 if x.format=='html' then local id=x.text:match('<a id="([^"]+)"');if id then return pandoc.Span({},pandoc.Attr(id)) end end
end
