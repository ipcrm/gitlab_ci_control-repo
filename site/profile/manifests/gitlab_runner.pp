class profile::gitlab_runner {
  package{['openssl-devel', 'readline-devel','zlib-devel','gcc-c++']:
    ensure => present,
  }

  class { '::gitlab::cirunner':
  }

  user {'gitlab-runner':
    groups  => ['docker'],
    require => Class['gitlab:cirunner'],
  }

}
