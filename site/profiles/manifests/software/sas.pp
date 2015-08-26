class profiles::software::sas {

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
