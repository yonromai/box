apt::source { 'elasticsearch':
  location   => 'http://packages.elasticsearch.org/elasticsearch/1.4/debian',
  release    => 'stable',
  repos      => 'main',
  key        => 'D88E42B4',
  key_server => 'pgp.mit.edu',
  }

class { 'elasticsearch':
  version => '1.4.2'
}

class { 'logstash':
  version => '1.4.2-1_debian'
}
