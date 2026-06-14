# Brand & Voice Guide

frockd — peer-to-peer marketplace for pre-loved formal dresses. Tagline: *"Built for honest deals."*

## Visual identity

| Element | Value |
|---------|-------|
| Display font | **Archivo Black** (headings, logo wordmark, video overlays) — `brand/fonts/ArchivoBlack-Regular.ttf`, SIL OFL |
| Body font | Inter |
| Mono/label font | JetBrains Mono (uppercase eyebrow labels) |
| Rose accent | `#e07c8a` — CTAs, lower-third bars |
| Soft rose | `#ebabb4` — borders/secondary |
| Blush background | `#fef9f8` |
| Text | near-black `#1a1a1a` on light; **white** on photos/video |
| Logo | `brand/frockd-logo.png` (transparent: dress mark + FROCKD wordmark + pink butterfly) |

## Logo usage in video
- Subtle, **top-centre**, ~450px wide on a 1080-wide frame, ~0.9 opacity.
- Transparent PNG so it sits over footage; the black wordmark reads on the light bedroom/daylight scenes.

## Overlay style spec (video)
- **Font:** Archivo Black. **Colour:** white with a soft drop shadow (`shadowcolor=black@0.5:shadowx=4:shadowy=4`) for legibility on footage.
- **Rose accents:** use the rose `#e07c8a` as a **lower-third bar** behind the URL/CTA (white text on rose), rather than rose text on light footage (low contrast).
- **Safe area:** keep text in the lower third, centred, with margins; avoid covering the avatar's face or the phone screen.
- Reference timing/positions: [`output/filter.txt`](output/filter.txt).

## Voice & tone
- Warm, friendly, **Australian** — "like talking to a mate." Upbeat but not performed/salesy.
- Localise: "G'day", "whilst", "wardrobe" (not "closet").
- Lead with the local hook (Sydney), state the value (buy/sell pre-loved **formal** dresses), then the launch offer (**free listings while we're getting started**), end on the URL.

## Pronunciation lexicon (for TTS / voiceover)
| Written | Say |
|---------|-----|
| **frockd** | **"frocked"** (rhymes with "rocked") — never "frock-dee" or "frog" |
| frockd.com.au | "frocked dot com dot A-U" |

> In generated spoken lines, **spell it "frocked"**; keep "frockd" only in on-screen text. See [PRODUCTION.md](../../core/docs/PRODUCTION.md) gotcha #1.

## Messaging guardrails
- "Free listings" is a **launch promo** ("whilst we're just getting started") — frame it that way, not as permanent.
- Site facts to stay consistent with: "no listing fees, no commission", "verified designers, honest condition", Sydney/NSW launch region.
