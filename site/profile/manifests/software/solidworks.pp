# Configure SOLIDWORKS
class profile::software::solidworks {

  windows_env { 'SW_D_LICENSE_FILE':
    ensure    => present,
    mergemode => clobber,
    value     => '25734@labviewlic.nmt.edu',
  }

}
