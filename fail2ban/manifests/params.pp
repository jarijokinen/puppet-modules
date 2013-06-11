class fail2ban::params {
  $jails = [
    "ssh", 
    "apache-noscript", 
    "apache-overflows", 
    "postfix", 
    "sasl", 
    "dovecot", 
    "fail2ban"
  ]

  case $::osfamily {
    "Debian": {
      case $::lsbdistcodename {
        "wheezy": {
        }
        default: { fail("unsupported release ${::lsbdistcodename}") }
      }
    }
    default: { fail("unsupported platform ${::osfamily}") }
  }
}
