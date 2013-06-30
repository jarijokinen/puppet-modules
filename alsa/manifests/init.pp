class alsa inherits alsa::params {
  package { "alsa-base":
    ensure => installed
  }
  package { "alsa-utils":
    ensure => installed
  }
  package { "libasound2-plugin-equal":
    ensure => installed
  }
}
