# Class:: profiles::registry
#
# Manages registry entries
# that are not policy settings

class profiles::registry {


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
    data   => 'mailhost.nmt.edu',
  } ->
  registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers\(Default)':
    ensure => present,
    type   => string,
    data   => '6',
  }

}
