class xfce4 inherits xfce4::params {
  package { "xfdesktop4": 
    ensure => installed
  }
}
