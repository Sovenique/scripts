#!/bin/bash
mkdir -p /opt/node_exporter && cd /opt/node_exporter && \
wget https://github.com/prometheus/node_exporter/releases/download/v1.0.0-rc.1/node_exporter-1.0.0-rc.1.linux-amd64.tar.gz
tar -xzf node_exporter-1.0.0-rc.1.linux-amd64.tar.gz && \
rm -f node_exporter-1.0.0-rc.1.linux-amd64.tar.gz && \
cat << EOF > /etc/systemd/system/node_exporter.service
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
systemctl daemon-reload && \
systemctl enable node_exporter && \
systemctl start node_exporter && \
systemctl status node_exporter 
