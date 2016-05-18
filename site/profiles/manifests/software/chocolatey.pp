# == Class profiles::software::chocolatey
#
#  Lists packages for chocolatey installation
class profiles::software::chocolatey {

  $pkglist = [
    'git',
    'GoogleChrome',
    'Firefox',
    'vlc',
#    'putty.install',
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
    'InkScape',
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
    'javaruntime',
    'flashplayerplugin',
    'adobereader',
    'notepadplusplus',
  ]

  package { $pkglist:     ensure => installed, provider => 'chocolatey', }
  package { $updatelist:  ensure => latest,    provider => 'chocolatey', }
}
