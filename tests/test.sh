#!/bin/bash
set -e

vagrant up --provision

echo "Waiting for answer on port 22..."
while ! timeout 300 nc -z 192.168.33.68 22; do
  sleep 0.2
done

ansible-playbook -i inventory.ini test.yml

ansible-playbook -i inventory.ini test.yml \
  | grep -q 'changed=0.*failed=0' \
  && (echo 'Idempotence test: pass' && exit 0) \
  || (echo 'Idempotence test: fail' && exit 1)

curl -s http://192.168.33.68:8080 \
 | grep -q '</html>' \
  && (echo 'curl test: pass' && exit 0) \
  || (echo 'curl test: fail' && exit 1)

vagrant destroy -f
