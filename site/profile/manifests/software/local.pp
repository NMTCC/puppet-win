# Configure local utils
class profile::software::local {

  include wget

  if $::wgethashes {

    $csrmd5 = $::facts['wgethashes']['ChangeScreenResolution.exe']
    $dp2md5 = $::facts['wgethashes']['DelProf2.exe']
    $pbmd5 = $::facts['wgethashes']['puppet.bat']

    if $csrmd5 != '516d6e1c48f10a7104cc2a4604530c83' {
      wget::fetch { 'ChangeScreenResolution.exe':
        source      =>
          'http://duplicon.nmt.edu/wingdows/ChangeScreenResolution_1.0.4/ChangeScreenResolution.exe',
        destination => 'C:/itc/bin/',
        require     => Package['wget'],
      }
    }

    if $dp2md5 != 'fdc4366be4d0e0d02c35b394ca59dd14' {
      wget::fetch { 'DelProf2.exe':
        source      =>
          'http://duplicon.nmt.edu/wingdows/Delprof2_1.6.0/Delprof2%201.6.0/DelProf2.exe',
        destination => 'C:/itc/bin/',
        require     => Package['wget'],
      }
    }

    if $pbmd5 != 'f783e3cc12424cc4f427af85af30240e' {
      wget::fetch { 'puppet.bat':
        source      => 'http://duplicon.nmt.edu/wingdows/puppet.bat',
        destination => 'C:/itc/bin/',
        require     => Package['wget'],
      }
    }

  }

  file { 'C:\itc\bin\unroll.bat':
    ensure => absent,
  }

}
