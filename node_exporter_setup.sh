#!/bin/bash

mkdir -p /workspaces/node-exporter

# Download the node-exporter
wget -O /workspaces/node-exporter/node-exporter.tar.gz https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz

# Extract the data
tar xvfz /workspaces/node-exporter/node-exporter.tar.gz -C /workspaces/node-exporter

# Start the exporter
/workspaces/node-exporter/node_exporter-1.8.2.linux-amd64/node_exporter
