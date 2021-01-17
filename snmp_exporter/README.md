

# service for prometheus monitoring
### SNMP stands for Simple Network Management Protocol.

#### The main reason to use SNMP in Prometheus is in the situations were you cannot install a Node Exporter on the device you want to monitor, but the device can still support SNMP.

#### Common devices that support SNMP are routers, switches, printers, servers, workstations and other devices found on IP networks.

#### Not every network device supports SNMP, or has it enabled, and there is a good chance you don't have an SNMP enabled device available on your network that you can use in this lesson. So we can set up a local SNMP daemon running on the server that we can test with. Later on, we will install another SNMPD on an external server, and I will also demonstrate connecting to an existing CISCO switch.

## To start a local SNMP daemon,

```
sudo apt install snmp snmpd

##### Verify that SNMPD is running
```
```
sudo service snmpd status
##### Test snmpget
```
```
snmpwalk -v2c -cpublic 127.0.0.1 1.3.6.1.2.1.1

##### Test snmpwalk
```
```
snmpget -v2c -cpublic 127.0.0.1 1.3.6.1.2.1.1.1.0
```
