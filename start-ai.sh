#!/bin/bash
ollama serve &
sleep 3
ollama run myai
# Or for web UI: (install Open WebUI via pip/docker in proot if desired)
