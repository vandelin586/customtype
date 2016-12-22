# == Class customtype::install
#
# This class is called from customtype for install.
#
class customtype::install {

  package { $::customtype::package_name:
    ensure => present,
  }
}
