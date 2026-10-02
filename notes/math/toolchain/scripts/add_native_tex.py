#!/usr/bin/env python3
"""Create editable same-path LaTeX companions without modifying Typst sources.

This bounded migration uses Typst's own evaluation for mathematics and semantic
HTML, then the existing QLNotes Pandoc adapter. It is not the native LaTeX web
export route. Existing .tex files are never overwritten without --replace.
"""
from __future__ import annotations

import argparse
from concurrent.futures import ThreadPoolExecutor
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import unicodedata
import xml.etree.ElementTree as ET

TOOLCHAIN = Path(__file__).resolve().parents[1]
REPO = TOOLCHAIN.parents[2]
sys.path.insert(0, str(TOOLCHAIN / 'scripts'))
from export import normalize_snapshot_text
from migrate_latex import replace_typst_function

INCLUDE = re.compile(r'#include\s+"([^"]+)"')
MARKER = re.compile(r'#(?P<kind>kn|ref)\s*\[')


def content_end(text: str, start: int) -> int:
    """Match a Typst content block, including markup nested around mathematics."""
    depth, math, quoted = 0, False, False
    for pos in range(start, len(text)):
        char = text[pos]
        if pos and text[pos - 1] == '\\':
            continue
        if char == '"':
            quoted = not quoted
        if quoted:
            continue
        if char == '$':
            math = not math
        if math:
            continue
        if char == '[':
            depth += 1
        elif char == ']':
            depth -= 1
            if depth == 0:
                return pos
    raise ValueError(f'unclosed content at {start}')


def replace_definition(text: str, name: str, replacement: str) -> str:
    start = text.index('#let ' + name + '(')
    following = text.find('\n#let ', start + 1)
    if following < 0:
        raise ValueError('expected following template function')
    return text[:start] + replacement + '\n' + text[following:]


def prepare_template(target: Path) -> None:
    text = (TOOLCHAIN / 'qlnotes.typ').read_text()
    text = replace_definition(text, 'kn', '''#let kn(body) = body
#let kn-native(key, body) = html.elem("span", attrs: (
  class: "ql-native-kn", data-native-key: key,
))[#body]
''')
    text = replace_definition(text, 'ref', '''#let ref(name, ..arguments) = {
  if type(name) == label { typst-ref(name) } else { name }
}
#let ref-native(key, body) = html.elem("span", attrs: (
  class: "ql-native-ref", data-native-key: key,
))[#body]
''')
    text = replace_definition(text, 'diagram', '''#let diagram(draw, caption: none, alt: "", id: none) = {
  html.elem("figure", attrs: (
    class: "ql-diagram", id: if id == none { "" } else { id },
    data-native-command: if id == none { "" } else if id.starts-with("fig-") { id.slice(4) } else { id },
  ))[
    #html.elem("p")[Native editable drawing]
    #if caption != none { html.elem("figcaption")[#caption] }
  ]
}
''')
    target.write_text(text)


def run(argv: list[str], **options) -> subprocess.CompletedProcess[str]:
    result = subprocess.run(argv, capture_output=True, text=True, **options)
    if result.returncode:
        raise RuntimeError(f'{argv[0]} failed:\n{result.stderr[-6000:]}')
    return result


def tex_escape(text: str) -> str:
    replacements = {'\\': r'\textbackslash{}', '&': r'\&', '%': r'\%',
                    '$': r'\$', '#': r'\#', '_': r'\_', '{': r'\{',
                    '}': r'\}', '~': r'\textasciitilde{}', '^': r'\textasciicircum{}'}
    return ''.join(replacements.get(ch, ch) for ch in text)


