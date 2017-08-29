# Configure nightly reboot
class profile::nightlyreboot {

  file { 'C:\itc\bin\nightly_reboot.ps1':
    ensure  => file,
    owner   => 'Administrators',
    group   => 'Users',
    mode    => '0644',
    content =>
      "\$UserCount = query user | Measure-Object -line | Select -ExpandProperty 'Lines'\r\nif (\$UserCount -lt 2) { Restart-Computer }",
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
