#!/bin/bash

ansible-playbook test.yml -i test.ini --ask-pass --ask-sudo-pass $*
