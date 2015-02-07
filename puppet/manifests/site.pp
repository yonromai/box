apt::source { 'elasticsearch':
    location    => 'http://packages.elasticsearch.org/elasticsearch/1.4/debian',
    release     => 'stable',
    repos       => 'main',
    key         => 'D88E42B4',

    # Elasticsearch doesn't publish their sources into the apt repository, don't
    # include them or you will get errors when trying to run `apt-get update`
    include_src => false,
}

apt::source { 'logstash':
    location    => 'http://packages.elasticsearch.org/logstash/1.4/debian',
    release     => 'stable',
    repos       => 'main',
    key         => 'D88E42B4',

    # Elasticsearch doesn't publish their sources into the apt repository, don't
    # include them or you will get errors when trying to run `apt-get update`
    include_src => false,
}

class { 'elasticsearch':
  version => '1.4.2'
}

class { 'logstash':
  version => '1.4.2-1_debian'
}
