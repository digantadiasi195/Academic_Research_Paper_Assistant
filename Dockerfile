# Use an Ubuntu base image with Python
FROM ubuntu:latest

# Set non-interactive mode to prevent prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt update && apt install -y curl python3 python3-pip

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Install Python dependencies
COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app

# Expose the required ports
EXPOSE 8000

# Run Ollama and FastAPI together
CMD ollama serve & uvicorn backend.main:app --host 0.0.0.0 --port 8000 --reload
