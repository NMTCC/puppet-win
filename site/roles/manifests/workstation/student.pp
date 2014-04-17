# Class roles::workstation::student

class roles::workstation::student {
  include profiles::tcc
  include profiles::registry
  include profiles::software
  include profiles::users
  include profiles::grouppolicy::machine
  include profiles::sysprep
  include profiles::drivers
}
