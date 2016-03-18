class profile::gitlab_runner {
  package{['openssl-devel', 'readline-devel','zlib-devel','g++']:
    ensure => present,
  }

  class { '::gitlab::cirunner':
  }
}
