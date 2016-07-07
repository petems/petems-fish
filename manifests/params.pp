# == Class fish::params
#
# This class is meant to be called from fish.
# It sets variables according to platform.
#
class fish::params {

  # OS Specific Defaults
  case $::osfamily {
    'RedHat': {
      #
    }
    'Debian': {
      $ubuntu_bleeding_edge_repo = undef
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  # Defaults for all Operating Systems
  $manage_package   = true
  $manage_repo      = true
  $manage_service   = true
  $package_name     = 'fish'
  $package_version  = 'installed'
}
