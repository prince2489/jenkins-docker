#!/bin/bash

# Update package index
sudo apt-get update

# Install OpenJDK (Java Development Kit)
sudo apt-get install -y openjdk-11-jdk

# Import Jenkins repository key and add the repository
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package index again after adding Jenkins repository
sudo apt-get update

# Install Jenkins
sudo apt-get install -y jenkins

# Update Package for Docker
sudo apt update

# get the dependancy
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

# Add Docker's Official GPG Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker Repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" # need to press enter

# Update Package again
sudo apt update

# Install Docker
sudo apt install docker-ce -y

# Start Docker Service
sudo systemctl start docker
sudo systemctl enable docker

# Docker check
sudo docker --version

# Jenkins check
dpkg -l | grep jenkins


sudo groupadd docker
sudo usermod -aG docker jenkins