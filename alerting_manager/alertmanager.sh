#!/bin/bash

# Specify the latest version of Alertmanager
ALERTMANAGER_VERSION=$(curl -s https://api.github.com/repos/prometheus/alertmanager/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | sed 's/^v//')
DOWNLOAD_URL="https://github.com/prometheus/alertmanager/releases/download/v$ALERTMANAGER_VERSION/alertmanager-$ALERTMANAGER_VERSION.linux-amd64.tar.gz"

# Download and install the latest Alertmanager version
mkdir -p /tmp/alertmanager-install
cd /tmp/alertmanager-install
wget "$DOWNLOAD_URL" -O alertmanager.tar.gz
tar xvzf alertmanager.tar.gz
cp alertmanager-$ALERTMANAGER_VERSION.linux-amd64/{alertmanager,amtool} /usr/local/bin/
rm -rf /tmp/alertmanager-install

# Create an alertmanager user and directories
useradd --no-create-home --shell /bin/false alertmanager
mkdir -p /etc/alertmanager/template
mkdir -p /var/lib/alertmanager/data

# Create and set ownership for config file and directories
touch /etc/alertmanager/alertmanager.yml
chown -R alertmanager:alertmanager /etc/alertmanager /var/lib/alertmanager

# Setup systemd service
echo "[Unit]
Description=Prometheus Alertmanager Service
Wants=network-online.target
After=network.target

[Service]
User=alertmanager
Group=alertmanager
Type=simple
ExecStart=/usr/local/bin/alertmanager \
    --config.file /etc/alertmanager/alertmanager.yml \
    --storage.path /var/lib/alertmanager/data
Restart=always

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/alertmanager.service

# Reload systemd, enable and start the Alertmanager service
systemctl daemon-reload
systemctl enable alertmanager
systemctl start alertmanager

# Notify user about setup completion
echo "(1/2) Setup complete."
echo "Add the following lines and substitute with correct values to /etc/alertmanager/alertmanager.yml:"
echo "
global:
  smtp_smarthost: 'localhost:25'
  smtp_from: 'alertmanager@prometheus.com'
  smtp_auth_username: ''
  smtp_auth_password: ''
  smtp_require_tls: false

templates:
- '/etc/alertmanager/template/*.tmpl'

route:
  repeat_interval: 1h
  receiver: operations-team

receivers:
- name: 'operations-team'
  email_configs:
  - to: 'operations-team+alerts@example.org'
  slack_configs:
  - api_url: https://hooks.slack.com/services/XXXXXX/XXXXXX/XXXXXX
    channel: '#prometheus-course'
    send_resolved: true" > /etc/alertmanager/alertmanager.yml

# Notify user about the second step
echo "(2/2) Setup complete."
echo "Alter the following config in /etc/prometheus/prometheus.yml:"
echo "
alerting:
  alertmanagers:
  - static_configs:
    - targets:
      - localhost:9093" >> /tmp/alertmanager-setup-instructions

# Display setup instructions
cat /tmp/alertmanager-setup-instructions
