# == Class profiles::software::blueview
#
#  Lists packages for chocolatey installation
class profiles::software::blueview {

  file { 'C:\Users\Public\Desktop\BlueView.lnk':
    ensure          => 'absent',
    force           => 'true',
  }

}
