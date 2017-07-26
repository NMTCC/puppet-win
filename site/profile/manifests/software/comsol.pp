# Configure COMSOL
class profile::software::comsol {

  file { 'C:\Program Files\COMSOL\COMSOL52a\Multiphysics\license\license.dat':
    ensure  => file,
    owner   => 'Administrators',
    group   => 'Users',
    mode    => '0644',
    content => "SERVER comsollic.nmt.edu ANY 27000\nUSE_SERVER",
  }

}
