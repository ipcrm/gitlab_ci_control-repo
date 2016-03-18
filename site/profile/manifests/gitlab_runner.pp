class profile::gitlab_runner {
  package{['openssl-devel', 'readline-devel','zlib-devel','gcc-c++']:
    ensure => present,
  }

  class { '::gitlab::cirunner':
  }
}
