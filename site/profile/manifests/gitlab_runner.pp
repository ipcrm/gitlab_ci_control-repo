class profile::gitlab_runner {
  package{['openssl-devel', 'readline-devel','zlib-devel']:
    ensure => present,
  }

  class { '::gitlab::cirunner':
  }
}
