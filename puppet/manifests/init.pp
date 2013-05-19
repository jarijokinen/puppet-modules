class puppet inherits puppet::params {
  package { "puppet":
    ensure  => installed,
    require => File["/etc/apt/sources.list.d/puppetlabs.list"]
  }
  file { "/etc/apt/sources.list.d/puppetlabs.list":
    ensure  => present,
    content => template("puppet/sources.list.erb"),
    notify  => Exec["apt-update"]
  }
  file { "/etc/puppet/puppet.conf":
    ensure  => present,
    content => template("puppet/puppet.conf.erb"),
    require => Package["puppet"]
  }
  file { "/etc/puppet/hiera.yaml":
    ensure  => present,
    content => template("puppet/hiera.yaml.erb"),
    require => Package["puppet"]
  }
  file { "/etc/hiera.yaml":
    ensure  => link,
    target  => "/etc/puppet/hiera.yaml",
    require => Package["puppet"]
  }
}
