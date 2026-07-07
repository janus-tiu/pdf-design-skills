# Editorial style — "warm paper, loud type"

Magazine DNA: a travel-guide/lookbook feel. The rhythm comes from alternating page colors — paper, powder blue, vermilion — and from the tension between the heavy geometric sans and the elegant serif.

## Tokens

| Token | Value |
|---|---|
| Paper | `#F4F2EF` |
| Ink | `#1c1c1c` |
| Vermilion (accent) | `#FF5D21` |
| Powder blue (secondary) | `#9ABFE1` |
| Display | Poppins ExtraBold ("Poppins ExtraBold"), covers 80–96px, statements 56–64px, always tight line-height (1.02) |
| Serif | Fraunces at display optical size ("Fraunces Disp" / italic) — chapter titles 40–44px, h2 22px |
| Body | Jost ("Jost R", "Jost M" for emphasis) 11.5px / 1.66 |
| Page padding | 0.75in top / 0.85in sides / 1in bottom |

## The rules that make it this style

1. **Display type is always vermilion** (or paper-white on orange pages). Never black display type.
2. **Serif titles carry one italic phrase** — `<span class="serifit">` — like "Packing Light, Packing *Smart*".
3. **Alternate page backgrounds** for rhythm: chapter openers on powder blue or paper; between major parts, a full-bleed orange statement page with big serif in cream. Never two orange pages in a row.
4. **Running head on every content page**: "Chapter N" bold left, letterspaced doc title right.
5. Body copy stays narrow (max 5.6in) and calm — the drama lives in the display type, not the paragraphs.

## Components (all demonstrated in assets/editorial.html)

Callout (1.5px ink border, italic serif label in vermilion) · data table (serif column heads, 1.5px top rule, hairline rows) · to-do (orange square boxes, filled when done) · stat row (rule-top, Poppins XB orange numbers) · numbered steps (big orange numerals) · timeline (ink spine, orange dots) · charts · spot illustrations · figcap in italic serif.

Charts: key bar solid vermilion, remaining bars 1.3px ink outlines, Jost labels, Poppins Bold value labels. Donut: vermilion arc on ink hairline circle. Line: 2.5px ink path, vermilion dots on data points.

## Illustration grammar

Vocabulary: circle, rectangle, arc, straight arrow (3px ink strokes, flat caps). Vermilion = the subject (small solid shapes). Powder blue = context/containers (solid fills with ink stroke). Nothing else — no gradients, no curves for their own sake, no faces.

Composition: one metaphor, centered or left-aligned, at most 5 elements, at least 40% empty space. Caption below in italic serif, lowercase, no period.

Six metaphor patterns (pick by the text's cognitive move, vary across a document):

- **filter** (selection, focus): 6–8 small ink-outline circles scattered left, a vertical gap or narrow opening mid-frame, one vermilion solid circle right. Scatter sizes 6–14px radius.
- **layers** (depth, foundations): 3 stacked horizontal rectangles, widths decreasing upward, bottom one blue solid, top one vermilion, middle ink outline.
- **path-with-fork** (decision): one 3px ink path splitting into two; the chosen branch ends in a vermilion dot, the other fades (shorter, no terminal).
- **signal-from-noise** (insight): grid of faint small ink circles, one replaced by a larger vermilion circle with a thin ink ring around it.
- **stack** (accumulation, compounding): 4–5 blue squares in a rising stair, top one vermilion, sizes growing slightly.
- **orbit** (attention, gravity): large ink-outline circle center, 3 small shapes at varying distances, the closest one vermilion.

Transformation (before → after) stays available but use it at most once per document.

## Image handling

Photo-led style, so image slots matter most here: full-width cover hero (5–6in tall), TOC image band, chapter-opener images. With no user images, replace every photo moment with a full-bleed orange or blue statement page — the style survives on color alone.
