# Class  profiles::firewall
#
#
#

class profiles::firewall {

  #Keep Firewall Disabled
  exec { 'nofirewall':
    command  => "netsh advfirewall set allprofiles state off",
    provider => powershell,
  }

}
