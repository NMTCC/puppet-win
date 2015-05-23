# Class:: profiles::diskcleaner
#
# Manages registry entries
# of settings for Disk Cleaner

class profiles::diskcleaner {

  define dcregentry ($uint32t) {
    registry_value { "${title}":
      key     => "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\${title}",
      ensure  => present,
      require => Registry_value['VolumeCaches'],
    }
    registry_value { "${title}-stateflags":
      key     => "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\${title}",
      value   => "StateFlags",
      type    => dword,
      data    => $uint32t,
      require => Registry_value["${title}"],
    }
  }

  registry_value { 'VolumeCaches':
    key    => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches',
    ensure => present,
  }

  dcregentry { 'Active Setup Temp Folders': uint32t                    => 2, }
  dcregentry { 'Downloaded Program Files': uint32t                     => 0, }
  dcregentry { 'Internet Cache Files': uint32t                         => 2, }
  dcregentry { 'Memory Dump Files': uint32t                            => 2, }
  dcregentry { 'Old ChkDsk Files': uint32t                             => 2, }
  dcregentry { 'Previous Installations': uint32t                       => 2, }
  dcregentry { 'Recycle Bin': uint32t                                  => 2, }
  dcregentry { 'SAS Temporary Files': uint32t                          => 0, }
  dcregentry { 'Service Pack Cleanup': uint32t                         => 2, }
  dcregentry { 'Setup Log Files': uint32t                              => 2, }
  dcregentry { 'System error memory dump files': uint32t               => 2, }
  dcregentry { 'System error minidump files': uint32t                  => 2, }
  dcregentry { 'Temporary Files': uint32t                              => 2, }
  dcregentry { 'Temporary Setup Files': uint32t                        => 2, }
  dcregentry { 'Thumbnail Cache': uint32t                              => 0, }
  dcregentry { 'Update Cleanup': uint32t                               => 2, }
  dcregentry { 'Upgrade Discarded Files': uint32t                      => 2, }
  dcregentry { 'Windows Error Reporting Archive Files': uint32t        => 2, }
  dcregentry { 'Windows Error Reporting Queue Files': uint32t          => 0, }
  dcregentry { 'Windows Error Reporting System Archive Files': uint32t => 2, }
  dcregentry { 'Windows Error Reporting System Queue Files': uint32t   => 0, }
  dcregentry { 'Windows Upgrade Log Files': uint32t                    => 2, }

  scheduled_task { 'Disk Cleanup':
    ensure    => 'present',
    enabled   => true,
    command   => 'C:\Windows/System32/cleanmgr.exe',
    arguments => '/sagerun:1',
    trigger   => {
      schedule   => 'daily',
      start_time => '01:15',
    }
    require   => Registry_value['VolumeCaches'],
  }

}
