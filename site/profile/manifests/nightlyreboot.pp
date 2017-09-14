# Configure nightly reboot
class profile::nightlyreboot {

  file { 'C:\itc\bin\nightly_reboot.ps1':
    ensure  => file,
    owner   => 'Administrators',
    group   => 'Users',
    mode    => '0644',
    content =>
      "\$ProcessNames = @(Get-Process | Select -ExpandProperty 'ProcessName')\r\nif (\$ProcessNames.Contains('LogonUI')) { Restart-Computer }",
  }

  scheduled_task { 'Nightly Reboot':
    ensure    => present,
    enabled   => true,
    command   => 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe',
    arguments => 'C:\itc\bin\nightly_reboot.ps1',
    trigger   => {
      schedule   => 'daily',
      start_time => '03:00',
    },
    require   => File['C:\itc\bin\nightly_reboot.ps1'],
  }

}
