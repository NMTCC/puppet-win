# Configure firewall
class profile::firewall {

  # Keep Firewall Disabled
  #
  # https://msdn.microsoft.com/en-us/library/
  #    windows/desktop/aa366303%28v=vs.85%29.aspx
  #
  #  * NET_FW_PROFILE2_DOMAIN = 1
  #  * NET_FW_PROFILE2_PRIVATE = 2
  #  * NET_FW_PROFILE2_PUBLIC = 4

  $domainfw = '$(New-Object -ComObject HNetCfg.FwPolicy2).FirewallEnabled(1)'
  $privatefw = '$(New-Object -ComObject HNetCfg.FwPolicy2).FirewallEnabled(2)'
  $publicfw = '$(New-Object -ComObject HNetCfg.FwPolicy2).FirewallEnabled(4)'

  exec { 'nodomainfw':
    provider => powershell,
    command  => "${domainfw} = \$False",
    unless   => "if ( ${domainfw} ) { exit 1 }",
  }

  exec { 'noprivatefw':
    provider => powershell,
    command  => "${privatefw} = \$False",
    unless   => "if ( ${privatefw} ) { exit 1 }",
  }

  exec { 'nopublicfw':
    provider => powershell,
    command  => "${publicfw} = \$False",
    unless   => "if ( ${publicfw} ) { exit 1 }",
  }

}
