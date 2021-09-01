Setup Service AlertManager for Prometheus
=========
on this play book setup mail server and alert service for alerting rule prometheus 



Example Playbook
----------------
for generate template alert.rule  and change prometheus config file:

     ansible-playbook -i /path/to/hosts --tag alert_config -e 'machine=monitor' run.yml

for install service alert manager (include mail server):

     ansible-playbook -i /path/to/hosts --tag alert_manager -e 'machine=monitor' run.yml

for install only service mail server:

     ansible-playbook -i /path/to/hosts --tag mail_server -e 'machine=monitor' run.yml
     
     
     
License
-------

BSD

Author Information
------------------

GreenWeb Co(Ali Ebrahimpour )
