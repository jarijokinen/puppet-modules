class xfce4 inherits xfce4::params {
  package { "xfce4": 
    ensure => installed
  }
  package { "xscreensaver": 
    ensure => purged
  }
}
