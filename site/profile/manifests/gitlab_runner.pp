class profile::gitlab_runner {
  class { '::gitlab::cirunner':
  }
}
