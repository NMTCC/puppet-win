# Class  profiles::firewall
#
#
#

class profiles::firewall {

  #Keep Firewall Disabled

  exec { 'nodomainfw':
    command  => '$(New-Object -ComObject HNetCfg.FwPolicy2).FirewallEnabled(1) = $False',
    unless   => 'if ( $(New-Object -ComObject HNetCfg.FwPolicy2).FirewallEnabled(1) ) { exit 1 }',
    provider => powershell,
  }

  exec { 'noprivatefw':
    command  => '$(New-Object -ComObject HNetCfg.FwPolicy2).FirewallEnabled(2) = $False',
    unless   => 'if ( $(New-Object -ComObject HNetCfg.FwPolicy2).FirewallEnabled(2) ) { exit 1 }',
    provider => powershell,
  }

  exec { 'nopublicfw':
    command  => '$(New-Object -ComObject HNetCfg.FwPolicy2).FirewallEnabled(4) = $False',
    unless   => 'if ( $(New-Object -ComObject HNetCfg.FwPolicy2).FirewallEnabled(4) ) { exit 1 }',
    provider => powershell,
  }

}
