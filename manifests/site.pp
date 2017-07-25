File { backup => false, }

node default {

  case $::puppetversion {
    '3.8.7': {
      include roles::workstation::student
      include grouppolicy
    }
    '4.10.4': {
      include role::win7
    }
    default: {
      warning('No role for this Puppet Agent version.')
    }
  }

}
