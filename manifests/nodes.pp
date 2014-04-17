node tccwin7 {


include roles::workstation::student
include grouppolicy

}



node default inherits tccwin7 { }


node 'puppet-win.nmt.edu' {
  class { 'puppetdb': }
  class { 'puppetdb::master::config': restart_puppet => false, }
  cron { 'puppet clean reports':
    command => 'cd /var/lib/puppet/reports && find . -type f -name \*.yaml -mtime +7 -print0 | xargs -0 -n50 /bin/rm -f',
    user    => 'root',
    hour    => 0,
    minute  => 5,
  }
}