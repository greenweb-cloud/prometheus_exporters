# mysql Exporter

mysql exporter for prometheus monitoring


## Add the following lines to /etc/prometheus/prometheus.yml:
```
  - job_name: 'mysqld_exporter'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9104']
```


## add .my.cnf
add .my.cnf in /home/mysqld_exporter path

```
[client]
host = localhost
user = root
password = galera_root_password
```
