#!/bin/bash
# Personal AI Assistant Setup for Termux + Parrot OS (arm64)
# Free, open-source, fully local. Run with: bash install.sh

set -e

echo "Updating Termux and installing base dependencies..."
pkg update -y && pkg upgrade -y
pkg install -y git wget curl cmake golang python python-pip proot-distro clang libomp

# Parrot OS (if not already installed)
if ! proot-distro list | grep -q parrot; then
    echo "Installing Parrot OS proot-distro..."
    proot-distro install parrot
fi

# Enter Parrot for heavier tools if preferred, but run core in Termux for speed
echo "Setting up Ollama (optimized for arm64)..."
pkg install -y ollama || {
    echo "Building/installing Ollama from source..."
    git clone --depth 1 https://github.com/ollama/ollama.git
    cd ollama && go generate ./... && go build -o $PREFIX/bin/ollama .
    cd ..
}

# Recommended small but capable models (uncensored-capable)
echo "Pulling base models (run in background or select smaller ones)..."
ollama serve & sleep 5
ollama pull qwen3.5:4b     # Strong reasoning/coding
ollama pull gemma3:2b      # Efficient
ollama pull phi4:3.8b      # Good balance (if RAM allows)

# Image generation setup (stable-diffusion.cpp)
echo "Setting up image generation..."
git clone --depth 1 https://github.com/leejet/stable-diffusion.cpp.git
cd stable-diffusion.cpp
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j2
cd ../..

# Python tools for agents, RAG, code execution
pip install langchain langchain-community chromadb sentence-transformers pillow requests

echo "Setup complete! Customize Modelfile for personality."
echo "Run: bash start-ai.sh"
