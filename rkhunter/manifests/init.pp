class rkhunter inherits rkhunter::params {
  package { "rkhunter": 
    ensure => installed
  }
  file { "/etc/rkhunter.conf.local":
    ensure  => present,
    content => template("rkhunter/conf.local.erb")
  }
}
