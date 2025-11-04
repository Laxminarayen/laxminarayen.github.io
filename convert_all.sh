#!/bin/bash
# Converts all .HEIC -> .jpeg and .MOV -> .mp4 in the current folder

mkdir -p converted

# Convert all HEIC images
for f in *.HEIC *.heic; do
  [ -e "$f" ] || continue
  base="${f%.*}"
  echo "🖼️ Converting $f → converted/${base}.jpeg"
  ffmpeg -y -i "$f" -q:v 1 "converted/${base}.jpeg"
done

# Convert all MOV videos
for f in *.MOV *.mov; do
  [ -e "$f" ] || continue
  base="${f%.*}"
  echo "🎥 Converting $f → converted/${base}.mp4"
  ffmpeg -y -i "$f" -vcodec libx264 -acodec aac -movflags +faststart "converted/${base}.mp4"
done

echo "✅ All conversions complete! Files saved in ./
