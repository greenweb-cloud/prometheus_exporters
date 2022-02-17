#!/bin/bash
#wget https://github.com/srkaviani/prometheus_exporters/raw/main/libvirt_exporter/prometheus-libvirt-exporter
cd /home/
cp /home/prometheus-libvirt-exporter /usr/local/bin

# create user
useradd --no-create-home --shell /bin/false prometheus-libvirt-exporter

chown prometheus-libvirt-exporter:prometheus-libvirt-exporter /usr/local/bin/prometheus-libvirt-exporter
chmod 755 /usr/local/bin/prometheus-libvirt-exporter

echo '[Unit]
Description=Libvirt Exporter
Wants=network-online.target
After=network-online.target
[Service]
User=prometheus-libvirt-exporter
Group=prometheus-libvirt-exporter
Type=simple
ExecStart=/usr/local/bin/prometheus-libvirt-exporter
[Install]
WantedBy=multi-user.target' > /etc/systemd/system/prometheus-libvirt-exporter.service

# enable prometheus-libvirt-exporter in systemctl
systemctl daemon-reload
systemctl start prometheus-libvirt-exporter
systemctl enable prometheus-libvirt-exporter


echo "Setup complete.
Add the following lines to /etc/prometheus/prometheus.yml:
  - job_name: 'prometheus-libvirt-exporter'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9000']
"
