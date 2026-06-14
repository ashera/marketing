# Working Conventions

The standing rules for this project. These are the shareable, version-controlled
source of truth (they mirror the local assistant-memory rules so they travel with
the repo to any machine or collaborator).

## 1. Log every generation prompt
Every image/video generation (Higgsfield or otherwise) is appended to
the product's `prompt-log.md` (e.g. [frockd's](../products/frockd/prompt-log.md)) with: **title, type + model, ISO 8601 datetime,
one-line description, cost, output/job id**, and **both** the **submitted** and the
**enhanced** prompt (Marketing Studio rewrites prompts — capture the `enhanced_prompt`
from the result JSON). Newest entries at the bottom.
*Why:* a complete, reproducible record of what produced each asset.

## 2. Log every reference upload
Every image uploaded to Higgsfield as a reference (`higgsfield upload create`) is
recorded in the product's `ref-ids.md` (e.g. [frockd's](../products/frockd/ref-ids.md)) as **UUID → local file**. It's the single
source of truth mapping Higgsfield UUIDs back to source files.
*Why:* unambiguous `--image <uuid>` usage and easy audits.

## 3. Cost-estimate before spending
Always run `higgsfield generate cost <model> [params]` and review the credit cost
**before** any paid render, and get explicit go-ahead before spending.
`core/scripts/generate.ps1` enforces this (estimate by default; `-Go` to render).
*Why:* no surprise credit spend.

## 4. Always keep the raw render
Retain the un-post-produced source video (`output/*-raw.mp4`) even after the final
edit — it's the free re-edit point (change overlays/music without re-rendering).
Only ever clean scratch/QC artifacts (extracted frame folders, temp previews);
preserve raws, finals, `output/filter.txt`, overlay text, brand assets, and fonts.
*Why:* re-rendering costs credits and time; the raw is the cheap re-edit point.

---
See also: [docs/PRODUCTION.md](docs/PRODUCTION.md) (workflow + gotchas), and the
[root README](../README.md) for repo structure.
