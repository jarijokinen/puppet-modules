class grsecurity(
) inherits grsecurity::params {
  package { "paxctl": 
    ensure => installed
  }
}
