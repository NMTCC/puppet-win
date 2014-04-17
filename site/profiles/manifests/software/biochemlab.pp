# == Class profiles::software::biochemlab
#
#  Lists packages for chocolatey installation
class profiles::software::biochemlab {

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
