
dnsmadeeasy_record_A node['name'] do
  domain node['dnsmadeeasy']['domain']
  value node['ipaddress']
  ttl 60
  unique true
  # if an existing record, with a different value is found — change it.
  action :create
end


