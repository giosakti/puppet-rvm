class rvm::system($version='latest') {
  exec { 'system-rvm':
    path    => '/usr/bin:/usr/sbin:/bin',
    command => "curl -L https://get.rvm.io | sudo bash -s stable",
    creates => '/usr/local/rvm/bin/rvm',
    require => [
      Class['rvm::dependencies'],
    ],
  }
}
