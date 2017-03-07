# Repo setup on Fedora
class fish::repo::fedora {

  yumrepo { 'shells_fish_release_2':
    ensure   => 'present',
    baseurl  => "https://download.opensuse.org/repositories/shells:/fish:/release:/2/Fedora_${::operatingsystemmajrelease}/",
    descr    => "Fish shell - 2.x release series (Fedora_${::operatingsystemmajrelease})",
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => "https://download.opensuse.org/repositories/shells:/fish:/release:/2/Fedora_${::operatingsystemmajrelease}/repodata/repomd.xml.key",
  }

}
