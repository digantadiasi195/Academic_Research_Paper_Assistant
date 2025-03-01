# Use the official Ollama Docker image
FROM ollama/ollama:latest

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt /app/requirements.txt

# Install Python and dependencies
RUN apt update && apt install -y python3 python3-pip
RUN pip install --no-cache-dir -r requirements.txt

# Expose the correct port for Render
EXPOSE 10000

# Start the Ollama server on the correct port
CMD ["ollama", "serve", "--port", "10000"]
