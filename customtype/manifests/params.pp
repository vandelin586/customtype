# == Class customtype::params
#
# This class is meant to be called from customtype.
# It sets variables according to platform.
#
class customtype::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'customtype'
      $service_name = 'customtype'
    }
    'RedHat', 'Amazon': {
      $package_name = 'customtype'
      $service_name = 'customtype'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
