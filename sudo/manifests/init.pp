class sudo inherits sudo::params {
  package { "sudo": 
    ensure => installed
  }
}
