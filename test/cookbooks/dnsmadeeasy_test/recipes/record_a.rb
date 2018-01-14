record_name = node['dnsmadeeasy']['hostname']

dnsmadeeasy_record_A record_name do
  domain node['dnsmadeeasy']['domain']
  value node['ipaddress']
  api_key node['dnsmadeeasy']['api_key']
  api_secret node['dnsmadeeasy']['api_secret']
  ttl 90
  action :create
end

dnsmadeeasy_record_A record_name do
  domain node['dnsmadeeasy']['domain']
  api_key node['dnsmadeeasy']['api_key']
  api_secret node['dnsmadeeasy']['api_secret']
  value '1.1.1.1'
  ttl 120
  action :update
end

dnsmadeeasy_record_A record_name do
  domain node['dnsmadeeasy']['domain']
  api_key node['dnsmadeeasy']['api_key']
  api_secret node['dnsmadeeasy']['api_secret']
  action :delete
end


