dnsmadeeasy_credentials_file 'my-corp' do
  api_key node['dnsmadeeasy_test']['api_key']
  api_secret node['dnsmadeeasy_test']['api_secret']
  encryption_key node['dnsmadeeasy_test']['encryption_key']
  action :create
end

