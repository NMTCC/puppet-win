# Class  profiles::firewall
#
#
#

class profiles::firewall {

  # Keep Firewall Disabled
  #
  # https://msdn.microsoft.com/en-us/library/
  #    windows/desktop/aa366303%28v=vs.85%29.aspx
  #
  #  * NET_FW_PROFILE2_DOMAIN = 1
  #  * NET_FW_PROFILE2_PRIVATE = 2
  #  * NET_FW_PROFILE2_PUBLIC = 4

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
