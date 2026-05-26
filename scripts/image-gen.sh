#!/bin/bash
# scripts/image-gen.sh
# Elite AI - Image Generation Wrapper

if [ -z "$1" ]; then
    echo "Usage: bash scripts/image-gen.sh \"Your detailed prompt\""
    echo "Example: bash scripts/image-gen.sh \"futuristic cyberpunk city, neon lights, highly detailed\""
    exit 1
fi

PROMPT="$1"
OUTPUT_DIR="$HOME/Downloads"
TIMESTAMP=$(date +%s)
OUTPUT_FILE="elite_ai_${TIMESTAMP}.png"

mkdir -p "$OUTPUT_DIR"

echo "========================================================================"
echo "Elite AI Image Generation"
echo "Prompt: $PROMPT"
echo "========================================================================"

cd stable-diffusion.cpp/build/bin 2>/dev/null || {
    echo "❌ Error: stable-diffusion.cpp not found."
    echo "Please run install.sh first to build it."
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

mv "$OUTPUT_FILE" "$OUTPUT_DIR/" 2>/dev/null || true
echo "✅ Image generated and saved to: $OUTPUT_DIR/$OUTPUT_FILE"
echo "========================================================================"
