#!/bin/bash

helm repo add kube-logging https://kube-logging.github.io/helm-charts
helm pull kube-logging/logging-operator
helm pull kube-logging/fluent-bit
helm pull kube-logging/fluentd
helm pull kube-logging/config-reloader

