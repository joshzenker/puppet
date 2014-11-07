class { 'apache': }
$vhost = hiera('apache::vhosts', {})
create_resources('apache::vhost', $vhost)
