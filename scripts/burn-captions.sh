#!/usr/bin/env bash
# Burn SRT captions into a video for silent autoplay (most social feeds play
# muted). Styled in Archivo Black, white with outline, lower-centre.
#
# Usage:
#   scripts/burn-captions.sh [IN] [SRT] [OUT]
# Defaults caption the launch final. Override ffmpeg via FFMPEG=/path/to/ffmpeg.
#
# Requires: ffmpeg built with libass (the `subtitles` filter). The font is
# loaded from brand/fonts via fontsdir; FontName must match the font's family
# name ("Archivo Black"). If libass/font lookup fails on your build, fall back
# to drawtext (see output/filter.txt for the drawtext pattern).
set -euo pipefail

IN="${1:-output/frockd-launch-final.mp4}"
SRT="${2:-subtitles/frockd-launch.srt}"
OUT="${3:-output/frockd-launch-captioned.mp4}"
FONTSDIR="${FONTSDIR:-brand/fonts}"
FFMPEG="${FFMPEG:-ffmpeg}"

for f in "$IN" "$SRT"; do [ -f "$f" ] || { echo "Missing: $f" >&2; exit 1; }; done

# ASS style: Archivo Black, white fill, semi-transparent black outline+shadow,
# bottom-centre (Alignment=2), raised above the very bottom (MarginV).
STYLE="FontName=Archivo Black,Fontsize=15,PrimaryColour=&H00FFFFFF&,OutlineColour=&H80000000&,BackColour=&H00000000&,BorderStyle=1,Outline=2,Shadow=1,Alignment=2,MarginV=110"

echo "==> Burning captions: $OUT"
"$FFMPEG" -y -i "$IN" \
  -vf "subtitles=${SRT}:fontsdir=${FONTSDIR}:force_style='${STYLE}'" \
  -c:v libx264 -profile:v high -pix_fmt yuv420p -crf 18 -preset medium \
  -c:a copy -movflags +faststart \
  "$OUT"
echo "Done -> $OUT"
