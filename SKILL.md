---
name: pdf-design-skill
description: Generate beautifully designed PDF documents — reports, guides, plans, audits, kits — in one of five named visual styles. Use this skill whenever the user asks for a designed PDF, a styled document, a report or guide "in the editorial / soft / noir / blueprint / modern style," or any polished multi-page PDF deliverable, even if they just say "make it look good" or "design this properly." Supports tables, charts, to-do lists, simple infographics, and rule-based spot illustrations. Not for filling PDF forms or extracting text from PDFs.
---

# pdf-design-skill — designed PDF documents in five styles

Turns content into a designed, multi-page PDF in one of three visual styles. The styles are complete identities, not themes: each has its own type system, palette, components, and illustration grammar. The output should look like a designer laid it out, not like a styled Word export.

## The styles

| Style | Feel | Use when |
|---|---|---|
| **editorial** | Warm paper, vermilion display type, powder-blue section pages, elegant serif italics. Magazine energy. | Guides, manifestos, lookbooks, anything with a voice |
| **soft** | White, pale-green rounded cards, lime highlighter labels, clean grotesque headings. Calm and functional. | Plans, worksheets, checklists, client docs, professional reports |
| **noir** | Charcoal grid, lime accents, Playfair headlines with one lime italic word, mono labels. Studio-dark. | Audits, playbooks, creator kits, anything with edge |
| **blueprint** | One royal blue, typewriter display type, engineer's dot grid, hand-sketched diagrams. A plan drawn with conviction. | Manifestos, frameworks, workbooks, method guides |
| **modern** | Terracotta cover with huge staggered grotesque type; vermilion, yellow and blue arriving as flat shape blocks. Loud and graphic. | Guides, ebooks, manifestos, personal-brand docs, punchy reports |

If the user doesn't name a style, ask — or infer from the content's temperature (warm/expressive → editorial, neutral/practical → soft, bold/opinionated → noir, method/framework-driven → blueprint, punchy/motivational → modern) and say which one you picked so they can switch.

## Working with the user

This skill will be used by people who aren't designers and may not know what to provide. Run a short intake before building anything:

1. **Content** — if they haven't given it, ask for it. If they only have bullet points, offer to draft the copy and say so plainly (otherwise their wording is used verbatim).
2. **Style** — offer the three styles with their one-line vibes (table below) unless they named one.
3. **Author line** — name or handle for the footer of every page.
4. **Images** — ask once: "Have photos or images you want in it? Drop them in and I'll place them. None is fine too." Never ask twice; never generate images.

**Draft checkpoint (docs over ~5 pages):** render the cover + one representative content page first, share that 2-page PDF, and confirm the direction before building the rest. Fixing taste at page 2 is cheap; at page 12 it's a rebuild.

**Edit loop:** always keep the `.html` source next to the rendered PDF. When the user asks for changes ("shorter title", "donut instead of bars", "swap page 3 and 4"), edit the source and re-render — never rebuild from scratch. Share the updated PDF after every edit round.

## Workflow

