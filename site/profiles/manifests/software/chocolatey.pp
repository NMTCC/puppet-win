# == Class profiles::software::chocolatey
#
#  Lists packages for chocolatey installation
class profiles::software::chocolatey {

  $pkglist = [
    'git',
    'GoogleChrome',
    'Firefox',
    'vlc',
    'filezilla',
    'vim',
    'Emacs',
    'VirtualCloneDrive',
    'libreoffice',
    'gimp',
    'winscp',
    'cygwin',
#    'Quicktime',
    'Silverlight',
    #'iTunes',
    'thunderbird',
#    'ActivePerl',
    'Ghostscript.app',
    'Xming',
    'miktex',
    'googleearth',
    'blender',
    'python3',
    'mingw',
    ]

  $updatelist = [
    '7zip',
    'adobereader',
    'flashplayerplugin',
    'InkScape',
    'javaruntime',
    'notepadplusplus',
    'putty.install',
  ]

  package { $pkglist:     ensure => installed, provider => 'chocolatey', }
  package { $updatelist:  ensure => latest,    provider => 'chocolatey', }

  package { 'InkScape 0.91': ensure => absent }
  Package['InkScape'] -> Package['InkScape 0.91']

}
