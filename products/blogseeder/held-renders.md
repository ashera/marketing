# Held Renders (`ip_detected`) — retrieve from Assets, not refundable

Per Higgsfield support: these three Marketing Studio Video jobs **completed on the model side**; `ip_detected` is a **rights-confirmation hold on the final step**, not a failure. So they are **charged and NOT refundable** — but the **outputs are available in the Higgsfield web app's Assets tab**, downloadable after a one-click **rights confirmation** (confirming the input/output rights are yours; for AI-generated content with image inputs removed it's a straight tick-through).

- **Account:** ashera247@gmail.com (Plus plan)
- **Where:** Higgsfield web app → **Assets tab** (the CLI keeps showing `ip_detected` / empty `result_url`; the tick-through is web-UI only).

## The held runs (already paid — 375 credits)

| Job ID | When (ledger) | Charged | Native res | Recipe / value |
|--------|---------------|---------|-----------|----------------|
| `9ef01d0b-3e6b-47cf-b9ed-d3c980dd0fb5` | 2026-06-14 11:21 | 75  | **720p (768×1344)** | ⭐ Fixed "Blog Seeder" pronunciation, clean (no web product/screenshot). **Best to retrieve** → re-post-produce for a sharper final than the current 480p-upscale. |
| `ed2937f6-f7d8-472d-93bf-8a82b75a65f0` | 2026-06-14 08:17 | 150 | 1080p | Old prompt → "Seeper" mispronunciation + on-screen site imagery. Lower value. |
| `aac7bf99-5fdb-4b85-868e-f6bc8f8b4d35` | 2026-06-14 08:41 | 150 | 1080p | Old prompt → "Seeper" mispronunciation. Lower value. |

## To do
- [ ] In the Assets tab, tick the rights confirmation and **download `9ef01d0b`** → save as `output/blogseeder-launch-720p-raw.mp4`.
- [ ] Re-run post-production on it for a **native 720p final** (no extra credits): `LOGO=brand/blogseeder-icon.png UI_IMAGE=app-screenshot-refs/01-home.png PRODUCT_DIR=products/blogseeder bash ../../core/scripts/postproduce.sh output/blogseeder-launch-720p-raw.mp4 output/blogseeder-launch-final.mp4 audio/BlippyTrance.mp3 15.07`
- [ ] (Optional) download the two 1080p runs for the archive, but they need a pronunciation re-fix to be usable.

## Prevention / handling
`ip_detected` holds are more likely when inputs carry rights ambiguity (web products / website screenshots with third-party stock photos) — composite real UI/branding in **post** instead, and run a cheap **480p test first**. But when a hold does happen, the output isn't lost: **retrieve it from Assets**. See [`../../core/docs/PRODUCTION.md`](../../core/docs/PRODUCTION.md) gotcha #8 and [`../../core/CONVENTIONS.md`](../../core/CONVENTIONS.md) rule 5.
