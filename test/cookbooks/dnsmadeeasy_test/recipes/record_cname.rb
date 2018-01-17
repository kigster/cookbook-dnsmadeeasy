cname_hash = node['dnsmadeeasy_test']['cname']
cname_name = cname_hash.values.first
cname_host = cname_hash.keys.first

dnsmadeeasy_record_CNAME cname_name do
  domain node['dnsmadeeasy_test']['domain']
  value cname_host
  api_key node['dnsmadeeasy_test']['api_key']
  api_secret node['dnsmadeeasy_test']['api_secret']
  encryption_key node['dnsmadeeasy_test']['encryption_key']
  ttl 90
  action :create
end

dnsmadeeasy_record_CNAME cname_name do
  domain node['dnsmadeeasy_test']['domain']
  api_key node['dnsmadeeasy_test']['api_key']
  api_secret node['dnsmadeeasy_test']['api_secret']
  encryption_key node['dnsmadeeasy_test']['encryption_key']
  value cname_host + '-xxx'
  ttl 120
  action :update
end

dnsmadeeasy_record_CNAME cname_name do
  domain node['dnsmadeeasy_test']['domain']
  api_key node['dnsmadeeasy_test']['api_key']
  api_secret node['dnsmadeeasy_test']['api_secret']
  encryption_key node['dnsmadeeasy_test']['encryption_key']
  action :delete
end


