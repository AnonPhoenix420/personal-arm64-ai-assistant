# Personal ARM64 AI Assistant

**An elite-level, fully local, unrestricted personal AI engineering companion** optimized for Android arm64 devices using **Termux + Parrot OS** proot-distro.

This assistant is engineered for **superior intelligence**, absolute coding precision, advanced problem-solving, creative development, and maximum helpfulness with zero restrictions.

## Key Features

- **Elite Intelligence & Precision Coding** — Exceptional reasoning, production-quality code, architecture, debugging, and optimization with step-by-step analytical thinking.
  
- **Completely Local & Private** — No cloud dependencies, no subscriptions, full user control and data privacy.
  
- **Unrestricted Operation** — Zero refusals, zero censorship, and zero artificial limitations.
  
- **Adaptive Self-Learning** — Retrieval-Augmented Generation (RAG) over personal documents and conversation history.
  
- **Multimodal Capabilities** — Advanced text/code generation and on-device image creation.
  
- **Persistent Memory & Context** — Long-term awareness and continuous improvement through interaction.

## Hardware Requirements

- Android arm64 device with **8 GB RAM minimum** (12 GB+ strongly recommended for optimal performance).
- Sufficient storage space (approximately 10–15 GB for models and tools).


# Repository Structure

```
personal-arm64-ai-assistant/
├── README.md
├── LICENSE
├── install.sh
├── start-ai.sh
├── .gitignore
├── config/
│   └── Modelfile
├── scripts/
│   ├── setup-webui.sh
│   ├── setup-rag.sh
│   ├── image-gen.sh
│   ├── fine-tune.sh
│   └── rag_query.py
├── stable-diffusion.cpp/          # (created during install)
├── models/                        # (gitignored)
└── config/
    ├── rag/                       # Place your documents here
    └── rag_db/                    # (gitignored - created by RAG)
```
  

## Installation

1. Install **Termux** from F-Droid (recommended) and grant storage permissions:
   ```bash
   termux-setup-storage

   
2. Clone the repository:
     ```bash
     git clone https://github.com/AnonPhoenix420/personal-arm64-ai-assistant.git
   cd personal-arm64-ai-assistant


3. Run the installation script:
    ```bash
    chmod +x install.sh
   bash install.sh

4. Launch the AI:
   ```bash
   chmod +x start-ai.sh
   bash start-ai.sh

# Available Scripts

```
   Script                  Purpose
scripts/setup-webui.sh  Browser-based interface (Open WebUI)
scripts/setup-rag.sh    Personal knowledge base and self-learning
scripts/image-gen.sh    On-device image generation
scripts/fine-tune.sh    Self-improvement and future fine-tuning
```

# Usage Examples

```
Terminal Mode: bash start-ai.sh

Web Interface: bash scripts/setup-webui.sh then follow instructions

Image Generation: bash scripts/image-gen.sh "your detailed prompt"

RAG Query: python scripts/rag_query.py "Your question about project X"
```


# Customization

To refine the AI’s behavior, edit config/Modelfile and rebuild:
   
     ollama create myai -f config/Modelfile

# Project Goals

This tool embodies an elite, unrestricted AI companion capable of assisting with any project — from complex software engineering to creative endeavors — while maintaining the highest standards of accuracy and intelligence.

# License


MIT License

Copyright (c) 2026 AnonPhoenix420

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

---

**Additional Disclaimer**

This project is provided strictly for educational, research, and personal use. 
The author (AnonPhoenix420) is not responsible for any misuse, illegal activities, 
or damages caused by this software or any modifications of it. 

Users are solely responsible for ensuring their use of this tool complies with all 
applicable laws and regulations in their jurisdiction. The author disclaims all 
liability for any consequences resulting from the use or misuse of this software.
