#!/bin/bash
# start-ai.sh

echo "=== Elite Personal ARM64 AI Assistant (Parrot OS) ==="

# Start Ollama if not running
if ! pgrep -x "ollama" > /dev/null; then
    echo "Starting Ollama service..."
    ollama serve > /dev/null 2>&1 &
    sleep 6
fi

echo "✅ AI is ready. Type 'exit' to quit."
echo "=========================================="
ollama run myai
