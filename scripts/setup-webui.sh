#!/bin/bash
# scripts/setup-webui.sh
# Setup Open WebUI inside Parrot OS proot-distro for browser access

echo "=== Open WebUI Setup for Parrot OS in Termux ==="

# Ensure Parrot OS is installed
if ! proot-distro list | grep -q parrot; then
    echo "Installing Parrot OS proot-distro..."
    proot-distro install parrot
fi

echo "Logging into Parrot OS and installing dependencies..."
proot-distro login parrot -- bash -c '
    apt update && apt upgrade -y
    apt install -y python3 python3-pip python3-venv git curl

    # Create isolated environment
    python3 -m venv \~/openwebui-env
    source \~/openwebui-env/bin/activate

    # Install Open WebUI (pip method - no Docker required)
    pip install --upgrade pip
    pip install open-webui

    echo "Installation complete!"
    echo "To start Open WebUI: source \~/openwebui-env/bin/activate && open-webui serve"
    echo "Access it in your browser at: http://localhost:8080"
'

echo "Setup finished."
echo "Usage:"
echo "1. proot-distro login parrot"
echo "2. source \~/openwebui-env/bin/activate"
echo "3. open-webui serve"
echo ""
echo "You can access the web UI from your Android browser at http://127.0.0.1:8080"
echo "Keep Ollama running in Termux (ollama serve) for model connectivity."
