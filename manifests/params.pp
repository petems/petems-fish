# == Class fish::params
#
# This class is meant to be called from fish.
# It sets variables according to platform.
#
class fish::params {

  case $::osfamily {
    'Debian': {
      $package_name = 'fish'
    }
    'RedHat': {
      $package_name = 'fish'
    }
    'Archlinux': {
      $package_name = 'fish'
    }
    default: {
      fail("${::osfamily} not supported")
    }
  }

  # Defaults for all Operating Systems
  $manage_package   = true
  $manage_repo      = true
  $manage_service   = true
  $package_version  = 'installed'

}
