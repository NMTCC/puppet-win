# Class:: grouppolicy::user
#
# Manages the registry.pol file that
# local grouppolicy writes to


class grouppolicy::user {

  file { 'C:\Windows\SysWOW64\GroupPolicy\User':
    ensure => 'directory',
  }

  file { 'C:\Windows\SysWOW64\GroupPolicy\User\Registry.pol':
    ensure => 'file',
    source => 'puppet:///modules/grouppolicy/user/Registry.pol',
  }

  exec { 'C:\Windows\SysWOW64\gpupdate.exe /force':
    subscribe   => File['C:\Windows\SysWOW64\GroupPolicy\User\Registry.pol'],
    refreshonly => true,
  }



}
