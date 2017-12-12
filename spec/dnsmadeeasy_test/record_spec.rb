require 'spec_helper'

describe 'dnsmadeeasy_test::record' do
  cached(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }
end
