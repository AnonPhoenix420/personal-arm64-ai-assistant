#!/bin/bash
# scripts/image-gen.sh

if [ -z "$1" ]; then
    echo "Usage: bash scripts/image-gen.sh \"Your detailed prompt\""
    exit 1
fi

PROMPT="$1"
OUTPUT_DIR="$HOME/Downloads"
TIMESTAMP=$(date +%s)
OUTPUT_FILE="elite_ai_${TIMESTAMP}.png"

mkdir -p "$OUTPUT_DIR"

cd stable-diffusion.cpp/build/bin 2>/dev/null || {
    echo "❌ stable-diffusion.cpp not found. Run install.sh first."
    exit 1
}

echo "Generating image..."
./sd -m ../../models/sd-v1-4.ckpt \
     --prompt "$PROMPT" \
     --n 1 \
     --size 512x512 \
     --output "$OUTPUT_FILE"

mv "$OUTPUT_FILE" "$OUTPUT_DIR/" 2>/dev/null || true
echo "Image saved to: $OUTPUT_DIR/$OUTPUT_FILE"
