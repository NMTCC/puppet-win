# Class profiles::printing

class profiles::printing {

  $domainadmin = hiera('domainadmin')

  file { 'c:\itc\etc\point_and_print.reg':
    ensure  => 'file',
    source  => 'puppet:///modules/profiles/printing/point_and_print.reg',
  }

  file { 'c:\itc\bin\AddPrintServerPrinters.ps1':
    ensure  => 'file',
    content => template('profiles/printing/AddPrintServerPrinters.ps1'),
    require => File['c:\itc\etc\point_and_print.reg'],
  }

  exec { 'fixprinters':
    command  => 'c:\itc\bin\AddPrintServerPrinters.ps1',
    provider => powershell,
    require  => File['c:\itc\bin\AddPrintServerPrinters.ps1'],
  }

  exec { 'printcleanup':
    command  => '$f="c:\itc\bin\AddPrintServerPrinters.ps1"; If (Test-Path $f){ del $f }',
    provider => powershell,
    require  => Exec['fixprinters'],
  }

}
