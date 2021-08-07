# prometheus_exporters


# Blackbox exporter 


The blackbox exporter allows blackbox probing of endpoints over
HTTP, HTTPS, DNS, TCP and ICMP.


### step 1
```
cp blackbox.yml /etc/prometheus/
```

### step 2
```
./ blackbox-exporter.sh
```
### step 3 
add config to prometheus exporter

### note: if have error on ping fauiler check the fllowing command:
```
echo "0 2147483647" > /proc/sys/net/ipv4/ping_group_range
sysctl net.ipv4.ping_group_range
echo "net.ipv4.ping_group_range = 0 2147483647" >> /etc/sysctl.conf

```
