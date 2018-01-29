# Configure Chocolatey packages
class profile::software::chocolatey {

  #TODO: sources look at doing this with config for self service option
  ChocolateySource {tcc:
    ensure => present,
    location => 'https://cocoa-host.nmt.edu/chocolatey',
    priority => 1
  }
  #TODO: configure features

  #package section
  $pkglist = heira('installlist')
  $updatelist = heira('updatelist')
  $uninstalllist = heira('uninstalllist')

  package { $uninstalllist: ensure => absent }
  package { $updatelist:  ensure    => latest,    provider => 'chocolatey', }
  package { $pkglist:     ensure    => installed, provider => 'chocolatey', }

  #TODO: Test that new method works for this
  #package { 'Inkscape 0.91': ensure =>  absent }
  #package { 'Inkscape 0.92.1': ensure =>  absent }
  #Package['Inkscape 0.91'] -> Package['Inkscape 0.92.1'] -> Package['inkscape']

}
