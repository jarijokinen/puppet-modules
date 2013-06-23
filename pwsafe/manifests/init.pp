class pwsafe inherits pwsafe::params {
  exec { "pwsafe-install":
    creates => "/usr/bin/pwsafe",
    command => "/usr/local/sbin/install_pwsafe.sh",
    require => File["/usr/local/sbin/install_pwsafe.sh"]
  }
  file { "/usr/local/sbin/install_pwsafe.sh":
    ensure  => present,
    mode    => "0700",
    content => template("pwsafe/install_pwsafe.sh")
  }
}
