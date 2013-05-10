class locales::params {
  $generated_locales = [
    "en_US ISO-8859-1",
    "en_US.ISO-8859-15 ISO-8859-15",
    "en_US.UTF-8 UTF-8",
    "fi_FI ISO-8859-1",
    "fi_FI.UTF-8 UTF-8",
    "fi_FI@euro ISO-8859-15"
  ]
  $default_locale = "en_US.UTF-8"

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
