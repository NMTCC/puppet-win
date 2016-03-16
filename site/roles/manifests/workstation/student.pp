# Class roles::workstation::student

class includelist {

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

}

class roles::workstation::student {

  $hour = generate("/usr/local/bin/winhour")
  $min = generate("/usr/local/bin/winmin")

  case $hour {

    '03': {
      warning("Reboot gunshy.")
    }
    '02': {
      if $min > 45 {
        warning("Reboot gunshy.")
      }
      else {
        include includelist
      }
    }
    default: {
      include includelist
    }

  }

}
