# Class profiles::users

class profiles::users {

  user { 'administrator':
    ensure     => present,
    managehome => false,
    password   => hiera(winpassword),
  }

  user { 'de':
    ensure     => present,
    managehome => true,
    password   => hiera(depassword),
  }


}
