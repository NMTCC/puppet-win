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
  
  user { 'act':
    ensure     => present,
    managehome => true,
    password   => hiera('depassword'),
  }
  
}
