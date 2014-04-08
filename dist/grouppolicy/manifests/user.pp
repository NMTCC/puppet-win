# Class:: grouppolicy::user
#
# Manages the registry.pol file that
# local grouppolicy writes to


class grouppolicy::user {

  file { 'C:\Windows\Sysnative\GroupPolicy\User':
    ensure => 'directory',
  }

  file { 'C:\Windows\Sysnative\GroupPolicy\User\Registry.pol':
    ensure => 'file',
    source => 'puppet:///modules/grouppolicy/user/Registry.pol',
  }

  exec { 'C:\Windows\Sysnative\gpupdate.exe /force':
    subscribe   => File['C:\Windows\Sysnative\GroupPolicy\User\Registry.pol'],
    refreshonly => true,
  }



}
