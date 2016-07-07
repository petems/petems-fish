require 'spec_helper'

describe 'fish' do
  context 'on CentOS' do
    let(:facts) do
      {
      :osfamily                  => 'RedHat',
      :operatingsystemmajrelease => '7',
      :operatingsystem           => 'CentOS',
    }
    end

    context 'repo disabled' do
      let(:params) {{ 'manage_repo' => false }}
      it { should_not contain_yumrepo('shells_fish_release_2') }
    end

    context 'repo enabled' do
      let(:params) {{ 'manage_repo' => true }}
      it { should contain_class('fish::Repo::Centos')}

      it do
        should contain_yumrepo('shells_fish_release_2').with(
          :descr    => 'Fish shell - 2.x release series (CentOS_7)',
          :baseurl  => 'http://download.opensuse.org/repositories/shells:/fish:/release:/2/CentOS_7/',
          :enabled  => '1',
          :gpgcheck => '1',
          :gpgkey   => "http://download.opensuse.org/repositories/shells:/fish:/release:/2/CentOS_7/repodata/repomd.xml.key",
        )
      end
    end
  end
end
