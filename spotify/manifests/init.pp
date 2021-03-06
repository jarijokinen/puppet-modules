class spotify inherits spotify::params {
  package { "spotify-client":
    ensure  => installed,
    require => File["/etc/apt/sources.list.d/spotify.list"],
    before  => [
      Exec["spotify-add-key"],
      Exec["apt-update"]
    ]
  }
  file { "/etc/apt/sources.list.d/spotify.list":
    ensure  => present,
    content => template("spotify/sources.list.erb"),
    notify  => [
      Exec["apt-update"], 
      Exec["spotify-add-key"]
    ]
  }
  exec { "spotify-add-key":
    command     => "/usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59",
    refreshonly => true
  }
}
