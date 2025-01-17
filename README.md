# Prometheus Exporter Test

This repository supports Dev-container. Start one Dev container in your browser here.

## Default Scenario

Run with `docker compose up`

Includes Node-Exporter, Blackbox-Exporter, Filestat-Exporter

## Windows Scenario

Run with `docker compose -f docker-compose-windows.yml up`

Includes Windows-Exporter with IIS-collector

## Mimir Scenario

Run with `docker compose -f docker-compose-mimir.yml up`

Includes Mimir as long-term storage and collects data via Blackbox-Exporter

## Thanos Scenario (wip)

Includes Mimir as long-term storage and collects data via Blackbox-Exporter
