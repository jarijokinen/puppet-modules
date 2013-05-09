class iptables inherits iptables::params {
  package { "iptables": 
    ensure => installed
  }
  file { "/etc/iptables.d":
    ensure  => directory,
    purge   => true,
    recurse => true,
    force   => true,
    mode    => "0700",
    notify  => Exec["/usr/local/sbin/iptables.sh"]
  }
  file { "/usr/local/sbin/iptables.sh":
    ensure  => present,
    mode    => "0700",
    content => template("iptables/iptables.sh.erb"),
    notify  => Exec["/usr/local/sbin/iptables.sh"]
  }
  exec { "/usr/local/sbin/iptables.sh":
    refreshonly => true,
    require     => File["/usr/local/sbin/iptables.sh"],
    notify      => Exec["iptables-save"]
  }
  exec { "iptables-save":
    refreshonly => true,
    command     => "/sbin/iptables-save > /etc/iptables.rules"
  }
  file { "/etc/iptables.rules":
    ensure => present,
    mode   => "0600"
  }
  file { "/etc/network/if-pre-up.d/iptables":
    ensure  => present,
    mode    => "0700",
    content => template("iptables/iptables-restore.sh.erb"),
    require => File["/usr/local/sbin/iptables.sh"]
  }
}
