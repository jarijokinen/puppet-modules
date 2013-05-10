class build inherits build::params {
  package { "build-essential":
    ensure => installed
  }
}
