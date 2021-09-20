
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
=======
Role Name
=========

A brief description of the role goes here.

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).

