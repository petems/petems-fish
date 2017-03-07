require 'spec_helper'

describe 'fish', :type => :class do
  let :facts do
    {
      :osfamily               => 'Debian',
      :operatingsystemrelease => '4.3.0-7-generic',
      :lsbdistid              => "Ubuntu",
      :concat_basedir         => '/dne',
      :lsbdistcodename        => 'xenial',
      :lsbdistrelease         => '16.04',
      :operatingsystem        => 'Ubuntu',
      :id                     => 'root',
      :kernel                 => 'Linux',
      :path                   => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
      :is_pe                  => false,
      :puppetversion          => Puppet.version,
    }
  end
  context "on Ubuntu and trying to set the root user's shell" do
    let :pre_condition do
      "include fish

       user {'root':
         ensure  => 'present',
         shell   => '/usr/bin/fish',
         require => Class['::fish'],
       }
      "
    end
    it {
      expect {
        is_expected.to compile
      }.to raise_error(/dependency cycles found/)
    }
  end
  context "on Ubuntu and trying to set any other user's shell" do
    let :pre_condition do
      "include fish

       user {'nemo':
         ensure  => 'present',
         shell   => '/usr/bin/fish',
         require => Class['::fish'],
       }
      "
    end
    it {
      is_expected.to contain_package('fish').that_comes_before('User[nemo]')
      expect { is_expected.to compile }.not_to raise_error
    }
  end
end
