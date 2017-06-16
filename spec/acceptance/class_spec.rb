require 'spec_helper_acceptance'

describe 'fish class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      class { 'fish': }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes  => true)
    end

    it 'will allow setting shell for users after installation' do
      pp = <<-EOS
      include fish

      user {'nemo':
        ensure  => 'present',
        shell   => '/usr/bin/fish',
        require => Class['::fish'],
      }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes  => true)
    end

    describe package('fish') do
      it { is_expected.to be_installed }
    end

  end
end
