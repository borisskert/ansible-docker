ansible-docker
==============

Installs docker-daemon and cli.

Requirements
------------

Operating systems:

* Ubuntu 14.04 or 16.04
* Raspian jessie

Tasks
-----

* Add repository key from keyserver
* Add docker repository
* Install docker-ce package
* Setup docker daemon options

Role parameters
--------------

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
        storage_driver: overlay2
