class kernel::development inherits kernel {
  package { "kernel-package":
    ensure => installed
  }
  package { "libncurses5-dev": 
    ensure => installed
  }
  package { "gcc-4.7-plugin-dev": 
    ensure => installed
  }
}
