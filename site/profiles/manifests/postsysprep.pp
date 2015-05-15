# Class profiles::sysprep
#
#
# Sysprep files that should be removed
#
#
#

class profiles::postsysprep {

  file { 'c:\itc\etc\unattend_sysprep.xml':
    ensure => 'absent',
    backup => 'false',
  }

}
