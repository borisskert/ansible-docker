install-docker
==============

Installs docker.

Requirements
------------

Operating systems:

* Ubuntu 14.04 or 16.04

Tasks
-----

For **Ubuntu 14.04**:

* Add repository key from keyserver
* Add docker repository
* Install docker-ce package
* Setup docker daemon options

For **Ubuntu 16.04**:

* Add repository key from keyserver
* Add docker repository
* Install docker-ce package
* Install docker service
* Setup docker daemon options

Role parameters
--------------

* docker_opts: to set the DOCKER_OPTS
* storage_driver to setup docker storage-driver, like overlay2

Example Playbook
----------------

Usage (without parameters):

    - hosts: servers
      roles:
         - { role: install-docker }

Usage (with parameters):

    - hosts: servers
      roles:
      - role: install-docker
        docker_opts: "-H tcp://127.0.0.1:4243 -H unix:///var/run/docker.sock --dns 8.8.8.8 --dns 8.8.4.4",
        storage_driver: overlay2
