node 'puppet-win.nmt.edu' {
  class { 'puppetdb': }
  class { 'puppetdb::master::config':
    restart_puppet => false,
    puppetdb_server => 'puppetdb.nmt.edu',
    puppetdb_port => 8081,
  }
  cron { 'puppet clean reports':
    command => 'cd /var/lib/puppet/reports && find . -type f -name \*.yaml -mtime +7 -print0 | xargs -0 -n50 /bin/rm -f',
    user    => 'root',
    hour    => 0,
    minute  => 5,
  }
}