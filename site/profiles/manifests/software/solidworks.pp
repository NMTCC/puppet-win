class profiles::software::solidworks {

  #SolidWorks License Configuration
  windows_env { 'SW_D_LICENSE_FILE':
    ensure    => present,
    mergemode => clobber,
    value     => '25734@labviewlic.nmt.edu',
  }

}
