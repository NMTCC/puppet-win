# Configure Disk Cleaner
class profile::diskcleaner {

  Registry_key {
    ensure => present,
  }

  Registry_value {
    ensure => present,
    type => dword,
  }

  $vckey = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches'

  registry_key { $vckey: }

  registry_key { "${vckey}\\Active Setup Temp Folders":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Active Setup Temp Folders\\StateFlags":
    data => 2,
  }

  registry_key { "${vckey}\\Downloaded Program Files":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Downloaded Program Files\\StateFlags":
    data => 0,
  }

  registry_key { "${vckey}\\Internet Cache Files":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Internet Cache Files\\StateFlags":
    data => 2,
  }

  registry_key { "${vckey}\\Memory Dump Files":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Memory Dump Files\\StateFlags":
    data => 2,
  }

  registry_key { "${vckey}\\Old ChkDsk Files":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Old ChkDsk Files\\StateFlags":
    data => 2,
  }

  registry_key { "${vckey}\\Previous Installations":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Previous Installations\\StateFlags":
    data => 2,
  }

  registry_key { "${vckey}\\Recycle Bin":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Recycle Bin\\StateFlags":
    data => 2,
  }

  registry_key { "${vckey}\\SAS Temporary Files":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\SAS Temporary Files\\StateFlags":
    data => 0,
  }

  registry_key { "${vckey}\\Service Pack Cleanup":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Service Pack Cleanup\\StateFlags":
    data => 2,
  }

  registry_key { "${vckey}\\Setup Log Files":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Setup Log Files\\StateFlags":
    data => 2,
  }

  registry_key { "${vckey}\\System error memory dump files":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\System error memory dump files\\StateFlags":
    data => 2,
  }

  registry_key { "${vckey}\\System error minidump files":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\System error minidump files\\StateFlags":
    data => 2,
  }

  registry_key { "${vckey}\\Temporary Files":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Temporary Files\\StateFlags":
    data => 2,
  }

  registry_key { "${vckey}\\Temporary Setup Files":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Temporary Setup Files\\StateFlags":
    data => 2,
  }

  registry_key { "${vckey}\\Thumbnail Cache":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Thumbnail Cache\\StateFlags":
    data => 0,
  }

  registry_key { "${vckey}\\Update Cleanup":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Update Cleanup\\StateFlags":
    data => 2,
  }

  registry_key { "${vckey}\\Upgrade Discarded Files":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Upgrade Discarded Files\\StateFlags":
    data => 2,
  }

  registry_key { "${vckey}\\Windows Error Reporting Archive Files":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Windows Error Reporting Archive Files\\StateFlags":
    data => 2,
  }

  registry_key { "${vckey}\\Windows Error Reporting Queue Files":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Windows Error Reporting Queue Files\\StateFlags":
    data => 0,
  }

  registry_key { "${vckey}\\Windows Error Reporting System Archive Files":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Windows Error Reporting System Archive Files\\StateFlags":
    data => 2,
  }

  registry_key { "${vckey}\\Windows Error Reporting System Queue Files":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Windows Error Reporting System Queue Files\\StateFlags":
    data => 0,
  }

  registry_key { "${vckey}\\Windows Upgrade Log Files":
    require => Registry_key[$vckey],
  } ->
  registry_value { "${vckey}\\Windows Upgrade Log Files\\StateFlags":
    data => 2,
  }

  scheduled_task { 'Disk Cleanup':
    ensure    => present,
    enabled   => true,
    command   => 'C:\Windows\System32\cleanmgr.exe',
    arguments => '/sagerun:1',
    trigger   => {
      schedule   => 'daily',
      start_time => '01:15',
    },
    require   => Registry_key[$vckey],
  }

}
