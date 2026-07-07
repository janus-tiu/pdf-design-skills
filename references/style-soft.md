# Soft style — "green highlighter on clean white"

Calm, functional doc DNA. White space does the designing; green appears only as soft fills, never as text color. Everything rounded, nothing loud.

## Tokens

| Token | Value |
|---|---|
| Page | `#FFFFFF` |
| Ink | `#1d1d1d` |
| Pale green (cards) | `#EAFFD1`, radius 12–16px |
| Lime (highlights, chips) | `#D0FF9B` |
| Hairline gray | `#D2D2D2`–`#D9D9D9` |
| Headings | Space Grotesk ("Space Grotesk M", "Space Grotesk B" for stat numbers) — cover 54px, h2 22px |
| Body | IBM Plex Sans ("Plex Sans R", "Plex Sans SB" for emphasis) 11px / 1.68 |
| Page padding | 0.8in top / 0.9in sides / 1in bottom |

## The rules that make it this style

1. **Green is a background, never a text color.** Text on green is always ink.
2. **Every h2 gets a hairline rule underneath.** It's the page's only line work.
3. **Key labels get the highlighter**: `<span class="hl">` — lime background, semibold, rounded 4px. Use it like a marker pen: sparingly, on the words that matter.
4. **Cover has the gradient hero band** (lime → white, top 2.4in) and a centered title. This is the one gradient in the whole system.
5. Radius everywhere: cards 16px, stat cards 12px, images 12px, chips 4px. No sharp corners.

## Components (all demonstrated in assets/soft.html)

Green card with grotesque title · two-column layout with highlighter labels · data table (bordered grid, pale-green header row, centered heads) · to-do (rounded checkbox, lime check when done) · stat cards (pale-green fills, Space Grotesk B numbers) · numbered steps (lime circle numerals) · timeline (gray spine, lime ringed dots) · charts · spot illustrations · gray figcap.

Charts: rounded bars (rx = half the bar height), key series lime, others `#E8E8E8`, Plex SB labels. Donut: lime arc on `#E8E8E8` ring. Line: 1.5px ink path with lime dot fills.

## Illustration grammar

Vocabulary: rounded rectangle (rx ≥ 12), circle, straight arrow (1.5px ink strokes). Lime = the resolved/finished state. Dashed 1.5px stroke = the rough/unfinished state. White fill + ink stroke = neutral elements.

Composition: one metaphor, horizontal flow reading left to right, at most 5 elements, generous padding. Caption below in 9.5px gray, lowercase.

Six metaphor patterns (pick by the text's cognitive move, vary across a document):

- **filter** (selection, focus): 6–8 small dashed circles scattered left, a gap, one lime solid rounded square right.
- **layers** (depth, foundations): 3 stacked rounded rects, bottom lime solid, others white with ink stroke, widths decreasing upward.
- **path-with-fork** (decision): 1.5px ink path splitting; chosen branch ends in a lime circle, other branch dashed.
- **signal-from-noise** (insight): loose grid of small ink-stroke circles, one larger lime circle with white center dot.
- **stack** (accumulation): rising stair of rounded rects, top one lime, gentle size growth.
- **grouping** (organizing): 3–4 small white circles inside one large rounded lime container, one circle still outside.

Progress (dashed → solid) stays available but use it at most once per document.

## Image handling

Optional in this style. User images go in rounded (12px) full-width blocks between sections. With no images, the layout simply flows — do not substitute color pages; whitespace is the aesthetic.
