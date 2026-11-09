# Raises the Nginx open-file limit so it can handle many concurrent requests without failing
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin:/bin:/usr/bin',
}

exec { 'nginx-restart':
  command => '/etc/init.d/nginx restart',
  path    => '/etc/init.d:/usr/sbin:/usr/bin:/bin',
  require => Exec['fix--for-nginx'],
}