def normalize_mathml(value: str, replacements: dict[str, str]) -> str:
    """Keep styled alphabets and valid MathML in the editable representation."""
    value = re.sub(r'</?span\b[^>]*>', '', value)
    root = ET.fromstring(value)
    for element in root.iter():
        if element.tag == 'mspace' and element.get('width') == '0':
            element.set('width', '0em')
        if element.tag == 'mfrac' and element.get('linethickness') in ('0pt', '0em', '0px'):
            element.set('linethickness', '0')
        if element.tag in ('mi', 'mtext') and element.text:
            if element.tag == 'mi' and any('\u4e00' <= char <= '\u9fff' for char in element.text):
                element.tag = 'mtext'
            names = [unicodedata.name(char, '') for char in element.text if not char.isspace()]
            variant = None
            for keyword, style in [('DOUBLE-STRUCK', 'double-struck'), ('BOLD SCRIPT', 'bold-script'),
                                   ('SCRIPT', 'script'), ('BOLD FRAKTUR', 'bold-fraktur'),
                                   ('FRAKTUR', 'fraktur'), ('BOLD ITALIC', 'bold-italic'),
                                   ('BOLD', 'bold'), ('MONOSPACE', 'monospace'), ('ITALIC', 'italic')]:
                if names and all(keyword in name for name in names):
                    variant = style
                    break
            if variant:
                if element.tag == 'mtext':
                    if len(element.text.strip()) == 1:
                        element.tag = 'mi'
                    else:
                        key = f'QLNATIVEMATH{len(replacements)}END'
                        content = tex_escape(unicodedata.normalize('NFKC', element.text))
                        command = '\\textbf' if 'bold' in variant else '\\textit'
                        replacements[key] = '\\text{' + command + '{' + content + '}}'
                        element.text = key
                        continue
                if variant != 'italic' or element.tag != 'mi':
                    element.set('mathvariant', variant)
                element.text = unicodedata.normalize('NFKC', element.text)
    # MathML's zero-thickness fraction is a binomial/atop, not a fraction.
    # Pandoc's HTML reader currently discards linethickness, so preserve it
    # explicitly before asking the reader to handle the remaining expression.
    def convert_part(element):
        wrapper = ET.Element('math')
        wrapper.append(element)
        document = json.loads(run(['pandoc', '-f', 'html', '-t', 'json'],
                                  input=ET.tostring(wrapper, encoding='unicode')).stdout)
        def find(item):
            if isinstance(item, dict):
                if item.get('t') == 'Math':
                    return item['c'][1]
                for value in item.values():
                    result = find(value)
                    if result is not None: return result
            elif isinstance(item, list):
                for value in item:
                    result = find(value)
                    if result is not None: return result
            return None
        return find(document) or ''
    def visit(parent):
        for element in list(parent):
            visit(element)
        for element in list(parent):
            if element.tag != 'mfrac' or element.get('linethickness') != '0':
                continue
            numerator, denominator = (convert_part(child) for child in element)
            children = list(parent)
            is_binom = (len(children) == 3 and children[1] is element
                        and children[0].tag == 'mo' and children[0].text == '('
                        and children[2].tag == 'mo' and children[2].text == ')')
            native = ('\\binom{' if is_binom else '\\genfrac{}{}{0pt}{}{') + numerator + '}{' + denominator + '}'
            key = f'QLNATIVEMATH{len(replacements)}END'
            replacements[key] = native
            placeholder = ET.Element('mtext')
            placeholder.text = key
            if is_binom:
                for child in list(parent): parent.remove(child)
                parent.append(placeholder)
            else:
                index = list(parent).index(element)
                parent.remove(element)
                parent.insert(index, placeholder)
    visit(root)
    return ET.tostring(root, encoding='unicode')


