# Class profiles::motd
#
#
# Files needed to show motd
#
#
#

class profiles::motd {


  file { 'c:\windows\system\motdpath.ini':
    ensure  => 'file',
    content => '\\userhost.nmt.edu\tcc\motd.txt';
  }

}
