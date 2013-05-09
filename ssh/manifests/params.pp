class ssh::params {
  case $::osfamily {
    "Debian": {
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily Debian")
    }
  }
}
