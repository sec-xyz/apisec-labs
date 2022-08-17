#!/usr/bin/env bash

# Kali Linux
# Install docker engine and docker-compose

### Uninstall old versions ###################################################
sudo apt-get -y remove docker docker-engine docker.io containerd runc

### SET UP THE REPOSITORY ###################################################

# Update the apt package index
sudo apt-get -y update

# Install packages to allow apt to use a repository over HTTPS:
sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint.
sudo apt-key fingerprint 0EBFCD88

# Set up the repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


### INSTALL DOCKER CE ###########################################################################

# Update the apt package index.
sudo apt-get -y update

# Install the latest version of Docker Engine, containerd, and Docker Compose
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Verify that Docker CE is installed correctly by running the hello-world image.
docker run hello-world | grep "Hello from Docker!"

# Verify that docker-compose is installed
docker-compose --version
