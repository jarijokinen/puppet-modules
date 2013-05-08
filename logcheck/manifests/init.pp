class logcheck inherits logcheck::params {
  package { "logcheck": 
    ensure => installed
  }
}
