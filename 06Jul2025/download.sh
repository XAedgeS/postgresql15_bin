#!/bin/bash

POSTGRES_EXPORTER_VERSION=$(curl -s https://api.github.com/repos/prometheus-community/postgres_exporter/releases/latest | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')

function download_postgres_exporter() {
    echo "Downloading Postgres Exporter v${POSTGRES_EXPORTER_VERSION}..."
    curl -LO "https://github.com/prometheus-community/postgres_exporter/releases/download/v${POSTGRES_EXPORTER_VERSION}/postgres_exporter-${POSTGRES_EXPORTER_VERSION}.linux-amd64.tar.gz"
}

download_postgres_exporter