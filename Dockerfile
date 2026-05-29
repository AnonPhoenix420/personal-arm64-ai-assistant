# Dockerfile for Phoenix AI (x86_64 / amd64)
FROM ubuntu:24.04

RUN apt update && apt install -y curl python3 python3-pip
RUN curl -fsSL https://ollama.com/install.sh | sh

WORKDIR /app
COPY . .

EXPOSE 11434
CMD ["ollama", "serve"]
