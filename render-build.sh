#!/bin/bash
# Install Ollama on Render
curl -fsSL https://ollama.com/install.sh | sh
ollama serve &
