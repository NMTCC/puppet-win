#  license server update
class profiles::software::comsol {

  file { 'C:\Program Files\COMSOL\COMSOL44\license\license.dat':
    ensure => 'file',
    source => '\\puppet-win.nmt.edu\winshare\packages\COMSOL\license.dat',
  }

}
