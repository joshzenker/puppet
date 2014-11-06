file { '/vagrant/test':
    ensure  => present,
    content => "hello world\n",
}
