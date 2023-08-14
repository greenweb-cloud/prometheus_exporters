#!/bin/bash
sudo apt-get update
sudo apt-get -y install  adduser libfontconfig1

# Get the latest release version from GitHub API
latest_release=$(curl -s https://api.github.com/repos/grafana/grafana/releases/latest | grep "tag_name" | cut -d '"' -f 4)

# Extract the version number from the tag
version=$(echo "$latest_release" | cut -d 'v' -f 2)

# Construct the download URL
download_url="https://dl.grafana.com/oss/release/grafana_${version}_amd64.deb"

# Download the latest version of Grafana
wget "$download_url" -O grafana_latest.deb

# Install Grafana
sudo dpkg -i grafana_latest.deb

# Reload systemd daemon
sudo systemctl daemon-reload

# Restart Grafana server
sudo systemctl restart grafana-server

# Enable Grafana service on startup
sudo systemctl enable grafana-server.service
