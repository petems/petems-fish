# == Class fish::install
#
# This class is called from fish for install.
#
class fish::install {

  if $::fish::manage_package {
    package { $::fish::package_name:
      ensure => $::fish::package_version,
    }
  }

}
