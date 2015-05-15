# Class roles::workstation::template

class roles::workstation::template {
  include profiles::itc
  include profiles::registry
  include profiles::software
  #include profiles::users
  include profiles::grouppolicy::machine
  include profiles::sysprep
  include profiles::drivers
}
