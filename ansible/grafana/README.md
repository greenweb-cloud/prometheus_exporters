Import and Export Grafana Dashboard 
=========

with this playbook you can import and export dashboard with json file

Requirements
------------

must be install ansible and garafana

Role Variables
--------------

in file defaults/main.yml you can set \
url: "url"  -> set url of grafana \ 
user: "user"  \
password: "pass" password user \
org_id: 1   -> set org_id \
uid: "uid" -> uid of dashboard \
path: "path"  -> path of export or import dasbaord json file \  
grafana_api_key : "grafana_api_key"  -> api key user \



Dependencies
------------
you must be generate json file or export dasboard for import it !

Example Playbook
----------------
for run playbook for import and export run below commad 
note: you must be set inventory

    - ansible-playbook -i inventory --tag grafana_import  -e 'machine=monitor' run.yml
    - ansible-playbook -i inventory --tag grafana_export  -e 'machine=monitor' run.yml
    

note: in  direcoty files  include json of popular json dasboard and you can run for alert_manager , haproxy , hpilo , mysql , rabbit , switch and same it :

    - ansible-playbook -i inventory --tag grafana_export -e 'path=../files/mysql' -e 'uid=mysql.json'  -e 'machine=monitor' run.yml

License
-------
BSD

Author Information
------------------
GreenWeb Co(Ali Ebrahimpour )
