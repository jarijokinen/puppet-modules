class debian {
  file { "/etc/rc.local":
    ensure => "present",
    content => template("debian/rc.local.erb")
  }
}
