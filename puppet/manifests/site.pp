apt::source { 'elasticsearch':
    location    => 'http://packages.elasticsearch.org/elasticsearch/1.4/debian',
    release     => 'stable',
    repos       => 'main',
    key         => 'D88E42B4',

    # Elasticsearch doesn't publish their sources into the apt repository, don't
    # include them or you will get errors when trying to run `apt-get update`
    include_src => false,
}

elasticsearch::instance { 'es-01': }

file { "/etc/logstash/logstash.conf":
    mode   => 440,
    owner  => root,
    group  => root,
    source => "puppet:///modules/box/config_files/logstash.conf"
}

apt::source { 'logs':
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
  version => '1.4.2-1-2c0f5a1'
}
