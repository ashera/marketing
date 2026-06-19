# Prompt Log — BlogSeeder

A running record of every image and video generation prompt run for BlogSeeder. **A new entry is appended every time a generation is run** — newest at the bottom. Each entry: title, type + model, ISO 8601 datetime, description, cost, output/job id, and both the **submitted** and **enhanced** prompts (see [`../../core/CONVENTIONS.md`](../../core/CONVENTIONS.md)).

---

## BlogSeeder launch — Clara UGC short

- **Type:** video — marketing_studio_video (Higgsfield Marketing Studio)
- **Datetime:** 2026-06-14T18:17:56+10:00
- **Description:** 15s 9:16 vertical launch short; anti-AI-slop hook. Clara avatar, Office/desk setting, holds phone showing BlogSeeder green landing. CTA blogseeder.com.
- **Settings:** avatar=Clara (`daf4bf2e-c19e-4879-805b-bcfa6eda61f2`) · setting=Office (`d39dda10-643c-44e2-bfc8-2451dddde7d9`) · web_product=BlogSeeder (`6ca86c91-e27f-45ba-ac82-12f92172eca2`) · phone image=home screenshot (`8eef9d6d-f74d-4f41-a79e-fff73e47d686`) · 9:16 · 1080p · 15s · generate_audio=true · mode=ugc
- **Cost:** 150 credits
- **Output / job id:** `ed2937f6-f7d8-472d-93bf-8a82b75a65f0`
- **Outcome:** ⚠️ BLOCKED — status `ip_detected` (Higgsfield IP/content moderation); no video produced. **150 credits charged, no auto-refund** (refunds do occur — request via support). Suspected trigger: the BlogSeeder website screenshot used as `start_image` (third-party stock hero photo / site branding). Re-roll plan: drop the `--image`, render Clara at desk only, and composite the real BlogSeeder UI in post (IP-safe + crisper).

**Prompt (submitted):**

> UGC-style vertical selfie video, about 15 seconds. A relatable young content marketer sits at a tidy desk with an open laptop, soft natural office daylight, warm and genuine. She talks straight to camera, casual and a little fed-up-then-excited, like venting to a friend who gets it. Partway through she holds up her smartphone toward the camera, screen facing us, clearly showing the BlogSeeder website — a fresh green "Plant a topic. Grow a blog." landing page. The brand name "BlogSeeder" is pronounced "blog seeder". Keep the spoken dialogue concise (around 35 words) so it fits comfortably inside 15 seconds and the closing call-to-action lands cleanly. She says: "Sick of blogs that scream 'written by AI'? BlogSeeder learns your voice — your humour, your opinions, your stats — and writes posts that sound like you. Plant a topic, grow a blog at blogseeder dot com." Authentic hand-held selfie feel, bright and upbeat.

**Prompt (enhanced — returned by Marketing Studio):**

> — REFERENCE BLOCK — @image_1 (main): Tall lean young woman, light warm skin, hazel eyes, strawberry-blonde hair in a relaxed bun; black-and-white polka-dot puff-sleeve romper with white Peter Pan collar. Match face/outfit only.
> — LOCATION — Minimal modern home desk, late morning. Light oak desktop, slim laptop with soft monitor glow, ceramic coffee mug, small potted plant. Warm diffused daylight from window off-frame left. Clean, cream walls.
> — PROMPT — Selfie mode, phone at arm's length, chest-to-face, desk behind.
> SHOT [00:00–00:02]: Exhales, glances at laptop, snaps back to camera. Deadpan mid-task hook, no words.
> SHOT [00:02–00:07]: Leans in, conspiratorial. "Sick of blogs that scream 'written by AI'? BlogSeeder learns your voice — your humour, your opinions, your stats."
> SHOT [00:07–00:11]: Flips phone to camera — BlogSeeder homepage visible (green hero, "Plant a topic. Grow a blog.", "Start generating"). Holds steady.
> SHOT [00:11–00:15]: Phone back to selfie, small genuine smile. "— and writes posts that sound like you. Plant a topic, grow a blog at blogseeder dot com." Soft nod.
> — TECHNICAL — iPhone 23mm front cam, HDR warm, handheld micro-drift. Audio: iPhone mic, faint keyboard/AC ambient. No music.

*(Note: SHOT 3 reproduces the website screenshot on the phone — that `start_image` is the suspected IP-detection trigger.)*

---

## BlogSeeder launch — Clara UGC short (v2, no screenshot)

