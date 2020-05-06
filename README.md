# ansible-docker

Installs docker-daemon and cli.

## Requirements

Operating systems:

* Ubuntu:
  * 16.04 (tested)
  * 18.04 (tested)
  * 20.04 (tested - installing `docker.io` package)
* Raspian jessie (longer time untested)

## Tasks

* Add repository key from keyserver
* Add docker repository
* Install docker-ce package (`docker.io` in Ubuntu 20.04)
* Setup docker daemon options (optional)
* Setup docker-cleanup systemd service (optional)
* Setup python3 docker via pip (optional)

## Role parameters

| Variable      | Type | Mandatory? | Default | Description           |
|---------------|------|------------|---------|-----------------------|
| storage_driver | text | no        | <empty => aufs> | The docker storage driver (consider documentation) |
| cleanup_enabled | text | no       | no => disabled  | Creates a systemd service to delete all stopped containers and delete unused images |
| cleanup_on_calendar | text | no       | `daily`     | Choose when your cleanup timer will be triggered                                    |
| install_pip_docker  | text | no       | no => will not be installed | Installs the python docker pip package                              |

## Usage

### Add to `requirements.yml`:

```yaml
- name: install-docker
  src: https://github.com/borisskert/ansible-docker.git
  scm: git
```

### Example playbooks

Minimal:

```yaml
- hosts: test_machine
  become: yes

  roles:
    - role: install-docker
```

All parameters:

```yaml
- hosts: test_machine
  become: yes

  roles:
    - role: install-docker
      storage_driver: overlay2
      cleanup_enabled: yes
      cleanup_on_calendar: daily
      install_pip_docker: yes
```

## Testing

Requirements:

* Vagrant with vagrant plugin `vagrant-vbguest` installed
* VirtualBox
* Ansible

Run:

```shell script
cd test
./test.sh
```
