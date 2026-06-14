# frockd — Marketing Media

Marketing creative for **[frockd.com.au](https://www.frockd.com.au)**, a peer-to-peer marketplace for buying and selling pre-loved formal dresses. This is one product folder inside the [marketing monorepo](../../README.md); the shared engine (scripts, docs, conventions) lives in [`../../core/`](../../core). This folder holds frockd's generated ads, reference assets, brand kit, and the prompts/recipes used to produce them — so any asset can be reproduced or re-edited without starting from scratch.

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
├── subtitles/                    # Caption .srt files
├── product.json                  # Per-product config (avatar/setting/IDs/paths) for core scripts
├── brand.md                      # Brand & voice guide (colours, fonts, tone, pronunciation)
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

The raw render (`output/frockd-launch-v2-raw.mp4`) is kept so overlays/music can be changed **without re-spending credits**. Re-run the post step with the shared script (from the repo root):

```bash
PRODUCT_DIR=products/frockd bash core/scripts/postproduce.sh
```

It reads `output/filter.txt` (overlay + audio-mix recipe) and verifies the output has no audio end-clip. Captions and alternate aspect ratios:

```bash
PRODUCT_DIR=products/frockd bash core/scripts/burn-captions.sh
PRODUCT_DIR=products/frockd bash core/scripts/export-formats.sh
```

## Engine (shared, in `../../core/`)

| Path | What |
|------|------|
| [`core/docs/PRODUCTION.md`](../../core/docs/PRODUCTION.md) | Playbook + solved gotchas (pronunciation, word budget, audio-clip trap, enhancer behaviour) + pre-flight checklist |
| [`core/docs/higgsfield-reference.md`](../../core/docs/higgsfield-reference.md) | Avatar / setting IDs, model params & CLI quirks, cost benchmarks |
| [`core/scripts/generate.ps1`](../../core/scripts/generate.ps1) | Render via higgsfield (cost-first; `-Config product.json`; `-Go` to spend) |
| [`core/scripts/postproduce.sh`](../../core/scripts/postproduce.sh) | Overlays + ducked music in one ffmpeg pass; verifies no audio end-clip |
| [`core/scripts/burn-captions.sh`](../../core/scripts/burn-captions.sh) | Burn SRT captions (Archivo Black) for silent-autoplay feeds |
| [`core/scripts/export-formats.sh`](../../core/scripts/export-formats.sh) | Repurpose 9:16 → 1:1 and 16:9 with blurred-fill background |

This product's own files: [`brand.md`](brand.md) (brand & voice guide), [`product.json`](product.json) (config for the scripts), [`subtitles/frockd-launch.srt`](subtitles/frockd-launch.srt).

Scripts require **ffmpeg** (with libx264; libass for captions). If ffmpeg isn't on `PATH`, set `FFMPEG`/`FFPROBE` env vars. Run shell scripts with `PRODUCT_DIR=products/frockd bash core/scripts/<name>.sh` from the repo root (or `bash ../../core/scripts/<name>.sh` from this folder).

## Conventions

The canonical, detailed version lives in [`../../core/CONVENTIONS.md`](../../core/CONVENTIONS.md). In short:

- **`prompt-log.md`** — every image/video generation is logged here with title, datetime, description, cost, and both the **submitted** and **enhanced** prompts.
- **`ref-ids.md`** — every Higgsfield reference upload is recorded as `UUID → file`.
- **Cost first** — a Higgsfield cost estimate is run and reviewed before every paid render.
- **Keep the raw** — the un-post-produced source render is always retained as the cheap re-edit point.

## Licences

- **Music** — `audio/hitslab-upbeat-upbeat-music-333747.mp3`, Pixabay Content License (commercial use, **no attribution required**); certificate in `audio/`.
- **Font** — Archivo Black, SIL Open Font License.
- Generated video/image assets are produced via Higgsfield under the account's plan.
