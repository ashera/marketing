# frockd — Marketing Media

Marketing creative for **[frockd.com.au](https://www.frockd.com.au)**, a peer-to-peer marketplace for buying and selling pre-loved formal dresses. This repo holds the generated video ads, the reference assets and brand kit they're built from, and the prompts/recipes used to produce them — so any asset can be reproduced or re-edited without starting from scratch.

Creative is generated with **[Higgsfield](https://higgsfield.ai)** (Marketing Studio avatars + image/video models) via the `higgsfield` CLI, with final post-production (audio mix + text/logo overlays) done in **ffmpeg**.

## Repository structure

```
.
├── output/                       # Rendered videos + post-production recipe
│   ├── frockd-launch-final-v3.mp4    # ▶️ Finished 15s launch ad (1080×1920, 9:16)
│   ├── frockd-launch-v2-raw.mp4      # Raw Higgsfield render (pre-overlay/music) — kept for re-edits
│   ├── filter.txt                    # ffmpeg filter graph for the overlay + audio mix
│   └── ovl/                          # Overlay text strings (drawtext sources)
├── brand/                        # Brand kit
│   ├── frockd-logo.png               # Transparent logo (wordmark + butterfly)
│   ├── frockd-favicon.png
│   └── fonts/ArchivoBlack-Regular.ttf  # frockd display font (matches site)
├── audio/                        # Background music + licence certificate
├── environment-refs/             # Environment/scene reference images
├── app-screenshot-refs/          # frockd app screenshots (used as in-video phone screens)
├── env-descriptors.md            # Scene descriptions for each environment ref (+ Higgsfield UUID)
├── screenshot-descriptors.md     # UI descriptions for each app screenshot (+ Higgsfield UUID)
├── ref-ids.md                    # Master map: Higgsfield UUID → local file
├── prompt-log.md                 # Every generation prompt (submitted + enhanced), dated
└── README.md
```

## Brand quick reference

| Token | Value | Use |
|-------|-------|-----|
| Display font | **Archivo Black** | Headings, logo wordmark, overlays |
| Body font | Inter | — |
| Rose accent | `#e07c8a` | CTAs, lower-third bars |
| Blush background | `#fef9f8` | — |
| Logo | `brand/frockd-logo.png` | Transparent, subtle corner placement |

## How the launch ad was made

1. **Reference assets** — environment photos and frockd app screenshots are uploaded to Higgsfield (`higgsfield upload create`); each returned UUID is logged in [`ref-ids.md`](ref-ids.md). Per-asset descriptions live in the `*-descriptors.md` files.
2. **Generate** — a 15s vertical UGC video via Higgsfield Marketing Studio (`marketing_studio_video`), using the **Sofia** preset avatar, the **Bedroom** scene setting, the frockd web product, and a listing screenshot as the phone-screen reference. Audio (voice) generated in-model.
3. **Post-production** — ffmpeg burns in branded text overlays (Archivo Black, white + shadow, rose `#e07c8a` lower-third for the URL), a subtle logo, and a ducked background-music bed. Recipe: [`output/filter.txt`](output/filter.txt).

### Reproduce / re-edit

The raw render (`output/frockd-launch-v2-raw.mp4`) is kept so overlays/music can be changed **without re-spending credits**. Re-run the post step with:

```bash
ffmpeg -y \
  -i output/frockd-launch-v2-raw.mp4 \
  -i audio/hitslab-upbeat-upbeat-music-333747.mp3 \
  -loop 1 -framerate 24 -i brand/frockd-logo.png \
  -filter_complex_script output/filter.txt \
  -map "[vout]" -map "[aout]" -t 15.07 \
  -c:v libx264 -profile:v high -pix_fmt yuv420p -crf 18 -preset medium \
  -c:a aac -b:a 192k -movflags +faststart \
  output/frockd-launch-final.mp4
```

## Conventions

- **`prompt-log.md`** — every image/video generation is logged here with title, datetime, description, cost, and both the **submitted** and **enhanced** prompts.
- **`ref-ids.md`** — every Higgsfield reference upload is recorded as `UUID → file`.
- **Cost first** — a Higgsfield cost estimate is run and reviewed before every paid render.
- **Keep the raw** — the un-post-produced source render is always retained as the cheap re-edit point.

## Licences

- **Music** — `audio/hitslab-upbeat-upbeat-music-333747.mp3`, Pixabay Content License (commercial use, **no attribution required**); certificate in `audio/`.
- **Font** — Archivo Black, SIL Open Font License.
- Generated video/image assets are produced via Higgsfield under the account's plan.
