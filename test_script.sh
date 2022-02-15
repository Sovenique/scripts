#!/bin/bash
mkdir -p /test/test_exporter/node_exporter && cd /test/test_exporter/node_exporter && \
wget https://github.com/prometheus/node_exporter/releases/download/v1.0.0-rc.1/node_exporter-1.0.0-rc.1.linux-amd64.tar.gz
tar -xzf node_exporter-1.0.0-rc.1.linux-amd64.tar.gz && \
rm -f node_exporter-1.0.0-rc.1.linux-amd64.tar.gz && \
cat <<EOF> /test/test_exporter/node_exporter/node_exporter.service
[Unit]
Description=node_exporter
Wants=network-online.target
After=network-online.target

[Service]

User=root
Group=root
Type=simple
ExecStart=/opt/node_exporter/node_exporter-1.0.0-rc.1.linux-amd64/node_exporter

[Install]

WantedBy=multi-user.target
EOF
systemctl daemon-reload 
