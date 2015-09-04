# Class roles::workstation::student

class roles::workstation::student {
  include profiles::itc
  include profiles::registry
  include profiles::software
  include profiles::users
  include profiles::motd
  include profiles::firewall
  include profiles::grouppolicy::machine
  include profiles::postsysprep
  include profiles::drivers
  include profiles::diskcleaner
  include profiles::printing

  #Class[printers] -> Class[profiles::printing]
}
