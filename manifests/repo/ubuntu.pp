# Repo setup on Ubuntu
class fish::repo::ubuntu {

  contain ::apt

  ::apt::ppa { 'ppa:fish-shell/release-2':
    before     => Class['apt::update'],
  }

}
