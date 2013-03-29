class chkrootkit {
  package { "chkrootkit": 
    ensure => "installed"
  }
  file { "/etc/chkrootkit.conf":
    ensure => "present",
    content => template("chkrootkit/conf.erb")
  }
}
