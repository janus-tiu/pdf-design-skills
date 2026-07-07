# Blueprint style — "royal blue, sketched plans"

Workbook/manifesto DNA: one loud blue, typewriter display type, engineer's dot grid, and hand-sketched whiteboard drawings. It should feel like a plan someone drew with conviction.

## Tokens

| Token | Value |
|---|---|
| Royal blue | `#0938DD` — the ONLY color. No secondary, no grays for decoration |
| Ink | `#16181d` (body text on white only) · muted `#8b8e97` (done-state and notes only) |
| Pages | White content pages; full-bleed blue pages for cover, TOC, and back cover |
| Dot grid | White dots (1.7px radius, 0.45in spacing) on blue only — full-bleed bands/columns (`.dots`), never behind body text |
| Display | Space Mono Bold, UPPERCASE — cover ~74px, back cover ~54px (sentence case allowed there) |
| Headings | Space Mono Bold blue — h1 38px, h2 19px; chapter numbers 110px Space Mono regular |
| Body | Archivo ("Archivo R" / "Archivo SB" for emphasis) 11.5px / 1.68 |
| Page padding | 0.8in top / 0.9in sides / 1in bottom (blue bleed pages: 0.35in frame) |

## The rules that make it this style

1. **Two colors, total.** Royal blue and white (plus near-black body text on white). If you're reaching for a third color, you've left the style.
2. **Display type is monospaced and uppercase.** Cover and back cover set in Space Mono Bold; big and unapologetic, 2-line breaks.
3. **The dot grid is a motif, not a background.** Dot-field bands appear on blue pages only, bleeding to the page edges — a band under the cover header, a full-height column on the back cover. Never behind body text.
4. **Chapter openers breathe**: giant blue mono number top-left ("01"), then 2+ inches of white space, then the title. Don't fill the gap.
5. **Everything structural is mono**: labels, table heads, captions, footers, stat numbers, step numbers. Body text is the only non-mono text.

## Components (all demonstrated in assets/blueprint.html)

Callout (2px blue border, mono uppercase label) · data table (full 1px blue grid borders, mono uppercase heads) · to-do (2px blue squares, filled when done) · stat row (2px blue rule-top, Space Mono Bold numbers) · numbered steps (mono "01" numerals) · timeline (blue spine, ringed dots) · charts · sketch illustrations · mono uppercase figcap.

Charts: key bar solid blue, others 1.5px blue outlines, Space Mono labels and values. Donut: blue arc on 1.5px blue-outline ring. Line: 2.5px blue path with round caps (slightly wavy is in character), white-filled blue-ringed dots.

## Illustration grammar — the sketch

This style's illustrations are hand-drawn, so the SVG must look freehand, not geometric. Technique: never use `<circle>`, `<rect>`, or straight `L`-only paths for illustration shapes. Draw every shape as a closed path of quadratic curves (`Q`) with deliberately uneven control points — corners slightly overshot, sides slightly bowed. Stroke `#0938DD`, width 2.5, `stroke-linecap="round"`, fill none (at most ONE solid-blue shape per graphic as the focal point). Radiating tick marks (3 short strokes) are the style's emphasis device — use them on the element that matters.

Six metaphor patterns (pick by the text's cognitive move, vary across a document):

- **system sketch** (process, structure): 3–4 wobbly bubbles connected by curved arrows, like a whiteboard flowchart; the outcome bubble solid blue, tick marks above it.
- **filter** (selection): several small wobbly circles left, a hand-drawn vertical strike with a gap, one solid blue bubble right.
- **path-with-fork** (decision): a wavering path that splits; chosen branch ends in a solid dot with tick marks, other branch trails off.
- **stack** (compounding): wobbly rectangles piled slightly askew, top one solid blue.
- **signal-from-noise** (insight): scattered sketch circles, one solid blue with a wobbly ring around it.
- **spark** (idea, beginning): one wobbly bubble with 5–6 radiating tick strokes of varying lengths, nothing else.

Composition: one metaphor, 4–8 elements, generous white space, caption below in mono uppercase.

## Image handling

The reference uses hand-drawn character illustrations — a skill can't generate those, so never fake them. User-provided images go full-width with a 2px blue border. With no images, statement pages carry a sketch (from the grammar above) centered over a blue quote — that IS the style's image substitute.
