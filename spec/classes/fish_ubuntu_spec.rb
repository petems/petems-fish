require 'spec_helper'

describe 'fish' do
  context 'on Ubuntu' do
    let(:facts) do
      {
      :osfamily                  => 'Debian',
      :operatingsystemmajrelease => '16.04',
      :operatingsystem           => 'Ubuntu',
      :lsbdistid                 => 'Ubuntu',
      :lsbdistcodename           => 'xenial',
      :lsbdistrelease            => '16.04',
      :puppetversion             => Puppet.version,
    }
    end

    context 'repo disabled' do
      let(:params) {{ 'manage_repo' => false }}
      it { is_expected.not_to contain_class('fish::repo::ubuntu')}
      it { is_expected.not_to contain_apt__source('fish-shell-release-2')}
    end

    context 'repo enabled' do
      let(:params) {{ 'manage_repo' => true }}

      it { is_expected.to contain_class('fish::repo::ubuntu')}

      it {
        is_expected.to contain_apt__source('fish-shell-release-2').with(
          :ensure    => 'present',
          :location  => 'http://ppa.launchpad.net/fish-shell/release-2/ubuntu',
          :release   => 'xenial',
          :repos     => 'main',
          :key      => {
            "id"=>"59FDA1CE1B84B3FAD89366C027557F056DC33CA5",
            "server"=>"keyserver.ubuntu.com"
          }
        )
      }
    end
  end
end
