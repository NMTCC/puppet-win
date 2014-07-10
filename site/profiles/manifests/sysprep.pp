# Class profiles::sysprep
#
#
# Files needed for generization and specialization
#
#
#

class profiles::sysprep {

  $domainhash = hiera('domainhash')
  $adminhash  = hiera('adminhash')
  $adminhash2 = hiera('adminhash2')

  file { 'c:\itc\bin\do_sysprep.ps1':
    ensure => 'file',
    source => 'puppet:///modules/profiles/sysprep/do_sysprep.ps1',
  }

  #Add generalization files
  file { 'c:\itc\etc\unattend_sysprep.xml':
    ensure    => 'file',
    content   => template('profiles/sysprep/unattend_sysprep.xml.erb')
  }

  #Add Specialization files
  file { 'c:\itc\bin\1_join_domain.ps1':
    ensure     => 'file',
    content    => template('profiles/sysprep/1_join_domain.ps1.erb'),
  }

}
