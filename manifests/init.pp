# Class: customtype
# ===========================
#
# Full description of class customtype here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class customtype (
  $package_name = $::customtype::params::package_name,
  $service_name = $::customtype::params::service_name,
) inherits ::customtype::params {

  # validate parameters here

  class { '::customtype::install': } ->
  class { '::customtype::config': } ~>
  class { '::customtype::service': } ->
  Class['::customtype']
}
