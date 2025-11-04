#!/bin/bash
# Converts all HEIC -> JPEG and MOV -> MP4 in the current folder (full-frame safe)

mkdir -p converted

# HEIC images via ImageMagick
for f in *.HEIC *.heic; do
  [ -e "$f" ] || continue
  base="${f%.*}"
  echo "🖼️ Converting $f → converted/${base}.jpeg"
  magick convert "$f" "converted/${base}.jpeg"
done

# MOV videos via ffmpeg
for f in *.MOV *.mov; do
  [ -e "$f" ] || continue
  base="${f%.*}"
  echo "🎥 Converting $f → converted/${base}.mp4"
  ffmpeg -y -i "$f" -vcodec libx264 -acodec aac -movflags +faststart "converted/${base}.mp4"
done

echo "✅ All conversions complete! Files saved in ./converted/"
