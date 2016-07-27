#  license server update
class profiles::software::comsol {

  file { 'C:\Program Files\COMSOL\COMSOL52a\Multiphysics\license\license.dat':
    ensure => 'file',
    source => '\\puppet-win.nmt.edu\winshare\packages\COMSOL\license.dat',
    owner  => 'Administrators',
    group  => 'Users',
    mode   => '0644',
  }

}
