# How to Use
 Install This Exporter Side of your Prometheus Server:
1. Copy File ipmi_remote.yml to /opt/ipmi_exporter/ipmi_remote.yml and change the username and password in default module to yours.
2. bash install_ipmi_exporter.sh
3. Create File /etc/prometheus/ipmi_targets.yml and define your targets in it:

```

- targets:
  - 10.1.2.23
  - 10.1.2.24
  - 10.1.2.25
  - 10.1.2.26
  - 10.1.2.27
  - 10.1.2.28
  - 10.1.2.29
  - 10.1.2.30
  labels:
    job: ipmi_exporter
```

4. Add to Prometheus.yml these lines:
```

  - job_name: ipmi_exporter
    params:
      module: ['default']
    scrape_interval: 1m
    scrape_timeout: 30s
    metrics_path: /ipmi
    scheme: http
    file_sd_configs:
    - files:
      - /etc/prometheus/ipmi_targets.yml
      refresh_interval: 5m
    relabel_configs:
    - source_labels: [__address__]
      separator: ;
      regex: (.*)
      target_label: __param_target
      replacement: ${1}
      action: replace
    - source_labels: [__param_target]
      separator: ;
      regex: (.*)
      target_label: instance
      replacement: ${1}
      action: replace
    - separator: ;
      regex: .*
      target_label: __address__
      replacement: localhost:9290
      action: replace


```
5. Reload Your Prometheus
6. Import IPMI Exporter Grafana Dashboard.json Dashboard to Grafana.
https://grafana.com/grafana/dashboards/15765

![11](https://user-images.githubusercontent.com/90821955/154206640-29c93aea-ffa8-450c-9f2a-341c7bd6b2ff.PNG)

