# BlogSeeder — Marketing Media

Marketing creative for **BlogSeeder** — an AI blog-post generator that lets users configure their **brand voice, humour, opinions, and stats**, so the output reads like *them*, not generic AI slop.

One product folder inside the [marketing monorepo](../../README.md); the shared engine (scripts, docs, conventions) lives in [`../../core/`](../../core).

**Status:** ✅ launch short delivered — `output/blogseeder-launch-final.mp4` (15s, 9:16, anti-AI-slop hook, Clara/Office, BlogSeeder UI composited in post). Pipeline and gotchas: [`../../core/docs/PRODUCTION.md`](../../core/docs/PRODUCTION.md).

> ⚠️ Current final is **upscaled from a 480p** render (the 1080p/720p renders kept hitting Higgsfield's inconsistent `ip_detected` filter; see `prompt-log.md`). Re-render a native 1080p once credits allow (480p-test first). Music **Blippy Trance is CC-BY** — add a credit line in the post description.

## How it was made
- Brand derived from the live site; CTA domain **blogseeder.com**.
- Rendered Clara at a desk **without** any web product/screenshot (those trip `ip_detected`); the real BlogSeeder UI is composited in post via `UI_IMAGE` → `core/scripts/postproduce.sh`.
- Spoken brand = "Blog Seeder" (TTS said "Seeper" otherwise); on-screen = "BlogSeeder" / "blogseeder.com".

## Files
- [`product.json`](product.json) — config the core scripts read
- [`brand.md`](brand.md) — brand & voice guide (to fill from the site)
- `ref-ids.md`, `prompt-log.md` — upload + generation logs (per [`../../core/CONVENTIONS.md`](../../core/CONVENTIONS.md))
- `brand/`, `audio/`, `output/`, `subtitles/`, `app-screenshot-refs/` — assets (created as we add them)
