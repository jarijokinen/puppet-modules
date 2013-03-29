class logwatch inherits logwatch::params {
  package { "logwatch": 
    ensure => "installed"
  }
  file { "/etc/logwatch/conf/override.conf":
    ensure => "present",
    content => template("logwatch/override.conf.erb"),
    require => Package["logwatch"]
  }
}
