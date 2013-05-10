class msmtp inherits msmtp::params {
  package { "msmtp":
    ensure => installed
  }
}
