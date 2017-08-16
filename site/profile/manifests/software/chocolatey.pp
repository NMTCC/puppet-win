# Configure Chocolatey packages
class profile::software::chocolatey {

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
    'Silverlight',
    'thunderbird',
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
    'inkscape',
    'javaruntime',
    'notepadplusplus',
    'putty.install',
  ]

  package { $pkglist:     ensure    => installed, provider => 'chocolatey', }
  package { $updatelist:  ensure    => latest,    provider => 'chocolatey', }

  package { 'Inkscape 0.91': ensure =>  absent }
  Package['Inkscape 0.91'] -> Package['inkscape']

}
