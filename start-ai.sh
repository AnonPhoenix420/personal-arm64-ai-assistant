#!/bin/bash
# start-ai.sh

echo "========================================================================"
echo "                   Phoenix — Supreme God Mode AI                     "
echo "========================================================================"

if ! pgrep -x "ollama" > /dev/null; then
    ollama serve > /dev/null 2>&1 &
    sleep 5
fi

ollama run phoenix
