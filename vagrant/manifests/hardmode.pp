$apache = $::osfamily ? {
    'Debian' => 'apache2',
    'RedHat' => 'httpd',
    default  => 'httpd',
}

package { "$apache":
    ensure => present,
}

service { "$apache":
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package["$apache"],
}

file { "/etc/${apache}/${apache}.conf":
    ensure   => present,
    #content => template("apache/${apache}.conf"),
    notify   => Service["$apache"],
}
