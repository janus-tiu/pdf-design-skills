# Modern style — "primary shapes, balanced"

Book-jacket DNA: a terracotta cover with huge staggered grotesque type, three loud primaries (vermilion, yellow, blue) arriving as flat shapes and blocks, Helvetica-bold energy set in Archivo. Confident, graphic, warm.

## Tokens

| Token | Value |
|---|---|
| Terracotta | `#E8794E` — cover background only, ink type on it |
| Vermilion | `#E13801` — headings on white, key shapes, accents |
| Yellow | `#FFEC3D` — full-bleed statement/table pages, shape blocks, chart bars |
| Blue | `#138EFF` — shape blocks, key chart bars, done-states, timeline dots |
| Ink | `#111111` — all text · muted `#9a938a` captions/done text |
| Cover type | Archivo B ("Archivo B") ~100px mixed case, -3px tracking, staggered lines |
| Display | Archivo XB ("Archivo XB") — stat numbers, donut center |
| Headings | Archivo B — h1 46px vermilion sentence case, h2 14px ink, kicker 12px uppercase right-aligned |
| Body | Archivo ("Archivo R" / "Archivo B" for emphasis) 11.5px / 1.68 |
| Page padding | 0.75in top / 0.9in sides / 1in bottom (full-bleed pages: 0) |

## The rules that make it this style

1. **Three primaries plus ink, nothing else** (terracotta lives only on the cover). No tints, gradients, borders, or shadows — every color arrives as a flat shape, block, or full-bleed page.
2. **The cover is staggered type over shape blocks.** Title words break one-per-line in mixed case at ~100px, each line indented differently; the author name gets the same treatment at the bottom. Words overlap the shape block.
3. **One shape block stands in for a photo**: a solid color rectangle (blue or yellow) holding a 2-shape composition — 3 shapes total on the cover, no more. If the user provides an image, the photo replaces the block's shapes — same rectangle, square corners. A second, smaller block is allowed only when there's a second image; blocks never overlap each other.
4. **Page rhythm**: terracotta cover → white content pages with vermilion headings → an occasional full-bleed yellow page (statements, showcase tables). The yellow statement page closes the document.
5. **Section openers**: ink uppercase kicker top-right, huge vermilion Archivo B headline broken over 2–3 lines, two-column body (main text + vermilion bold pull quote right).

## The shape system (recreate these exactly)

Flat SVG, exact geometry:

- **shape block** — the cover unit: `<rect>` in blue or yellow holding 2 shapes from this list, e.g. a yellow bowl `<path d="M 107 330 A 115 115 0 0 0 337 330 Z"/>` cradling a vermilion `<circle>`.
- **dome / bowl** — semicircle; flat-side-up bulging down (`A r r 0 0 0` sweep) or rotated 180 for an upward dome resting on a block.
- **seated circle** — a circle overlapping a rect's top edge with a thick page-color stroke (`stroke-width` 16–18) so it reads as nested in a cut-out.
- **offset squares** — two ink squares stepped diagonally, corners overlapping slightly: `<rect x="0" y="0" width="25" height="25"/><rect x="21" y="21" width="25" height="25"/>`. The statement-page mark.
- **oval trio** — three vertical ellipses (`rx="8" ry="16"`) in a row, single color. Sign-off mark.

## Components (all demonstrated in assets/modern.html)

Cover (staggered title + one shape block, 3 shapes total) · section opener with pull-quote column · data tables (vermilion bold heads + 2px ink rule on white; ink heads, no row rules on yellow) · to-do (2px ink squares, blue fill when done) · stat row (3px ink rule-top, Archivo XB vermilion numbers) · vermilion circle steps · timeline (ink spine, blue dots, yellow ink-ringed key dot) · charts · shape spot illustrations · closing yellow statement page with offset-squares mark.

Charts: key bar solid blue, others yellow with 1.5px ink stroke, Archivo B ink labels, values at bar ends. Donut: flat primary segments, Archivo XB center number. Line: 2.5px vermilion path, blue dots, yellow ink-ringed key dot, faint dotted gridlines.

## Illustration grammar

Spot illustrations compose ONLY the shape vocabulary: domes/bowls (semicircles either orientation), full circles, rectangles, squares, vertical ovals. Flat fills in the three primaries + ink; at most one ink element per graphic; no strokes except the seated-circle ring; no arrows. Contact and gravity carry the meaning — shapes rest on, hang from, or nest in each other.

Six metaphor patterns:

- **balance** — blue dome point-down on a yellow block: tension held, equilibrium.
- **nest** — an upward yellow bowl cradling a blue circle, small ink base bar below: support, rest.
- **stack** — block, dome, circle piled with touching edges, increasing precariousness: compounding.
- **tip** — a row of grounded shapes with one circle rolled away to the right: imbalance, change.
- **step** — offset ink squares ascending diagonally, one yellow: progress.
- **trio** — three vertical ovals, middle one blue: comparison, the middle path.

Composition: one metaphor, 2–5 large shapes, generous white space, edges touching at exactly one point where possible, caption in muted 9.5px uppercase.

## Image handling

Optional. On the cover, a user image replaces a shape block's composition — same solid rectangle, square corners, no border. On content pages images go full-width, square corners. No images → the shape blocks and full-bleed color pages carry the document; do not add substitutes.
