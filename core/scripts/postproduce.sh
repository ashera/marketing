#!/usr/bin/env bash
# Post-produce a raw Higgsfield render: burn in branded overlays + a ducked
# music bed, in one ffmpeg pass. The full-length audio fix (see
# docs/PRODUCTION.md gotcha #4) is baked into output/filter.txt.
#
# Usage:
#   scripts/postproduce.sh [RAW_IN] [OUT] [MUSIC] [DURATION]
# Defaults target the launch video. Override ffmpeg via FFMPEG=/path/to/ffmpeg.
#
# Requires: ffmpeg (libx264, libfreetype/drawtext). Set FFMPEG/FFPROBE if not on PATH.
# Operates inside a product dir; the paths below are relative to it.
# Run from the product dir, or set PRODUCT_DIR=products/<name>.
set -euo pipefail

cd "${PRODUCT_DIR:-.}"

RAW="${1:-output/frockd-launch-v2-raw.mp4}"
OUT="${2:-output/frockd-launch-final.mp4}"
MUSIC="${3:-audio/hitslab-upbeat-upbeat-music-333747.mp3}"
DUR="${4:-15.07}"
LOGO="${LOGO:-brand/frockd-logo.png}"
FILTER="${FILTER:-output/filter.txt}"
FFMPEG="${FFMPEG:-ffmpeg}"
FFPROBE="${FFPROBE:-ffprobe}"

for f in "$RAW" "$MUSIC" "$LOGO" "$FILTER"; do
  [ -f "$f" ] || { echo "Missing: $f" >&2; exit 1; }
done

# Inputs: [0]=raw video, [1]=music, [2]=logo. Optional [3]=UI image to composite
# (set UI_IMAGE=<path>; the filter must reference [3:v]).
INPUTS=(-i "$RAW" -i "$MUSIC" -loop 1 -framerate 24 -i "$LOGO")
if [ -n "${UI_IMAGE:-}" ]; then
  [ -f "$UI_IMAGE" ] || { echo "Missing UI_IMAGE: $UI_IMAGE" >&2; exit 1; }
  INPUTS+=(-loop 1 -framerate 24 -i "$UI_IMAGE")
fi

echo "==> Rendering final: $OUT"
"$FFMPEG" -y "${INPUTS[@]}" \
  -filter_complex_script "$FILTER" \
  -map "[vout]" -map "[aout]" -t "$DUR" \
  -c:v libx264 -profile:v high -pix_fmt yuv420p -crf 18 -preset medium \
  -c:a aac -b:a 192k -movflags +faststart \
  "$OUT"

# Verify the audio wasn't clipped (the recurring trap).
VD=$("$FFPROBE" -v error -select_streams v:0 -show_entries stream=duration -of default=nw=1:nokey=1 "$OUT")
AD=$("$FFPROBE" -v error -select_streams a:0 -show_entries stream=duration -of default=nw=1:nokey=1 "$OUT")
echo "video=${VD}s  audio=${AD}s"
awk -v v="$VD" -v a="$AD" 'BEGIN{ if ((v-a)>0.2 || (a-v)>0.5) { print "WARNING: audio/video duration mismatch — check for an end clip!"; } else { print "OK: durations aligned."; } }'
echo "Done -> $OUT  (next: scripts/burn-captions.sh and/or scripts/export-formats.sh)"
