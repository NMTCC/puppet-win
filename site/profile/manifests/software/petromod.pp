# Configure PetroMod
class profile::software::petromod {

  windows_env { 'SLBSLS_LICENSE_FILE':
    ensure    => present,
    mergemode => clobber,
    value     => '27000@petrolic.nmt.edu',
  }

}
