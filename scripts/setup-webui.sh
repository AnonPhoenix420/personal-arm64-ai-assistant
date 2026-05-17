#!/bin/bash
# scripts/setup-webui.sh
# Open WebUI setup inside Parrot OS proot-distro

echo "=== Open WebUI Setup for Parrot OS ==="

if ! proot-distro list | grep -q parrot; then
    echo "Parrot OS not found. Installing..."
    proot-distro install parrot
fi

proot-distro login parrot -- bash -c '
    apt update && apt upgrade -y
    apt install -y python3 python3-pip python3-venv git curl

    echo "Creating virtual environment..."
    python3 -m venv \~/openwebui-env
    source \~/openwebui-env/bin/activate

    echo "Installing Open WebUI..."
    pip install --upgrade pip
    pip install open-webui

    echo ""
    echo "✅ Open WebUI installed successfully inside Parrot OS!"
    echo "To start the web interface:"
    echo "   1. proot-distro login parrot"
    echo "   2. source \~/openwebui-env/bin/activate"
    echo "   3. open-webui serve"
    echo ""
    echo "Access in browser: http://127.0.0.1:8080"
    echo "Make sure Ollama is running in Termux (ollama serve)"
'
