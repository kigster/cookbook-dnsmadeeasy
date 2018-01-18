require 'spec_helper'

require 'dnsmadeeasy'
require 'dnsmadeeasy/dme'

RSpec.shared_examples "credentials" do |credentials_file|
  before do
    expect(ENV['DME_KEY']).to_not be_nil,
                                  "DME_KEY is required environment variable" +
                                    "that should be set to the encryption key"

    expect(File.exist?(credentials_file)).to be(true)
    DME.configure_from_file(credentials_file, nil, ENV['DME_KEY'])
  end

  let(:api_key) { DME.api_key }
  let(:api_secret) { DME.api_secret }

  context 'the keys are loaded' do
    subject { DME.credentials_from_file(file: credentials_file) }
    its(:api_key) { should_not be_nil }
    its(:api_secret) { should_not be_nil }
  end

  let(:runner) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu',
                               version:  '16.04') do |node|
      node.override['dnsmadeeasy_test']['api_key']        = api_key
      node.override['dnsmadeeasy_test']['api_secret']     = api_secret
      node.override['dnsmadeeasy_test']['encryption_key'] = ENV['DME_KEY']
    end
  end
end

