# == Class profiles::software::petromod
#
#  Lists packages for chocolatey installation
class profiles::software::petromod {



  # Microsoft HPC Pack
  # ERTH 460 (Petroleum Geology)
  # Dr. Jolante Van Wijk  <jvanwijk@ees.nmt.edu>
  # Erik Weiss <eweiss@ees.nmt.edu>
  # Requested 17 Apr 2014
  # MSI
  package { 'Microsoft HPC Pack 2008 R2 MS-MPI Redistributable Pack':
    ensure          => installed,
    source          => '\\puppet-win.nmt.edu\winshare\packages\PetroMod\mpi_x64.msi',
    install_options => ['/quiet'],
  }


  # PetroMod
  # ERTH 460 (Petroleum Geology)
  # Dr. Jolante Van Wijk  <jvanwijk@ees.nmt.edu>
  # Erik Weiss <eweiss@ees.nmt.edu>
  # Requested 17 Apr 2014
  # InstallShield
    package { 'PetroMod 2013.2':
    ensure          => installed,
    source          => '\\puppet-win.nmt.edu\winshare\packages\PetroMod\PetroMod2013.2.exe',
    install_options => ['/S','/v/qn'],
  }

  #PetroMod License Configuration
  windows_env { 'SLBSLS_LICENSE_FILE':
    ensure    => present,
    mergemode => clobber,
    value     => '27000@petromod.nmt.edu',
  }

}
