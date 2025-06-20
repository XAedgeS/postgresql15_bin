#!/bin/bash

mkdir -p etcd elasticsearch opensearch minio k8s_bin

wget -O etcd/etcd-v3.6.1-linux-amd64.tar.gz https://github.com/etcd-io/etcd/releases/download/v3.6.1/etcd-v3.6.1-linux-amd64.tar.gz

wget -O elasticsearch/elasticsearch-9.0.0-amd64.deb https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-9.0.0-amd64.deb
wget -O elasticsearch/elasticsearch-9.0.0-amd64.deb.sha512 https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-9.0.0-amd64.deb.sha512
wget -O elasticsearch/elasticsearch.gpg https://artifacts.elastic.co/GPG-KEY-elasticsearch

wget -O opensearch/opensearch-2.19.2-linux-x64.tar.gz https://artifacts.opensearch.org/releases/bundle/opensearch/2.19.2/opensearch-2.19.2-linux-x64.tar.gz

wget -O minio/minio https://dl.min.io/server/minio/release/linux-amd64/minio
wget -O minio/mc https://dl.min.io/client/mc/release/linux-amd64/mc

wget -O k8s_bin/kubectl https://dl.k8s.io/release/v1.31.8/bin/linux/amd64/kubectl
wget -O k8s_bin/helm-v3.18.3-linux-amd64.tar.gz https://get.helm.sh/helm-v3.18.3-linux-amd64.tar.gz
wget -O k8s_bin/k9s_Linux_amd64.tar.gz https://github.com/derailed/k9s/releases/download/v0.50.6/k9s_Linux_amd64.tar.gz