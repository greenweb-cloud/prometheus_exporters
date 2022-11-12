#!/bin/bash
export VERSION=$(curl -sL https://api.github.com/repos/cafebazaar/keepalived-exporter/releases/latest | grep "tag_name"   | sed -E 's/.*"([^"]+)".*/\1/'|sed 's/v//')
#export VERSION="1.2.0"
wget https://github.com/cafebazaar/keepalived-exporter/releases/download/v${VERSION}/keepalived-exporter-${VERSION}.linux-amd64.tar.gz
tar xvzf keepalived-exporter-${VERSION}.linux-amd64.tar.gz keepalived-exporter-${VERSION}.linux-amd64/keepalived-exporter
#sudo mv keepalived-exporter-${VERSION}.linux-amd64/keepalived-exporter /usr/local/bin/
cd keepalived-exporter-${VERSION}.linux-amd64/
cp keepalived-exporter /usr/local/bin/keepalived_exporter

# create user
useradd --no-create-home --shell /bin/false keepalived

chown keepalived:keepalived /usr/local/bin/keepalived_exporter

echo '[Unit]
Description=Keep Alive Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=keepalived
Group=keepalived
Type=simple
ExecStart=/usr/local/bin/keepalived_exporter

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/keepalived_exporter.service

# enable node_exporter in systemctl
systemctl daemon-reload
systemctl start keepalived_exporter
systemctl enable keepalived_exporter


echo "Setup complete."
