class locales(
  $generated_locales = $locales::params::generated_locales,
  $default_locale    = $locales::params::default_locale
) inherits locales::params {
  package { "locales": 
    ensure => installed
  }
  file { "/etc/locale.gen":
    ensure  => present,
    content => template("locales/locale.gen.erb"),
    require => Package["locales"],
    notify  => [ Exec["locales-generate"], Exec["locales-update"] ]
  }
  file { "/etc/default/locale":
    ensure  => present,
    content => template("locales/locale.default.erb"),
    require => Package["locales"],
    notify  => [ Exec["locales-generate"], Exec["locales-update"] ]
  }
  exec { "locales-generate":
    refreshonly => true,
    command     => "/usr/sbin/locale-gen"
  }
  exec { "locales-update":
    refreshonly => true,
    command     => "/usr/sbin/update-locale"
  }
}
