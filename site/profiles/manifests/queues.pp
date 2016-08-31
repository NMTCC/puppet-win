# Class profiles::queues
#
# Manages registry print queues

class profiles::queues {

  $printers = [
    'cramer114',
    'fidel130',
    'fidel130-color',
    'library122',
    'library208',
    'library208-color',
    'library22',
    'presidents113',
    'south218',
    'speare112',
    'speare116',
    'speare117',
    'speare23a',
    'speare23-color',
    'speare4a',
    'speare5',
    'speare5-color',
    'torres130',
    'weir128',
    'weir209',
    'west219'
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

  queuedotreg { $printers : }

}
