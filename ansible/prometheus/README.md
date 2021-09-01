# prometheus_config
Ansible playbooks and roles to automate install prometheus and another exporter  

# step 1
you need to change inventory file for senario
* vim inventory

# step2

for run prometheus playbook with each service:


    ansible-playbook -i /path/to/hosts --tag infra -e 'machine=infras' run.yml
    ansible-playbook -i /path/to/hosts --tag compute -e 'machine=compute' run.yml 
    ansible-playbook -i /path/to/hosts --tag nfs -e 'machine=nfs' run.yaml
    ansible-playbook -i /path/to/hosts --tag glance -e 'machine=glance' run.yml
    ansible-playbook -i /path/to/hosts --tag galera -e 'machine=infra' run.yml
    ansible-playbook -i /path/to/hosts --tag haproxy -e 'machine=infra' run.yml
    ansible-playbook -i /path/to/hosts --tag keepalived -e 'machine=infra' run.yml
    ansible-playbook -i /path/to/hosts --tag rabbit -e 'machine=infra' run.yml
    ansible-playbook -i /path/to/hosts --tag hpilo -e 'machine=monitor' run.yml
    ansible-playbook -i /path/to/hosts --tag snmp -e 'machine=monitor' run.yml
    

# step3


You must run the following command to configure Prometheus

```
ansible-playbook -i /path/to/hosts --tag monitor_infra -e 'machine=monitor' run.yml
ansible-playbook -i /path/to/hosts --tag monitor_compute -e 'machine=monitor' run.yml
ansible-playbook -i /path/to/hosts --tag monitor_nfs -e 'machine=monitor' run.yml
ansible-playbook -i /path/to/hosts --tag monitor_glance -e 'machine=monitor' run.yml
ansible-playbook -i /path/to/hosts --tag monitor_galera -e 'machine=monitor' run.yml
ansible-playbook -i /path/to/hosts --tag monitor_haproxy -e 'machine=monitor' run.yml
ansible-playbook -i /path/to/hosts --tag monitor_keepalived -e 'machine=monitor' run.yml
ansible-playbook -i /path/to/hosts --tag monitor_rabbit -e 'machine=monitor' run.yml


```
