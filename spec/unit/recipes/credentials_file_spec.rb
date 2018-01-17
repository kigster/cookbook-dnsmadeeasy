#
# Cookbook:: dnsmadeeasy
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'dnsmadeeasy_test::credentials_file' do
  include_examples "credentials", 'spec/unit/fixtures/credentials.yml'

  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) { runner.converge(described_recipe) }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
