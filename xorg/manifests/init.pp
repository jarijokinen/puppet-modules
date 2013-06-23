class xorg inherits xorg::params {
  package { "xserver-xorg": 
    ensure => installed
  }
  package { "xfonts-terminus": 
    ensure => installed
  }
  package { "ttf-mscorefonts-installer": 
    ensure => installed
  }
  exec { "xorg-intel-driver-install":
    unless  => '/usr/bin/apt-cache policy xserver-xorg-video-intel | /bin/grep "2.20"',
    command => "/usr/local/sbin/install_intel_driver.sh",
    require => File["/usr/local/sbin/install_intel_driver.sh"]
  }
  file { "/usr/local/sbin/install_intel_driver.sh":
    ensure  => present,
    mode    => "0700",
    content => template("xorg/install_intel_driver.sh")
  }
}
