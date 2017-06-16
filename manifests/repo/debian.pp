# Repo setup on Debian
class fish::repo::debian {

  contain ::apt

  ::apt::source { 'fish-shell-release-2':
    ensure   => 'present',
    location => 'http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/',
    repos    => '/',
    release  => '',
    key      => {
      'id'     => '24A63B31CAB41B33EC48801E2CE2AC08D880C8E4',
      'server' => 'pool.sks-keyservers.net',
    },
  }

}
