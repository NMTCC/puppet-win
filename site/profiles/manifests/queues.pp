# Class profiles::queues
#
# Manages registry print queues

class profiles::queues {

  $printers = [
    'cramer114',
    'goldw101',
    'goldw145',
    'library208',
    'library22',
    'presidents113',
    'south218',
    'speare112',
    'speare23a',
    'speare23-color',
    'speare4a',
    'speare5',
    'torres130',
    'weir128',
    'weir209',
    'west219'
  ]

  $oldprinters = [
    'fidel130',
    'fidel130-color',
    'goldw145-color',
    'library122',
    'library208-color'
  ]

  define queuedotreg {
    file { "C:/itc/etc/${title}.reg":
      ensure => 'file',
      source => "//puppet-win.nmt.edu/winshare/registry/${title}.reg",
      owner  => 'Administrators',
      group  => 'Users',
      mode   => '0644',
    }
    exec { "regadd-${title}":
      command     => "reg import c:\\itc\\etc\\${title}.reg",
      provider    => powershell,
      subscribe   => File["C:/itc/etc/${title}.reg"],
      refreshonly => true,
    }
  }

  define dequeuedotreg {
    file { "C:/itc/etc/${title}.reg":
      ensure => 'absent',
    }
    file { "C:/itc/etc/${title}-rem.reg":
      ensure  => 'file',
      source  => "//puppet-win.nmt.edu/winshare/registry/${title}-rem.reg",
      owner   => 'Administrators',
      group   => 'Users',
      mode    => '0644',
      require => File["C:/itc/etc/${title}.reg"],
    }
    exec { "regdel-${title}":
      command     => "reg import c:\\itc\\etc\\${title}-rem.reg",
      provider    => powershell,
      subscribe   => File["C:/itc/etc/${title}-rem.reg"],
      refreshonly => true,
    }
  }

  queuedotreg { $printers : }
  dequeuedotreg { $oldprinters : }

  file { 'C:/itc/etc/driver.printerExport':
    ensure => 'file',
    source => '//puppet-win.nmt.edu/winshare/registry/driver.printerExport',
    owner  => 'Administrators',
    group  => 'Users',
    mode   => '0644',
  }

  exec { 'phaser-6700-install':
    command  => 'C:\Windows\system32\spool\tools\PrintBrm.exe -r -f C:\itc\etc\driver.printerExport',
    provider => powershell,
    creates  => 'C:/Windows/system32/spool/DRIVERS/x64/3/xDHAYPGR.p3p',
    require  => File['C:/itc/etc/driver.printerExport'],
  }

  file { 'C:/itc/etc/que.printerExport':
    ensure => 'file',
    source => '//puppet-win.nmt.edu/winshare/registry/que.printerExport',
    owner  => 'Administrators',
    group  => 'Users',
    mode   => '0644',
  }

  exec { 'phaser-queues':
    command  => 'C:\Windows\system32\spool\tools\PrintBrm.exe -r -f C:\itc\etc\que.printerExport',
    provider => powershell,
    unless   => 'Get-WmiObject Win32_Printer | Select-String goldw145-color',
    require  => File['C:/itc/etc/que.printerExport'],
  }

}
