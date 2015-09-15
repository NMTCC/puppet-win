# Class:: profiles::grouppolicy::machine
#
# Manages the registry entries that
# local grouppolicy machine/registry.pol
# would hold


class profiles::grouppolicy::machine {

  registry::value { 'WaitForNetwork':
    key   => 'HKLM\Software\Policies\Microsoft\Windows\System',
    value => 'WaitForNetwork',
    type  => dword,
    data  => 1,
  }

  registry::value { 'SlowLinkDetectEnabled':
    key    => 'HKLM\Software\Policies\Microsoft\Windows\System',
    value  => 'SlowLinkDetectEnabled',
    type   => dword,
    data   => 0,
  }

  registry::value { 'ProfileErrorAction':
    key   => 'HKLM\Software\Policies\Microsoft\Windows\System',
    value => 'ProfileErrorAction',
    type  => dword,
    data  => 1,
  }

  registry::value { 'DeleteRoamingCache':
    key    => 'HKLM\Software\Policies\Microsoft\Windows\System',
    value  => 'DeleteRoamingCache',
    type   => dword,
    data   => 1,
  }

  registry::value { 'OtherDeleteRoamingCache':
    key    => 'HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon',
    value  => 'DeleteRoamingCache',
    type   => dword,
    data   => 1,
  }

  registry::value { 'CleanupProfiles':
    key   => 'HKLM\Software\Policies\Microsoft\Windows\System',
    value => 'CleanupProfiles',
    type  => dword,
    data  => 5,
  }


  # Point and Print Restrictions
  # Machine, Admin Templates, Printers
  registry_key { 'HKLM\Software\Policies\Microsoft\Windows NT\Printers':
    ensure => present,
  }
  registry::value { 'PointAndPrintRestricted':
    key   => 'HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint',
    value => 'Restricted',
    type  => dword,
    data  => 1,
  }
  registry::value { 'PointAndPrintTrustedServers':
    key   => 'HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint',
    value => 'TrustedServers',
    type  => dword,
    data  => 0,
  }
  registry::value { 'PointAndPrintInForest':
    key   => 'HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint',
    value => 'InForest',
    type  => dword,
    data  => 1,
  }
  registry::value { 'PointAndPrintNoWarningNoElevationOnInstall':
    key   => 'HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint',
    value => 'NoWarningNoElevationOnInstall',
    type  => dword,
    data  => 1,
  }
  registry::value { 'PointAndPrintUpdatePromptSettings':
    key   => 'HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint',
    value => 'UpdatePromptSettings',
    type  => dword,
    data  => 2,
  }
  registry::value { 'PointAndPrintServerList':
    key    => 'HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint',
    value  => 'ServerList',
    type   => string,
  }
  # Wow version
  registry_key { 'HKLM\Software\Wow6432Node\Policies\Microsoft\Windows NT\Printers':
    ensure => present,
  }
  registry::value { 'WowPointAndPrintRestricted':
    key   => 'HKLM\Software\Wow6432Node\Policies\Microsoft\Windows NT\Printers\PointAndPrint',
    value => 'Restricted',
    type  => dword,
    data  => 1,
  }
  registry::value { 'WowPointAndPrintTrustedServers':
    key   => 'HKLM\Software\Wow6432Node\Policies\Microsoft\Windows NT\Printers\PointAndPrint',
    value => 'TrustedServers',
    type  => dword,
    data  => 0,
  }
  registry::value { 'WowPointAndPrintInForest':
    key   => 'HKLM\Software\Wow6432Node\Policies\Microsoft\Windows NT\Printers\PointAndPrint',
    value => 'InForest',
    type  => dword,
    data  => 1,
  }
  registry::value { 'WowPointAndPrintNoWarningNoElevationOnInstall':
    key   => 'HKLM\Software\Wow6432Node\Policies\Microsoft\Windows NT\Printers\PointAndPrint',
    value => 'NoWarningNoElevationOnInstall',
    type  => dword,
    data  => 1,
  }
  registry::value { 'WowPointAndPrintUpdatePromptSettings':
    key   => 'HKLM\Software\Wow6432Node\Policies\Microsoft\Windows NT\Printers\PointAndPrint',
    value => 'UpdatePromptSettings',
    type  => dword,
    data  => 2,
  }
  registry::value { 'WowPointAndPrintServerList':
    key    => 'HKLM\Software\Wow6432Node\Policies\Microsoft\Windows NT\Printers\PointAndPrint',
    value  => 'ServerList',
    type   => string,
  }

}
