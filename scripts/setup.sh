#!/bin/bash

echo "🚀 Setting up development environment..."

# Detect OS
OS="$(uname -s)"
echo "🖥️ Detected OS: $OS"

# -----------------------------
# Check Docker Installed
# -----------------------------
if ! command -v docker &> /dev/null
then
    echo "❌ Docker is not installed."

    if [[ "$OS" == "Darwin" ]]; then
        echo "👉 Install Docker Desktop for Mac:"
        echo "https://www.docker.com/products/docker-desktop"
    elif [[ "$OS" == "Linux" ]]; then
        echo "👉 Install Docker for Linux:"
        echo "https://docs.docker.com/engine/install/"
    else
        echo "👉 Please install Docker manually from:"
        echo "https://www.docker.com/products/docker-desktop"
    fi

    exit 1
else
    echo "✅ Docker is installed"
fi

# -----------------------------
# Check Docker Running
# -----------------------------
if ! docker info > /dev/null 2>&1
then
    echo "❌ Docker is installed but NOT running."
    echo "👉 Please start Docker Desktop and re-run this script."
    exit 1
else
    echo "✅ Docker is running"
fi

# -----------------------------
# Check Docker Compose
# -----------------------------
if ! docker compose version &> /dev/null && ! command -v docker-compose &> /dev/null
then
    echo "❌ Docker Compose is not available."
    echo "👉 It usually comes with Docker Desktop. Please reinstall/update Docker."
    exit 1
else
    echo "✅ Docker Compose is available"
fi

# -----------------------------
# Check Make (optional)
# -----------------------------
if ! command -v make &> /dev/null
then
    echo "⚠️ Make is not installed."
    echo "👉 You can still run project using:"
    echo "docker-compose up --build"
else
    echo "✅ Make is installed"
fi

echo "🎉 Setup check complete! You are ready to run the project."