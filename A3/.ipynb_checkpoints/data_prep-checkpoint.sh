#!/bin/bash

# Download the video using youtube-dl
VIDEO_URL="https://www.youtube.com/watch?v=bSMxl1V8FSg"
yt-dlp -f 'best[height<=480]' -o video.mp4 "$VIDEO_URL"
# youtube-dl -f 'best[height<=480]' -o video.mp4 "$VIDEO_URL"

# Extract frames using ffmpeg
mkdir frames
ffmpeg -i video.mp4 -vf fps=25 -t 30 frames/frame_%04d.jpg

# Count the number of frames
FRAME_COUNT=$(ls frames | wc -l)
echo "Total frames extracted: $FRAME_COUNT"

