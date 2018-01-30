# Configure Chocolatey packages
class profile::software::chocolatey {

  #TODO: sources look at doing this with config for self service option
  ChocolateySource {'tcc': ensure => present, location => 'https://cocoa-host.nmt.edu/chocolatey', priority => 1 }
  #TODO: configure features
  ChocolateyFeature { 'allowGlobalConfirmation' : ensure = enabled }
  #package section
  $pkglist = hiera('installlist')
  $updatelist = hiera('updatelist')
  #$uninstalllist = hiera('uninstalllist')

  #package { $uninstalllist: ensure => absent,     provider => 'chocolatey', }
  package { $updatelist:  ensure    => latest,    provider => 'chocolatey', }
  package { $pkglist:     ensure    => installed, provider => 'chocolatey', }

  #TODO: fix on new domain
  package { 'Inkscape 0.91': ensure =>  absent }
  package { 'Inkscape 0.92.1': ensure =>  absent }
  Package['Inkscape 0.91'] -> Package['Inkscape 0.92.1'] -> Package['inkscape']

}
