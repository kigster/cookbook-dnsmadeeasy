require 'spec_helper'

describe 'dnsmadeeasy_test::credentials_file' do
  cached(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  context 'testing create action' do
    it 'creates credentials file' do
      expect(chef_run).to create_dnsmadeeasy_credentials_file('my-corp')
    end
  end
end
