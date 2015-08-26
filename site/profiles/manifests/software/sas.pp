class profiles::software::sas {

  $hour = generate("/usr/local/bin/winhour")

  case $::hostname {
    /^WEIR209/: {
      case $hour {
        '00', '01', '02': {
          package { 'SAS 9.4':
            ensure          => installed,
            source          => '\\replicon.nmt.edu\samba\sas\SAS_9.4\setup.exe',
            install_options => [
              '-quiet',
              '-responsefile',
              '\\replicon.nmt.edu\samba\sas\ResponseRecord.log',
            ],
          }
        }
        default: { $time = [ 'Wrong time for SAS.', ] }
      }
    }
    default: { $dummy = [ 'Did not install SAS.', ] }
  }

}
