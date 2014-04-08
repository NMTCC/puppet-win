# Class  profiles::tcc
#
#
# Core C:\TCC file structure
#
#
#

class profiles::tcc {


  # Create directory structure
  file { [ 'c:\tcc', 'c:\tcc\driverstore', 'c:\tcc\etc', 'c:\tcc\bin', 'c:\tcc\log', ]:
    ensure => 'directory',
  }

}
