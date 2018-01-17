#
# Cookbook:: dnsmadeeasy
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'
require 'dnsmadeeasy'

describe 'dnsmadeeasy_test::record_a' do
  include_examples "credentials", 'spec/unit/fixtures/credentials.yml'

  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) { runner.converge(described_recipe) }

    it 'converges successfully' do
      expect(runner.node['dnsmadeeasy']).to_not be_nil
    end
  end
end
