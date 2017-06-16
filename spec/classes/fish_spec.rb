require 'spec_helper'

describe 'fish' do
  context 'supported operating systems' do

    shared_examples 'with no parameters' do
      let(:params) {{ }}

      it { should compile.with_all_deps }

      it { is_expected.to create_class('fish') }

      it { is_expected.to contain_class('fish::params') }
      it { is_expected.to contain_class('fish::install') }
      it { is_expected.to contain_class('fish::repo').that_comes_before('Class[fish::install]') }

      it { is_expected.to contain_package('fish').with_ensure('installed') }

    end

    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        it_behaves_like 'with no parameters'

      end
    end
  end

end
