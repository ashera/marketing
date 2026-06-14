# Prompt Log

A running record of every image and video generation prompt run through Higgsfield (or any generation tool) for this project. **A new entry is appended here every time a generation is run** — newest at the bottom.

Each entry records:
- **Title** — short name for the generation
- **Type** — image or video, plus the model used
- **Datetime** — ISO 8601 timestamp (local) of when it was run
- **Description** — one-line summary of what it's for
- **Prompt (submitted)** — the exact prompt text we submitted
- **Prompt (enhanced)** — the backend-enhanced prompt, when the tool enhances it (e.g. `product-photoshoot`, `marketplace-cards`). Omit if identical to submitted.

---

<!--
Entry template (copy for each new generation):

## <Title>

- **Type:** image | video — <model>
- **Datetime:** YYYY-MM-DDTHH:MM:SS±TZ
- **Description:** <one-line summary>
- **Output / job id:** <higgsfield job or upload id, if any>

**Prompt (submitted):**

> <exact prompt text we submitted>

**Prompt (enhanced):**  <!-- omit this whole block if the tool did not enhance / it's identical -->

> <backend-enhanced prompt as returned by the tool>

---
-->

## frockd Sydney launch — Sofia UGC short

- **Type:** video — marketing_studio_video (Higgsfield Marketing Studio)
- **Datetime:** 2026-06-09T20:14:56+10:00
- **Description:** 15s 9:16 vertical launch short; Sofia avatar, Aussie accent, bedroom + open wardrobe, holds phone showing emerald-gown frockd listing. Free-listings Sydney launch CTA.
- **Settings:** avatar=Sofia (`bba3087a-ad14-42c2-b51b-7c22b632abf4`) · setting=Bedroom (`b8368076-35eb-4045-b33b-74b2646d9863`) · web_product=frockd (`6f13aabd-2115-40f8-a081-3f4a2a7bb352`) · phone-screen image=listing-detail (`07d06fd7-74df-4930-856b-595bfa0ac944`) · 9:16 · 1080p · 15s · generate_audio=true · mode=ugc
- **Cost:** 150 credits
- **Result job id:** `73697d1a-cf08-4b92-a0e0-257aa2246764`
- **Result URL:** https://d8j0ntlcm91z4.cloudfront.net/user_3Er1ZhsnMfBhSMZ8ZhrzY1L2o2p/hf_20260609_101448_73697d1a-cf08-4b92-a0e0-257aa2246764.mp4 (local: output/frockd-launch-raw.mp4)
- **Outcome:** ⚠️ Superseded — visuals/scene/phone-listing all landed, but TTS mispronounced the brand ("frockd" → "frog"). Re-rolled with phonetic "frocked" fix (see next entry).

**Prompt (submitted):**

> UGC-style vertical selfie video. A young Australian woman stands in a cozy bedroom right beside an open wardrobe full of hanging clothes and formal dresses, soft natural window light. She speaks warmly and energetically straight to camera with a natural Australian accent, casual and friendly. Partway through she holds up her smartphone toward the camera, screen facing us, clearly showing a frockd app listing — a stunning emerald-green designer gown with its price. She says: "G'day Sydney! Still got that gorgeous formal dress sitting in your wardrobe? Sell it on frockd — the new local marketplace for pre-loved formal dresses. Listing's totally free whilst we're just getting started. Head to frockd dot com dot A-U." Authentic hand-held feel, bright and upbeat.

**Prompt (enhanced — returned by Marketing Studio):**

> — REFERENCE BLOCK — @image_1 (main): Young woman, long straight blonde hair with subtle lighter highlights, bright blue eyes, full lips, warm fair skin tone, natural glowy makeup. Wearing a soft pink open cardigan over a white ribbed ruffle crop top and light grey sweatpants, delicate pearl pendant necklace. Match face and outfit exactly throughout. Reference image is for face and appearance only — do not replicate background or room from reference photo.
>
> — LOCATION — Cozy bedroom, unmade bed with rumpled white linen and a soft textured throw. Warm natural window light from the left, golden tone. Open wardrobe beside her — hanging dresses, formal gowns, a glimpse of emerald green fabric. Soft, lived-in morning energy. No harsh lighting, no ring light.
>
> — PROMPT — Selfie mode. Handheld, gentle natural drift. Seated on bed edge, leaning slightly forward. Warm, direct-to-camera eye contact.
> SHOT [00:00–00:02]: Glances toward the open wardrobe, snaps back to camera with a knowing smile. "G'day Sydney — still got a formal dress just sitting in your wardrobe?"
> SHOT [00:02–00:07]: Gestures toward the hanging dresses. "Yeah, same. Mine have been in there for two years. But there's this new app called frockd — it's a local marketplace made specifically for pre-loved formal dresses."
> SHOT [00:07–00:11]: Picks up phone, tilts screen to camera showing the emerald green Zimmerman Sandbox gown, $150. Taps screen. "Listing is completely free right now while they're just getting started — look at this one, one-fifty."
> SHOT [00:11–00:15]: Phone lowered, relaxed smile, small shrug. "Head to frockd dot com dot A-U — honestly takes like two minutes to list."
>
> — TECHNICAL BLOCK — iPhone front-facing 23mm, slight barrel distortion, HDR warm. Handheld micro-movement. Audio: iPhone built-in mic, voice close and slightly compressed, soft ambient room tone. No music.

*(Note: enhancer rewrote the script to ~95 words — far over a 15s budget — and styled the avatar blonde. This drove both the timing risk and the unconstrained brand pronunciation.)*

---

## frockd Sydney launch — Sofia UGC short (v2, pronunciation fix)

