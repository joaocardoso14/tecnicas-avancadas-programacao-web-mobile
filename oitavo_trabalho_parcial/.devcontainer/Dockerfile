# Usar IA para instalar outros software como Flutter(futuramente) e MySql

# Base Ubuntu 24.04 (o "24.x" disponível hoje é 24.04
FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Evita prompts interativos
ENV DEBIAN_FRONTEND=noninteractive

# Dependências básicas + ferramentas comuns
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        git-lfs \
        gnupg \
        wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Instala Dart SDK (stable) via repositório oficial do Dart
RUN wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/dart.gpg && \
    echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' > /etc/apt/sources.list.d/dart_stable.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends dart && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*