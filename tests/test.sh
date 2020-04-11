#!/bin/bash
set -e

vagrant up --provision

ansible-playbook -i inventory.ini test.yml

ansible-playbook -i inventory.ini test.yml \
  | grep -q 'changed=0.*failed=0' \
  && (echo 'Idempotence test: pass' && exit 0) \
  || (echo 'Idempotence test: fail' && exit 1)

curl -s http://192.168.33.10:8080 \
 | grep -q '</html>' \
  && (echo 'curl test: pass' && exit 0) \
  || (echo 'curl test: fail' && exit 1)

vagrant destroy -f