# Configure basic stuff
class profile::base {

  $itcdirs = [ 'C:\itc', 'C:\itc\bin', 'C:\itc\etc', 'C:\itc\log', ]

  file { $itcdirs:
    ensure => directory,
  }

}
