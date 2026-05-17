#!/bin/bash
# scripts/setup-webui.sh
# Professional setup for Open WebUI inside Parrot OS proot-distro

echo "========================================================================"
echo "Elite Personal AI - Open WebUI Setup"
echo "========================================================================"

# Ensure Parrot OS is installed
if ! proot-distro list | grep -q parrot; then
    echo "[+] Installing Parrot OS proot-distro..."
    proot-distro install parrot
fi

echo "[+] Installing Open WebUI inside Parrot OS..."

proot-distro login parrot -- bash -c '
    apt update && apt upgrade -y
    apt install -y python3 python3-pip python3-venv git curl

    # Create isolated environment
    python3 -m venv \~/openwebui-env
    source \~/openwebui-env/bin/activate

    pip install --upgrade pip
    pip install open-webui

    echo ""
    echo "✅ Open WebUI installed successfully!"
    echo ""
    echo "To start the web interface:"
    echo "   1. proot-distro login parrot"
    echo "   2. source \~/openwebui-env/bin/activate"
    echo "   3. open-webui serve"
    echo ""
    echo "Access in your Android browser at: http://127.0.0.1:8080"
    echo "Ensure Ollama is running in Termux (ollama serve)"
'

echo "========================================================================"
echo "WebUI setup complete."
echo "========================================================================"
