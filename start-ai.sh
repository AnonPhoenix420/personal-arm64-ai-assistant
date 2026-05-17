#!/bin/bash
# start-ai.sh
# =============================================================================
# Elite Personal ARM64 AI Assistant - Main Runtime Entry Point (Proot Engine)
# =============================================================================

# Terminal formatting
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

clear
echo -e "${CYAN}========================================================================${NC}"
echo -e "${CYAN}           Elite Personal ARM64 AI Assistant Core Engine                ${NC}"
echo -e "${CYAN}========================================================================${NC}"

# 1. Verify if Ollama's network socket is listening
if ! curl -s http://127.0.0.1:11434 > /dev/null; then
    echo -e "${YELLOW}[!] Ollama service socket offline. Initializing background fork...${NC}"
    
    # Wipe temporary lockfiles or residual sockets if any exist
    pkill -9 ollama || true
    
    # Spawn Ollama natively inside the container loopback interface
    OLLAMA_HOST=127.0.0.1:11434 ollama serve > /dev/null 2>&1 &

    # Poll the socket until active
    echo -n "    -> Awaiting core synchronization"
    for i in {1..15}; do
        if curl -s http://127.0.0.1:11434 > /dev/null; then
            echo -e " ${GREEN}[CONNECTED]${NC}"
            break
        fi
        echo -n "."
        sleep 1
        if [ $i -eq 15 ]; then
            echo -e "\n${RED}❌ Error: Core interface failed to bind to port 11434.${NC}"
            echo "Check for background process blocks or port constraints."
            exit 1
        fi
    done
fi

# 2. Verify that the custom model exists before executing
if ! ollama list | grep -q "myai"; then
    echo -e "${RED}❌ Error: Custom engine model layout 'myai' not found.${NC}"
    echo "Please execute your build engine first: configuration/Modelfile missing compilation."
    exit 1
fi

# 3. Enter Interactive Environment Loop
echo -e "${GREEN}✅ Personal Assistant core pipeline initialized successfully.${NC}"
echo -e "Interactive terminal session active. Instruction sequence set: ${CYAN}Unrestricted Engineering Mode${NC}"
echo -e "Type ${RED}exit${NC} or press ${YELLOW}Ctrl+D${NC} to terminate session sequence safely."
echo -e "${CYAN}========================================================================${NC}\n"

# Launch the interactive terminal loop running your custom compiled persona
ollama run myai
