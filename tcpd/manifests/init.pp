class tcpd(
  $hosts_allow = $tcpd::params::hosts_allow,
  $hosts_deny  = $tcpd::params::hosts_deny
) inherits tcpd::params {
  package { "tcpd": 
    ensure => installed
  }
  file { "/etc/hosts.allow":
    ensure  => present,
    content => template("tcpd/hosts.allow.erb")
  }
  file { "/etc/hosts.deny":
    ensure  => present,
    content => template("tcpd/hosts.deny.erb")
  }
}
