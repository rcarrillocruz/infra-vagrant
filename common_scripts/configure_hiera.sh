#!/bin/bash

cat <<EOF > hiera.yaml
---
:hierarchy:
  - "fqdn/%{::fqdn}"
  - common
:backends:
  - yaml
:yaml:
  :datadir: '/etc/puppet/hieradata/'
EOF
cp hiera.yaml /etc/puppet/hiera.yaml
chmod 644 /etc/puppet/hiera.yaml
mkdir -p /etc/puppet/hieradata/fqdn
chmod -R 750 /etc/puppet/hieradata
cp /vagrant/hieradata/common.yaml /etc/puppet/hieradata/common.yaml
chmod 644 /etc/puppet/hieradata/common.yaml
cp /vagrant/hieradata/fqdn/* /etc/puppet/hieradata/fqdn
chmod 644 /etc/puppet/hieradata/fqdn/*
