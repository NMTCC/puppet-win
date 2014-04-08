# == Class profiles::packages
#
#  Lists packages for chocolatey installation
class profiles::chocolatey {

  $pkglist = [
    'git',
    '7zip',
    'GoogleChrome',
    'Firefox',
    'vlc',
    'putty.install',
    'filezilla',
    'flashplayerplugin',
    'vim',
    'Emacs',
    'VirtualCloneDrive',
    'libreoffice',
    'gimp',
    'winscp',
    'Cygwin',
    'Quicktime',
    'Silverlight',
    'iTunes',
    'InkScape',
    'thunderbird',
    'ActivePerl',
    'Ghostscript.app',
    'Xming',
    'miktex',
    'googleearth',
    'blender',
    ]

  $updatelist = [
    'javaruntime',
    'adobereader',
    'notepadplusplus',
  ]

  package { $pkglist:     ensure => installed, provider => 'chocolatey', }
  package { $updatelist:  ensure => latest,    provider => 'chocolatey', }

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


  # PyMOL
  # Biochemistry II Lab
  # Dr. Sally Piaz  <spias@nmt.edu>
  # Requested 20 Jan 2014
  # MSI
  package { 'PyMOL (32 bit)':
      ensure          => installed,
      source          => '\\puppet-win.nmt.edu\winshare\packages\PyMOL\pymol-v1.3r1-edu-Win32.msi',
      install_options => ['/quiet'],
  }

  # UCSF Chimera
  # Biochemistry II Lab
  # Dr. Sally Piaz <spias@nmt.edu>
  # Requested 20 Jan 2014
  # Inno Setup
  package { 'UCSF Chimera 1.8.1':
    ensure          => installed,
    source          => '\\puppet-win.nmt.edu\winshare\packages\UCSFChimera\chimera-1.8.1-win64.exe',
    install_options => ['/sp-','/silent','/norestart',],
  }

}
