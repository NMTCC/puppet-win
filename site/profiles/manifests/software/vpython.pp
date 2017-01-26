# profiles::software::vpython
class profiles::software::vpython {

  # VPython
  # PHYS 242 (Vibrations and Waves)
  # Dr. Raul Morales Juberias <raul.moralesjuberius@nmt.edu>
  # Requested 25 Jan 2017
  # Inno Setup
  package { 'VPython 6.11':
    ensure          => installed,
    source          => '\\puppet-win.nmt.edu\winshare\packages\VPython\VPython-Win-32-Py2.7-6.11.exe',
    install_options => ['/verysilent'],
  }

}
