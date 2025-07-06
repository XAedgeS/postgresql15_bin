#!/bin/bash

POSTGRES_EXPORTER_PORT=9187

function create_postgres_exporter_user() {
    sudo useradd --no-create-home --shell /bin/false postgres_exporter
}

function create_postgres_exporter_service() {
    tar -xzf postgres_exporter-${POSTGRES_EXPORTER_VERSION}.linux-amd64.tar.gz
    sudo mv postgres_exporter-${POSTGRES_EXPORTER_VERSION}.linux-amd64/postgres_exporter /usr/local/bin/
    rm -rf postgres_exporter-${POSTGRES_EXPORTER_VERSION}.linux-amd64.tar.gz postgres_exporter-${POSTGRES_EXPORTER_VERSION}.linux-amd64
    sudo mkdir -p /etc/postgres_exporter
    sudo cp -f postgres-exporter.env /etc/postgres_exporter/.env
    sudo chown -R postgres_exporter:postgres_exporter /etc/postgres_exporter
    echo "Creating postgres_exporter systemd service..."
    sudo tee /etc/systemd/system/postgres_exporter.service > /dev/null << EOF
[Unit]
Description=Prometheus Postgres Exporter
After=network.target

[Service]
User=postgres_exporter
Group=postgres_exporter
EnvironmentFile=/etc/postgres_exporter/.env
ExecStart=/usr/local/bin/postgres_exporter --collector.stat_statements --web.listen-address=:$POSTGRES_EXPORTER_PORT

[Install]
WantedBy=multi-user.target
EOF
}

function start_postgres_exporter_service() {
    sudo systemctl daemon-reload
    sudo systemctl enable postgres_exporter.service --now
}

function install_postgres_exporter() {
    create_postgres_exporter_user
    create_postgres_exporter_service
    start_postgres_exporter_service
}

install_postgres_exporter