# Configure COMSOL
class profile::software::comsol {

  file { 'C:\Program Files\COMSOL\COMSOL53\Multiphysics\license\license.dat':
    ensure  => file,
    owner   => 'Administrators',
    group   => 'Users',
    mode    => '0644',
    content => "SERVER comsollic.nmt.edu ANY 27001\nUSE_SERVER",
  }

}
