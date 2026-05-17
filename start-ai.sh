#!/bin/bash
# start-ai.sh

echo "Starting Personal ARM64 AI Assistant..."

if ! pgrep -x "ollama" > /dev/null; then
    ollama serve > /dev/null 2>&1 &
    sleep 4
fi

echo "AI Ready. Type 'exit' to quit."
echo "========================================"
ollama run myai