def native_underlines(text: str) -> str:
    pattern = re.compile(r'\\underset\{¯\}\{')
    while match := pattern.search(text):
        start, depth = match.end(), 1
        end = start
        while end < len(text) and depth:
            if text[end] in '{}' and text[end - 1] != '\\':
                depth += 1 if text[end] == '{' else -1
            end += 1
        if depth:
            raise ValueError('unclosed underset math')
        text = text[:match.start()] + '\\underline{' + text[start:end - 1] + '}' + text[end:]
    return text


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--course', action='append', default=[])
    parser.add_argument('--replace', action='store_true')
    args = parser.parse_args()
    math_root = REPO / 'notes/math'
    sources = sorted(p for course in math_root.iterdir()
                     if course.is_dir() and course.name != 'toolchain'
                     and (not args.course or course.name in args.course)
                     for p in course.rglob('*.typ')
                     if not any(s in ('build', 'exports', 'site') for s in p.parts))
    sources = [p for p in sources if p.parent.name != 'diagrams']
    for source in sources:
        if source.with_suffix('.tex').exists() and not args.replace:
            raise ValueError(f'companion already exists: {source.with_suffix(".tex")}')
    build = REPO / 'knowledge/build/native-tex'
    workspace = build / 'workspace'
    workspace.mkdir(parents=True, exist_ok=True)
    shutil.copytree(math_root, workspace / 'notes/math', dirs_exist_ok=True,
                    ignore=shutil.ignore_patterns('build', 'exports', 'site', '*.tex', '*.pdf', '__pycache__'))
    prepare_template(workspace / 'notes/math/toolchain/qlnotes.typ')
    # Migration reads authored markers directly and does not consume graph state.
    (workspace / 'notes/math/toolchain/generated/knowledge-registry.typ').write_text('#let knowledge-registry = ()\n')
    records: dict[str, dict] = {}
    for source in sources:
        relative = source.relative_to(REPO)
        text = source.read_text()
        matches = list(MARKER.finditer(text))
        for match in reversed(matches):
            end = content_end(text, match.end() - 1)
            key = f'{relative.as_posix()}:{match.start()}'
            records[key] = {'source': relative.as_posix(), 'kind': match.group('kind'),
                            'typst': text[match.end():end]}
            text = text[:match.start()] + f'#{match.group("kind")}-native({json.dumps(key, ensure_ascii=False)})[' + text[match.end():]
        text = INCLUDE.sub(lambda m: '#html.elem("div", attrs: (class: "ql-native-input", '
                           f'data-native-path: {json.dumps(str(Path(m[1]).with_suffix(".tex")), ensure_ascii=False)}))[Included source]', text)
        # Reuse each authored bitmap, with a path valid from any course root.
        def image(match):
            asset = (source.parent / match[1]).resolve()
            asset.relative_to(math_root)
            path = '../' + asset.relative_to(math_root).as_posix()
            width = f', style: "width: {match[2]}%;"' if match[2] else ''
            return f'html.elem("img", attrs: (src: {json.dumps(path, ensure_ascii=False)}{width}))'
        text = re.sub(r'image\("([^"]+)"(?:,\s*width:\s*([\d.]+)%)?\s*\)', image, text)
        # Paged layout wrappers otherwise erase their contents in Typst HTML.
        text = re.sub(r'(?<!#)\balign\(center\)\[', '[', text)
        text = re.sub(r'#scale\([^)]*\)\[((?:\\.|[^\]\\])*)\]', lambda m: m[1], text)
        # Legacy TeX accents in these migrated sources otherwise evaluate to
        # Typst's unrelated `ar` function rather than a mathematical overbar.
        text = re.sub(r'(?<!\\)\\bar\s*\{([^{}]*)\}', lambda m: ' overline(' + m[1] + ') ', text)
        text = re.sub(r'(?<!\\)\\bar\s+([A-Za-z]+)', lambda m: ' overline(' + m[1] + ') ', text)
        text, _ = replace_typst_function(text, 'overline', 'accent({body}, macron)')
        text, _ = replace_typst_function(text, 'underline', 'attach(limits({body}), b: macron)')
        text = text.replace('$&$', '&').replace('$−ref$', '$−upright("ref")$')
        # Restore explicit escaped TeX display snippets left by the old migration.
        def raw_math(match):
            native = re.sub(r'\\(.)', r'\1', match[1])
            if not native.lstrip().startswith(r'\begin{'):
                native = '\\[' + native + '\\]'
            return ('#html.elem("div", attrs: (class: "ql-native-raw", data-native-tex: '
                    + json.dumps(native, ensure_ascii=False) + '))[Native TeX display]')
        text = re.sub(r'\\\$\\\$(.*?)\\\$\\\$', raw_math, text, flags=re.DOTALL)
        text = text.replace('#pagebreak()', '#html.elem("div", attrs: '
                            '(class: "ql-native-raw", data-native-tex: "\\\\clearpage"))[Page break]')
        # The two hand-authored analysis drawings do not survive semantic HTML.
        if relative.as_posix().endswith('mathematical-analysis/chapters/02-functions-countability-and-metric-spaces.typ'):
            for signature, command in [('  #table(columns: (1fr, auto, 1fr)', 'ql-analysis-function'),
                                       ('  #block(width: 150pt', 'ql-analysis-two-level'),
                                       ('  #block(width: 165pt', 'ql-analysis-lattice')]:
                position = text.index(signature)
                start = text.rfind('#align(center)[', 0, position)
                end = content_end(text, text.index('[', start))
                text = (text[:start] + '#html.elem("div", attrs: (class: "ql-native-tikz", '
                        + f'data-native-command: "{command}"))[Native editable drawing]' + text[end + 1:])
        (workspace / relative).write_text(text)

    def convert(source: Path) -> tuple[Path, str, list[dict]]:
        relative = source.relative_to(REPO)
        copied = workspace / relative
        job = build / 'render' / relative.with_suffix('')
        job.mkdir(parents=True, exist_ok=True)
        original = source.read_text()
        entry = '#show: qlnotes.with(title: "")\n' if '#show: qlnotes.with(' not in original else ''
        # Native label references must not depend on compiling another chapter first.
        entry += '''#show std.align: it => it.body
#show std.ref: it => html.elem("span", attrs: (
  class: "ql-native-label-ref", data-native-label: str(it.target),
))[Reference]
'''
        # Put the adapter after imports and before the source's remaining content.
        copied_text = copied.read_text()
        imports = re.findall(r'^#import[^\n]*\n', copied_text, re.MULTILINE)
        body = re.sub(r'^#import[^\n]*\n', '', copied_text, flags=re.MULTILINE)
        # Imports retain their original directory-relative paths through copied entry.
        copied.write_text('#import "/notes/math/toolchain/qlnotes.typ": *\n'
                         + ''.join(imports) + '\n' + entry + body)
        compilation = run(['typst', 'compile', '--root', str(workspace), '--features', 'html', '--format', 'html',
                           '--input', 'ql-export=true', str(copied), str(job / 'source.html')])
        (job / 'typst.log').write_text(compilation.stderr)
        if re.search(r'was ignored during (HTML|MathML) export', compilation.stderr):
            raise ValueError(f'layout element lost its contents: {relative}; see {job / "typst.log"}')
        rendered = (job / 'source.html').read_text()
        math_replacements: dict[str, str] = {}
        rendered = re.sub(r'<math\b.*?</math>', lambda m: normalize_mathml(m[0], math_replacements), rendered, flags=re.DOTALL)
        main = re.search(r'<main\b[^>]*>(.*?)</main>', rendered, re.DOTALL)
        if not main:
            raise ValueError(f'missing authored document body: {relative}')
        (job / 'body.html').write_text(main[1])
        # Pandoc can silently turn unsupported MathML into ordinary prose.
        ast = json.loads(run(['pandoc', str(job / 'body.html'), '-f', 'html', '-t', 'json']).stdout)
        def count_math(item):
            if isinstance(item, dict):
                return int(item.get('t') == 'Math') + sum(count_math(value) for value in item.values())
            if isinstance(item, list):
                return sum(count_math(value) for value in item)
            return 0
        expected_math = len(re.findall(r'<math\b', main[1]))
        if count_math(ast) != expected_math:
            # Adjacent inline equations may be merged by Pandoc. Check each
            # original expression independently before accepting that case.
            for expression in re.findall(r'<math\b.*?</math>', main[1], re.DOTALL):
                parsed = json.loads(run(['pandoc', '-f', 'html', '-t', 'json'], input=expression).stdout)
                if not count_math(parsed):
                    raise ValueError(f'MathML fell back to text in {relative}: {expression[:500]}')
        (job / 'math.json').write_text(json.dumps(math_replacements, ensure_ascii=False))
        (job / 'labels.json').write_text(json.dumps(re.findall(r'^\s*<([^>\n]+)>\s*$', original, re.MULTILINE), ensure_ascii=False))
        environment = dict(os.environ, QLNOTES_NATIVE_MARKERS=str(job / 'markers.json'),
                           QLNOTES_NATIVE_MATH=str(job / 'math.json'), QLNOTES_NATIVE_LABELS=str(job / 'labels.json'))
        output = run(['pandoc', str(job / 'body.html'), '-f', 'html', '-t', 'latex',
                      '--lua-filter', str(TOOLCHAIN / 'filters/native-pairs.lua'),
                      '--lua-filter', str(TOOLCHAIN / 'filters/qlnotes.lua'),
                      '--top-level-division', 'chapter', '--wrap', 'preserve'], env=environment).stdout
        output = normalize_snapshot_text(output)
        output = re.sub('[\ufe00-\ufe0f]', '', output)
        output = native_underlines(output).replace('○', r'\circ').replace(r'\int\limits_{¯}', r'\underline{\int}')
        # amsmath's default matrix limit is ten columns; authored permutation
        # arrays can be wider, with no change to their mathematics.
        if source.parent.name == 'homeworks':
            output = re.sub(r'(\\(?:label|ref)\{)(problem-\d+)(\})',
                            lambda m: m[1] + source.stem + '-' + m[2] + m[3], output)
        is_entry = '#show: qlnotes.with(' in original
        if is_entry:
            metadata = {key: value for key, value in re.findall(r'(title|subtitle|author|date):\s*"([^"]*)"', original)}
            preamble = '% !TeX program = xelatex\n\\documentclass{../toolchain/latex/qlnotes-native}\n'
            if source.parent.name == 'prob':
                preamble += '\\input{diagrams/probability-diagrams.tex}\n'
            preamble += '\\title{' + tex_escape(metadata.get('title', source.stem)) + '}\n'
            for key in ('subtitle', 'author', 'date'):
                if key in metadata:
                    preamble += '\\' + key + '{' + tex_escape(metadata[key]) + '}\n'
            preamble += '\\begin{document}\n\\frontmatter\n\\maketitle\n\\tableofcontents\n\\mainmatter\n'
            output = preamble + output + '\n\\end{document}\n'
        mappings = json.loads((job / 'markers.json').read_text())
        expected = {key for key, record in records.items() if record['source'] == relative.as_posix()}
        found = {mapping['key'] for mapping in mappings}
        if found != expected:
            raise ValueError(f'marker coverage mismatch: {relative}: missing={expected - found}, extra={found - expected}')
        for mapping in mappings:
            mapping.update(records[mapping['key']])
        return source.with_suffix('.tex'), output, mappings

    results = []
    with ThreadPoolExecutor(max_workers=4) as pool:
        for result in pool.map(convert, sources):
            results.append(result)
            print('converted', result[0].relative_to(REPO), flush=True)
    mappings = []
    for target, content, names in results:
        target.write_text(('% LaTeX companion of ' + target.with_suffix('.typ').name + '. Both formats are editable.\n' + content).rstrip() + '\n')
        mappings.extend(names)
    map_file = build / 'marker-map.json'
    if args.course and map_file.exists():
        selected_paths = {p.relative_to(REPO).as_posix() for p in sources}
        mappings = [m for m in json.loads(map_file.read_text()) if m['source'] not in selected_paths] + mappings
    map_file.write_text(json.dumps(mappings, ensure_ascii=False, indent=2) + '\n')
    print(f'Installed {len(results)} LaTeX companions; {len(mappings)} explicit marker mappings.')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
