# Noir style — "studio dark"

@janustiu's kit DNA, structured for documents. Charcoal with a faint grid, lime as the only accent, editorial serif against utilitarian mono.

## Tokens

| Token | Value |
|---|---|
| Background | `#1b1b18` with 0.5in grid of `rgba(255,255,255,0.045)` 1px lines (both axes) |
| Lime accent | `#c9f23c` |
| Headline white | `#f4f2ec` |
| Body | `#c2c0b8` · lede `#c9c7bf` · muted `#9d9b92` · footer `#85837a` |
| Cream card | `#f2efe6` bg, 8px radius, mono text `#23231c` |
| Headlines | Playfair Display ExtraBold ("Playfair Display XB"), section h1 ~37px, cover ~60px |
| Body | Inter ("Inter R" / "Inter SB" for emphasis — bold via font-family switch, not font-weight) |
| Mono | JetBrains Mono ("JetBrains Mono R" / "JetBrains Mono B"), labels ~9px, 0.14–0.18em letter-spacing |
| Page padding | 0.78in top / 0.85in sides / 1in bottom |

## The rules that make it this style

1. **Exactly one lime italic word (or short phrase) per Playfair headline** — `<span class="lime">`. Never zero, never two.
2. **Section labels in brackets**: `[ the problem ]` — mono, lowercase, wide tracking, above every h1.
3. **Lime means "look here"**: labels, borders of the primary callout, checkbox brackets, chart key series. Gray/white variants for everything secondary.
4. **Mono for all structural text** (labels, captions, footers, table heads — uppercase), Inter for reading text, Playfair only for headlines.
5. Footer every page: author/handle left (uppercase mono), page number right. This style hosts other people's content too — take the name from the user, don't assume @JANUSTIU.

## Components (all demonstrated in assets/noir.html)

Cover chip (lime pill naming the doc type) · receipt box (lime border, mono label; `.gray` variant) · cream card (for verbatim/copy-paste content) · data table (lime mono uppercase heads, lime rule, faint hairlines) · to-do (`[ ]` / `[x]` lime brackets) · stat row (lime rule-top, Playfair lime numbers, mono labels) · steps (lime left border, mono label, Playfair subhead) · timeline (faint spine, lime dots, mono whens) · charts · spot illustrations · uppercase mono figcap.

Charts: key bar solid lime, others 1px `rgba(255,255,255,0.5)` outlines, mono uppercase labels. Donut: lime arc on faint white ring. Line: 1.5px lime path, cream dots.

## Illustration grammar

Vocabulary: circle, rectangle, straight arrow. Lime 2px strokes and small lime solids = the subject. `rgba(255,255,255,0.4)` 1.5px strokes = context. Cream `#f2efe6` solid fill = at most one element per graphic (the "made thing"). Align elements to the 0.5in background grid where possible.

Composition: one metaphor, left-to-right, at most 5 elements, dark space is part of the drawing — don't fill it. Caption below in uppercase mono.

Six metaphor patterns (pick by the text's cognitive move, vary across a document):

- **signal-from-noise** (insight): 8–10 faint white circles scattered, one lime solid circle with a lime ring at 2x its radius. Vary scatter sizes.
- **system** (process, structure): three lime-stroked boxes connected by one faint path, sized differently, one containing a cream solid dot.
- **filter** (selection): faint circles left, a gap in a faint vertical line, one lime circle right.
- **layers** (foundations): 3 stacked rectangles, bottom cream solid, middle faint outline, top lime outline, widths decreasing upward.
- **stack** (compounding): rising stair of faint squares, top one lime solid, aligned to the background grid.
- **path-with-fork** (decision): faint path splitting; chosen branch lime with a lime terminal dot, other branch stops short.

Output (sketch → cream solid) stays available but use it at most once per document.

## Image handling

Rarely used in this style. If the user provides images, place them full-width with a 1px `rgba(255,255,255,0.2)` border, mono caption below. No images → no substitute needed; the grid carries the page.
