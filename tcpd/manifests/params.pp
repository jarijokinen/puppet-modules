class tcpd::params {
  $hosts_allow = [
    "127.0.0.1, ::1, localhost, ip6-localhost, ip6-loopback"
  ]
  $hosts_deny = [
    "ALL"
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
