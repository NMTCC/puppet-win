# Class roles::workstation::template

class roles::workstation::template {
  include profiles::tcc
  include profiles::registry
  # include profiles::software
  #nclude profiles::users
  include profiles::grouppolicy::machine
  include profiles::sysprep
  include profiles::drivers
}
