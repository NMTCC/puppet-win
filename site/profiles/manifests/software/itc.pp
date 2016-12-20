class profiles::software::itc {

  file { 'C:\itc\bin\DumpEDID.exe':
    ensure => 'file',
    source => '\\puppet-win.nmt.edu\winshare\packages\itc\DumpEDID.exe',
    owner  => 'Administrators',
    group  => 'Users',
    mode   => '0755',
  }

}
