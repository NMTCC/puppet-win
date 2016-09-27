# == Class profiles::software::petromod
#
#  Lists packages for chocolatey installation
class profiles::software::labview {

  #LabVIEW License Configuration
  windows_env { 'NILM_LICENSE_FILE':
    ensure    => present,
    mergemode => clobber,
    value     => '27000@labviewlic.nmt.edu',
  }

}
