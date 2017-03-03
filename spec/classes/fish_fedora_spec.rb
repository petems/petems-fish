require 'spec_helper'

describe 'fish' do
  context 'on Fedora' do
    let(:facts) do
      {
      :osfamily                  => 'RedHat',
      :operatingsystemmajrelease => '22',
      :operatingsystem           => 'Fedora',
    }
    end

    context 'repo disabled' do
      let(:params) {{ 'manage_repo' => false }}
      it { should_not contain_yumrepo('shells_fish_release_2') }
    end

    context 'repo enabled' do
      let(:params) {{ 'manage_repo' => true }}

      it { should contain_class('fish::repo::fedora') }

      it do
        should contain_yumrepo('shells_fish_release_2').with(
          :ensure              => 'present',
          :descr               => 'Fish shell - 2.x release series (Fedora_22)',
          :baseurl             => 'http://download.opensuse.org/repositories/shells:/fish:/release:/2/Fedora_22/',
          :enabled             => '1',
          :gpgcheck            => '1',
          :gpgkey              => 'http://download.opensuse.org/repositories/shells:/fish:/release:/2/Fedora_22/repodata/repomd.xml.key',
        )
      end
    end
  end
end