# Windows-Exporter-Prometheus-Grafana
This is a Tools for monitor Windows Node By Prometheus and Grafana (+Dashboard)

# 1. Install Windows Exporter on Your Nodes:
Download and Copy windows_exporter-0.16.0-amd64.msi to your nodes Desktop.
Open CMD As Administrator.
Change Directory to Desktop.
Run this Command:
```
msiexec /i windows_exporter-0.16.0-amd64.msi ENABLED_COLLECTORS="ad,adfs,cache,cpu,cpu_info,cs,container,dfsr,dhcp,dns,fsrmquota,iis,logical_disk,logon,memory,msmq,mssql,netframework_clrexceptions,netframework_clrinterop,netframework_clrjit,netframework_clrloading,netframework_clrlocksandthreads,netframework_clrmemory,netframework_clrremoting,netframework_clrsecurity,net,os,process,remote_fx,service,tcp,time,vmware" TEXTFILE_DIR="C:\custom_metrics" LISTEN_PORT="9115"
```

# 2. Add Node to Prometheus Targets:
Edit Prometheus.yml and add targets.


# 3. Import Grafana Dashboard.


