#!/bin/bash

set -e

function create_elasticsearch_exporter_user() {
    sudo useradd --no-create-home --shell /bin/false elasticsearch_exporter
}

function create_elasticsearch_exporter_service() {
    tar -xzf elasticsearch_exporter-${EXPORTER_VERSION}.linux-amd64.tar.gz
    sudo mv elasticsearch_exporter-${EXPORTER_VERSION}.linux-amd64/elasticsearch_exporter /usr/local/bin/
    rm -rf elasticsearch_exporter-${EXPORTER_VERSION}.linux-amd64.tar.gz elasticsearch_exporter-${EXPORTER_VERSION}.linux-amd64
    sudo mkdir -p /etc/elasticsearch_exporter
    sudo cp -f elasticsearch-exporter.env /etc/elasticsearch_exporter/.env
    sudo chown -R elasticsearch_exporter:elasticsearch_exporter /etc/elasticsearch_exporter
    echo "Creating elasticsearch_exporter systemd service..."
    sudo tee /etc/systemd/system/elasticsearch_exporter.service > /dev/null << EOF
[Unit]
Description=Prometheus Elasticsearch Exporter
After=network.target

[Service]
User=elasticsearch_exporter
Group=elasticsearch_exporter
EnvironmentFile=/etc/elasticsearch_exporter/.env
Type=simple
ExecStart=/usr/local/bin/elasticsearch_exporter --es.uri=$ES_URI --es.all --es.indices --es.shards
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
}

function enable_and_start_elasticsearch_exporter() {
    systemctl daemon-reload
    systemctl enable elasticsearch_exporter --now
}

function main() {
    create_elasticsearch_exporter_user
    create_elasticsearch_exporter_service
    enable_and_start_elasticsearch_exporter
}

main

