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
* Add dockerproject.org repository
* Install docker-engine package
* Setup docker daemon options

For **Ubuntu 16.04**:

* Add repository key from keyserver
* Add dockerproject.org repository
* Install docker-engine package
* Install docker service
* Setup docker daemon options

For **OpenSUSE**:

* Add Virtualization_containers repository
* Install docker package
* Install containerd service
* Install docker service
* Setup docker daemon options

Role parameters
--------------

* docker_opts: to set the DOCKER_OPTS
* http_proxy: to set the http-proxy for docker
* https_proxy: to set the https-proxy for docker
* no_proxy: to set the no-proxy hosts for docker

Example Playbook
----------------

Usage (without parameters):

    - hosts: servers
      roles:
         - { role: install-docker }

Usage (with parameters):

    - hosts: servers
      roles:
         - { role: install-docker,
         docker_opts: "-H tcp://127.0.0.1:4243 -H unix:///var/run/docker.sock --dns 8.8.8.8 --dns 8.8.4.4",
         http_proxy: "http://proxy:81",
         https_proxy: "http://proxy:81",
         no_proxy: "localhost,127.0.0.1"
          }