1. **Content first.** Get the final content before designing (see intake above). The user's wording is used verbatim — don't rewrite or "improve" their copy. Fix typography only (curly quotes, en/em dashes); flag factual or grammar issues rather than silently fixing them.
2. **Read the style reference** for the chosen style: `references/style-editorial.md`, `references/style-soft.md`, `references/style-noir.md`, `references/style-blueprint.md`, or `references/style-modern.md`. It has the full token table, component rules, and illustration grammar.
3. **Run `scripts/setup_fonts.sh`** once per session (installs WeasyPrint and builds all font instances for all three styles).
4. **Copy the style's template** from `assets/` (`editorial.html`, `soft.html`, `noir.html`, `blueprint.html`, `modern.html`) and replace the content. The template demonstrates every component with correct spacing — edit content, not CSS, unless a new component is truly needed.
5. **Render**: `python3 -m weasyprint input.html "Title.pdf"`
6. **Verify visually — non-negotiable.** Convert every page (`pdftoppm -png -r 60`), read each image, and check: no overflow, no orphaned headings at page bottoms, footers present, page numbers sequential, charts labeled, page balance (a page that's mostly empty looks unfinished — merge it with a neighbor).

## Component contract (all styles support these)

- **Data table** — column headers + hairline rows. Keep to ≤4 columns on letter width; split wider data into two tables.
- **Charts** — inline SVG only (WeasyPrint runs no JS). Four types: horizontal bars, vertical bars, donut, simple line. Construction rules that separate designed charts from rough ones: scale bars to the max value with the largest bar at ~75% of chart width; bar gap 60–80% of bar height; label every bar with its value at the bar end; one accent-colored "key" series (the largest or most important), the rest neutral; add 2–3 faint dotted gridlines with small value labels when values aren't self-evident; align category labels on a common left edge. If data doesn't fit these four types, use a table instead — never invent a chart type.
- **To-do list** — open and done states, optional muted parenthetical notes.
- **Infographic patterns** — exactly four: stat row (2–3 big numbers), numbered steps, timeline, spot illustration. Resist inventing new patterns; constraint is what keeps output looking designed.
- **Callout / card** — for evidence, caveats, summaries.
- **Cover, TOC (for 8+ pages), section openers, closing page.**

## Spot illustrations

Illustrations are drawn as SVG following each style's grammar. They are **opt-in, not default** — most pages should have none.

**When to draw one.** Only when the page's text makes one clear conceptual move (a filter, a decision, growth, consolidation) AND the page has room to give the drawing air. Skip pages that already carry a chart or table — they have their visual. Target density: roughly one illustration per 2–3 pages; a 5-page document might have one or two, and zero is a valid answer for data-heavy documents.

The workflow matters more than the drawing:

1. Read the section the illustration accompanies. Find the **cognitive move** — the tension, transformation, comparison, filter, or growth the text describes.
2. Choose **one metaphor** for it. One idea per graphic. If you need two metaphors, you need two graphics (or zero).
3. Pick the metaphor pattern that fits the move — each style reference lists six (filter, layers, path-with-fork, signal-from-noise, stack, orbit) with construction notes. The template's example SVG is *one* example, not the default: if every illustration in a document is "shape → arrow → shape," that's a failure.
4. Draw it using only the style's allowed vocabulary (shapes, stroke weights, fills — see the style reference). Quality bar: 4–8 elements with deliberate size variation (small/medium/large reads as designed; five same-size shapes reads as clip-art), one focal accent element, everything else quiet, at least 40% empty space. A short caption in the style's caption treatment.
5. If no honest metaphor exists, skip the illustration. A page without one beats a decorative one.
6. **Scatter, don't clump.** Illustrations spread across the document — at most one per page, in varied positions: tucked into an opener's empty corner, beside a timeline column, above a closing quote, on a statement page. Never stack them on one "illustrations page," and never give one its own heading (no "Spot illustration" or "The shape of the plan" labels) — an illustration accompanies content with only its caption; a heading turns it into a section and makes it feel bolted on.

**Geometry hygiene** (this is what separates "designed" from "rough"):

- Shapes that should touch must touch *exactly* — compute the tangent point; a 3px gap or accidental overlap reads as sloppy. Shapes that shouldn't touch need clear space between them (≥ half the smaller shape's width).
- Compose on a coarse grid: centers and edges on multiples of 8–10 SVG units, sizes from a small scale (e.g. radii 6 / 10 / 16 / 24), never arbitrary values like `r="13.7"`.
- One stroke width per graphic (the style's specified one). Mixed stroke weights inside a single illustration read as errors, not hierarchy — use size and fill for hierarchy.
- Keep every element inside the viewBox with breathing room; nothing within 8 units of the edge, and the caption never crowds the drawing.
- Balance the composition's bounding box: if all mass sits in one corner with dead space elsewhere, re-center or crop the viewBox.

**The illustration check** — after the full-document render, re-render each page that has an illustration at higher resolution (`pdftoppm -png -r 130 -f N -l N`) and look at the illustration specifically. Ask: do contact points actually touch? Does it read as one deliberate composition or random scatter? Would you post this crop on its own? If it fails, redraw it once; if it still fails, delete it and let the page breathe — a missing illustration is invisible, a rough one is the first thing readers see.

## Images

Never generate or fetch images. If the user provides images, read each one and assign it to the slot whose content matches (cover hero, section divider, inline) — the templates mark slots with `IMAGE SLOT` comments. With no images, use the style's fallback: editorial gets full-bleed accent-color statement pages, soft and noir simply flow without image blocks.

## Conventions

- 5–12 pages is the working range. US Letter.
- Footer on every page: author/brand left, page number right (set from user info — never hardcode a name).
- No overclaiming in content you're asked to draft: hedged, precise language, and any stat needs a source the reader can check.
- Name the file like a deliverable: `"<Document Title>.pdf"`.

## Pipeline quick reference

```bash
bash scripts/setup_fonts.sh                       # once per session
python3 -m weasyprint doc.html "Title.pdf"        # render
pdftoppm -png -r 60 "Title.pdf" pg                # page images for visual check
```

Read every `pg-*.png` before calling it done. Rendering "success" is not the bar — a page with overflowing text renders successfully.
