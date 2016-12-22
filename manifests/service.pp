# == Class customtype::service
#
# This class is meant to be called from customtype.
# It ensure the service is running.
#
class customtype::service {

  service { $::customtype::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
