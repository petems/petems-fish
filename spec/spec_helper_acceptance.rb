require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'
require 'beaker/puppet_install_helper'
require 'simp/beaker_helpers'
include Simp::BeakerHelpers

run_puppet_install_helper unless ENV['BEAKER_provision'] == 'no'

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
    puppet_module_install(:source => proj_root, :module_name => 'fish')
    hosts.each do |host|
      if fact('osfamily') == 'Debian'
        # These should be on all Deb-flavor machines by default...
        # But Docker is often more slimline
        shell('apt-get install apt-transport-https software-properties-common -y', { :acceptable_exit_codes => [0] })
      end
      copy_fixture_modules_to(hosts)
    end
  end
end
