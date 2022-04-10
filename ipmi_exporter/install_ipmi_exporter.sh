#!/bin/bash
#Install FREEipmi
sudo apt-get -y install build-essential libgcrypt11-dev
wget https://ftp.gnu.org/gnu/freeipmi/freeipmi-1.6.9.tar.gz
tar -xvf freeipmi-1.6.9.tar.gz
cd freeipmi-1.6.9/
./configure
make
make install
apt -y install freeipmi

##
wget https://github.com/srkaviani/prometheus_exporters/raw/main/ipmi_exporter/ipmi_exporter
mv ipmi_exporter /usr/local/bin/
chmod 755 /usr/local/bin/ipmi_exporter

echo '[Unit]
Description=IPMI Exporter
Wants=network-online.target
After=network-online.target
[Service]
User=root
Group=root
Type=simple
ExecStart=/usr/local/bin/ipmi_exporter --config.file=/opt/ipmi_exporter/ipmi_remote.yml
[Install]
WantedBy=multi-user.target' > /etc/systemd/system/ipmi_exporter.service

# enable ipmi_exporter in systemctl
systemctl daemon-reload
systemctl start ipmi_exporter
systemctl enable ipmi_exporter

echo "Setup complete. Add to Prometheus By Readme ."
