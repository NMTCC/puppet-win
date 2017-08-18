# Configure Chocolatey packages
class profile::software::chocolatey {

  $pkglist = [
    'blender',
    'cygwin',
    'dumpedid',
    'Emacs',
    'filezilla',
    'Firefox',
    'Ghostscript.app',
    'gimp',
    'git',
    'gnuwin32-sed.install',
    'GoogleChrome',
    'googleearth',
    'libreoffice',
    'md5sums',
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
