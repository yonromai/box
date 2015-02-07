apt::source { 'puppetlabs':
  location   => 'http://apt.puppetlabs.com',
  repos      => 'main',
  key        => '1054B7A24BD6EC30',
  key_server => 'pgp.mit.edu',
  }


class { 'elasticsearch':
  version => '1.4.2'
}

class { 'logstash':
  version => '1.4.2-1_debian'
}
