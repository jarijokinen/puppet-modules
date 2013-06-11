class fail2ban(
  $jails = $fail2ban::params::jails
) inherits fail2ban::params {
  package { "fail2ban": 
    ensure => installed
  }
  service { "fail2ban":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package["fail2ban"]
  }
  file { "/etc/fail2ban/jail.local":
    ensure  => present,
    content => template("fail2ban/jail.local.erb"),
    notify  => Service["fail2ban"],
    require => Package["fail2ban"]
  }
  file { "/etc/fail2ban/filter.d/fail2ban.conf":
    ensure  => present,
    content => template("fail2ban/filter.d/fail2ban.conf.erb"),
    notify  => Service["fail2ban"],
    require => Package["fail2ban"]
  }
}
