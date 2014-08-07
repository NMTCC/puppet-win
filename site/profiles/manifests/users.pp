# Class profiles::users

class profiles::users {

  user { 'administrator':
    ensure     => present,
    managehome => false,
    password   => hiera(winpassword),
  }

  user { 'act':
    ensure     => present,
    managehome => true,
    password   => hiera(depassword),
  }


}
