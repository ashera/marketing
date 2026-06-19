# Production Playbook

The proven end-to-end workflow for making a product video short (frockd is the running example), plus the gotchas we've already solved (don't relearn them the hard way).

## Pipeline at a glance

```
script ─▶ cost estimate ─▶ Higgsfield render ─▶ QC ─▶ post-production ─▶ verify ─▶ export
         (core/scripts/generate.ps1)                  (core/scripts/postproduce.sh)  (core/scripts/export-formats.sh)
```

1. **Write the script** — see word-count rule below.
2. **Cost estimate first** — always (`generate.ps1` does this before any paid render). Review credits before spending.
3. **Render** — Higgsfield Marketing Studio (`marketing_studio_video`). See [higgsfield-reference.md](higgsfield-reference.md) for IDs/params.
4. **QC** — download, extract frames, **listen** (accent + full URL), confirm the phone screen reads as frockd.
5. **Post-production** — overlays + ducked music (`postproduce.sh`). Optional captions (`burn-captions.sh`).
6. **Verify** — check the **audio stream duration** equals the video (see audio-clip gotcha).
7. **Log** — record the prompt (submitted + enhanced), cost, and result in the product's [`prompt-log.md`](../../products/frockd/prompt-log.md); record any new uploaded refs in [`ref-ids.md`](../../products/frockd/ref-ids.md).

## Gotchas (already paid for — don't repeat)

### 1. Brand pronunciation: write "frocked", not "frockd"
TTS reads the real spelling **"frockd"** as **"frog."** In all **spoken** lines, spell it phonetically **"frocked"** (rhymes with "rocked") and add an explicit pronunciation note in the prompt. Keep the correct **"frockd"** spelling only in **on-screen** text/overlays. URL spoken as "frocked dot com dot A-U".

### 2. Word budget: ~30–35 spoken words for 15s
More than that and Higgsfield's enhancer overstuffs the dialogue, rushing or clipping the closing CTA. Keep it tight and put the URL in its own final beat.

### 3. The enhancer rewrites your script and restyles the avatar
Marketing Studio expands your prompt into a multi-shot storyboard and auto-styles the avatar (e.g. Sofia rendered blonde). The returned `enhanced_prompt` is the source of truth for what's actually spoken/shown — always capture it in the prompt log. To stay closer to your script, instruct it to keep dialogue near-verbatim.

### 4. Audio-clipping trap in post (the big one)
`ffmpeg` `amix duration=first` **and** `-shortest` both silently truncated our output (voice cut to ~14.4s, chopping the end of the URL). Fixes, both baked into `postproduce.sh`:
- Pad+trim the voice to full length **before** mixing: `[0:a]apad,atrim=0:DUR,asetpts=N/SR/TB`.
- Don't use `-shortest`; bound the output with `-t DUR`.
- Loop the logo image input (`-loop 1`) so a single-frame overlay doesn't confuse duration.
- **Always verify** the final **audio stream** duration == video duration:
  ```bash
  ffprobe -v error -select_streams a:0 -show_entries stream=duration -of default=nw=1:nokey=1 final.mp4
  ```

### 5. Text overlays / URLs must be added in post
Avatar/UGC models render in-frame text as garbled. Burn overlays + the URL in `ffmpeg` (`postproduce.sh`), never via the generation prompt.

### 6. Music = post-production, and licence-clean only
No music parameter exists on the model. Mix a **licence-cleared** track (Pixabay no-attribution, or CC with credit) under the VO at ~ -18 to -20 dB. See [frockd's brand.md](../../products/frockd/brand.md) and the product's `audio/`.

### 7. Keep the raw render
Always keep `output/*-raw.mp4`. It's the free re-edit point — change overlays/music without re-spending credits.

### 8. `ip_detected` is a rights-confirmation HOLD, not a failure (confirmed by Higgsfield support)
A render that returns **`ip_detected`** has actually **completed on the model side** — the status is a **rights-confirmation hold on the final step**, not a failed generation. Consequences:
- **Credits are spent and NOT refunded** (the work was produced) — unlike generic `failed` jobs, which auto-refund.
- **Recovery is unreliable.** Support says held outputs appear in the **Assets tab** after a one-click rights confirmation — but in practice our three held runs did **not** show up there (only normally-completed runs did). The **CLI** also keeps `status: ip_detected` with an empty `result_url`. So **do not count on recovering a held run**; if you need it, **escalate to support** to surface it or refund.
- The hold is more likely when inputs carry rights ambiguity (**web products / website screenshots with third-party stock photos**), but can fire on clean runs too. Composite real UI/branding in **post** (`UI_IMAGE` input to `postproduce.sh`) to reduce holds and keep it crisp.

Defences (still worth it for cost + QC):
- **Run a cheap 480p test first** (cost scales: 480p≈52, 720p:75, 1080p:150) to validate content/audio before the full-res final.
- If a full-res run holds, **download it from the Assets tab** (tick-through) — you've already paid for it; no need to re-render.
- `output/filter.txt` scales any source up to 1080×1920, so even a 480p source yields a 1080-frame deliverable if needed.

## Pre-flight checklist

- [ ] Script ≤ ~35 spoken words; brand spelled "frocked" in dialogue; URL its own final beat
- [ ] Reference images uploaded + logged in `ref-ids.md`
- [ ] Cost estimate run and approved
- [ ] **480p test render passed** (moderation + audio/pronunciation) before any full-res final
- [ ] Rendered; raw saved as `output/<name>-raw.mp4`
- [ ] QC: frames checked, **audio listened** (accent + full URL), phone screen legible
- [ ] Post: overlays + ducked music; (optional) captions
- [ ] **Verified audio duration == video duration** (no end clip)
- [ ] Prompt logged (submitted + enhanced) in `prompt-log.md`
- [ ] Final committed (videos go to Git LFS automatically)
