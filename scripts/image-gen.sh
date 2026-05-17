#!/bin/bash
# scripts/image-gen.sh
# Professional image generation wrapper for stable-diffusion.cpp

if [ -z "$1" ]; then
    echo "Usage: bash scripts/image-gen.sh \"Your detailed prompt\""
    echo "Example: bash scripts/image-gen.sh \"futuristic cyberpunk city at night, neon lights, highly detailed, 8k\""
    exit 1
fi

PROMPT="$1"
OUTPUT_DIR="$HOME/storage/downloads"
TIMESTAMP=$(date +%s)
OUTPUT_FILE="elite_ai_image_${TIMESTAMP}.png"

mkdir -p "$OUTPUT_DIR"

echo "========================================================================"
echo "Elite AI Image Generation"
echo "Prompt: $PROMPT"
echo "========================================================================"

cd stable-diffusion.cpp/build/bin 2>/dev/null || {
    echo "❌ stable-diffusion.cpp not found. Please run install.sh first."
    exit 1
}

./sd -m ../../models/sd-v1-4.ckpt \
     --prompt "$PROMPT" \
     --n 1 \
     --size 512x512 \
     --output "$OUTPUT_FILE" || {
    echo "❌ Image generation failed."
    exit 1
}

if [ -f "$OUTPUT_FILE" ]; then
    mv "$OUTPUT_FILE" "$OUTPUT_DIR/"
    echo "✅ Image successfully generated and saved to Downloads folder:"
    echo "$OUTPUT_DIR/$OUTPUT_FILE"
else
    echo "❌ Image file was not created."
fi

echo "========================================================================"
