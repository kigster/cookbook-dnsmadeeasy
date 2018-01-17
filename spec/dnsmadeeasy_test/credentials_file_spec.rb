require 'spec_helper'

describe 'dnsmadeeasy_test::credentials_file' do
  include_examples "credentials", 'spec/unit/fixtures/credentials.yml'
  cached(:chef_run) { runner.converge(described_recipe) }

  context 'testing create action' do
    it 'creates credentials file' do
      expect(chef_run).to create_dnsmadeeasy_credentials_file('my-corp')
    end
  end
end
