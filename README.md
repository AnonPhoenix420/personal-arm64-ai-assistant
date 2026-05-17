# Personal ARM64 AI Assistant

A fully local, free, open-source, and unrestricted personal AI companion optimized for **Android arm64** devices using **Termux** + **Parrot OS** proot-distro.

This assistant is designed for superior intelligence, exceptional coding accuracy, creative tasks, problem-solving, self-learning, and maximum helpfulness with no restrictions.

## Key Features

- **Superior Intelligence & Coding Precision**: Optimized for accurate, production-quality code with deep reasoning.
- **Completely Local & Private**: No cloud, no subscriptions, no data sharing.
- **Unrestricted Operation**: Zero refusals or censorship.
- **Adaptive & Self-Learning**: RAG support over personal documents + conversation memory.
- **Multimodal**: Text, code, and on-device image generation.
- **Human-like Interaction**: Natural, context-aware, and continuously improving.

## Hardware Requirements

- Android arm64 device with **8 GB RAM minimum** (12 GB+ recommended).
- Sufficient storage (models + build tools ≈ 10–15 GB).

## Repository Structure

personal-arm64-ai-assistant/
├── README.md
├── install.sh
├── start-ai.sh
├── config/
│   └── Modelfile
├── scripts/
│   ├── setup-webui.sh
│   ├── setup-rag.sh
│   └── image-gen.sh
├── .gitignore
└── stable-diffusion.cpp/      # Built during installation

## Installation

1. Install **Termux** from F-Droid and grant storage permissions:
   ```bash
   termux-setup-storage
   ```

 2. Clone the repository:
```bash
   git clone https://github.com/AnonPhoenix420/personal-arm64-ai-assistant.git
cd personal-arm64-ai-assistant
```

3. 
Run the installer:
```bash
chmod +x install.sh
bash install.sh
```

4. Launch the AI:
   ```bash
   chmod +x start-ai.sh
   bash start-ai.sh

   
  #Usage
  
Terminal Mode: bash start-ai.sh

Web Interface (Recommended): Run bash scripts/setup-webui.sh then follow the instructions.

Image Generation: bash scripts/image-gen.sh "your prompt here"

RAG Queries: python scripts/rag_query.py "Your question"
