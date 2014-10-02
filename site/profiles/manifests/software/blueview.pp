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
    source          => '\\puppet-win.nmt.edu\winshare\packages\BlueView\BlueView.msi',
    install_options => ['/qn'],
  }

  file { 'C:\Users\Public\Desktop\BlueView.lnk':
    ensure          => 'absent',
    force           => 'true',
  }

}
