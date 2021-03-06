class profile::puppetmaster {

  $hiera_yaml = "${::settings::confdir}/hiera.yaml"

  class { 'hiera':
    hierarchy  => [
      'virtual/%{::virtual}',
      'nodes/%{::trusted.certname}',
      'common',
    ],
    hiera_yaml => $hiera_yaml,
    datadir    => '/etc/puppetlabs/code/environments/%{environment}/hieradata',
    owner      => 'pe-puppet',
    group      => 'pe-puppet',
    notify     => Service['pe-puppetserver'],
  }

  #remove the default hiera.yaml from the code-staging directory
  #after the next code manager deployment it should be removed
  #from the live codedir
  file { '/etc/puppetlabs/code-staging/hiera.yaml' :
    ensure => absent,
  }

  file { '/etc/puppetlabs/puppetserver/ssh/id-control_repo.rsa':
    ensure => present,
    owner  => 'pe-puppet',
    group  => 'pe-puppet',
  }
  file { '/etc/puppetlabs/puppetserver/ssh/id-control_repo.rsa.pub':
    ensure => present,
    owner  => 'pe-puppet',
    group  => 'pe-puppet',
  }

  file { '/etc/puppetlabs/puppetserver/ssh':
    ensure => present,
    owner  => 'pe-puppet',
    group  => 'pe-puppet',
  }
 
}
