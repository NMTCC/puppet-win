class profiles::software::java {

  $java_dirs = [
    'C:\Windows\Sun',
    'C:\Windows\Sun\Java',
    'C:\Windows\Sun\Java\Deployment',
  ]

  file { $java_dirs:
    ensure => 'directory',
  }

  file { 'C:\Windows\Sun\Java\Deployment\deployment.config':
    ensure  => 'file',
    content => "deployment.system.config=file:///C:/Windows/Sun/Java/Deployment/deployment.properties\ndeployment.system.config.mandatory=true",
    require => File['C:\Windows\Sun\Java\Deployment'],
  }

  file { 'C:\Windows\Sun\Java\Deployment\deployment.properties':
    ensure  => 'file',
    content => "deployment.webjava.enabled=true\ndeployment.security.level=HIGH\ndeployment.security.level.locked\ndeployment.user.security.exception.sites=C:/Windows/Sun/Java/Deployment/exception.sites",
    require => File['C:\Windows\Sun\Java\Deployment'],
  }

  file { 'C:\Windows\Sun\Java\Deployment\exception.sites':
    ensure  => 'file',
    content => "http://jmol.sourceforge.net",
    require => File['C:\Windows\Sun\Java\Deployment'],
  }

}
