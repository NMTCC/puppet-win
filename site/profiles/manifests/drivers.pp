# == Class profiles::drivers
#
# Manages driver files
class profiles::drivers {

  $drivers = [  '\\puppet-win.nmt.edu\winshare\drivers\Realtek-win7-64\rt64win7.inf',
                '\\puppet-win.nmt.edu\\winshare\drivers\MAudioDelta-1224\MAudioDelta_x64.inf',
                '\\puppet-win.nmt.edu\winshare\drivers\HP-G3110\hpxpg311.inf',
                '\\puppet-win.nmt.edu\winshare\drivers\Arduino\arduino.inf',
                '\\puppet-win.nmt.edu\winshare\drivers\Intel-82579V\e1c62x64.inf',
  ]

  $certs = [ '\\puppet-win.nmt.edu\winshare\drivers\Arduino\arduino.cat'
  ]


# Install driver inf listing file
  file { 'c:\tcc\etc\drivers.ini':
    ensure   => 'file',
    content  => template('profiles/drivers/drivers.ini.erb')
  }

# Install cert listing file
  file { 'c:\tcc\etc\certs.ini':
    ensure   => 'file',
    content  => template('profiles/drivers/certs.ini.erb')
  }

  file { 'c:\tcc\bin\add_drivers.ps1':
    ensure => 'file',
    source => 'puppet:///modules/profiles/drivers/add_drivers.ps1',
  }

}
