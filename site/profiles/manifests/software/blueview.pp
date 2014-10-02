# == Class profiles::software::blueview
#
#  Lists packages for chocolatey installation
class profiles::software::blueview {

  # BlueView
  # Benjamin F McNeill <bmcneill@nmt.edu>
  # Requested 11 Sept 2014
  # InstallShield
    package { 'BlueView':
    ensure          => installed,
    source          => '\\puppet-win.nmt.edu\winshare\packages\BlueView\BlueView1064_setup.exe',
    install_options => ['/S','/v"/qn ALLUSERS=1"'],
  }

  file { 'C:\Users\Public\Desktop\BlueView.lnk':
    ensure          => 'absent',
    force           => 'true',
  }

}
