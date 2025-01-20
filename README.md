# Prometheus Exporter Test

This repository supports GitHub Codespaces. Start a codespace in your browser here.

# Docker network setup

You have to run `docker network create grafana-shared` before running any docker compose scenario!
The network will be created automatically in codespaces.
The containers use an external network, so the Grafana container can reach Prometheus container from different
compose files.

## Default Scenario

Run with `docker compose up`

Includes Node-Exporter, Blackbox-Exporter, Filestat-Exporter

In codespaces there is already a node-exporter ready. 
Run the exporter in codespaces with: `/workspaces/prometheus/node_exporter`

The other exporters start automatically with Docker.

## Windows Scenario

**Additionally to Default Scenario**, run also `docker compose -f docker-compose-windows.yml up`

Includes Windows-Exporter with IIS-collector
IIS and the Windows-Exporter will start automatically after first installation via batch-script.

## Mimir Scenario

Run with `docker compose -f docker-compose-mimir.yml up`

Includes Mimir as long-term storage and collects data via Blackbox-Exporter

## Thanos Scenario (wip)

Run with `docker compose -f docker-compose-thanos.yml up`

Includes Thanos as long-term storage and collects data via Blackbox-Exporter
