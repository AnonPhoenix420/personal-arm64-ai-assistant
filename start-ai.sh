#!/bin/bash
# start-ai.sh - Launch your personal AI

echo "Starting Personal ARM64 AI Assistant..."

# Start Ollama server if not running
if ! pgrep -x "ollama" > /dev/null; then
    echo "Starting Ollama service..."
    ollama serve > /dev/null 2>&1 &
    sleep 4
fi

echo "AI is ready. Type 'exit' to quit."
echo "========================================"
ollama run myai
