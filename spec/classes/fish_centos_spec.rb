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
      it { is_expected.not_to contain_yumrepo('shells_fish_release_2') }
    end

    context 'repo enabled' do
      let(:params) {{ 'manage_repo' => true }}
      it { is_expected.to contain_class('fish::Repo::Centos')}

      it do
        is_expected.to contain_yumrepo('shells_fish_release_2').with(
          :descr    => 'Fish shell - 2.x release series (CentOS_7)',
          :baseurl  => 'https://download.opensuse.org/repositories/shells:/fish:/release:/2/CentOS_7/',
          :enabled  => '1',
          :gpgcheck => '1',
          :gpgkey   => "https://download.opensuse.org/repositories/shells:/fish:/release:/2/CentOS_7/repodata/repomd.xml.key",
        )
      end
    end
  end
end
