# Manage other registry entries
class profile::registry {

  # Values for NT4(Samba3) Domain Compatibility
  registry_value { 'HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\DomainCompatibilityMode':
    ensure => present,
    type   => dword,
    data   => 1,
  }
  registry_value { 'HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\DNSNameResolutionRequired':
    ensure => present,
    type   => dword,
    data   => 0,
  }

  # Disable "Allow all users to install updates on this computer"
  registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate':
    ensure => present,
  }
  registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\ElevateNonAdmins':
    ensure => present,
    type   => dword,
    data   => 0,
  }

  # Don't show last logged-on user -- Classic Logon Screen:
  registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\dontdisplaylastusername':
    ensure => present,
    type   => dword,
    data   => 1,
  }

  # Windows Backup DisableMonitoring
  registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsBackup\DisableMonitoring':
    ensure => present,
    type   => dword,
    data   => 1,
  }

  # Turn Autologon off
  registry_value { 'HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\AutoAdminLogon':
    ensure => present,
    type   => string,
    data   => '0',
  }

  # Disable shut down in start menu
  registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose':
    ensure => present,
    type   => dword,
    data   => 1,
  }

  # Set NTP to use our systems
  registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers\6':
    ensure => present,
    type   => string,
    data   => '129.138.60.60',
  } ->
  registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers\\':
    ensure => present,
    type   => string,
    data   => '6',
  }

  # Disable switch user
  registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\HideFastUserSwitching':
    ensure => present,
    type   => dword,
    data   => 1,
  }

  # fix rdp mode
  registry_value { 'HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\UserAuthentication':
    ensure => present,
    type   => dword,
    data   => 0,
  }

  # disable hibernate
  registry_value { 'HKLM\SYSTEM\CurrentControlSet\Control\Power\HibernateEnabled':
    ensure => present,
    type   => dword,
    data   => 0,
  }

  # network/profile options
  registry_value { 'HKLM\Software\Policies\Microsoft\Windows\System\WaitForNetwork':
    ensure => present,
    type   => dword,
    data   => 1,
  }
  registry_value { 'HKLM\Software\Policies\Microsoft\Windows\System\SlowLinkDetectEnabled':
    ensure => present,
    type   => dword,
    data   => 0,
  }
  registry_value { 'HKLM\Software\Policies\Microsoft\Windows\System\ProfileErrorAction':
    ensure => present,
    type   => dword,
    data   => 1,
  }
  registry_value { 'HKLM\Software\Policies\Microsoft\Windows\System\DeleteRoamingCache':
    ensure => present,
    type   => dword,
    data   => 1,
  }
  registry_value { 'HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\DeleteRoamingCache':
    ensure => present,
    type   => dword,
    data   => 1,
  }
  registry_value { 'HKLM\Software\Policies\Microsoft\Windows\System\CleanupProfiles':
    ensure => present,
    type   => dword,
    data   => 5,
  }

  # Point and Print Restrictions
  # Machine, Admin Templates, Printers
  registry_key { 'HKLM\Software\Policies\Microsoft\Windows NT\Printers':
    ensure => present,
  }
  registry_value { 'HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint\Restricted':
    ensure => present,
    type   => dword,
    data   => 1,
  }
  registry_value { 'HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint\TrustedServers':
    ensure => present,
    type   => dword,
    data   => 0,
  }
  registry_value { 'HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint\InForest':
    ensure => present,
    type   => dword,
    data   => 1,
  }
  registry_value { 'HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint\NoWarningNoElevationOnInstall':
    ensure => present,
    type   => dword,
    data   => 1,
  }
  registry_value { 'HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint\UpdatePromptSettings':
    ensure => present,
    type   => dword,
    data   => 2,
  }
  registry_value { 'HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint\ServerList':
    ensure => present,
    type   => string,
  }

  # Point and Print Restrictions
  # Wow version
  registry_key { 'HKLM\Software\Wow6432Node\Policies\Microsoft\Windows NT\Printers':
    ensure => present,
  }
  registry_value { 'HKLM\Software\Wow6432Node\Policies\Microsoft\Windows NT\Printers\PointAndPrint\Restricted':
    ensure => present,
    type   => dword,
    data   => 1,
  }
  registry_value { 'HKLM\Software\Wow6432Node\Policies\Microsoft\Windows NT\Printers\PointAndPrint\TrustedServers':
    ensure => present,
    type   => dword,
    data   => 0,
  }
  registry_value { 'HKLM\Software\Wow6432Node\Policies\Microsoft\Windows NT\Printers\PointAndPrint\InForest':
    ensure => present,
    type   => dword,
    data   => 1,
  }
  registry_value { 'HKLM\Software\Wow6432Node\Policies\Microsoft\Windows NT\Printers\PointAndPrint\NoWarningNoElevationOnInstall':
    ensure => present,
    type   => dword,
    data   => 1,
  }
  registry_value { 'HKLM\Software\Wow6432Node\Policies\Microsoft\Windows NT\Printers\PointAndPrint\UpdatePromptSettings':
    ensure => present,
    type   => dword,
    data   => 2,
  }
  registry_value { 'HKLM\Software\Wow6432Node\Policies\Microsoft\Windows NT\Printers\PointAndPrint\ServerList':
    ensure => present,
    type   => string,
  }

}
