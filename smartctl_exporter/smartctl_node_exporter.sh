#!/bin/bash
sudo apt install smartmontools
mkdir -p /var/lib/node_exporter/textfile_collector
wget mirror.iranserver.com/prom/smartmon.sh -O /usr/local/bin/smartmon.sh && chmod +x /usr/local/bin/smartmon.sh
echo '[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter --collector.textfile.directory /var/lib/node_exporter/textfile_collector/

[Install]
WantedBy=multi-user.target
' > /etc/systemd/system/node_exporter.service

echo '*/1 * * * * root /usr/local/bin/smartmon.sh > /var/lib/node_exporter/textfile_collector/smart_metrics.prom' >> /etc/crontab
# enable node_exporter in systemctl
systemctl daemon-reload
systemctl restart node_exporter

