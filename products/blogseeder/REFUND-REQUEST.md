# Refund Request — BlogSeeder blocked renders

Three Marketing Studio Video jobs were charged but produced **no output** (Higgsfield `ip_detected` moderation block, empty result). Unlike `failed` jobs, these were **not auto-refunded**.

- **Account:** ashera247@gmail.com (Plus plan)
- **Contact:** support@higgsfield.ai (send from the account email) · https://higgsfield.ai/contact · Discord (via contact page)
- **Status:** ☐ not yet sent  ·  ☐ sent  ·  ☐ refunded
- **Evidence:** `higgsfield account transactions --size 12` (shows the charges and absent refunds)

## Jobs to refund (375 credits)

| Job ID | When (ledger) | Charged | Status |
|--------|---------------|---------|--------|
| `ed2937f6-f7d8-472d-93bf-8a82b75a65f0` | 2026-06-14 08:17 | 150 | ip_detected, no video |
| `aac7bf99-5fdb-4b85-868e-f6bc8f8b4d35` | 2026-06-14 08:41 | 150 | ip_detected, no video |
| `9ef01d0b-3e6b-47cf-b9ed-d3c980dd0fb5` | 2026-06-14 11:21 | 75  | ip_detected, no video |

## Message to send

> **Subject:** Refund request — credits charged for blocked (ip_detected) renders, no output
>
> Hi Higgsfield team,
>
> My account (ashera247@gmail.com, Plus plan) was charged credits for three Marketing Studio Video jobs that **failed to produce any output** — each returned status **`ip_detected`** with an empty result. I was billed in full and not auto-refunded (unlike my `failed` jobs, which did refund).
>
> Please refund the credits for:
> - `ed2937f6-f7d8-472d-93bf-8a82b75a65f0` — 150 credits — ip_detected, no result
> - `aac7bf99-5fdb-4b85-868e-f6bc8f8b4d35` — 150 credits — ip_detected, no result
> - `9ef01d0b-3e6b-47cf-b9ed-d3c980dd0fb5` — 75 credits — ip_detected, no result
>
> Total: **375 credits**. Happy to provide anything else you need. Thanks!

## Prevention (already applied)
Avoid future `ip_detected` charges: don't feed web products / website screenshots into the model (composite real UI in post), and always run a cheap **480p test first**. See [`../../core/docs/PRODUCTION.md`](../../core/docs/PRODUCTION.md) gotcha #8 and [`../../core/CONVENTIONS.md`](../../core/CONVENTIONS.md) rule 5.
