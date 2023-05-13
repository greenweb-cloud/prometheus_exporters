#!/bin/bash
sudo apt-get update
sudo apt-get -y install  adduser libfontconfig1

wget https://dl.grafana.com/oss/release/grafana_9.2.3_amd64.deb

sudo dpkg -i grafana_9.2.3_amd64.deb

systemctl daemon-reload
systemctl restart grafana-server
systemctl enable grafana-server.service
