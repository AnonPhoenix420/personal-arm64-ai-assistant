#!/bin/bash
# scripts/image-gen.sh
# Image generation wrapper for stable-diffusion.cpp

if [ -z "$1" ]; then
    echo "Usage: bash $0 \"Your detailed image prompt here\""
    echo "Example: bash $0 \"a cyberpunk city at night, neon lights, highly detailed\""
    exit 1
fi

PROMPT="$1"
TIMESTAMP=$(date +%s)
OUTPUT_DIR="$HOME/storage/downloads"
OUTPUT_FILE="ai_image_${TIMESTAMP}.png"

mkdir -p "$OUTPUT_DIR"

echo "Generating image with prompt: $PROMPT"
echo "This may take several minutes on mobile hardware..."

cd stable-diffusion.cpp/build/bin 2>/dev/null || {
    echo "❌ Error: stable-diffusion.cpp build not found."
    echo "Please run install.sh first."
    exit 1
}

# Run generation
./sd -m ../../models/sd-v1-4.ckpt \
     --prompt "$PROMPT" \
     --n 1 \
     --output "$OUTPUT_FILE" \
     --size 512x512 2>/dev/null || {
    echo "❌ Generation failed. Check if model exists."
    exit 1
}

if [ -f "$OUTPUT_FILE" ]; then
    mv "$OUTPUT_FILE" "$OUTPUT_DIR/"
    echo "✅ Image successfully generated and saved to Downloads folder:"
    echo "\( OUTPUT_DIR/ai_image_ \){TIMESTAMP}.png"
else
    echo "❌ Image file was not created."
fi
