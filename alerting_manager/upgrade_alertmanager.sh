#!/bin/bash
ALERTMANAGER_VERSION=$(curl -s https://api.github.com/repos/prometheus/alertmanager/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | sed 's/^v//')
wget https://github.com/prometheus/alertmanager/releases/download/v${ALERTMANAGER_VERSION}/alertmanager-${ALERTMANAGER_VERSION}.linux-amd64.tar.gz
tar xvzf alertmanager-${ALERTMANAGER_VERSION}.linux-amd64.tar.gz

systemctl stop alertmanager

cd alertmanager-${ALERTMANAGER_VERSION}.linux-amd64/

cp alertmanager /usr/local/bin/
cp amtool /usr/local/bin/

# set ownership
chown alertmanager:alertmanager /usr/local/bin/alertmanager
chown alertmanager:alertmanager /usr/local/bin/amtool

systemctl daemon-reload
systemctl enable alertmanager
systemctl restart alertmanager
