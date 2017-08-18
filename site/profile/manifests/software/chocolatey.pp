# Configure Chocolatey packages
class profile::software::chocolatey {

  $pkglist = [
    'blender',
    'cygwin',
    'Emacs',
    'filezilla',
    'Firefox',
    'Ghostscript.app',
    'gimp',
    'git',
    'GoogleChrome',
    'googleearth',
    'libreoffice',
    'miktex',
    'mingw',
    'python3',
    'Silverlight',
    'thunderbird',
    'vim',
    'VirtualCloneDrive',
    'vlc',
    'wget',
    'winscp',
    'Xming',
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
