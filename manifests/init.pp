class rvm($version='latest', $install_rvm=true) {
  if $install_rvm {
    class {
      'rvm::dependencies': stage => pre;
      'rvm::system': stage => pre, version => $version;
    }
    file { "/etc/gemrc":
      ensure => present,
      owner => root,
      group => root,
      mode => 664,
      source => "puppet:///modules/rvm/gemrc"
    }
    file { "/etc/rvmrc":
      ensure => present,
      owner => root,
      group => root,
      mode => 664,
      source => "puppet:///modules/rvm/rvmrc"
    }
  }
}