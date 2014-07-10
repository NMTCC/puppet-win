# Class  profiles::itc
#
#
# Core C:\ITC file structure
#
#
#

class profiles::itc {


  # Create directory structure
  file { [ 'c:\itc', 'c:\itc\driverstore', 'c:\itc\etc', 'c:\itc\bin', 'c:\itc\log', ]:
    ensure => 'directory',
  }

}
