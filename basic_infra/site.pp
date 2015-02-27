#
# Top-level variables
#
# There must not be any whitespace between this comment and the variables or
# in between any two variables in order for them to be correctly parsed and
# passed around in test.sh
#

#
# Default: should at least behave like an openstack server
#
node default {
  class { 'openstack_project::server':
    sysadmins => hiera('sysadmins', []),
  }
}

node 'jenkins.your.own.domain' {
  class { 'openstack_project::jenkins':
    project_config_repo     => 'https://git.openstack.org/openstack-infra/project-config',
    jenkins_jobs_password   => 'openstack',
    jenkins_ssh_private_key => hiera('jenkins_ssh_private_key_contents'),
    ssl_cert_file  => '/etc/ssl/certs/ssl-cert-snakeoil.pem',
    ssl_key_file   => '/etc/ssl/private/ssl-cert-snakeoil.key',
    ssl_chain_file => '',
    sysadmins               => '',
    zmq_event_receivers     => ['logstash',
                                'nodepool',
    ],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
