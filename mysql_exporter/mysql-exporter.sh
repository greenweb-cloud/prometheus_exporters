#!/bin/bash
#https://github.com/prometheus/mysqld_exporter/releases/download/v0.12.1/mysqld_exporter-0.12.1.linux-amd64.tar.gz
MYSQL_EXPORTER_VERSION="0.12.1"
wget https://github.com/prometheus/mysqld_exporter/releases/download/v${MYSQL_EXPORTER_VERSION}/mysqld_exporter-${MYSQL_EXPORTER_VERSION}.linux-amd64.tar.gz
tar -xzvf mysqld_exporter-${MYSQL_EXPORTER_VERSION}.linux-amd64.tar.gz
cd mysqld_exporter-${MYSQL_EXPORTER_VERSION}.linux-amd64
cp mysqld_exporter /usr/local/bin

# create user
useradd --no-create-home --shell /bin/false mysqld_exporter

chown mysqld_exporter:mysqld_exporter /usr/local/bin/mysqld_exporter

echo '[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=mysqld_exporter
Group=mysqld_exporter
Type=simple
ExecStart=/usr/local/bin/mysqld_exporter

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/mysqld_exporter.service

# enable mysqld_exporter in systemctl
systemctl daemon-reload
systemctl start mysqld_exporter
systemctl enable mysqld_exporter


echo "Setup complete.
Add the following lines to /etc/prometheus/prometheus.yml:

  - job_name: 'mysqld_exporter'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9104']
"

