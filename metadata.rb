name 'dnsmadeeasy'
maintainer 'Konstantin Gredeskoul'
maintainer_email 'kigster@gmail.com'
license 'MIT'
description 'A Chef Resource to manage DNS records with Dnsmadeeasy'
long_description <<~EOF
  This cookbook provides flexible for fetching, updating, creating DNS records 
  using the Dnsmadeeasy provider, using the ruby gem "dnsmadeeasy" behind the 
  scenes.
EOF
version '0.1.2'

chef_version '>= 12.5' if respond_to?(:chef_version)

source_url 'https://github.com/kigster/dnsmadeeasy-cookbook'
issues_url 'https://github.com/kigster/dnsmadeeasy-cookbook/issues'

gem 'dnsmadeeasy', '~> 0.3.2'

supports 'amazon'
supports 'centos'
supports 'scientific'
supports 'oracle'
supports 'debian'
supports 'fedora'
supports 'redhat'
supports 'ubuntu'
