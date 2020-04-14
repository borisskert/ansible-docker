# ansible-docker

Installs docker-daemon and cli.

## Requirements

Operating systems:

* Ubuntu:
  * 16.04 (tested)
  * 18.04 (tested)
  * 20.04 (not working yet)
* Raspian jessie (longer time untested)

## Tasks

* Add repository key from keyserver
* Add docker repository
* Install docker-ce package
* Setup docker daemon options (optional)
* Setup docker-cleanup cron-job (optional)
* Setup python3 docker via pip (optional)

## Role parameters

| Variable      | Type | Mandatory? | Default | Description           |
|---------------|------|------------|---------|-----------------------|
| storage_driver | text | no        | <empty => aufs> | The docker storage driver (consider documentation) |
| cleanup_enabled | text | no       | no => disabled  | Creates cron-job to delete all stopped containers and delete all untagged images |
| install_pip_docker | text | no       | no => will not be installed | Installs the python docker pip package                            |

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
        cleanup_enabled: yes
        install_pip_docker: yes
