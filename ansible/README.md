# prometheus_config
Ansible playbooks and roles to automate install prometheus and another exporter  

# step 1
you need change inventory file for senario
* vim inventory

# step2

```
 ansible-playbook -i /path/to/hosts --tag infra -e 'machine=infras' run.yml
 ansible-playbook -i /path/to/hosts --tag compute -e 'machine=compute' run.yml 
 ansible-playbook -i /path/to/hosts --tag nfs -e 'machine=nfs' run.yaml
 ansible-playbook -i /path/to/hosts --tag haproxy -e 'machine=haproxy' run.yml
