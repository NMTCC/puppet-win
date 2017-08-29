# Win7 workstation
class role::win7 {

  include profile::base
  include profile::diskcleaner
  include profile::firewall
  include profile::nightlyreboot
  include profile::registry
  include profile::software
  include profile::users

}
