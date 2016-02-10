#!/bin/bash

ansible-playbook test.yml -i test.ini -u flandi --ask-sudo-pass
