# Win7 workstation
class role::win7 {

  include profile::base
  include profile::diskcleaner
  include profile::firewall

}
