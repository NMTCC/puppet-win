#  license server update
class profiles::software::comsol {

  file { 'C:\Program Files\COMSOL\COMSOL51\Multiphysics\license\license.dat':
    ensure => 'file',
    source => '\\puppet-win.nmt.edu\winshare\packages\COMSOL\license.dat',
    owner  => 'Administrators',
    group  => 'Administrator',
    mode   => '0644',
  }

}
