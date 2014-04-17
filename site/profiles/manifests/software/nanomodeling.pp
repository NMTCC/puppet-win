# == Class profiles::software::nanomodeling
#
#  Lists packages for chocolatey installation
class profiles::software::nanomodeling {

  # VMD
  # Nanomodeling CH E 489
  # Dr. Pabitra Choudhury <pchoudhu@nmt.edu>
  # Requested 15 Jan 2014
  # MSI
  package { 'VMD 1.9.1':
    ensure          => installed,
    source          => '\\puppet-win.nmt.edu\winshare\packages\VMD\vmd191win32.msi',
    install_options => ['/quiet'],
  }

  # Avogadro
  # Nanomodeling CH E 489
  # Dr. Pabitra Choudhury <pchoudhu@nmt.edu>
  # Requested 15 Jan 2014
  # NullSoft Scriptable Istall System
  package { 'Avogadro':
    ensure          => installed,
    source          => '\\puppet-win.nmt.edu\winshare\packages\Avogadro\Avogadro-1.1.1-win32.exe',
    install_options => ['/S'],
  }

  # wincnt / Nanotube Modeler
  # Nanomodeling CH E 489
  # Dr. Pabitra Choudhury <pchoudhu@nmt.edu>
  # Requested 15 Jan 2014
  # InstallShield
  package { 'WinCNT':
    ensure          => installed,
    source          => '\\puppet-win.nmt.edu\winshare\packages\wincnt\NanotubeModeler.exe',
    install_options => ['/s','/f2c:\tcc\log\wincntdebug.txt','/f1\\puppet-win.nmt.edu\winshare\packages\wincnt\setup.iss'],
  }

}
