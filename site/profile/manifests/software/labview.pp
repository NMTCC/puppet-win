# Configure LavVIEW
class profile::software::labview {

  windows_env { 'NILM_LICENSE_FILE':
    ensure    => present,
    mergemode => clobber,
    value     => '27000@labviewlic.nmt.edu',
  }

}
