# Eugene

Eugene is a [SMuFL](https://w3c-cg.github.io/smufl/latest/)-compliant OpenType music font inspired by the engraving style of **E. Fromont**, the Parisian music publisher active in the early 20th century. 
The primary visual referencer are the Debussy works from the Fromont catalog of 1900–1910.

The font is named after Eugène Fromont, founder of the publishing house.

> **Version 0.5 — work in progress.** Glyphs not yet redesigned in Eugene fall back to [Bravura](https://github.com/steinbergmedia/bravura) by Steinberg Media Technologies GmbH.
> Glyph coverage will expand in future releases.
All original glyphs are designed against first-edition scans from the IMSLP archive and the Bibliothèque nationale de France (Gallica). The engraving tradition differs in several respects from Bravura, Leland, and other contemporary SMuFL fonts.
---

## Files

| File | Description |
|---|---|
| `Eugene.otf` | SMuFL-compliant OpenType music font |
| `eugene_metadata.json` | SMuFL font metadata |
| `LICENSE.txt` | SIL Open Font License 1.1 |
| `FONTLOG.txt` | Version and change history |

---

## Installation

### Dorico

1. Copy `Eugene.otf` to `~/Library/Fonts/` (macOS) or `C:\Windows\Fonts\` (Windows)
2. Copy `eugene_metadata.json` to:
   - macOS: `~/Library/Application Support/SMuFL/Fonts/Eugene/`
   - Windows: `%APPDATA%\SMuFL\Fonts\Eugene\`
3. Restart Dorico
4. Select Eugene via `Library → Music Fonts`

### MuseScore

1. Copy `Eugene.otf` to the system fonts directory (`~/Library/Fonts/` (macOS) or `C:\Windows\Fonts\` (Windows))
2. Copy `eugene_metadata.json` to the SMuFL fonts directory:
   - macOS: `~/Library/Application Support/SMuFL/Fonts/Eugene/`
   - Windows: `%APPDATA%\SMuFL\Fonts\Eugene\`
3. Restart MuseScore
4. Select Eugene via `Edit → Preferences → Score → Music Font`

---

## License

Eugene is released under the [SIL Open Font License, Version 1.1](LICENSE.txt).

Bravura glyphs used as fallback are copyright © Steinberg Media Technologies GmbH, also released under the SIL Open Font License 1.1. Source: [https://github.com/steinbergmedia/bravura](https://github.com/steinbergmedia/bravura).

---

## Acknowledgements

Visual source material from [Bibliothèque nationale de France (Gallica)](https://gallica.bnf.fr).

Fallback glyphs: [Bravura](https://github.com/steinbergmedia/bravura) by Steinberg Media Technologies GmbH.

SMuFL specification: [W3C Music Notation Community Group](https://www.w3.org/community/music-notation/).
