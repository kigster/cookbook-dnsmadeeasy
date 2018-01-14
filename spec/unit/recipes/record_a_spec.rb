#
# Cookbook:: dnsmadeeasy
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'
require 'dnsmadeeasy'

describe 'dnsmadeeasy_test::record_a' do
  context 'When all attributes are default, on an Ubuntu 16.04' do

    let(:credentials) { ::DnsMadeEasy::Credentials.keys_from_file }

    let(:chef_run) do
      pp credentials

      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu',
                                          version:  '16.04') do |node|
        node.automatic['dnsmadeeasy']['api_key']    = credentials.api_key
        node.automatic['dnsmadeeasy']['api_secret'] = credentials.api_secret
      end
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
