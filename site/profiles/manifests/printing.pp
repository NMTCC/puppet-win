# Class profiles::printing

class profiles::printing {

  $domainadmin = hiera('domainadmin')

  file { 'c:\itc\bin\AddPrintServerPrinters.ps1':
    ensure  => 'file',
    content => template('profiles/printing/AddPrintServerPrinters.ps1'),
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
