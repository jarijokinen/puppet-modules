class timezone(
  $default_timezone = $timezone::params::default_timezone
) inherits timezone::params {
  package { "tzdata": 
    ensure => installed
  }
  file { "/etc/localtime":
    ensure  => link,
    target  => "/usr/share/zoneinfo/${default_timezone}",
    require => Package["tzdata"]
  }
  file { "/etc/timezone":
    ensure  => present,
    content => "${default_timezone}\n",
    require => Package["tzdata"]
  }
}
