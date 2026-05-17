# Personal ARM64 AI Assistant

A fully local, free, and open-source personal AI companion designed to run on **Android arm64** devices using **Termux** combined with **Parrot OS** proot-distro. This project delivers a powerful, adaptive, and unrestricted AI assistant capable of supporting a wide range of tasks including coding, problem-solving, education, creative projects, image generation, and natural human-like interaction.

## Key Features

- **Completely Local Execution**: Ensures full privacy with no cloud dependencies, subscriptions, or external services.

- **Intelligent Reasoning & Coding**: Utilizes optimized quantized models suitable for mobile hardware.

- **Adaptive & Self-Learning**: Supports Retrieval-Augmented Generation (RAG) over personal documents, conversation memory, and user feedback mechanisms.

- **Multimodal Capabilities**:
  - Advanced text generation, code writing, debugging, and project assistance.
  - On-device image generation via `stable-diffusion.cpp`.
  - Basic video frame processing capabilities.

- **Unrestricted Operation**: No built-in content filters — designed for maximum helpfulness across any project.

- **Human-like Interaction**: Customizable personality with persistent memory and natural conversational style.
  
- **Extensible Tooling**: Includes Python-based agents for code execution, file operations, and local knowledge retrieval.

## Hardware Recommendations
- Android device with arm64 architecture.
- Minimum 8 GB RAM (12 GB or more strongly recommended for smoother performance with larger models).
- Adequate internal storage (models typically require 2–8 GB each).

## Repository Structure


``personal-arm64-ai-assistant/
├── README.md
├── install.sh                 # Automated setup script
├── start-ai.sh                # Launch script
├── config/
│   ├── Modelfile              # Custom system prompt and personality
│   └── rag/                   # Directory for personal documents (RAG)
├── scripts/                   # Additional tools and wrappers (expandable)
├── models/                    # Local model storage (.gitignore recommended)
└── requirements.txt           # Python dependencies (if expanding)``


## Installation Instructions

1. Install **Termux** from [F-Droid](https://f-droid.org/) (not Google Play) and grant storage access:
   ```bash
   termux-setup-storage

   

2. Clone the repository:

   ```git clone https://github.com/AnonPhoenix420/personal-arm64-ai-assistant.git```

cd personal-arm64-ai-assistant


4. Make the installation script executable and run it:

   ``chmod +x install.sh
bash install.sh``

5. After installation, create your personalized model:

   ``ollama create myai -f config/Modelfile``

   # Usage
   
Start the AI assistant:

``chmod +x start-ai.sh
bash start-ai.sh``
