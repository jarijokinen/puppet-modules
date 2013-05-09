class ssh::client inherits ssh {
  package { "openssh-client": 
    ensure => installed
  }
}
