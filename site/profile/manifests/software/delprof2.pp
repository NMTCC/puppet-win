# Configure delprof2
class profile::software::delprof2 {

  #  This tool is called from a scheduled task
  #  to purge stale roaming profiles.

  scheduled_task { 'Remove old profiles':
    ensure    => present,
    enabled   => true,
    command   => 'C:\itc\bin\DelProf2.exe',
    arguments => '/q /d:1 /ed:admin* /ed:itc* /ed:act*',
    trigger   => {
      schedule   => 'daily',
      start_time => '00:45',
    },
  }

}
