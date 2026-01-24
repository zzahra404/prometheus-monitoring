#!/bin/bash

# Script to install Grafana OSS on Kali Linux / Debian

set -e  # Stop the script if any command fails

# Install tools for HTTPS repositories and file downloads
sudo apt-get install -y apt-transport-https wget

# Create a secure directory to store APT keys
sudo mkdir -p /etc/apt/keyrings/

# Download and install Grafana's GPG key
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null

# Add the official Grafana repository to APT sources
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# Update the package list 
sudo apt-get update

# Install Grafana OSS 
sudo apt-get install grafana

echo "Grafana OSS installed successfully!"


# Start the Grafana service 
sudo systemctl start grafana-server   

# Check the status of Grafana 
sudo systemctl status grafana-server   

# Default Grafana web interface access: http://localhost:3000 or http://IP_VM:3000
# Default login credentials: Username: admin and Password: admin

