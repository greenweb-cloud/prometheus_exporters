Import and Export Grafana Dashboard 
=========

with this playbook you can import and export dashboard with json file

Requirements
------------

must be install ansible and garafana

Role Variables
--------------

in file defaults/main.yml you can set \
url: "url"
user: "user"
password: "pass"
org_id: 1
uid: "uid"
path: "path"
grafana_api_key : "grafana_api_key"



Dependencies
------------
you must be generate json file or export dasboard for import it !

Example Playbook
----------------
for run playbook for import and export run below commad 
note: you must be set inventory

    - ansible-playbook -i inventory --tag grafana_import -e 'machine=monitor' run.yml
    - ansible-playbook -i inventory --tag grafana_export -e 'machine=monitor' run.yml

License
-------
BSD

Author Information
------------------
GreenWeb Co(Ali Ebrahimpour )
