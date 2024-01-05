#!/bin/bash

echo "Starting Docker, Docker Compose v2 and Portainer installer..."

# Install Docker
echo "Installing Docker..."
sh <(curl -sSL https://get.docker.com)

# Get the latest version of Docker Compose
echo "Getting the latest version of Docker Compose..."
LATEST=$(curl -sL https://api.github.com/repos/docker/compose/releases/latest | grep '"tag_name":' | cut -d'"' -f4)

# Set the Docker config directory, defaulting to ~/.docker if not already set
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}

# Create the directory for Docker CLI plugins if it doesn't exist
mkdir -p $DOCKER_CONFIG/cli-plugins

# Download the latest version of Docker Compose into the Docker CLI plugins directory
echo "Installing Docker Compose v2..."
curl -sSL https://github.com/docker/compose/releases/download/$LATEST/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose

# Make the Docker Compose plugin executable
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

# Print the Docker Compose version to verify the installation
docker compose version

# Create a Docker volume for Portainer
docker volume create portainer_data

# Run Portainer
echo "Installing Portainer..."
docker run -d \
  -p 8000:8000 \
  -p 9443:9443 \
  --name=portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:latest

# Get the IP address of the server
IP_ADDRESS=$(hostname -I | cut -d' ' -f1)

# Print the URL for Portainer
echo "You can access Portainer at http://$IP_ADDRESS:9443"
