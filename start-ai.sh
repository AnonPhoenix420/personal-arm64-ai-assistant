#!/bin/bash
# start-ai.sh - Elite Personal ARM64 AI Assistant Launcher

echo "=== Elite Personal ARM64 AI Assistant ==="

# Check if Ollama is installed
if ! command -v ollama &> /dev/null; then
    echo "❌ Ollama not found. Installing now..."
    pkg install ollama -y || {
        echo "⚠️  Failed to install via pkg. Building from source..."
        pkg install golang git -y
        git clone --depth 1 https://github.com/ollama/ollama.git
        cd ollama && go build -o $PREFIX/bin/ollama . && cd ..
    }
fi

# Start Ollama server if not running
if ! pgrep -x "ollama" > /dev/null; then
    echo "Starting Ollama service..."
    ollama serve > /dev/null 2>&1 &
    sleep 6
fi

echo "✅ AI is ready. Type 'exit' to quit."
echo "=========================================="
ollama run myai
