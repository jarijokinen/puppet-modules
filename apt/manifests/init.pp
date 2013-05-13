class apt inherits apt::params {
  package { "apt": 
    ensure  => installed
  }
  package { "debian-keyring": 
    ensure => installed
  }
  file { "/etc/apt/sources.list":
    ensure  => present,
    content => template("apt/sources.list.erb")
  }
  exec { "apt-update":
    refreshonly => true,
    command     => "/usr/bin/apt-get update"
  }
}
