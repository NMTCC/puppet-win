# Configure basic stuff
class profile::base {

  file { 'C:\itc',
    ensure => directory,
  }

  file { [ 'C:\itc\bin', 'C:\itc\etc', 'C:\itc\log', ]:
    ensure  => directory,
    require => File['C:\itc'],
  }

  file { 'C:\itc\etc\unattend_sysprep.xml':
    ensure  => absent,
    backup  => false,
    require => File['C:\itc\etc'],
  }

}
