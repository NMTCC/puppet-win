# Class profiles::queues
#
# Manages registry print queues

class profiles::queues {

  $printers = [
    'cramer114',
    'fidel130',
    'library122',
    'library208',
    'library22',
    'south218',
    'speare112',
    'speare116',
    'speare117',
    'speare23a',
    'speare4a',
    'speare5',
    'torres130',
    'weir128',
    'weir209'
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
      command => "reg add c:\\itc\\etc\\${title}.reg",
      unless  => "reg query HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Printers\\${title}",
      require => File["C:/itc/etc/${title}.reg"],
    }
  }

  queuedotreg { $printers : }

}
