# Repo setup on CentOS
class fish::repo::centos {

  yumrepo { 'shells_fish_release_2':
    ensure   => 'present',
    baseurl  => "http://download.opensuse.org/repositories/shells:/fish:/release:/2/CentOS_${::operatingsystemmajrelease}/",
    descr    => "Fish shell - 2.x release series (CentOS_${::operatingsystemmajrelease})",
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => "http://download.opensuse.org/repositories/shells:/fish:/release:/2/CentOS_${::operatingsystemmajrelease}/repodata/repomd.xml.key",
  }

}
