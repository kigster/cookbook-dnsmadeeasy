# DnsMadeEasy Chef Cookbook

[![Build Status](https://travis-ci.org/kigster/dnsmadeeasy-cookbook.svg?branch=master)](https://travis-ci.org/kigster/dnsmadeeasy-cookbook)

This cookbook is an attempt to export the functionality of the [dnsmaseeasy](/kigster/dnsmadeeasy) ruby gem as several reslurces with well defined actions.

The following resources are available:

- dnsmadeeasy_credentials_file
- dnsmadeeasy_record
- dnsmadeeasy_record_A

## Usage

### `dnsmadeeasy_credentials_file`

You can create a credentials file on a remote server, if you need to perform DNS operations outside of Chef.

Here is how:

```ruby
dnsmadeeasy_credentials_file 'my-corp' do
  api_key node['my_corp']['api_key']
  api_secret node['my_corp']['api_secret']
  encryption_key node['my_corp']['encryption_key']
  action :create
end
```

### `dnsmadeeasy_record_A`

Use this to create, update, or delete an A record.





