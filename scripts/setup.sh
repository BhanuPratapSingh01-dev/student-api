#!/bin/bash

set -e

echo "🚀 Starting VM provisioning..."

# -----------------------------
# Update System
# -----------------------------
update_system() {
    echo "📦 Updating packages..."
    sudo apt-get update -y
}

# -----------------------------
# Install Docker
# -----------------------------
install_docker() {
    echo "🐳 Installing Docker..."

    if command -v docker &> /dev/null
    then
        echo "✅ Docker already installed"
    else
        sudo apt-get install -y docker.io

        sudo systemctl enable docker
        sudo systemctl start docker

        echo "✅ Docker installed successfully"
    fi
}

# -----------------------------
# Install Docker Compose
# -----------------------------
install_docker_compose() {
    echo "🐳 Installing Docker Compose..."

    if command -v docker-compose &> /dev/null
    then
        echo "✅ Docker Compose already installed"
    else
        sudo apt-get install -y docker-compose

        echo "✅ Docker Compose installed"
    fi
}

# -----------------------------
# Install Make
# -----------------------------
install_make() {
    echo "🛠 Installing Make..."

    if command -v make &> /dev/null
    then
        echo "✅ Make already installed"
    else
        sudo apt-get install -y make

        echo "✅ Make installed"
    fi
}

# -----------------------------
# Add Vagrant User To Docker Group
# -----------------------------
configure_docker_permissions() {
    echo "🔐 Configuring Docker permissions..."

    sudo usermod -aG docker vagrant

    echo "✅ Docker permissions configured"
}

# -----------------------------
# Verify Installations
# -----------------------------
verify_installations() {
    echo "🔍 Verifying installations..."

    docker --version
    docker-compose --version
    make --version

    echo "✅ All dependencies verified"
}

# -----------------------------
# Main Function
# -----------------------------
main() {
    update_system
    install_docker
    install_docker_compose
    install_make
    configure_docker_permissions
    verify_installations

    echo "🎉 VM provisioning completed successfully!"
}

main