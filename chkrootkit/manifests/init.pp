class chkrootkit inherits chkrootkit::params {
  package { "chkrootkit": 
    ensure => installed
  }
  file { "/etc/chkrootkit.conf":
    ensure  => present,
    content => template("chkrootkit/conf.erb"),
    require => Package["chkrootkit"]
  }
  file { "/etc/cron.daily/chkrootkit":
    ensure  => present,
    content => template("chkrootkit/cron.daily.erb"),
    require => Package["chkrootkit"],
    mode    => "0755"
  }
}
