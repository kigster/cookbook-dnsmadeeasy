require_relative 'dnsmadeeasy_base'

module DnsmadeeasyCookbook
  class DnsmadeeasyCredentialsFile < DnsmadeeasyBase
    resource_name :dnsmadeeasy_credentials_file

    action :create do
      filename = "#{Dir.home(node['current_user'])}/.dnsmadeeasy/credentials.yml"

      directory File.dirname(filename) do
        action :create
      end

      template filename do
        source 'credentials.yml.erb'
        mode '0700'
        variables(
          api_key:    api_key,
          api_secret: api_secret
        )
        action :create
      end
    end

    action :delete do
      file filename do
        action :delete
      end
    end
  end
end

