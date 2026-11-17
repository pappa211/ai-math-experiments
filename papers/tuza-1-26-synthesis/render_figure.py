#!/usr/bin/env python3
"""Render the archived SVG's explicit lines/circles/text, preserving dash patterns.
Optional asset regeneration with PyMuPDF; the main build uses the supplied PDF.
The 23 labelled edges and their coordinates are read directly from final-core.svg.
"""
from pathlib import Path
import xml.etree.ElementTree as ET
import pymupdf as f
r=Path(__file__).resolve().parent;root=ET.fromstring((r/'final-core.svg').read_bytes());d=f.open();p=d.new_page(width=720,height=490)
def color(s):
 if s=='white':return (1,1,1)
 s=s.lstrip('#');s=''.join(c*2 for c in s) if len(s)==3 else s
 return tuple(int(s[i:i+2],16)/255 for i in (0,2,4))
edges=[]
for x in root:
 tag=x.tag.rsplit('}',1)[-1];a=x.attrib
 if tag=='line':
  edges.append(a['data-edge']);p.draw_line((float(a['x1']),float(a['y1'])),(float(a['x2']),float(a['y2'])),color=color(a['stroke']),width=float(a['stroke-width']),dashes='['+a['stroke-dasharray']+'] 0' if 'stroke-dasharray' in a else None)
 elif tag=='circle':p.draw_circle((float(a['cx']),float(a['cy'])),float(a['r']),color=color(a['stroke']),fill=color(a['fill']),width=float(a['stroke-width']))
 elif tag=='text':
  font='tiit' if a.get('font-style')=='italic' else 'helv';text=x.text or '';size=float(a['font-size']);w=f.get_text_length(text,fontname=font,fontsize=size);p.insert_text((float(a['x'])-w/2,float(a['y'])),text,fontname=font,fontsize=size,color=(0,0,0))
assert len(edges)==len(set(edges))==23
(r/'final-core.pdf').write_bytes(d.tobytes(garbage=4,deflate=True,no_new_id=True))
