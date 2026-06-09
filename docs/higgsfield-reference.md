# Higgsfield Reference

Known-good IDs, params, and quirks for the `higgsfield` CLI — so we don't re-query them each time. Verify with `higgsfield model get <model>` / `... avatars list` if something changes.

## Model: `marketing_studio_video`

Vertical/landscape avatar UGC video. Required: `--prompt`. Key params:

| Param | Values / notes |
|-------|----------------|
| `aspect_ratio` | `auto,21:9,16:9,4:3,1:1,3:4,9:16` (use **9:16** for shorts) |
| `resolution` | `480p,720p,1080p` |
| `duration` | integer seconds (default 15) |
| `generate_audio` | `true` to make the avatar speak |
| `mode` | `ugc` (default), `ugc_how_to`, `ugc_unboxing`, `product_showcase`, `product_review`, `tv_spot`, `ugc_virtual_try_on`, … |
| `avatars` | **array of objects** — `[{"id":"<uuid>","type":"preset"}]` (bare UUID is rejected) |
| `setting_id` | scene preset UUID (bare string OK) |
| `web_product_ids` | **array of strings** — `["<uuid>"]` |
| phone/start image | pass via `--image <uuid>` (the CLI wires the `medias` `{role,data}` shape for you; raw `--medias` is fiddly) |

### CLI quirks
- Arrays must be JSON: `--avatars '[{"id":"...","type":"preset"}]'`, `--web_product_ids '["..."]'`.
- `--image`, `--video`, `--audio` accept a UUID **or** a local path (auto-uploaded).
- Add `--wait --wait-timeout 25m --wait-interval 15s` to block; `--json` to capture the result (incl. `result_url` and `enhanced_prompt`).
- **Always** `higgsfield generate cost <model> [params]` first.

### Cost benchmark
- 15s · 9:16 · 1080p · audio · 1 avatar + setting + web product + 1 image ≈ **150 credits**.

## Preset avatars (`higgsfield marketing-studio avatars list`)

| Name | ID | Gender |
|------|----|--------|
| **Sofia** (used) | `bba3087a-ad14-42c2-b51b-7c22b632abf4` | female |
| Maria | `bbf8e803-f10b-4e39-801c-eb12850237ab` | female |
| Adriana | `aa9260cc-a888-47b2-8bfd-0a9c90558384` | female |
| Clara | `daf4bf2e-c19e-4879-805b-bcfa6eda61f2` | female |
| Valentina | `cd6fb78c-e1a2-42f1-8b1e-902c15511877` | female |
| Lily | `cec35719-5848-4455-a9dc-e6df72e03b80` | female |
| _(+ more — Mei, Yuna, Jia, Hana, Nia; males Jayden, Stefan, Liam, Felix, Malik, Erik, Joon, Tae, Ryu)_ | run `avatars list` | |

> Note: preset avatars are **re-styled per render** by the enhancer (Sofia came out blonde). For a consistent spokesperson, create a custom avatar from a fixed image (`avatars create --name X --image <upload_id>`).

## Scene settings (`higgsfield marketing-studio settings list`)

| Name | ID | Vibe |
|------|----|------|
| **Bedroom** (used) | `b8368076-35eb-4045-b33b-74b2646d9863` | unmade bed, soft window light, cozy |
| Street | `8c95f9ba-5849-44b1-82d0-9f6b33240758` | urban sidewalk selfie |
| Kitchen | `a0eb0be9-f0ff-4aee-9dee-69d9fd20110a` | counter, daylight |
| Office | `d39dda10-643c-44e2-bfc8-2451dddde7d9` | desk, modern |
| Nature | `10f47b85-abd7-4899-b6b6-91ff2969d3bf` | outdoors, natural light |
| _(+ Bathroom, In Car, Gym, and "unrealistic" novelty settings)_ | run `settings list` | |

## frockd assets

| Asset | ID |
|-------|----|
| Web product (frockd.com.au) | `6f13aabd-2115-40f8-a081-3f4a2a7bb352` |
| Phone-screen ref (listing detail) | `07d06fd7-74df-4930-856b-595bfa0ac944` |

Full UUID → file map: [`../ref-ids.md`](../ref-ids.md). Hooks library (`hooks list`) is stunt/comedy-oriented — generally skip for premium brand tone.
