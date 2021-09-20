
Import and Export Grafana Dashboard 
------------

with this playbook you can import and export dashboard with json file

Role Name


A brief description of the role goes here.


Requirements
------------


must be install ansible and garafana

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.


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

GreenWeb Co(Ali Ebrahimpour )
=======

An optional section for the role authors to include contact information, or a website (HTML is not allowed).

