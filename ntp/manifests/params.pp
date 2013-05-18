class ntp::params {
  $servers = [
    "0.debian.pool.ntp.org",
    "1.debian.pool.ntp.org",
    "2.debian.pool.ntp.org",
    "3.debian.pool.ntp.org"
  ]

  case $::osfamily {
    "Debian": {
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily Debian")
    }
  }
}
