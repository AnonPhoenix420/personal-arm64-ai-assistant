#!/bin/bash
# scripts/setup-webui.sh

echo "========================================================================"
echo "Elite AI - Open WebUI Setup (Inside Parrot OS)"
echo "========================================================================"

apt install -y python3 python3-pip python3-venv curl

python3 -m venv \~/openwebui-env
source \~/openwebui-env/bin/activate

pip install --upgrade pip
pip install open-webui

echo "✅ Open WebUI installed successfully!"
echo ""
echo "To start the web interface:"
echo "   source \~/openwebui-env/bin/activate"
echo "   open-webui serve"
echo ""
echo "Access in browser at: http://127.0.0.1:8080"
