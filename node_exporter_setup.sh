#!/bin/bash

echo RUNNING NODE EXPORTER SET UP SCRIPT
mkdir -p /workspaces/node-exporter

# Download the node-exporter
echo Downloading node-exporter...
wget -O /workspaces/node-exporter/node-exporter.tar.gz https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz

# Extract the data
echo Extracting node-exporter...
tar xvfz /workspaces/node-exporter/node-exporter.tar.gz -C /workspaces/node-exporter

# Start the exporter
echo Starting node-exporter...
/workspaces/node-exporter/node_exporter-1.8.2.linux-amd64/node_exporter &

# Finish
exit 0
