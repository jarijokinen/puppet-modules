class vim inherits vim::params {
  package { "vim-nox":
    ensure => installed
  }
}
