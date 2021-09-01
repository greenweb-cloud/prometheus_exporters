Consul template Generator
=========
on this playbook generate template for service snmp and blackbox and hp ilo



Example Playbook
----------------
for generate snmp:
     
     ansible-playbook -i /path/to/hosts --tag snmp_consul -e 'machine=monitor' run.yml

for generate blackbox:

     ansible-playbook -i /path/to/hosts --tag snmp_consul -e 'machine=monitor' run.yml
     
for generate hp ilo:

     ansible-playbook -i /path/to/hosts --tag hpilo_consul -e 'machine=monitor' run.yml
 

License
-------
BSD

Author Information
------------------
GreenWeb Co(Ali Ebrahimpour )
