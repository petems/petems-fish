# fish::repo - Used for managing package repositories for fish
#
class fish::repo {

  if $::fish::manage_repo {

    case $::osfamily {
      'RedHat': {
        case $::operatingsystem {
          'CentOS': {
            require ::fish::repo::centos
          }
          'Fedora': {
            require ::fish::repo::fedora
          }
          default: {
            # code
          }
        }
      }
      'Debian': {
        case $::operatingsystem {
          'Ubuntu': {
            require ::fish::repo::ubuntu
          }
          'Debian': {
            require ::fish::repo::debian
          }
          default: {
            fail("Debian-flavour Operating System ${::operatingsystem} not supported")
          }
        }
      }
      default: {
        # code
      }
    }
  }
}
