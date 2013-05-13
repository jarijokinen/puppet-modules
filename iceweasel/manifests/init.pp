class iceweasel inherits iceweasel::params {
  package { "iceweasel":
    ensure  => installed,
    require => File["/etc/apt/sources.list.d/iceweasel.list"],
    notify  => Exec["iceweasel-pax"]
  }
  package { "pkg-mozilla-archive-keyring": 
    ensure => installed,
    notify => Exec["iceweasel-add-archive-key"]
  }
  file { "/etc/apt/sources.list.d/iceweasel.list":
    ensure  => present,
    content => template("iceweasel/sources.list.erb"),
    require => Package["pkg-mozilla-archive-keyring"],
    notify  => Exec["apt-update"]
  }
  exec { "iceweasel-add-archive-key":
    refreshonly => true,
    command     => "/usr/bin/gpg --check-sigs --fingerprint --keyring /etc/apt/trusted.gpg.d/pkg-mozilla-archive-keyring.gpg --keyring /usr/share/keyrings/debian-keyring.gpg pkg-mozilla-maintainers"
  }
  exec { "iceweasel-pax":
    refreshonly => true,
    command     => "/sbin/paxctl -crm /usr/lib/iceweasel/iceweasel",
    onlyif      => "/usr/bin/test -f /sbin/paxctl"
  }
}
