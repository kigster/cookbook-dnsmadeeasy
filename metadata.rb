name 'dnsmadeeasy'
maintainer 'Konstantin Gredeskoul'
maintainer_email 'kigster@gmail.com'
license 'MIT'
description 'A collection of Chef Resources to manage DNS records using DnsMadeEasy via their REST API'

version '0.2.1'

chef_version '>= 12.5' if respond_to?(:chef_version)

source_url 'https://github.com/kigster/dnsmadeeasy-cookbook'
issues_url 'https://github.com/kigster/dnsmadeeasy-cookbook/issues'

gem 'dnsmadeeasy', '~> 0.3.2'
gem 'sym', '~> 2.8.5'

supports 'amazon'
supports 'centos'
supports 'scientific'
supports 'oracle'
supports 'debian'
supports 'fedora'
supports 'redhat'
supports 'ubuntu'

long_description <<~EOF
= DESCRIPTION:

This cookbook provides a flexible resource for creating, getting, updating, and deleting DNS records
through the DnsMadeEasy.com. The underlying ruby gem "dnsmadeeasy" is used to talk to DME via the REST API.
Two concrete DNS record types are offered — A record and CNAME records, as well as a generic record type.

= RESOURCES

The following resources are available:

 * *dnsmadeeasy_record* — a generic record, where type is required, and no validation is performed on the value.
 * *dnsmadeeasy_record_A* – an A-record, where the value is validated to be a valid IP address.
 * *dnsmadeeasy_record_CNAME* — a CNAME-record, where the value is validated to be a valid domain/host name.

= EXAMPLES

Creating a new A record (skips over, if already created):

```ruby
 dnsmadeeasy_record_A 'web001.mydomain.com' do
   domain 'mydomain.com'
   value '10.1.0.12'
   api_key 'af98098f0909sdf0909'
   api_secret 'f9890987sdf9f87sd9f78s9df79asd78f98as7df9'
   encryption_key ''
   ttl 90
   action :create
 end
```
EOF
