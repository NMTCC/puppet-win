# == Class profiles::software::chocolatey
#
#  Lists packages for chocolatey installation
class profiles::software::chocolatey {

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
}
