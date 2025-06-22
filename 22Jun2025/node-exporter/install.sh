# !/bin/bash

tar -xzf node_exporter-*.linux-amd64.tar.gz
sudo mv node_exporter-*/node_exporter /usr/local/bin

sudo useradd --system --no-create-home --shell /bin/false node_exporter
sudo tee /etc/systemd/system/node_exporter.service > /dev/null << EOF
[Unit]
Description=Prometheus Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable node_exporter --now

rm -rf node_exporter-*.linux-amd64.tar.gz node_exporter-*
echo "========== node_exporter installed and started successfully =========="
