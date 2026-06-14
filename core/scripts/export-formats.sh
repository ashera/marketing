#!/usr/bin/env bash
# Repurpose a finished vertical (9:16) video into square (1:1) and landscape
# (16:9) variants for multi-platform posting, using a blurred-fill background
# so no content is cropped away.
#
# Usage:
#   scripts/export-formats.sh [IN] [OUTDIR]
# Override ffmpeg via FFMPEG=/path/to/ffmpeg.
#
# NOTE: this is a quick repurpose. For best quality on a very different aspect
# (e.g. true 16:9), prefer re-rendering natively in that aspect via
# scripts/generate.ps1 -Aspect 16:9 (costs credits but is purpose-shot).
set -euo pipefail

# Operates inside a product dir (run from it, or set PRODUCT_DIR=products/<name>).
cd "${PRODUCT_DIR:-.}"

IN="${1:-output/frockd-launch-final.mp4}"
OUTDIR="${2:-output}"
FFMPEG="${FFMPEG:-ffmpeg}"
BASE="$(basename "${IN%.*}")"
[ -f "$IN" ] || { echo "Missing: $IN" >&2; exit 1; }

# args: WIDTH HEIGHT SUFFIX
make_format() {
  local W="$1" H="$2" SFX="$3"
  local OUT="${OUTDIR}/${BASE}-${SFX}.mp4"
  echo "==> ${SFX} (${W}x${H}) -> $OUT"
  "$FFMPEG" -y -i "$IN" -filter_complex \
    "[0:v]split=2[bg][fg];\
     [bg]scale=${W}:${H}:force_original_aspect_ratio=increase,crop=${W}:${H},boxblur=24:6,eq=brightness=-0.06[bgb];\
     [fg]scale=${W}:${H}:force_original_aspect_ratio=decrease[fgs];\
     [bgb][fgs]overlay=(W-w)/2:(H-h)/2[v]" \
    -map "[v]" -map 0:a \
    -c:v libx264 -profile:v high -pix_fmt yuv420p -crf 18 -preset medium \
    -c:a aac -b:a 192k -movflags +faststart \
    "$OUT"
}

make_format 1080 1080 "1x1"
make_format 1920 1080 "16x9"
echo "Done. Variants written to ${OUTDIR}/"
