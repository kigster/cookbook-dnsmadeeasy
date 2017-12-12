name 'dnsmadeeasy'
maintainer 'Konstantin Gredeskoul'
maintainer_email 'kigster@gmail.com'
license 'MIT'
description 'A Chef Resource to manage DNS records with DnsMadeEasy'
long_description <<~EOF
  This cookbook provides flexible for fetching, updating, creating DNS records 
  using the DnsMadeEasy provider, using the ruby gem "dnsmadeeasy" behind the 
  scenes.
EOF
version '0.1.0'

chef_version '>= 12.5' if respond_to?(:chef_version)

source_url 'https://github.com/kigster/dnsmadeeasy-cookbook'
issues_url 'https://github.com/kigster/dnsmadeeasy-cookbook/issues'

gem 'dnsmadeeasy', '~> 0.2.0'

supports 'amazon'
supports 'centos'
supports 'scientific'
supports 'oracle'
supports 'debian'
supports 'fedora'
supports 'redhat'
supports 'ubuntu'