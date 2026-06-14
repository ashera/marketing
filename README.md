# Marketing Studio — Monorepo

Video/marketing creative for multiple products, generated with **[Higgsfield](https://higgsfield.ai)** (Marketing Studio avatars + image/video models via the `higgsfield` CLI) and finished in **ffmpeg**.

A shared **engine** holds the reusable workflow, scripts, and conventions; each **product** keeps its own brand kit, assets, prompts, and rendered videos.

## Structure

```
.
├── core/                     # Shared engine (product-agnostic)
│   ├── CONVENTIONS.md            # Standing workflow rules
│   ├── docs/
│   │   ├── PRODUCTION.md         # End-to-end playbook + solved gotchas + checklist
│   │   └── higgsfield-reference.md  # Avatar/setting IDs, params, CLI quirks, costs
│   └── scripts/
│       ├── generate.ps1          # Render via higgsfield (cost-first; -Config product.json)
│       ├── postproduce.sh        # Overlays + ducked music; verifies no audio end-clip
│       ├── burn-captions.sh      # Burn SRT captions for silent autoplay
│       └── export-formats.sh     # 9:16 → 1:1 / 16:9 with blurred-fill
└── products/
    └── frockd/               # A product (brand kit, assets, prompts, renders)
        ├── product.json          # Config the core scripts read (avatar/setting/IDs/paths)
        ├── brand.md              # Brand & voice guide
        ├── output/               # Rendered videos + filter.txt (overlay/audio recipe)
        ├── brand/ audio/ subtitles/ environment-refs/ app-screenshot-refs/
        └── ref-ids.md  prompt-log.md  *-descriptors.md  README.md
```

## Products

| Product | Folder |
|---------|--------|
| frockd — pre-loved formal-dress marketplace | [`products/frockd/`](products/frockd) |

## Quick start (make a video for a product)

```bash
# 1. Cost estimate (safe; spends nothing)
pwsh core/scripts/generate.ps1 -Config products/frockd/product.json -PromptFile prompt.txt

# 2. Render (spends credits) + download the raw
pwsh core/scripts/generate.ps1 -Config products/frockd/product.json -PromptFile prompt.txt -Go `
     -OutFile products/frockd/output/my-video-raw.mp4

# 3. Post-produce (overlays + ducked music), then optional captions / formats
PRODUCT_DIR=products/frockd bash core/scripts/postproduce.sh
PRODUCT_DIR=products/frockd bash core/scripts/burn-captions.sh
PRODUCT_DIR=products/frockd bash core/scripts/export-formats.sh
```

Then **log the prompt** (submitted + enhanced) in the product's `prompt-log.md` and any new uploads in `ref-ids.md` — see [`core/CONVENTIONS.md`](core/CONVENTIONS.md).

Scripts need the `higgsfield` CLI (authenticated) and **ffmpeg** (libx264; libass for captions). If ffmpeg isn't on `PATH`, set `FFMPEG`/`FFPROBE` env vars.

## Add a new product

1. `mkdir -p products/<name>/{output,brand,audio,subtitles}`
2. Add `products/<name>/product.json` (copy frockd's and swap the avatar/setting/web-product/image IDs + paths).
3. Drop in the brand kit (logo, font) and an `output/filter.txt` overlay recipe (start from frockd's).
4. Run the quick-start flow above with `-Config products/<name>/product.json` and `PRODUCT_DIR=products/<name>`.

## Conventions & media

- Standing rules (prompt logging, ref-id logging, cost-first, keep-raw): [`core/CONVENTIONS.md`](core/CONVENTIONS.md).
- **Git LFS** stores `*.mp4` / `*.mp3` (see `.gitattributes`) — install `git-lfs` before cloning so media materialises (`git lfs pull` if you only see pointer files).
