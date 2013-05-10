class postfix::params {
  # Backend options: local, files, mysql (not implemented yet)
  $backend = "local"
  
  # Relayhost
  # Supported backends: local
  $relayhost = ""

  # Virtual alias domains separated by commas
  # Supported backends: files
  $virtual_alias_domains = ""
  
  # Where to redirect all mail sent to virtual alias domains
  # Supported backends: files
  $virtual_alias_destination = "root@localhost"
  
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
