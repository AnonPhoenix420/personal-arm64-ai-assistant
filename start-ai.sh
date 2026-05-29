#!/bin/bash
# start-ai.sh - Phoenix Ultimate AI Coding Partner

echo "========================================================================"
echo "                   Phoenix — Ultimate AI Coding Partner              "
echo "========================================================================"

if ! pgrep -x "ollama" > /dev/null; then
    echo "Starting Ollama service..."
    ollama serve > /dev/null 2>&1 &
    sleep 5
fi

echo "Phoenix is active. Ask anything — especially coding tasks."
ollama run phoenix
