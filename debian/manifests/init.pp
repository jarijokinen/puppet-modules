class debian {
  package { "bsd-mailx": 
    ensure => "installed"
  }
  file { "/etc/rc.local":
    ensure => "present",
    content => template("debian/rc.local.erb"),
    mode => "0700"
  }
}
