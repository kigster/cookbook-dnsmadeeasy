dnsmadeeasy_credentials_file 'my-corp' do
  api_key node['dnsmadeeasy']['api_key']
  api_secret node['dnsmadeeasy']['api_secret']
  encryption_key 'MOO'
  action :create
end

