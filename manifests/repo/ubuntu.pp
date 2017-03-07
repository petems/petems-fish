# Repo setup on Ubuntu
class fish::repo::ubuntu {

  contain ::apt

  ::apt::source { 'fish-shell-release-2':
    ensure   => 'present',
    location => 'http://ppa.launchpad.net/fish-shell/release-2/ubuntu',
    release  => $::lsbdistcodename,
    repos    => 'main',
    key      => {
      'id'     => '59FDA1CE1B84B3FAD89366C027557F056DC33CA5',
      'server' => 'keyserver.ubuntu.com',
    },
  }

}
