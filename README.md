# Eugene

<img src="/Logo.png" />

Eugene is a [SMuFL](https://w3c-cg.github.io/smufl/latest/)-compliant OpenType music font inspired by the engraving style found on *E. Fromont* publications and other French sheet music published between 1890-1910.
The primary visual references are Debussy works from the Fromont catalog, including: Prélude à "l'Après-midi d'un faune" (1895), Ariettes Oubliées (1903), Suite bergamasque (1905). Other references include Durand publications from the same era.

The font is named after Eugène Fromont, founder of the publishing house.

The primary creator of the font is Mikko Patama. [Buy me a coffee](https://buymeacoffee.com/mikkopatama) if you wish to support this project.

Current glyph count: 625

<img src="/Screenshot.png" />

> **Work in progress** Glyphs not yet redesigned in Eugene fall back to [Bravura](https://github.com/steinbergmedia/bravura) by Steinberg Media Technologies GmbH.
> Glyph coverage will expand in future releases.
All original glyphs are designed against first-edition scans from the Bibliothèque nationale de France (Gallica).

## More or less complete

☑ All Staff brackets and dividers

☑ 67 different [noteheads](https://w3c-cg.github.io/smufl/latest/tables/noteheads.html)

☑ All slash noteheads

☑ Three of the most frequently used clefs with ottava variants

☑ All time signature glyphs

☑ All basic flags

☑ All standard accidentals

☑ All Gould arrow quartertone accidentals

☑ All Stein-Zimmermann accidentals

☑ All rests

☑ All bar repeat signs

☑ All common ornaments

☑ All [Precomposed trills and mordents](https://w3c-cg.github.io/smufl/latest/tables/precomposed-trills-and-mordents.html)

☑ All tuplet numbers

☑ All [Articulations](https://w3c-cg.github.io/smufl/latest/tables/articulation.html)

☑ All Octave glyphs

☑ String techniques

☑ Brass techniques

☑ Majority of Wind techniques

## Goals for future releases in order of importance

☐ Wind playing techniques

☐ More noteheads, not necessarily all in the SMuFL standard




---

## Files

| File | Description |
|---|---|
| `Installers` | Easy to use installer files for macOS and Windows |
| `Source/Eugene.ufo` | Font source files, Unified Font Object package |
| `Comparison Eugene-Bravura-Leland.pdf` | Comparison between Eugene and the default music fonts of Dorico and MuseScore |
| `Eugene glyphs.pdf` | List of all original Eugene music symbols in the latest build |
| `Eugene.otf` | SMuFL-compliant OpenType music font |
| `EugeneText.otf` | SMuFL-compliant OpenType music text font |
| `EugeneStrong.otf` | Bolder variant of the font |
| `EugeneStrongText.otf` | Bolder variant of the text font |
| `Eugene.json` | SMuFL font metadata |
| `EugeneStrong.json` | SMuFL font metadata for the stronger variant |
| `EugeneSampleScores.pdf` | A collection of sample scores engraved with Eugene |
| `LICENSE.txt` | SIL Open Font License 1.1 |
| `FONTLOG.txt` | Change log |

---

## Installation

Quick automated installation:

Download either the [macOS package](https://github.com/mikkopatama/eugenefont/blob/main/Installers/macOS/) or the [Windows installer](https://github.com/mikkopatama/eugenefont/blob/main/Installers/Windows/), which will add the correct files in the system font directories.

Manual installation:

1. Copy `Eugene.otf` and `EugeneText.otf` to `~/Library/Fonts/` (macOS) or `%LOCALAPPDATA%\Microsoft\Windows\Fonts\` (Windows) or `~/.fonts` (Linux)
2. Copy `Eugene.json` to:
   - macOS: `~/Library/Application Support/SMuFL/Fonts/Eugene/`
   - Windows: `%LOCALAPPDATA%\SMuFL\Fonts\Eugene\`
   - Linux: `$XDG_DATA_HOME/SMuFL/Fonts/Eugene/` 
3. Restart your notation app
4. Select Eugene as the music font in your notation app


---

## License

Eugene is released under the [SIL Open Font License, Version 1.1](LICENSE.txt).

Bravura glyphs used as fallback are copyright © Steinberg Media Technologies GmbH, also released under the SIL Open Font License 1.1. Source: [https://github.com/steinbergmedia/bravura](https://github.com/steinbergmedia/bravura).

---

## Acknowledgements

Visual source material from [Bibliothèque nationale de France (Gallica)](https://gallica.bnf.fr).

Fallback glyphs: [Bravura](https://github.com/steinbergmedia/bravura) by Steinberg Media Technologies GmbH.

SMuFL specification: [W3C Music Notation Community Group](https://www.w3.org/community/music-notation/).
