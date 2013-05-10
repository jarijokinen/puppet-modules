class gimp inherits gimp::params {
  package { "gimp":
    ensure => installed
  }
}
