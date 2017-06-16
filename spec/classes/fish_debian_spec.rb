require 'spec_helper'

describe 'fish' do
  context 'on Debian' do
    let(:facts) do
      {
      :osfamily                  => 'Debian',
      :operatingsystemmajrelease => '8',
      :operatingsystem           => 'Debian',
      :lsbdistid                 => 'Debian',
      :lsbdistcodename           => 'jessie',
      :lsbdistrelease            => '8.0',
      :puppetversion             => Puppet.version,
    }
    end

    context 'repo disabled' do
      let(:params) {{ 'manage_repo' => false }}
      it { is_expected.not_to contain_class('fish::repo::debian')}
      it { is_expected.not_to contain_apt__source('fish-shell-release-2')}
    end

    context 'repo enabled' do
      let(:params) {{ 'manage_repo' => true }}

      it { is_expected.to contain_class('fish::repo::debian')}

      it {
        is_expected.to contain_apt__source('fish-shell-release-2').with(
          :ensure    => 'present',
          :location  => 'http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/',
          :release   => '',
          :repos     => '/',
          :key      => {
            "id"=>"24A63B31CAB41B33EC48801E2CE2AC08D880C8E4",
            "server"=>"pool.sks-keyservers.net"
          }
        )
      }
    end
  end
end
