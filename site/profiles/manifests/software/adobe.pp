class profiles::software::adobe {

  $hour = generate("/usr/local/bin/winhour")

  package { 'Adobe Acrobat XI Pro':
    ensure          => installed,
    source          => '\\replicon.nmt.edu\samba\adobe\AdobeAcrobatXI\Build\AdobeAcrobatXI.msi',
    install_options => ['/quiet'],
  }

  case $hour {
    '00', '01', '02': {
      $dummy = [ 'CC stuff will go here?', ]
    }
    default: { $dummy = [ 'Wrong time for Adobe.', ] }
  }

}
