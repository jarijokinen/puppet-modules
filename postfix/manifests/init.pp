class postfix(
  $backend                   = $postfix::params::backend,
  $relayhost                 = $postfix::params::relayhost,
  $virtual_alias_domains     = $postfix::params::virtual_alias_domains,
  $virtual_alias_destination = $postfix::params::virtual_alias_destination
) inherits postfix::params {
  package { "postfix": 
    ensure => installed
  }
  service { "postfix":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Package["postfix"]
  }
  file { "/etc/postfix/main.cf":
    ensure  => "present",
    content => template("postfix/main.cf.erb"),
    require => Package["postfix"],
    notify  => Service["postfix"]
  }
  file { "/etc/postfix/master.cf":
    ensure  => present,
    content => template("postfix/master.cf.erb"),
    require => Package["postfix"],
    notify  => Service["postfix"]
  }
  exec { "postfix-postmap":
    refreshonly => true,
    command     => "/usr/sbin/postmap /etc/postfix/virtual"
  }
  case $backend {
    "local": {}
    "files": {
      file { "/etc/postfix/virtual":
        ensure  => present,
        content => template("postfix/virtual.erb"),
        mode    => "0640",
        require => Package["postfix"],
        notify  => Exec["postfix-postmap"]
      }
    }
    default: { fail("unknown postfix backend") }
  }
}
