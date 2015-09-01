class profiles::software::adobe {

  $hour = generate("/usr/local/bin/winhour")

  case $hour {
    '00', '01', '02': {

        package { 'Adobe Acrobat XI Pro':
          ensure          => installed,
          source          => '\\replicon.nmt.edu\samba\adobe\AdobeAcrobatXI\Build\AdobeAcrobatXI.msi',
          install_options => ['/quiet'],
        }

    }
    default: { $dummy = [ 'Wrong time for Adobe.', ] }
  }

}
