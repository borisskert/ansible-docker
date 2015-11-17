ansible-docker
=========

Installs docker on Ubuntu 14.04 hosts.

Tasks
-----

* Install LTS Kernel
* Add repository key from keyserver
* Add dockerproject.org repository
* Install docker-engine package
* Set docker daemon options

Requirements
------------

No requirements.

Role Variables
--------------

No variables defined.

Dependencies
------------

No dependencies.

Example Playbook
----------------

Usage (without parameters):

    - hosts: servers
      roles:
         - { role: ansible-docker }

Usage (with parameters):

    - hosts: servers
      roles:
         - { role: ansible-docker,
         docker_opts: "-H tcp://127.0.0.1:4243 -H unix:///var/run/docker.sock --dns 8.8.8.8 --dns 8.8.4.4"
          }

License
-------

BSD
