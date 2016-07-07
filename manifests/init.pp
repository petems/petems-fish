# fish - Used for installation and configuration
# of fish (https://fishshell.com/)
#
# @example
#   include fish
#
# @example
#   class { 'fish':
#     manage_repo    => false,
#     package_name   => 'fish-custombuild',
#   }
#
# @author Peter Souter
#
# @param manage_package [Boolean] Whether to manage the fish package
#
# @param manage_repo [Boolean] Whether to manage the package repositroy
##
# @param package_name [String] Name of the fish package
#
# @param package_version [String] Version of the fish package to install
#
# @param yum_preview_repo [String] Whether to use the preview Yum repos to
#   install package. See https://copr.fedorainfracloud.org/coprs/g/fish/fish-preview/
#
class fish (
  $manage_package   = $::fish::params::manage_package,
  $manage_repo      = $::fish::params::manage_repo,
  $package_name     = $::fish::params::package_name,
  $package_version  = $::fish::params::package_version,
  $yum_preview_repo = $::fish::params::yum_preview_repo,
) inherits ::fish::params {

  # validate parameters here
  validate_bool($manage_package)
  validate_bool($manage_repo)

  validate_string($package_name)
  validate_string($package_version)

  class { '::fish::repo': } ->
  class { '::fish::install': } ->
  Class['::fish']

  # Update packages on repo refresh
  Class['::fish::repo'] ~>
  Class['::fish::install']
}