- **Type:** video — marketing_studio_video (Higgsfield Marketing Studio)
- **Datetime:** 2026-06-14T18:41:26+10:00
- **Description:** Re-roll after the v1 IP block. Same script/avatar/setting, but **no website image fed to the model** (Clara at desk only, screens kept out of focus). The real BlogSeeder UI is composited in post instead.
- **Settings:** avatar=Clara · setting=Office · web_product=BlogSeeder (`6ca86c91…`) · **no --image** · 9:16 · 1080p · 15s · generate_audio=true · mode=ugc
- **Cost:** 150 credits
- **Output / job id:** `aac7bf99-5fdb-4b85-868e-f6bc8f8b4d35`
- **Outcome:** ⚠️ BLOCKED again — `ip_detected`, no video, **150 credits charged** (balance 196). Removing the screenshot did NOT clear it → prime suspect is now the **web_product** (`6ca86c91…`), which embeds the site's third-party stock hero photo. Next step: a cheap **480p (~52cr)** diagnostic render with **no web_product** to isolate the cause before any 1080p final. Note: cost scales with resolution (480p≈52, 720p≈75, 1080p=150).

**Prompt (submitted):**

> UGC-style vertical selfie video, about 15 seconds. A relatable young content marketer sits at a tidy modern home desk with an open laptop, a ceramic coffee mug, and a small plant, soft natural daylight from a window off to the left. She talks straight to camera, casual and a little fed-up-then-excited, like venting to a friend who gets it; occasionally gesturing toward her laptop. Do NOT show any specific on-screen website, app UI, or logos — keep screens out of focus or off-frame. The brand name "BlogSeeder" is pronounced "blog seeder". Keep the spoken dialogue concise (around 35 words)... She says: "Sick of blogs that scream 'written by AI'? BlogSeeder learns your voice — your humour, your opinions, your stats — and writes posts that sound like you. Plant a topic, grow a blog at blogseeder dot com." Authentic hand-held selfie feel, bright and upbeat.

**Prompt (enhanced — returned by Marketing Studio):**

> _(not retained — job blocked before completion)_

---

## BlogSeeder — diagnostic test renders (480p, no web product)

- **`5ad89033-dfc6-40cc-81cf-a38cce27f94c`** (480p): `failed` (transient) — **auto-refunded** (+52.5).
- **`31c6d888-2ec5-4d2d-80cb-2b108eb55137`** (480p): ✅ **completed** → `output/blogseeder-test-480p-raw.mp4`. Confirms the **web product (`6ca86c91…`) was the `ip_detected` trigger** (its embedded stock hero photo). The recipe — avatar + setting + script, **no web product / no website image** — passes moderation; real BlogSeeder UI/branding composited in post.
- **Pronunciation fix:** 480p test caught TTS saying "Blog **Seeper**". Fixed by spelling the brand as two words "Blog Seeder" + "blog seeder dot com" in the spoken lines. Confirmed good on job `b7b1523f-...` (480p) → `output/blogseeder-test-480p-raw.mp4`.
- **720p final** (`9ef01d0b-3e6b-47cf-b9ed-d3c980dd0fb5`): ⚠️ `ip_detected` **again** despite no web product — moderation is **inconsistent** (same recipe passed at 480p). Charged -75, no refund. Balance hit 16 credits.
- **Final deliverable:** `output/blogseeder-launch-final.mp4` (1080×1920, **upscaled from the 480p raw** — no further render spend). Post (ffmpeg): BlogSeeder UI composited as a card (~5.6–10s), sprout logo top-left, Plus Jakarta Sans overlays ("Tired of AI slop?" → green `#2d9f77` bar with blogseeder.com + tagline), Blippy Trance (CC-BY, **needs credit line**) ducked under VO. Audio verified 15.07s (no clip). Filter: `output/filter.txt`.
- **Spend summary:** 2× 1080p `ip_detected` (-300) + 1× 720p `ip_detected` (-75) + 2× completed 480p tests (-105) = -480 charged. **Update (per Higgsfield support): `ip_detected` runs completed and are NOT refundable** — the status is a rights-confirmation hold, not a failure — but the **outputs are in the Higgsfield Assets tab**, downloadable after a one-click rights tick-through. **Follow-up (2026-06-19): the held runs are NOT in the Assets tab** — only the two completed 480p tests are. So `9ef01d0b` (the native 720p we'd hoped to recover) is unavailable; pursuing refund-or-surface with support. The current final stays built from the local good 480p (`output/blogseeder-test-480p-raw.mp4`). See [held-renders.md](held-renders.md).

---

---
