require 'spec_helper'

describe 'fish' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "fish class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to create_class('fish') }

          it { is_expected.to contain_class('fish::params') }
          it { is_expected.to contain_class('fish::repo').that_comes_before('Class[fish::install]') }
          it { is_expected.to contain_class('fish::install') }

          it { is_expected.to contain_package('fish').with_ensure('installed') }
        end
      end
    end
  end
end
