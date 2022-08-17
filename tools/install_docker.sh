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
curl -fsSL https://download.docker.com/linux/debian/gpg |
  sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-ce-archive-keyring.gpg

# Set up the repository
printf '%s\n' "deb https://download.docker.com/linux/debian bullseye stable" |
  sudo tee /etc/apt/sources.list.d/docker-ce.list


### INSTALL DOCKER CE ###########################################################################

# Update the apt package index.
sudo apt-get -y update

# Install the latest version of Docker Engine, containerd, and Docker Compose
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Verify that Docker CE is installed correctly by running the hello-world image.
docker run hello-world | grep "Hello from Docker!"

# Verify that docker-compose is installed
docker-compose --version
