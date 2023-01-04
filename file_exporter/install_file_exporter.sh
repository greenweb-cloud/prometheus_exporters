#!/bin/bash

wget https://raw.githubusercontent.com/greenweb-cloud/prometheus_exporters/main/file_exporter/filestat.yaml
wget https://raw.githubusercontent.com/greenweb-cloud/prometheus_exporters/main/file_exporter/filestat_exporter

cp filestat_exporter /usr/local/bin/filestat_exporter
cp filestat.yaml /usr/local/bin/filestat.yaml

# create user
#useradd --no-create-home --shell /bin/false filestat_exporter
#chown filestat_exporter:filestat_exporter /usr/local/bin/filestat_exporter

echo '[Unit]
Description=File Stat Exporter
Wants=network-online.target
After=network-online.target
[Service]
User=root
Group=root
Type=simple
ExecStart=/usr/local/bin/filestat_exporter  -config.file /usr/local/bin/filestat.yaml
[Install]
WantedBy=multi-user.target' > /etc/systemd/system/filestat_exporter.service


# enable node_exporter in systemctl
systemctl daemon-reload
systemctl start filestat_exporter
systemctl enable filestat_exporter


echo "Setup complete.
Add the following lines to /etc/prometheus/prometheus.yml:
  - job_name: 'node_exporter'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9943']
"



