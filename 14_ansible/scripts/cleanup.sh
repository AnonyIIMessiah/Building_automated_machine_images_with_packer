#!/bin/bash -eux

# Uninstall Ansible and remove PPA.
sudo apt -y remove --purge ansible
sudo apt-add-repository --yes --remove ppa:ansible/ansible
# sudo add-apt-repository  --update ppa:ansible/ansible
# Apt cleanup.
sudo apt -y autoremove
sudo apt -y update