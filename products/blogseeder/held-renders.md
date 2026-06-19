# Held Renders (`ip_detected`) — not refunded AND not retrievable

Three Marketing Studio Video jobs returned **`ip_detected`** (a rights-confirmation hold). Per Higgsfield support these completed model-side, so they're **charged and not auto-refunded**, and support said the outputs would be in the **Assets tab**.

**Observed reality (2026-06-19):** the held runs are **NOT in the Assets tab.** The tab shows 8 assets total — 6 from June 9 (frockd) + 2 from June 14, and the June-14 pair are the **two completed 480p test renders** (the good "Blog Seeder" one + the "Seeper" one), *not* the held runs. So the three held outputs are neither refunded nor accessible.

- **Account:** ashera247@gmail.com (Plus plan)
- **Status:** ☐ follow-up sent · ☐ resolved (refund or assets surfaced)

## The held runs (paid, 375 credits, not accessible)

| Job ID | When (UTC) | Charged | Native res | Note |
|--------|-----------|---------|-----------|------|
| `9ef01d0b-3e6b-47cf-b9ed-d3c980dd0fb5` | 2026-06-14 11:21 | 75  | 720p | Fixed pronunciation, clean recipe — the one worth recovering |
| `ed2937f6-f7d8-472d-93bf-8a82b75a65f0` | 2026-06-14 08:17 | 150 | 1080p | Old prompt (mispronunciation) + site imagery |
| `aac7bf99-5fdb-4b85-868e-f6bc8f8b4d35` | 2026-06-14 08:41 | 150 | 1080p | Old prompt (mispronunciation) |

## Follow-up message to support

> **Subject:** Held (ip_detected) runs are not in my Assets tab — please surface or refund
>
> Thanks for the explanation. However, the three held runs are **not** in my Assets tab. It shows 8 assets total — 6 from June 9 and 2 from June 14 — and the June‑14 pair are my two completed **480p test** renders, not the held runs. These three are missing and not downloadable:
> - `9ef01d0b-3e6b-47cf-b9ed-d3c980dd0fb5` (720p) — 75 credits
> - `ed2937f6-f7d8-472d-93bf-8a82b75a65f0` (1080p) — 150 credits
> - `aac7bf99-5fdb-4b85-868e-f6bc8f8b4d35` (1080p) — 150 credits
>
> Could you either make these outputs accessible in Assets, or refund the 375 credits since they aren't available? Happy to share screenshots of the Assets tab and transaction log. Thanks!

## Takeaway
Don't count on recovering a held run. The reliable levers are **avoiding the hold** (no web products / website screenshots into the model; composite branding in post) and **480p-test-first** to cap cost. We already have the good 480p source locally (`output/blogseeder-test-480p-raw.mp4`); the current final is built from it. See [`../../core/docs/PRODUCTION.md`](../../core/docs/PRODUCTION.md) gotcha #8 and [`../../core/CONVENTIONS.md`](../../core/CONVENTIONS.md) rule 5.
