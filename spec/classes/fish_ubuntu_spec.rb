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
      it { should_not contain_class('fish::repo::ubuntu')}
      it { should_not contain_apt__ppa('ppa:fish-shell/release-2')}
      it { should_not contain_exec('fish-add-apt-repository-ppa:fish-shell/release-2')}
    end

    context 'repo enabled' do
      let(:params) {{ 'manage_repo' => true }}
      it { should contain_class('fish::repo::ubuntu')}
      it { should contain_apt__ppa('ppa:fish-shell/release-2')}
    end
  end
end
