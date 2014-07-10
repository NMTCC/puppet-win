# == Class profiles::drivers
#
# Manages driver files
class profiles::drivers {

  $drivers = [  '\\puppet-win.nmt.edu\winshare\drivers\Realtek-win7-64\rt64win7.inf',
                '\\puppet-win.nmt.edu\\winshare\drivers\MAudioDelta-1224\MAudioDelta_x64.inf',
                '\\puppet-win.nmt.edu\winshare\drivers\HP-G3110\hpxpg311.inf',
                '\\puppet-win.nmt.edu\winshare\drivers\Arduino\arduino.inf',
                '\\puppet-win.nmt.edu\winshare\drivers\Intel-82579V\e1c62x64.inf',
                '\\puppet-win.nmt.edu\winshare\drivers\Intel-965\igdlh64.inf',
                '\\puppet-win.nmt.edu\winshare\drivers\Intel-Pro1000\e1d62x64.inf',
                '\\puppet-win.nmt.edu\winshare\drivers\nv_dispwu.inf_amd64_neutral_104ae97042f2a706\nv_dispwu.inf',
                '\\puppet-win.nmt.edu\winshare\drivers\nvhda.inf_amd64_neutral_6fca61a1d3e2d202\nvhda.inf',
                '\\puppet-win.nmt.edu\winshare\drivers\nvstusb.inf_amd64_neutral_bf149df106f49b54\nvstusb.inf',
  ]

  $certs = [ '\\puppet-win.nmt.edu\winshare\drivers\Arduino\arduino.cat'
  ]


# Install driver inf listing file
  file { 'c:\itc\etc\drivers.ini':
    ensure   => 'file',
    content  => template('profiles/drivers/drivers.ini.erb')
  }

# Install cert listing file
  file { 'c:\itc\etc\certs.ini':
    ensure   => 'file',
    content  => template('profiles/drivers/certs.ini.erb')
  }

  file { 'c:\itc\bin\add_drivers.ps1':
    ensure => 'file',
    source => 'puppet:///modules/profiles/drivers/add_drivers.ps1',
  }

}
