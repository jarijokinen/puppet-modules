class ssh::server inherits ssh {
  package { "openssh-server": 
    ensure => installed
  }
  service { "ssh":
    ensure => running,
    enable => true
  }
  file { "/etc/ssh/sshd_config":
    ensure  => present,
    mode    => "0600",
    content => template("ssh/sshd_config.erb"),
    notify  => Service["ssh"]
  }
}
