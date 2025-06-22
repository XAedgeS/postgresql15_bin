# !/bin/bash

NODE_EXPORTER_VERSION=$(curl -s "https://api.github.com/repos/prometheus/node_exporter/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')

echo "========== Downloading Node Exporter v${NODE_EXPORTER_VERSION} =========="
curl -LO https://github.com/prometheus/node_exporter/releases/download/v$NODE_EXPORTER_VERSION/node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz
