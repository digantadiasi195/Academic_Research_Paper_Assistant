# Use the official prebuilt Ollama image
FROM ollama/ollama:latest

# Expose the Ollama API port
EXPOSE 11434

# Start Ollama with the correct host binding
CMD ["ollama", "serve", "--host", "0.0.0.0", "--port", "11434"]
