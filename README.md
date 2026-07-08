# pdf-design-skill

A Claude skill that turns your content into beautifully designed, multi-page PDFs — reports, guides, plans, audits, kits — in one of five named visual styles. Pick your style, hand Claude your content, get a document that looks art-directed.

Made by [@janustiu](https://instagram.com/janustiu).

## Pick your style

| | |
|---|---|
| <img src="previews/editorial.png" width="380"><br>**editorial** — warm paper, vermilion + powder blue, serif italics. For travel guides, brand docs, anything expressive. | <img src="previews/soft.png" width="380"><br>**soft** — white space, pastel green cards, friendly grotesque. For proposals, onboarding, wellness content. |
| <img src="previews/noir.png" width="380"><br>**noir** — charcoal grid, lime accents, Playfair headlines. For kits, playbooks, bold personal-brand freebies. | <img src="previews/blueprint.png" width="380"><br>**blueprint** — one royal blue, mono type, hand-sketched diagrams. For frameworks, workbooks, manifestos. |
| <img src="previews/modern.png" width="380"><br>**modern** — terracotta cover, staggered grotesque type, flat primary shapes. For guides, ebooks, punchy reports. | |

Every preview above is a real document the skill produced — open the full PDFs in [`examples/`](examples/): a travel guide (editorial), a marketing report (soft), a creator freebie kit (noir), an event production plan (blueprint), and a revenue report (modern).

## What it does

Every style supports the same components, each with its own visual treatment:

- Data tables, to-do lists, stat rows, numbered steps, timelines
- Charts (bar, donut, line) drawn as clean SVG — no chart libraries, no screenshots
- Simple spot illustrations in each style's shape vocabulary, added only where they fit
- Your images, placed into the layout by content — or shape compositions when you have none

Claude prompts you to pick a style first, then asks for your content and author line, shows you a draft of the cover and one page before building everything, and keeps the source file so you can request edits without starting over.

## Install

First, download **`pdf-design-skill.skill`** from [Releases](../../releases). Then pick where you use Claude:

### Claude desktop app / Cowork

1. Drag the `.skill` file into any Claude chat.
2. Click **Save skill** on the file card.
3. That's it — ask for a designed PDF and the skill kicks in.

### Claude.ai (web)

1. Rename the downloaded file from `.skill` to `.zip`.
2. Go to **Settings → Capabilities**, make sure **Code execution & file creation** is on (requires a paid plan).
3. Under **Skills**, click **Upload skill** and select the zip. (The zip must contain the `pdf-design-skill` folder at its root — this one already does.)

### Claude Code

```
unzip pdf-design-skill.skill -d ~/.claude/skills/
```

On macOS, install Pango once so PDF rendering works: `brew install pango`

### OpenAI Codex CLI

Codex supports the same skill format:

```
unzip pdf-design-skill.skill -d ~/.codex/skills/
```

Invoke it with `$pdf-design-skill`, the `/skills` selector, or just describe the document you want. Same Pango note applies on macOS.

## Use it

Just ask, naming a style if you have a preference:

> "Make my Q2 report as a designed PDF in the noir style"

> "Turn this checklist into a guide, blueprint style"

> "Design this properly — you pick the style"

## How it's built

```
pdf-design-skill/
├── SKILL.md                  # the brain: workflow, component contract, conventions
├── references/               # one style bible per style: tokens, rules, illustration grammar
├── assets/                   # one HTML template per style, every component demonstrated
└── scripts/setup_fonts.sh    # downloads + instances all fonts
```

Claude reads the style reference, copies the matching template, replaces the content, renders with WeasyPrint, then **looks at every rendered page** and fixes what's off before handing you the file.

---

Questions or requests? Find me on Instagram: [@janustiu](https://instagram.com/janustiu)
