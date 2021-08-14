# mysql Exporter

mysql exporter for prometheus monitoring


## Add the following lines to /etc/prometheus/prometheus.yml:
```
  - job_name: 'mysqld_exporter'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9104']
```
