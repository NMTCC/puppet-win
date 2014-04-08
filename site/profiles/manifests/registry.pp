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

  # Add tcc driver store
  #  registry_value { 'HKLM\Software\Microsoft\Windows\CurrentVersion\DevicePath':
  #   ensure => present,
  #  data   => '%systemroot%\inf;c:\tcc\driverstore'
  #}

  # Disable "Allow all users to install updates on this computer"
  registry_key { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate': ensure => present }
  registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\ElevateNonAdmins':
    ensure => present,
    data   => '0',
    type   => 'dword',
  }

  # Don't show last logged-on user -- Classic Logon Screen:
  registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\dontdisplaylastusername':
    ensure => present,
    data   => 1,
  }

  # Windows Backup DisableMonitoring
  registry_value { 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsBackup\DisableMonitoring':
    ensure => present,
    data   => 1,
    type   => dword,
  }

  # Turn Autologon off
  registry_value { 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\AutoAdminLogon':
    ensure => present,
    data   => 0,
  }



}
