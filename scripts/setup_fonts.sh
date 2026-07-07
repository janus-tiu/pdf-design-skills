#!/usr/bin/env bash
# Sets up WeasyPrint + font stacks for all three pdf-doc styles.
# Idempotent — safe to re-run. Run once per session before rendering.
set -e

pip install weasyprint fonttools --break-system-packages -q 2>/dev/null | tail -1 || true

mkdir -p ~/.fonts && cd ~/.fonts

dl() { [ -f "$2" ] || curl -sL -o "$2" "$1"; }

# --- noir (dark studio) ---
dl "https://github.com/google/fonts/raw/main/ofl/playfairdisplay/PlayfairDisplay%5Bwght%5D.ttf" Playfair.ttf
dl "https://github.com/google/fonts/raw/main/ofl/playfairdisplay/PlayfairDisplay-Italic%5Bwght%5D.ttf" PlayfairItalic.ttf
dl "https://github.com/google/fonts/raw/main/ofl/jetbrainsmono/JetBrainsMono%5Bwght%5D.ttf" JetBrainsMono.ttf
dl "https://github.com/google/fonts/raw/main/ofl/inter/Inter%5Bopsz%2Cwght%5D.ttf" Inter.ttf
# --- editorial (Wander) ---
dl "https://github.com/google/fonts/raw/main/ofl/poppins/Poppins-Bold.ttf" Poppins-Bold.ttf
dl "https://github.com/google/fonts/raw/main/ofl/poppins/Poppins-ExtraBold.ttf" Poppins-ExtraBold.ttf
dl "https://github.com/google/fonts/raw/main/ofl/fraunces/Fraunces%5BSOFT%2CWONK%2Copsz%2Cwght%5D.ttf" Fraunces.ttf
dl "https://github.com/google/fonts/raw/main/ofl/fraunces/Fraunces-Italic%5BSOFT%2CWONK%2Copsz%2Cwght%5D.ttf" FrauncesItalic.ttf
dl "https://github.com/google/fonts/raw/main/ofl/jost/Jost%5Bwght%5D.ttf" Jost.ttf
# --- soft (Cera) ---
dl "https://github.com/google/fonts/raw/main/ofl/spacegrotesk/SpaceGrotesk%5Bwght%5D.ttf" SpaceGrotesk.ttf
dl "https://github.com/google/fonts/raw/main/ofl/ibmplexsans/IBMPlexSans%5Bwdth%2Cwght%5D.ttf" IBMPlexSans.ttf
# --- blueprint (Space Mono faces are static — no instancing needed) ---
dl "https://github.com/google/fonts/raw/main/ofl/spacemono/SpaceMono-Regular.ttf" SpaceMono-Regular.ttf
dl "https://github.com/google/fonts/raw/main/ofl/spacemono/SpaceMono-Bold.ttf" SpaceMono-Bold.ttf
dl "https://github.com/google/fonts/raw/main/ofl/archivo/Archivo%5Bwdth%2Cwght%5D.ttf" Archivo.ttf

python3 - <<'EOF'
import os
from fontTools.varLib.instancer import instantiateVariableFont
from fontTools.ttLib import TTFont

# Distinct family names per weight: WeasyPrint doesn't reliably select
# weights from variable fonts, so each instance gets its own family.
jobs = [
    # noir
    ("Playfair.ttf", {"wght": 800}, "Playfair-ExtraBold.ttf", "Playfair Display XB", "Regular"),
    ("PlayfairItalic.ttf", {"wght": 800}, "Playfair-ExtraBoldItalic.ttf", "Playfair Display XB", "Italic"),
    ("JetBrainsMono.ttf", {"wght": 400}, "JBM-Regular.ttf", "JetBrains Mono R", "Regular"),
    ("JetBrainsMono.ttf", {"wght": 700}, "JBM-Bold.ttf", "JetBrains Mono B", "Regular"),
    ("Inter.ttf", {"wght": 400, "opsz": 14}, "Inter-Regular.ttf", "Inter R", "Regular"),
    ("Inter.ttf", {"wght": 600, "opsz": 14}, "Inter-SemiBold.ttf", "Inter SB", "Regular"),
    # editorial — Fraunces at high optical size for that sharp display-serif look
    ("Fraunces.ttf", {"wght": 500, "opsz": 144, "SOFT": 0, "WONK": 0}, "Fraunces-Disp.ttf", "Fraunces Disp", "Regular"),
    ("FrauncesItalic.ttf", {"wght": 500, "opsz": 144, "SOFT": 0, "WONK": 1}, "Fraunces-DispIt.ttf", "Fraunces Disp", "Italic"),
    ("Jost.ttf", {"wght": 400}, "Jost-Regular.ttf", "Jost R", "Regular"),
    ("Jost.ttf", {"wght": 500}, "Jost-Medium.ttf", "Jost M", "Regular"),
    # blueprint
    ("Archivo.ttf", {"wght": 400, "wdth": 100}, "Archivo-Regular.ttf", "Archivo R", "Regular"),
    ("Archivo.ttf", {"wght": 600, "wdth": 100}, "Archivo-SemiBold.ttf", "Archivo SB", "Regular"),
    ("Archivo.ttf", {"wght": 700, "wdth": 100}, "Archivo-Bold.ttf", "Archivo B", "Regular"),
    ("Archivo.ttf", {"wght": 800, "wdth": 100}, "Archivo-ExtraBold.ttf", "Archivo XB", "Regular"),
    # soft
    ("SpaceGrotesk.ttf", {"wght": 500}, "SG-Medium.ttf", "Space Grotesk M", "Regular"),
    ("SpaceGrotesk.ttf", {"wght": 700}, "SG-Bold.ttf", "Space Grotesk B", "Regular"),
    ("IBMPlexSans.ttf", {"wght": 400, "wdth": 100}, "Plex-Regular.ttf", "Plex Sans R", "Regular"),
    ("IBMPlexSans.ttf", {"wght": 600, "wdth": 100}, "Plex-SemiBold.ttf", "Plex Sans SB", "Regular"),
]
for src, axes, out, fam, style in jobs:
    if os.path.exists(out):
        continue
    f = TTFont(src)
    instantiateVariableFont(f, axes, inplace=True)
    name = f["name"]
    for nid in (1, 16): name.setName(fam, nid, 3, 1, 0x409)
    for nid in (2, 17): name.setName(style, nid, 3, 1, 0x409)
    name.setName(f"{fam} {style}", 4, 3, 1, 0x409)
    name.setName(f"{fam}-{style}".replace(" ", ""), 6, 3, 1, 0x409)
    if style == "Italic":
        f["head"].macStyle |= 2
    f.save(out)
    print("built", out)
EOF

fc-cache -f ~/.fonts >/dev/null 2>&1
echo "Fonts ready:"
fc-list | grep -E "Playfair Display XB|JetBrains Mono [RB]|Inter [RS]|Fraunces Disp|Jost [RM]|Space Grotesk [MB]|Plex Sans" | sort
