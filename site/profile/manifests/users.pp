# Configure users
class profile::users {

  user { 'administrator':
    ensure     => present,
    managehome => false,
    password   => hiera('winpassword'),
  }

  user { 'itc':
    ensure     => present,
    managehome => true,
    password   => hiera('winpassword'),
  }

  exec { 'netuseract':
    provider => powershell,
    command  => 'net user /add act foo',
    unless   => 'if (Get-LocalUser act) { exit 0 } else { exit 1 }',
    notify   => Exec['localgroupact'],
  }

  exec { 'localgroupact':
    provider    => powershell,
    command     => 'net localgroup administrators act /add',
    refreshonly => true,
  }
  
  user { 'act':
    ensure     => present,
    managehome => true,
    password   => hiera('depassword'),
    require    => Exec['netuseract'],
  }
  
}
