define iptables::module($ensure = "present") {
  case $ensure {
    "present": {
      file { "/etc/iptables.d/$name":
        ensure  => present,
        mode    => "0600",
        content => template("iptables/iptables.d/$name"),
        notify  => Exec["/usr/local/sbin/iptables.sh"]
      }
    }
    "absent": {
      file { "/etc/iptables.d/$name":
        ensure => absent,
        notify => Exec["/usr/local/sbin/iptables.sh"]
      }
    }
  }
}
