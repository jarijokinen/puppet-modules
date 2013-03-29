class rkhunter {
  package { "rkhunter": 
    ensure => "installed"
  }
  file { "/etc/rkhunter.conf.local":
    ensure => "present",
    content => template("rkhunter/conf.local.erb")
  }
}
