require 'spec_helper'
require 'dnsmadeeasy/dme'

RSpec.shared_examples "credentials" do |credentials_file|
  before do

    expect(File.exist?(credentials_file)).to be(true)
    DME.configure_from_file(credentials_file, nil, ENV['DME_KEY'])
  end

  let(:api_key) { DME.api_key }
  let(:api_secret) { DME.api_secret }

  context 'the keys are loaded' do
    subject { DME.credentials_from_file(file: credentials_file ) }
    its(:api_key) { should_not be_nil }
    its(:api_secret) { should_not be_nil }
  end

  let(:runner) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu',
                               version:  '16.04') do |node|
      node.override['dnsmadeeasy']['api_key']    = api_key
      node.override['dnsmadeeasy']['api_secret'] = api_secret
    end
  end
end

