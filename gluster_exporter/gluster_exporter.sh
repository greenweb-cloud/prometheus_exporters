#!/bin/bash
GLUSTER_EXPORTER_VERSION="0.2.7"
#https://github.com/ofesseler/gluster_exporter/releases/download/v0.2.7/gluster_exporter-0.2.7.linux-amd64.tar.gz
wget https://github.com/ofesseler/gluster_exporter/releases/download/v${GLUSTER_EXPORTER_VERSION}/gluster_exporter-${GLUSTER_EXPORTER_VERSION}.linux-amd64.tar.gz
tar -xzvf gluster_exporter-${GLUSTER_EXPORTER_VERSION}.linux-amd64.tar.gz
cd gluster_exporter-${GLUSTER_EXPORTER_VERSION}.linux-amd64
cp gluster_exporter /usr/local/bin

# create user
useradd --no-create-home --shell /bin/false gluster_exporter

chown gluster_exporter:gluster_exporter /usr/local/bin/gluster_exporter

echo '[Unit]
Description=Gluster Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=gluster_exporter
Group=gluster_exporter
Type=simple
ExecStart=/usr/local/bin/gluster_exporter

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/gluster_exporter.service

# enable gluster_exporter in systemctl
systemctl daemon-reload
systemctl start gluster_exporter
systemctl enable gluster_exporter


echo "Setup complete.
Add the following lines to /etc/prometheus/prometheus.yml:

  - job_name: 'gluster_exporter'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost::9189']
"

