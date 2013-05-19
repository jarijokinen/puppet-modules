class grub inherits grub::params {
  package { "grub-pc":
    ensure => installed
  }
  package { "grub-legacy":
    ensure => absent
  }
  package { "lilo":
    ensure => absent
  }
  file { "/etc/default/grub":
    ensure  => present,
    content => template("grub/default.erb"),
    notify  => Exec["update-grub"]
  }
  exec { "update-grub":
    refreshonly => true,
    command     => "/usr/sbin/update-grub"
  }
}
