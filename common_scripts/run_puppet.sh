#!/bin/bash
puppet apply /vagrant/site.pp --modulepath=/etc/puppet/modules:/opt/openstack-infra/system-config/modules
