# Use the official Ollama Docker image
FROM ollama/ollama:latest

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt /app/requirements.txt

# Install Python and dependencies
RUN apt update && apt install -y python3 python3-pip
RUN pip install --no-cache-dir -r requirements.txt

# Expose the correct port for Ollama (Render requires 0.0.0.0 binding)
EXPOSE 11434

# Start the Ollama server with correct host and port
CMD ["ollama", "serve", "--host", "0.0.0.0", "--port", "11434"]
