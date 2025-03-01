# Use an Ubuntu base image
FROM ubuntu:latest

# Set non-interactive mode for apt install
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt update && apt install -y curl python3 python3-pip

# Install Ollama (alternative approach)
RUN curl -fsSL https://ollama.com/install.sh | sh || true

# Set Python as the default
RUN ln -s /usr/bin/python3 /usr/bin/python

# Copy the requirements.txt
COPY requirements.txt /app/requirements.txt

# Install Python dependencies
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Ollama API port
EXPOSE 10000

# Start Ollama and keep the container running
CMD ["ollama", "serve"]
