#!/bin/bash
# Enable superuser privileges
sudo apt update && sudo apt install -y curl
curl -fsSL https://ollama.com/install.sh | sh
ollama serve &
