require 'spec_helper'

describe 'dnsmadeeasy_test::record_a' do
  include_examples "credentials", 'spec/unit/fixtures/credentials.yml'

  cached(:chef_run) do
    runner.converge(described_recipe)
  end
end
