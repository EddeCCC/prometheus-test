# Prometheus Exporter Test

This repository supports GitHub Codespaces. Start a codespace in your browser here.

You can start any scenario by running `docker compose up` in the specific directory.

---
## Exporter Scenario

Scenario with various Prometheus-Exporters to create data. 
Like Node-Exporter, Filestat-Exporter, Blackbox-Exporter

This scenario uses a shared Docker network with Windows Scenario. 
You have to run `docker network create grafana-shared` before starting the scenario.

In codespaces, there is already a Node-Exporter ready. 
Run the exporter in codespaces with: `/workspaces/prometheus/node_exporter`

The other exporters start automatically with Docker.

---
## Windows Scenario

Scenario with Windows-Exporter (incl. IIS-collector) to collect data for Windows.

This scenario uses a shared Docker network with Exporter Scenario.
You have to run `docker network create grafana-shared` before starting the scenario.

An IIS-Webserver and the Windows-Exporter will start automatically after first installation via batch-script.

---
## Mimir Scenario

This scenario uses Mimir as long-term storage and collects data via Blackbox-Exporter

---
## Thanos Scenario (wip)

This scenario uses Mimir as long-term storage and collects data via Blackbox-Exporter
