class ntp inherits ntp::params {
  package { "ntp": 
    ensure => installed
  }
  service { "ntp":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package["ntp"]
  }
  file { "/etc/ntp.conf":
    ensure  => present,
    content => template("ntp/ntp.conf.erb"),
    notify  => Service["ntp"]
  }
  file { "/etc/default/ntp":
    ensure  => present,
    content => template("ntp/ntp.default.erb"),
    notify  => Service["ntp"]
  }
}
