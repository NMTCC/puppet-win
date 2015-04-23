# == Class profiles::software::delprof2
#
#  This tool is called from a scheduled task
#  to purge stale roaming profiles.
class profiles::software::delprof2 {

  file { 'delprof2exe':
    path   => 'C:\itc\DelProf2.exe':
    ensure => 'present',
    source => '\\puppet-win.nmt.edu\winshare\packages\Delprof2_1.6.0\DelProf2.exe',
  }

  scheduled_task { 'Remove old profiles':
    ensure    => 'present',
    enabled   => true,
    command   => 'C:\itc\DelProf2.exe',
    arguments => '/q /d:1 /ed:admin* /ed:itc* /ed:act*',
    trigger   => {
      schedule   => 'daily',
      start_time => '00:45',
    }
    require   => File['delprof2exe'],
  }

}
