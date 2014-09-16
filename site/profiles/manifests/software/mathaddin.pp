# == Class profiles::software::mathaddin
#
#  Lists packages for chocolatey installation
class profiles::software::mathaddin {

  # Mathematics Add-In for Word and OneNote
  # Emily Anne Matthias <ematthia@nmt.edu>
  # Requested 9 Sept 2014
  # Some sort of packed MSI?
    package { 'Microsoft Mathematics Add-In for Word and OneNote':
    ensure          => installed,
    source          => '\\puppet-win.nmt.edu\winshare\packages\MathAddIn\edumathaddin.exe',
    install_options => ['/quiet','/passive'],
  }

}
