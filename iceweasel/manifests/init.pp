class iceweasel inherits iceweasel::params {
  package { "iceweasel":
    ensure  => installed,
    require => [
      File["/etc/apt/sources.list.d/iceweasel.list"],
      Package["pkg-mozilla-archive-keyring"]
    ],
    before  => Exec["apt-update"]
  }
  package { "pkg-mozilla-archive-keyring": 
    ensure => installed,
    notify => Exec["iceweasel-add-archive-key"],
    require => File["/etc/apt/sources.list.d/iceweasel.list"]
  }
  file { "/etc/apt/sources.list.d/iceweasel.list":
    ensure  => present,
    content => template("iceweasel/sources.list.erb"),
    notify  => Exec["apt-update"]
  }
  file { "/etc/iceweasel/pref/iceweasel.js":
    ensure  => present,
    content => template("iceweasel/pref.js.erb"),
    require => Package["iceweasel"]
  }
  exec { "iceweasel-add-archive-key":
    refreshonly => true,
    command     => "/usr/bin/gpg --check-sigs --fingerprint --keyring /etc/apt/trusted.gpg.d/pkg-mozilla-archive-keyring.gpg --keyring /usr/share/keyrings/debian-keyring.gpg pkg-mozilla-maintainers",
    returns     => ["0", "2"]
  }
}
