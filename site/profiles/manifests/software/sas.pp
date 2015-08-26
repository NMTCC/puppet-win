class profiles::software::sas {

  $hour = generate("/usr/local/bin/winhour")

  case $hour {
    '00', '01', '02': {
      exec { 'SAS reinstall':
        command => '\\replicon.nmt.edu\samba\sas\SAS_9.4\setup.exe -quiet -responsefile \\replicon.nmt.edu\samba\sas\ResponseRecord.log',
        creates => 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\SAS\SAS 9.4 (English).lnk',
      }
    }
    default: { $dummy = [ 'Wrong time for SAS.', ] }
  }

}
