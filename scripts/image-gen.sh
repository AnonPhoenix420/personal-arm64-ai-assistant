#!/bin/bash
# scripts/image-gen.sh
# Wrapper for stable-diffusion.cpp image generation

if [ -z "$1" ]; then
    echo "Usage: $0 \"Your image prompt here\""
    exit 1
fi

PROMPT="$1"
OUTPUT="output_$(date +%s).png"

cd stable-diffusion.cpp/build/bin 2>/dev/null || {
    echo "stable-diffusion.cpp not found. Run install.sh first."
    exit 1
}

echo "Generating image... (this may take some time on mobile)"
./sd -m ../../models/sd-v1-4.ckpt \
     --prompt "$PROMPT" \
     --n 1 \
     --output "$OUTPUT"

if [ -f "$OUTPUT" ]; then
    echo "Image generated: $OUTPUT"
    # Copy to accessible location
    cp "$OUTPUT" \~/storage/downloads/ 2>/dev/null && echo "Saved to Downloads folder."
fi
