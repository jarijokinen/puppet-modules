class spotify inherits spotify::params {
  package { "spotify-client":
    ensure  => installed,
    require => File["/etc/apt/sources.list.d/spotify.list"]
  }
  file { "/etc/apt/sources.list.d/spotify.list":
    ensure  => present,
    content => template("spotify/sources.list.erb"),
    notify  => Exec["apt-update"]
  }
}
