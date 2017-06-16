require 'spec_helper'

describe 'fish' do
  context 'unsupported operating system' do
    context 'fish class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }
      end

      it { expect { is_expected.to create_class('fish') }.to raise_error(Puppet::Error, /Solaris not supported/) }
    end
  end
end