- **Type:** video — marketing_studio_video (Higgsfield Marketing Studio)
- **Datetime:** 2026-06-09T20:44:40+10:00
- **Description:** Re-roll of the launch short. Spoken brand spelled phonetically "frocked" (was mispronounced "frog"), explicit pronunciation note, tightened to ~30–35 spoken words so the closing URL lands cleanly. Same scene/avatar/phone-listing.
- **Settings:** identical to v1 — Sofia · Bedroom setting · frockd web product · listing-detail phone image (`07d06fd7…`) · 9:16 · 1080p · 15s · generate_audio=true · mode=ugc
- **Cost:** 150 credits
- **Result job id:** `5b15c3dd-540e-4cdf-97af-95a6198d7d61`
- **Result URL:** https://d8j0ntlcm91z4.cloudfront.net/user_3Er1ZhsnMfBhSMZ8ZhrzY1L2o2p/hf_20260609_104431_5b15c3dd-540e-4cdf-97af-95a6198d7d61.mp4 (local: output/frockd-launch-v2-raw.mp4)
- **Outcome:** ✅ Approved base footage (audio confirmed good by user — "frocked" pronounced correctly, full URL spoken). Enhanced script near-verbatim to approved; brand spelled "frocked" in all spoken lines.
- **Final deliverable:** `output/frockd-launch-final-v3.mp4` (15.08s video, 15.07s audio, 1080×1920). Post-production (ffmpeg): ducked background music (Pixabay `hitslab-upbeat-upbeat-music-333747.mp3`, no-attribution licence, volume 0.104 ≈ -20 dB under VO, 0.85s fade-out) + burned-in overlays in frockd Archivo Black font (white + shadow): "G'day Sydney" (0–3s), "Buy & sell / pre-loved formal dresses" (4.3–8.5s), rose `#e07c8a` lower-third bar with "frockd.com.au" + "FREE listings" (10.8–15s), plus transparent FROCKD logo top-centre (450px wide). Filter graph: `output/filter.txt`.
- **Render fixes:** (1) full-length video via looped logo input + `-t 15.07` (no `-shortest`); (2) **audio truncation fix** — `amix duration=first` was clipping the voice track to 14.44s and cutting the end of the spoken URL; resolved by `apad`+`atrim` to pad/trim the VO to 15.07s before `amix duration=longest`. Verified: audio stream = 15.07s, closing "dot A-U" intact. Superseded cuts (final.mp4, final-v2.mp4) deleted.

**Prompt (submitted):**

> UGC-style vertical selfie video, about 15 seconds. A young Australian woman sits on her bed right beside an open wardrobe full of hanging formal dresses (emerald, purple, sequined), soft natural window light, cozy honest morning feel. She speaks warmly and energetically straight to camera with a natural Australian accent, casual and friendly like talking to a mate. Partway through she holds up her smartphone toward the camera, screen facing us, clearly showing a frocked app listing — a stunning emerald-green designer gown with its $150 price. **IMPORTANT PRONUNCIATION:** the brand is written "frockd" but is ALWAYS pronounced "frocked" (rhymes with "rocked"). In every spoken line, pronounce it "frocked". The website is spoken as "frocked dot com dot A-U". Keep the spoken dialogue concise (around 30-35 words total) so it fits comfortably inside 15 seconds and the final call-to-action line is spoken fully and clearly, never rushed or cut off. She says: "G'day Sydney! Still got that gorgeous formal dress sitting in your wardrobe? Sell it on frocked — the new local marketplace for pre-loved formal dresses. Listing's totally free whilst we're just getting started. Head to frocked dot com dot A-U." Authentic hand-held selfie feel, bright and upbeat.

**Prompt (enhanced — returned by Marketing Studio):**

> — REFERENCE BLOCK — @image_1 (main): Young woman, early 20s, long straight blonde hair with subtle highlights, bright blue eyes, full lips, light skin tone, soft natural makeup. Pale pink open cardigan over a white ribbed crop tube top, light grey smocked sweatpants, silver pearl pendant. Match face and outfit exactly. Reference image is for face and appearance only.
>
> — LOCATION — Bedroom, mid-morning soft window light from frame left. Unmade bed, cream/white bedding, knit throw. Open wardrobe behind her right shoulder — hanging formal gowns in emerald, purple, sequined fabrics clearly visible. Warm, lived-in. No artificial lighting.
>
> — PROMPT — Handheld selfie, vertical 9:16. Seated on edge of bed, reclined against pillows, wardrobe over her shoulder.
> SHOT [00:00–00:02]: Leans toward camera, bright eyes, small grin; wardrobe of gowns lit behind. No product yet.
> SHOT [00:02–00:06]: Direct to camera, casual upbeat warm Australian accent. "G'day Sydney! Still got that gorgeous formal dress just sitting in your wardrobe?"
> SHOT [00:06–00:10]: Glances back to dresses then camera, light hand gesture. "Sell it on frocked — the new local marketplace for pre-loved formal dresses."
> SHOT [00:10–00:13]: Picks up phone, turns screen to camera — frockd listing fills screen, emerald Zimmerman gown, $150 visible, tilts for readability. "Listing's totally free whilst we're just getting started."
> SHOT [00:13–00:15]: Lowers phone slightly, direct unhurried eye contact. "Head to frocked dot com dot A-U." Soft close-lipped smile, natural hold as clip ends.
>
> — TECHNICAL BLOCK — iPhone front-facing 23mm, slight barrel distortion, HDR warm, golden window fill. Handheld selfie drift. Audio: iPhone mic, voice close/slightly compressed, soft ambient bedroom quiet. No music. Phone screen legible, no glare.

---
