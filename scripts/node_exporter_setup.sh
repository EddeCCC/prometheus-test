#!/bin/bash

echo RUNNING NODE EXPORTER SET UP SCRIPT
mkdir -p /workspaces/prometheus

# Download the node-exporter
echo Downloading node-exporter...
wget -O /workspaces/prometheus/node_exporter.tar.gz https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz

# Extract the data
echo Extracting node-exporter...
tar xvfz /workspaces/prometheus/node_exporter.tar.gz -C /workspaces/prometheus

# Create symbolic link
ln -s /workspaces/prometheus/node_exporter-1.8.2.linux-amd64/node_exporter /workspaces/prometheus/node_exporter

echo Run node-exporter with /workspaces/prometheus/node_exporter
